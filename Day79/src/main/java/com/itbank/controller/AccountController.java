package com.itbank.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.vo.AccountVO;
import com.itbank.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired private AccountService as;
	
	// message.jsp로 보낼 데이터 세팅
	private ModelAndView setMessage(int row, String msg, String location) {
		ModelAndView mav = new ModelAndView("message");
		
		mav.addObject("row", row);
		mav.addObject("msg", msg);
		mav.addObject("location", location);
		
		return mav;
	}
	
	@GetMapping("/list")
	public void accList(Model model) {
		model.addAttribute("list", as.getAccounts());
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public ModelAndView login(AccountVO input, HttpSession session) 
			throws NoSuchAlgorithmException {
		
		Map<String, Object> map = as.login(input, session);
		
		int row = (Integer)map.get("row");
		String msg = (String)map.get("msg");
		
		return setMessage(row, msg, null);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public void myPage() {}

	@GetMapping("/signUp")
	public void signUp() {}
	
	@PostMapping("/signUp")
	public ModelAndView signUp(AccountVO input) {
		int row = as.signUp(input);
		return setMessage(row, "가입성공", "account/login");
	}

	@GetMapping("/delete/{idx}")
	public ModelAndView delete(AccountVO input) {
		int row = as.delete(input.getIdx());
		return setMessage(row, "탈퇴가 완료 되었습니다", "account/logout");
	}
	
	@PostMapping("/update/{idx}")
	public ModelAndView update(AccountVO input) {
		int row = as.update(input);
		String msg = "수정 완료. 다시 로그인해 주세요";
		
		return setMessage(row, msg, "account/logout");
	}
	
	@GetMapping("/find")
	public void find() {}
	
	@PostMapping("/findId")
	public ModelAndView findId(String email) {
		String msg = as.findAccount(email);
		
		return setMessage(1, msg, "account/login");
	}
	
	@PostMapping("/findPw")
	public ModelAndView findPw(AccountVO input) throws NoSuchAlgorithmException {
		String msg = as.findAccount(input);
		return setMessage(1, msg, "account/login");
	}
	
	// pk, uk 중복시 예외 발생
	@ExceptionHandler(DuplicateKeyException.class)
	public ModelAndView dke(DuplicateKeyException e) {
		return setMessage(0, "잘못된 접근 방식입니다", null);
	}
	
}

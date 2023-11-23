package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.OrderVO;
import com.itbank.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MypagController
{	
	@Autowired private MyPageService myPageService;
	
	@Autowired
	private OrderVO OrderVO;//session에서 get해온다.
	@Autowired
	private MemberVO memberVO;
	@GetMapping("/myPageMain")//orderlist바인딩 ,  세션으로부터 memberVO에 정보 바인딩
	public ModelAndView myPageMain(Model model, HttpSession httpsession)throws Exception
	{
		memberVO = (MemberVO)httpsession.getAttribute("memberInfo");
		String members_idx = OrderVO.getOrders_idx()+"";//VO 구현해라
		
		ModelAndView mav = new ModelAndView();
		List<OrderVO> myOrderList = myPageService.listMyOrderGoods(members_idx);//오더 리스트 받아오는 함수 구현해라(위에서 받은 id를 토대로)
		
		mav.addObject("myOrderList",myOrderList);
		mav.setViewName("mypage/myPageMain");
		return mav;
	}
}

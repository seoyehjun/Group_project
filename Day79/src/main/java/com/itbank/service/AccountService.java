package com.itbank.service;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.components.SHA512;
import com.itbank.model.AccountDAO;
import com.itbank.model.vo.AccountVO;

@Service
public class AccountService {
	
	@Autowired private AccountDAO dao;
	@Autowired private SHA512 hash;

	public List<AccountVO> getAccounts() {
		return dao.selectAll();
	}

	public Map<String, Object> login(AccountVO input, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		String msg = "입력 정보를 다시 확인해 주세요";
		int row = 0;
		
		input = dao.selectOne(input);
		
		if (input != null) {
			session.setAttribute("user", input);
			msg = input.getNick() + "님 로그인";
			row = 1;
		}
		
		map.put("msg", msg);
		map.put("row", row);
		
		return map;
	}

	public int signUp(AccountVO input) {
		return dao.insert(input);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int update(AccountVO input) {
		return dao.update(input);
	}

	public String findAccount(String email) {
		List<String> ids = dao.selectEmail(email);
		String result = "";
		
		for (String id : ids) {
			result += id + "\\n";
		}
		
		return result;
	}

	public String findAccount(AccountVO input) 
			throws NoSuchAlgorithmException {
		
		input = dao.seletAcc(input);
		String msg = "존재하지 않는 계정 정보";
		
		if (input == null) {
			return msg;
		}
		
		msg = RandomStringUtils.randomAlphanumeric(8);
		input.setUserpw(hash.getHash(msg));
		
		dao.update(input);
		
		return msg;
	}
	
}

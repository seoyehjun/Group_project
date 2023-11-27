package com.itbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.dao.MyPageDAO;
import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.OrderVO;

@Service
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;
	
	public List<OrderVO> listMyOrderGoods(String members_idx) throws Exception
	{
		return myPageDAO.listMyOrderGoods(members_idx);
	}
	
	public MemberVO givememember(String members_idx) throws Exception
	{
		return myPageDAO.givememember(members_idx);
	}
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception
	{
		String members_idx = (String)memberMap.get("members_idx");
		myPageDAO.updateMyInfo(memberMap);
		return givememember(members_idx);
	}
}

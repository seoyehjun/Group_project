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
	
	public void modifyMyInfo(Map memberMap) throws Exception
	{
		String member_id = (String)memberMap.get("member_id");
		myPageDAO.updateMyInfo(memberMap);
	}
}

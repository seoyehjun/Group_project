package com.itbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.dao.MyPageDAO;
import com.itbank.model.vo.Cart_vo;
import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.O_OD_P_C_S_M_vo;
import com.itbank.model.vo.O_P_OD_vo;
import com.itbank.model.vo.OrderVO;

@Service
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;
	
	public List<Cart_vo> listMyCart(String members_idx) throws Exception
	{
		return myPageDAO.listMyCart(members_idx);
	}
	
	public List<O_P_OD_vo> listMyOrderGoods(String members_idx) throws Exception
	{
		System.out.println("members_idx: "+members_idx);
		return myPageDAO.listMyOrderGoods(members_idx);
	}
	
	public MemberVO givememember(int members_idx) throws Exception
	{
		return myPageDAO.givememember(members_idx);
	}
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception
	{
		String members_idx = (String)memberMap.get("members_idx");//return값 보내서 세션 업데이트하기위해
		myPageDAO.updateMyInfo(memberMap);
		return givememember(Integer.parseInt(members_idx));
	}
	
	public O_OD_P_C_S_M_vo getOrderDetail(int orders_idx)throws Exception
	{
		return myPageDAO.getOrderDetail(orders_idx);
	}
}

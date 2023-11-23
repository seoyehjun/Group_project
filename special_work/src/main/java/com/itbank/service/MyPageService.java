package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.dao.MyPageDAO;
import com.itbank.model.vo.OrderVO;

@Service
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;
	
	public List<OrderVO> listMyOrderGoods(String member_idx) throws Exception
	{
		return myPageDAO.listMyOrderGoods(member_idx);
	}
}

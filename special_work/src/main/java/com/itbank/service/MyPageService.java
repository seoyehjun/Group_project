package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.dao.MyPageDAO;
import com.itbank.model.vo.OrderVO;

@Service("myPageService")
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;
	
	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception
	{
		return myPageDAO.listMyOrderGoods(member_id);
	}
}

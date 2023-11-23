package com.itbank.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.itbank.model.vo.OrderVO;


public interface MyPageDAO 
{
	@Select("select * from orders " + 
			"            where members_idx=#{members_idx} " + 
			"            order by orderdate desc")
	List<OrderVO> listMyOrderGoods(String member_idx);
	
}

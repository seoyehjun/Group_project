package com.itbank.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.model.vo.OrderVO;

@Repository("myPageDAO")
public interface MyPageDAO 
{
	@Select("select * from orders " + 
			"            where member_id=#{member_id} " + 
			"            order by orderdate desc")
	List<OrderVO> listMyOrderGoods(String member_id);
	
}

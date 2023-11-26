package com.itbank.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.itbank.model.vo.OrderVO;

@Repository
public interface MyPageDAO 
{
	@Select("select * from orders " + 
			"            where members_idx=#{members_idx} " + 
			"            order by orders_date desc")
	List<OrderVO> listMyOrderGoods(String members_idx);
	
	void updateMyInfo(Map memberMap);// mapper���� ���� ��
}

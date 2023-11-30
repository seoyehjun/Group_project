package com.itbank.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.OrderVO;

@Repository
public interface MyPageDAO 
{
	@Select("select orders_idx, orders_date, orders_status"
			+ "	from orders o, products p, orders_detailed od "  
			+ "		where od.orders_idx = o.orders_idx"
			+ "		and od.products_idx = p.products_idx"
			+ "		and members_idx=#{members_idx} " 
			+ "		order by o.orders_date desc")
	List<OrderVO> listMyOrderGoods(String members_idx);
	
	@Select("select * from members " + 
			"            where members_idx=#{members_idx} " )
	MemberVO givememember(int members_idx);
	
	void updateMyInfo(Map memberMap);// mapper���� ���� ��
}

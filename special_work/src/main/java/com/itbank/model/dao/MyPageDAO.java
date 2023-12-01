package com.itbank.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.O_P_OD_vo;
import com.itbank.model.vo.OrderVO;

@Repository
public interface MyPageDAO 
{
	@Select("select o.orders_idx, o.orders_date, o.orders_status"
			+ ",p.products_name, p.products_idx, od.quantity"
			+ "	from orders o, products p, ordersd_details od "  
			+ "		where od.orders_idx = o.orders_idx"
			+ "		and od.products_idx = p.products_idx"
			+ "		and members_idx = #{members_idx} " 
			+ "		order by o.orders_date desc")
	List<O_P_OD_vo> listMyOrderGoods(String members_idx);
	
	@Select("select * from members " + 
			"            where members_idx=#{members_idx} " )
	MemberVO givememember(int members_idx);
	
	void updateMyInfo(Map memberMap);// mapper에서 구현 ㄱ
}

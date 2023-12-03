package com.itbank.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.itbank.model.vo.Cart_vo;
import com.itbank.model.vo.MemberVO;
import com.itbank.model.vo.O_OD_P_C_S_M_vo;
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
	
	@Select("select c.cart_idx, c.quantity, c.products_idx, c.members_idx,c.color_idx, c.size_idx"
			+ " , p.products_name, p.products_price, st.size_product, ct.color" + 
			" from cart c, products p, size_table st, color ct,products_color pc, products_size ps, members m" + 
			" where #{members_idx}= c.members_idx" + 
			" and m.members_idx = #{members_idx}" + 
			" and c.products_idx = p.products_idx" + 
			" and c.products_idx = pc.products_idx and pc.color_idx = ct.color_idx and c.color_idx = pc.color_idx" + 
			" and c.products_idx = ps.products_idx and ps.size_idx = st.size_idx and c.size_idx = ps.size_idx")
	List<Cart_vo> listMyCart(String members_idx);
	
	//sql문에 필요한 열 데이터가 하나라도 없으면 행반환 안될수도 있다. --> products_img
	@Select("select o.orders_idx, o.orders_date, o.orders_status" + 
			"			,o.orders_recipient_address, o.orders_detailed_address" + 
			"			,o.orders_recipient_phone, o.orders_recipient_name" + 
			"			,od.quantity" + 
			"			,p.products_idx, p.products_name, p.products_price " + 
			"			,pi.img_url" + 
			"			,c.color" + 
			"			,st.size_product" + 
			"			from orders o, ordersd_details od, products p, products_img pi, color c, size_table st" + 
			"			,products_color pc, products_size ps " + 
			"            where o.orders_idx = od.orders_idx" + 
			"            and od.products_idx = p.products_idx" + 
			"            and p.products_idx = pi.products_idx" + 
			"            and ps.size_idx = od.size_idx and ps.products_idx = od.products_idx and ps.size_idx = st.size_idx" + 
			"            and pc.color_idx = od.color_idx and pc.products_idx = od.products_idx and pc.color_idx = c.color_idx " + 
			"            and o.orders_idx = #{orders_idx}")
	O_OD_P_C_S_M_vo getOrderDetail(int orders_idx);
	
	
	void updateMyInfo(Map memberMap);// mapper에서 구현 ㄱ
}

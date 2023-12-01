package com.itbank.model.vo;

import java.sql.Date;

public class O_P_OD_vo
{
	//ORDERS 테이블
	public int orders_idx;
	public Date orders_date;
	public String orders_status;
	
	//PRODUCTS 테이블
	public String products_name;
	public int products_idx;
	
	//ORDERS_DETAILS 테이블
	public int quantity;

	public int getOrders_idx() {
		return orders_idx;
	}

	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}

	public Date getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Date orders_date) {
		this.orders_date = orders_date;
	}

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
	}

	public String getProducts_name() {
		return products_name;
	}

	public void setProducts_name(String products_name) {
		this.products_name = products_name;
	}

	public int getProducts_idx() {
		return products_idx;
	}

	public void setProducts_idx(int products_idx) {
		this.products_idx = products_idx;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}

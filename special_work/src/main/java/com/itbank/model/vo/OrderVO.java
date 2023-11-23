package com.itbank.model.vo;

import java.sql.Date;

public class OrderVO 
{
	int orders_idx,orders_total_amount,orders_total_quantity,
	products_id, members_id;
	Date orders_date;
	String orders_status, orders_recipient_name, 
	orders_recipient_address, orders_detailed_address,
	orders_recipient_phone, orders_delivery_notes;
	
	
	public int getProduct_id() {
		return products_id;
	}
	public void setProduct_id(int product_id) {
		this.products_id = product_id;
	}
	public int getMember_id() {
		return members_id;
	}
	public void setMember_id(int member_id) {
		this.members_id = member_id;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}
	public int getOrders_total_amount() {
		return orders_total_amount;
	}
	public void setOrders_total_amount(int orders_total_amount) {
		this.orders_total_amount = orders_total_amount;
	}
	public int getOrders_total_quantity() {
		return orders_total_quantity;
	}
	public void setOrders_total_quantity(int orders_total_quantity) {
		this.orders_total_quantity = orders_total_quantity;
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
	public String getOrders_recipient_name() {
		return orders_recipient_name;
	}
	public void setOrders_recipient_name(String orders_recipient_name) {
		this.orders_recipient_name = orders_recipient_name;
	}
	public String getOrders_recipient_address() {
		return orders_recipient_address;
	}
	public void setOrders_recipient_address(String orders_recipient_address) {
		this.orders_recipient_address = orders_recipient_address;
	}
	public String getOrders_detailed_address() {
		return orders_detailed_address;
	}
	public void setOrders_detailed_address(String orders_detailed_address) {
		this.orders_detailed_address = orders_detailed_address;
	}
	public String getOrders_recipient_phone() {
		return orders_recipient_phone;
	}
	public void setOrders_recipient_phone(String orders_recipient_phone) {
		this.orders_recipient_phone = orders_recipient_phone;
	}
	public String getOrders_delivery_notes() {
		return orders_delivery_notes;
	}
	public void setOrders_delivery_notes(String orders_delivery_notes) {
		this.orders_delivery_notes = orders_delivery_notes;
	}
	
}

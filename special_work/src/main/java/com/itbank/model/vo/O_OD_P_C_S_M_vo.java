package com.itbank.model.vo;

import java.sql.Date;

public class O_OD_P_C_S_M_vo 
{
	//Orders
	private String orders_status;
	private String orders_recipient_address;
	private String orders_detailed_address;
	private String orders_recipient_phone;
	private String orders_recipient_name;
	private Date orders_date;
	private int orders_idx;
	
	//Odersd_Details
	int quantity;
	
	//Products
	int products_idx;
	String products_name;
	int products_price;
	
	//products_img
	String img_url;
	
	//color
	String color;
	
	//size_table
	String size_product;

	public String getOrders_status() {
		return orders_status;
	}

	public void setOrders_status(String orders_status) {
		this.orders_status = orders_status;
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

	public String getOrders_recipient_name() {
		return orders_recipient_name;
	}

	public void setOrders_recipient_name(String orders_recipient_name) {
		this.orders_recipient_name = orders_recipient_name;
	}

	public Date getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Date orders_date) {
		this.orders_date = orders_date;
	}

	public int getOrders_idx() {
		return orders_idx;
	}

	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProducts_idx() {
		return products_idx;
	}

	public void setProducts_idx(int products_idx) {
		this.products_idx = products_idx;
	}

	public String getProducts_name() {
		return products_name;
	}

	public void setProducts_name(String products_name) {
		this.products_name = products_name;
	}

	public int getProducts_price() {
		return products_price;
	}

	public void setProducts_price(int products_price) {
		this.products_price = products_price;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize_product() {
		return size_product;
	}

	public void setSize_product(String size_product) {
		this.size_product = size_product;
	}
	
	
	
}

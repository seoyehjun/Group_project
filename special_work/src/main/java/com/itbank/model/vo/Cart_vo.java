package com.itbank.model.vo;

import java.sql.Date;

public class Cart_vo 
{
	private int cart_idx, quantity, products_idx, members_idx, color_idx,size_idx ;
	private Date added_date ;
	
	private String products_name,products_price;
	private String size_product;
	private String color;
	private String img_url;
	
	
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getProducts_name() {
		return products_name;
	}
	public void setProducts_name(String products_name) {
		this.products_name = products_name;
	}
	public String getProducts_price() {
		return products_price;
	}
	public void setProducts_price(String products_price) {
		this.products_price = products_price;
	}
	public String getSize_product() {
		return size_product;
	}
	public void setSize_product(String size_product) {
		this.size_product = size_product;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
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
	public int getMembers_idx() {
		return members_idx;
	}
	public void setMembers_idx(int members_idx) {
		this.members_idx = members_idx;
	}
	public int getColor_idx() {
		return color_idx;
	}
	public void setColor_idx(int color_idx) {
		this.color_idx = color_idx;
	}
	public int getSize_idx() {
		return size_idx;
	}
	public void setSize_idx(int size_idx) {
		this.size_idx = size_idx;
	}
	public Date getAdded_date() {
		return added_date;
	}
	public void setAdded_date(Date added_date) {
		this.added_date = added_date;
	}
	
	
}

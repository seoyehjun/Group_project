package com.itbank.model.vo;

import java.sql.Date;

public class OrderVO 
{
	private int orderid, productid,memberid,totalpayment
	, totalquantity;
	private String orderstatus, recipientname,postalcode, recipientaddress
	,recipientphone, deliveryrequest, representativeproduct
	,representativeimageurl;
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getTotalpayment() {
		return totalpayment;
	}
	public void setTotalpayment(int totalpayment) {
		this.totalpayment = totalpayment;
	}
	public int getTotalquantity() {
		return totalquantity;
	}
	public void setTotalquantity(int totalquantity) {
		this.totalquantity = totalquantity;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getRecipientname() {
		return recipientname;
	}
	public void setRecipientname(String recipientname) {
		this.recipientname = recipientname;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getRecipientaddress() {
		return recipientaddress;
	}
	public void setRecipientaddress(String recipientaddress) {
		this.recipientaddress = recipientaddress;
	}
	public String getRecipientphone() {
		return recipientphone;
	}
	public void setRecipientphone(String recipientphone) {
		this.recipientphone = recipientphone;
	}
	public String getDeliveryrequest() {
		return deliveryrequest;
	}
	public void setDeliveryrequest(String deliveryrequest) {
		this.deliveryrequest = deliveryrequest;
	}
	public String getRepresentativeproduct() {
		return representativeproduct;
	}
	public void setRepresentativeproduct(String representativeproduct) {
		this.representativeproduct = representativeproduct;
	}
	public String getRepresentativeimageurl() {
		return representativeimageurl;
	}
	public void setRepresentativeimageurl(String representativeimageurl) {
		this.representativeimageurl = representativeimageurl;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	private Date orderdate;
}

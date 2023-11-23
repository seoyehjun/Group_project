package com.itbank.model.vo;

import java.sql.Date;

public class MemberVO {
	int members_idx;
	String members_id,members_password
	,members_nickname
	,members_email
	,members_address 
	,members_detailed_address
	,members_phone_number
	,members_name, members_is_withdrawn;
	int members_ssn;
	int members_points;
	Date members_join_date;
	
	public int getMembers_idx() {
		return members_idx;
	}
	public void setMembers_idx(int members_idx) {
		this.members_idx = members_idx;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public String getMembers_password() {
		return members_password;
	}
	public void setMembers_password(String members_password) {
		this.members_password = members_password;
	}
	public String getMembers_nickname() {
		return members_nickname;
	}
	public void setMembers_nickname(String members_nickname) {
		this.members_nickname = members_nickname;
	}
	public String getMembers_email() {
		return members_email;
	}
	public void setMembers_email(String members_email) {
		this.members_email = members_email;
	}
	public String getMembers_address() {
		return members_address;
	}
	public void setMembers_address(String members_address) {
		this.members_address = members_address;
	}
	public String getMembers_detailed_address() {
		return members_detailed_address;
	}
	public void setMembers_detailed_address(String members_detailed_address) {
		this.members_detailed_address = members_detailed_address;
	}
	public String getMembers_phone_number() {
		return members_phone_number;
	}
	public void setMembers_phone_number(String members_phone_number) {
		this.members_phone_number = members_phone_number;
	}
	public String getMembers_name() {
		return members_name;
	}
	public void setMembers_name(String members_name) {
		this.members_name = members_name;
	}
	public String getMembers_is_withdrawn() {
		return members_is_withdrawn;
	}
	public void setMembers_is_withdrawn(String members_is_withdrawn) {
		this.members_is_withdrawn = members_is_withdrawn;
	}
	public int getMembers_ssn() {
		return members_ssn;
	}
	public void setMembers_ssn(int members_ssn) {
		this.members_ssn = members_ssn;
	}
	public int getMembers_points() {
		return members_points;
	}
	public void setMembers_points(int members_points) {
		this.members_points = members_points;
	}
	public Date getMembers_join_date() {
		return members_join_date;
	}
	public void setMembers_join_date(Date members_join_date) {
		this.members_join_date = members_join_date;
	} 
}

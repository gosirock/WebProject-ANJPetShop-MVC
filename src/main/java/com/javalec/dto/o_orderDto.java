package com.javalec.dto;

import java.sql.Timestamp;

public class o_orderDto {

	// Field
	int ordernum;
	String userid;
	String pid;
	int count;
	int price;
	Timestamp orderdate;
	
	// Constructor
	public o_orderDto() {
		// TODO Auto-generated constructor stub
	}

	public o_orderDto(int ordernum, String userid, String pid, int count, int price, Timestamp orderdate) {
		super();
		this.ordernum = ordernum;
		this.userid = userid;
		this.pid = pid;
		this.count = count;
		this.price = price;
		this.orderdate = orderdate;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	
	
}

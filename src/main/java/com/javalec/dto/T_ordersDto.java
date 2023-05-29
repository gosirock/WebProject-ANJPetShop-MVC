package com.javalec.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class T_ordersDto {
	
	// Filed
	String ordernum;
	int count;
	int price;
	String userid;
	String pid;
	String orderdate;
	
	// Construct
	public T_ordersDto(int count, int price, String orderdate, String userid, String pid) {
		  // this.ordernum = userid + "_" + getCurrentDateTime();
		  this.count = count;
		  this.price = price;
		  this.orderdate = orderdate;
		  this.userid = userid;
		  this.pid = pid;
		}



	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
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

	public String getOrderdate() {
		return orderdate;
	}
	
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
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
	
	
	// Method

//	// 현재 날짜 및 시간을 문자열로 반환하는 메서드
//	private String getCurrentDateTime() {
//	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//	  return sdf.format(new Date());
//	}
	
}

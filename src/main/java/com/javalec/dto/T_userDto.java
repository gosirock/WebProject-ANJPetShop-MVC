package com.javalec.dto;

public class T_userDto {
	
	// Field
	String userid;
	String username;
	String usertel;
	String useremail;
	String address;
	
	
	// Construct
	public T_userDto() {
		// TODO Auto-generated constructor stub
	}


	public T_userDto(String username, String usertel, String useremail, String address) {
		super();
		//this.userid = userid;
		this.username = username;
		this.usertel = usertel;
		this.useremail = useremail;
		this.address = address;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUsertel() {
		return usertel;
	}


	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}

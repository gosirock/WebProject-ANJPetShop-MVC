package com.javalec.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class o_userDto {

	// Field
	String userid;
	String username;
	String usertel;
	String useremail;
	String useraddress;
	Date insertdate;
	Date deletedate;
	
	public o_userDto() {
		// TODO Auto-generated constructor stub
	}

	public o_userDto(String userid, String username, String usertel, String useremail, String useraddress,
			Date insertdate, Date deletedate) {
		super();
		this.userid = userid;
		this.username = username;
		this.usertel = usertel;
		this.useremail = useremail;
		this.useraddress = useraddress;
		this.insertdate = insertdate;
		this.deletedate = deletedate;
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

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public Date getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(Date insertdate) {
		this.insertdate = insertdate;
	}

	public Date getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}


}

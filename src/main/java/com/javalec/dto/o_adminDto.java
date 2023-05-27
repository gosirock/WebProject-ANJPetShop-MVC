package com.javalec.dto;

public class o_adminDto {

	// Field
	String adminid;
	String adminpasswd;
	String adminname;
	String admintel;
	
	public o_adminDto() {
		// TODO Auto-generated constructor stub
	}

	public o_adminDto(String adminid, String adminpasswd, String adminname, String admintel) {
		super();
		this.adminid = adminid;
		this.adminpasswd = adminpasswd;
		this.adminname = adminname;
		this.admintel = admintel;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpasswd() {
		return adminpasswd;
	}

	public void setAdminpasswd(String adminpasswd) {
		this.adminpasswd = adminpasswd;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getAdmintel() {
		return admintel;
	}

	public void setAdmintel(String admintel) {
		this.admintel = admintel;
	}
	
}

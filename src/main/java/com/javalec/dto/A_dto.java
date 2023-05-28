package com.javalec.dto;

public class A_dto {

	// field
	String pid;
	String pname;
	int psize;
	String pcolor;
	int pprice;
	String pimage;

	// 생성자

	public A_dto(String pid, String pname, int pprice) {
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
	}


	public A_dto(String pname, int pprice) {
		super();
		this.pname = pname;
		this.pprice = pprice;
	}


	public A_dto(String pid, String pname, int pprice, String pimage) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pimage = pimage;
	}




	public String getPimage() {
		return pimage;
	}
	
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPsize() {
		return psize;
	}

	public void setPsize(int psize) {
		this.psize = psize;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

}

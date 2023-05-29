package com.javalec.dto;

public class o_productDto {

	// Field
	String pid;
	String pname;
	int psize;
	String pcolor;
	int pprice;
	int pstock;
	String pimage;
	
	// Constructor
	public o_productDto() {
		// TODO Auto-generated constructor stub
	}

	public o_productDto(String pid, String pname, int psize, String pcolor, int pprice, int pstock, String pimage) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.psize = psize;
		this.pcolor = pcolor;
		this.pprice = pprice;
		this.pstock = pstock;
		this.pimage = pimage;
	}

	// getter and setter
	
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

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	
}

package com.javalec.command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ACommand { 		// 작업시 수행시킬 내용. 메소드 이름만 정의 
	
	public void execute(HttpServletRequest request, HttpServletResponse response);

}

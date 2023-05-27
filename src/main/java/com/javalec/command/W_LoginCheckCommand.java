package com.javalec.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.W_Dao;

public class W_LoginCheckCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		W_Dao dao = new W_Dao();
		String result = dao.loginChack(id, pw);
		
		System.out.println("로그인?");
		
		response.setContentType("text/plain; charset=utf-8");
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}

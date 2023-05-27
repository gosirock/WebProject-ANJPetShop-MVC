package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.W_Dao;

public class W_joinCommnand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		W_Dao dao = new W_Dao();
		dao.join(id, pw, name, tel, email, address);
	}

}

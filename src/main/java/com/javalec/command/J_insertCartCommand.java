package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.J_dao;


public class J_insertCartCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String uid = request.getParameter("userid");
		String pid = request.getParameter("pid");
		String qty = request.getParameter("qty");
		
		J_dao dao = new J_dao();
		dao.insertcart(uid, pid, qty);
		
	}

}

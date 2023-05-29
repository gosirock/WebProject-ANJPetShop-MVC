package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.J_dao;
import com.javalec.dto.J_dto;

public class J_productViewCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
//		String pid = request.getParameter("pid");
		String pid = "NB02IVY250";
		J_dao dao = new J_dao();
		J_dto dto = dao.contentView(pid);
		
		request.setAttribute("content_view", dto);

	}

}

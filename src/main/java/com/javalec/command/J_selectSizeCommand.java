package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.J_dao;
import com.javalec.dto.J_dto;

public class J_selectSizeCommand implements ACommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
//		String pid = request.getParameter("pid");
		String pid = "NB02IVY250";
		J_dao dao = new J_dao();
		ArrayList<J_dto> dto = dao.selectSize(pid);
		
		request.setAttribute("selectSize", dto);
	}

}

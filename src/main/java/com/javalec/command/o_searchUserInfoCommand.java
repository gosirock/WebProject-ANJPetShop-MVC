package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;
import com.javalec.dto.o_userDto;

public class o_searchUserInfoCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		
		o_adminDao dao = new o_adminDao();
		ArrayList<o_userDto> dtos = dao.searchUserInfo(queryName, queryContent);
		request.setAttribute("userlist", dtos);
	}

}

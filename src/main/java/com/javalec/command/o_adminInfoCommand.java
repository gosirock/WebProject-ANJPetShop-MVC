package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;
import com.javalec.dto.o_adminDto;
import com.mysql.cj.Session;

public class o_adminInfoCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		o_adminDao dao = new o_adminDao();
		String adminid = request.getParameter("adminid");
		
		o_adminDto dto = dao.searchAdminInfo(adminid);
		
		request.setAttribute("admin_info", dto);

	}

}

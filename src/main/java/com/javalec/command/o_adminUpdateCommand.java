package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;
import com.javalec.dto.o_adminDto;

public class o_adminUpdateCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		o_adminDao dao = new o_adminDao();
		String adminId = request.getParameter("adminid");
		String adminPasswd = request.getParameter("adminpasswd");
		String adminName = request.getParameter("adminname");
		String adminTel = request.getParameter("admintel");
		
		dao.adminUpdate(adminId, adminPasswd, adminName, adminTel);
	}

}

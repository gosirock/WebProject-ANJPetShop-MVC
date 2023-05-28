package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;

public class o_stockChanageCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		o_adminDao dao = new o_adminDao();
		
		String pid = request.getParameter("pid");
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		String pimage = request.getParameter("pimage");
		
		dao.stockChange(pid, pprice, pstock, pimage);


	}

}

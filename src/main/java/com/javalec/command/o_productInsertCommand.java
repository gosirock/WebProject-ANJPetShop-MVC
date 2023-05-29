package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;

public class o_productInsertCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pid = request.getParameter("pid");
		System.out.println("pid" + pid);
		String pname = request.getParameter("pname");
		System.out.println("pname" + pname);
		int psize = Integer.parseInt(request.getParameter("psize"));
		System.out.println("psize" + psize);
		String pcolor = request.getParameter("pcolor");
		System.out.println("pcolor" + pcolor);
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		System.out.println("pprice" + pprice);
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		System.out.println("pstock" + pstock);
		String pimage = request.getParameter("pimage");
		System.out.println("pimage" + pimage);
		
		o_adminDao dao = new o_adminDao();
		
		int result = dao.productInsert(pid, pname, psize, pcolor, pprice, pstock, pimage);
		
		request.setAttribute("result", result);
		

	}

}

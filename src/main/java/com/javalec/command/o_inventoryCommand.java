package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;
import com.javalec.dto.o_productDto;

public class o_inventoryCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		o_adminDao dao = new o_adminDao();
		
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		ArrayList<o_productDto> dtos = dao.searchInventory(queryName, queryContent);
		
		request.setAttribute("productList", dtos);
	}

}

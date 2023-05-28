package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.o_adminDao;
import com.javalec.dto.o_adminDto;
import com.javalec.dto.o_orderDto;

public class o_ordersCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		o_adminDao dao = new o_adminDao();
		
		ArrayList<o_orderDto> dtos = dao.searchOrders();
		
		request.setAttribute("orders", dtos);

	}

}

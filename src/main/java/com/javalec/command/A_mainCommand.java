package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.A_dao;
import com.javalec.dto.A_dto;

public class A_mainCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		//	메인페이지 데이터베이스 연결 (Command)
		A_dao dao = new A_dao();
		ArrayList<A_dto> dtos = dao.A_mainView();
		request.setAttribute("A_mainView", dtos);

		System.out.println("여기까지는 오고있긴 하냐? 여기네 여기서 못받네;");
	}

}

package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.T_Dao;
import com.javalec.dto.T_userDto;

public class T_userinfoCommand implements ACommand {

	 @Override
	    public void execute(HttpServletRequest request, HttpServletResponse response) {
	        T_Dao dao = new T_Dao();
	        T_userDto dto = dao.userlist();
	        request.setAttribute("acontent_View", dto);

			/*
			 * // 배송지 정보를 보여주는 form에도 동일한 속성을 설정 request.setAttribute("delivery_View", dto);
			 */
	    }
	}


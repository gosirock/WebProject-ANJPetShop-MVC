package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.T_Dao;

public class T_cartDeleteCommand implements ACommand {

	    @Override
	    public void execute(HttpServletRequest request, HttpServletResponse response) {
	    	String seqParam = request.getParameter("seq");
	    	int seq = 0; // 기본값 설정
	    	if (seqParam != null && !seqParam.isEmpty()) {
	    	    seq = Integer.parseInt(seqParam);
	    	}
	    	System.out.println(seq);
	        T_Dao dao = new T_Dao();
	        dao.delete(seq);
	    }
	}


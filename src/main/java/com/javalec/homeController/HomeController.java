package com.javalec.homeController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.javalec.command.ACommand;
import com.javalec.command.A_ProductCommand;
import com.javalec.command.A_mainCommand;

/**
 * Servlet implementation class SemiFrrontController
 */
@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		ACommand command = null; // 커맨드 호출
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		
		String com = uri.substring(conPath.length());
		

		
		// 각 조원 별 컨트롤러 추가 
		switch (com) {
		case("/A_mainView.do"): //글을 쓰기 위한 빈화면
		command = new A_mainCommand(); //DB에서 불러오는 것
		command.execute(request, response);	
		viewPage = "A_mainView.jsp";
		break;
		case ("/A_ProductView.do"):
		command = new A_ProductCommand(); //DB에서 불러오는 것
		command.execute(request, response);	
		viewPage = "A_ProductView.jsp";
		break;
		}	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
//		
//		switch (com) { 
//		case "/o_searchUserInfo.do":
//			command = new o_searchUserInfoCommand();
//			command.execute(request, response);
//			viewPage = "o_searchUserInfo.jsp";
//			break;
//		// 다른 case문들 추가
//
//	
//	
//	
//	}
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
} //END

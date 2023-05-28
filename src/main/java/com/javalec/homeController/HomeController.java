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
//import com.javalec.command.j_productViewCommand;
//import com.javalec.command.j_selectColorCommand;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");

		String viewPage = null;
		ACommand command = null; // 커맨드 호출
		ACommand command1 = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();

		String com = uri.substring(conPath.length());

		// 각 조원 별 컨트롤러 추가
		switch (com) {
		case ("/A_mainView.do"): // 글을 쓰기 위한 빈화면
			command = new A_mainCommand(); // DB에서 불러오는 것
			command.execute(request, response);
			viewPage = "A_mainView.jsp";
			break;
		case ("/A_ProductView.do"):
			command = new A_ProductCommand(); // DB에서 불러오는 것
			command.execute(request, response);
			viewPage = "A_ProductView.jsp";
			break;
//		case ("/j_productView.do"): // 상품 선택시 보여줄 페이지
//			command = new j_productViewCommand();
//			command.execute(request, response);
//			command1 = new j_selectColorCommand();
//			command1.execute(request, response);
//			viewPage = "j_productDetail.jsp";
//			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

} // END

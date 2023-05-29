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
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		switch(com) {
		case("/idCheck.do"):
			idCheckDo(request, response);
			break;
		case("/loginCheck.do"):
			loginCheckdo(request, response);
			break;
		default:
			actionDo(request, response);
		}
	}

	

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("utf-8");

		String viewPage = null;
		ACommand command = null; // 커맨드 호출

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();

		String com = uri.substring(conPath.length());
		
	

		// 각 조원 별 컨트롤러 추가
		switch (com) {
		case("/"):
			viewPage = "A_mainView.do";
			break;
		// 재원이 컨트롤러
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
		// 종욱이 컨트롤러
		case("/o_adminMain.do"):
			command = new o_ordersCommand();
			command.execute(request, response);
			command1 = new o_salesCommand();
			command1.execute(request, response);
			viewPage = "o_adminMain.jsp?adminid=admin1";
			break;
		case("/o_searchUserInfo.do"):
			command = new o_searchUserInfoCommand();
			command.execute(request, response);
			viewPage = "o_searchUserInfo.jsp";
			break;
		case("/o_adminInfo.do"):
			command = new o_adminInfoCommand();
			command.execute(request, response);
			viewPage = "o_adminInfo.jsp";
			break;
		case("/o_adminUpdate.do"):
			command = new o_adminUpdateCommand();
			command.execute(request, response);
			viewPage = "o_adminInfo.do";
			break;
		case("/o_searchSales.do"):
			command = new o_salesCommand();
			command.execute(request, response);
			viewPage = "o_sales.jsp";
			break;
		case("/o_inventory.do"):
			command = new o_inventoryCommand();
			command.execute(request, response);
			viewPage = "o_adminProductCRUD.jsp";
			break;	
		case("/o_productChange.do"):
			command = new o_stockChanageCommand();
			command.execute(request, response);
			viewPage = "o_inventory.do";
			break;
		case("/o_productInsert.do"):
			command = new o_productInsertCommand();
			command.execute(request, response);
			viewPage = "o_inventory.do";
			break;

		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

		
	}
	// 종욱이 컨트롤
	private void idCheckDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ACommand command = null;
		
			command = new W_IdCheckCommand();
			command.execute(request, response);
}

	private void loginCheckdo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ACommand command = null;
			command = new W_LoginCheckCommand();
			command.execute(request, response);
}


} // END

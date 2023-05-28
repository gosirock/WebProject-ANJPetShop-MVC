package com.javalec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.o_adminDto;
import com.javalec.dto.o_orderDto;
import com.javalec.dto.o_userDto;

public class o_adminDao {

	// Field
	DataSource dataSource;
	
	public o_adminDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvcshop");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<o_userDto> searchUserInfo(String queryName, String queryContent){
		ArrayList<o_userDto> dtos = new ArrayList<>();

		if(queryName == null){ // 첫 화면인 경우
			queryName = "username";
			queryContent = "";
		}
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select userid, username, usertel, useremail, useraddress, insertdate, deletedate from user";
			String where = " where " + queryName + " like '%" + queryContent + "%';";
			preparedStatement = connection.prepareStatement(query + where);
			resultSet = preparedStatement.executeQuery();
			
			
			while(resultSet.next()) {
				String userid = resultSet.getString(1);
				String username = resultSet.getString(2);
				String usertel = resultSet.getString(3) ;
				String useremail = resultSet.getString(4);
				String useraddress = resultSet.getString(5);
				Date insertdate = resultSet.getDate(6);
				Date deletedate = resultSet.getDate(7);
				
				o_userDto dto = new o_userDto(userid, username, usertel, useremail, useraddress, insertdate, deletedate);
				dtos.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 생성한 순서의 역순대로 닫아준다! -> 퍼포먼스가 좋아짐.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
		
	} // SearchUserInfo
	
	public o_adminDto searchAdminInfo(String adminid){
		o_adminDto dto = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from admin where adminid = '" + adminid + "'";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			
			if(resultSet.next()) {
				String adminpasswd = resultSet.getString(2);
				String adminname = resultSet.getString(3);
				String admintel = resultSet.getString(4);
				
				dto = new o_adminDto(adminid, adminpasswd, adminname, admintel);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 생성한 순서의 역순대로 닫아준다! -> 퍼포먼스가 좋아짐.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
		
	} // searchAdminInfo
	
	public ArrayList<o_orderDto> searchOrders(){
		ArrayList<o_orderDto> dtos = new ArrayList<>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 날짜 형식 바꾸기.
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from orders";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			
			while(resultSet.next()) {
				int ordernum = resultSet.getInt(1);
				String userid = resultSet.getString(2);
				String pid = resultSet.getString(3);
				int count = resultSet.getInt(4);
				int tmp_price = resultSet.getInt(5);
				String price = DecimalFormat.getInstance().format(tmp_price); // 형식 데시멀로 변경
				Timestamp tmp_orderdate = resultSet.getTimestamp(6);
				String orderdate = format.format(tmp_orderdate);
				
				
				o_orderDto dto = new o_orderDto(ordernum, userid, pid, count, price, orderdate);
				dtos.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 생성한 순서의 역순대로 닫아준다! -> 퍼포먼스가 좋아짐.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
		
	} // SearchUserInfo
	
	public void adminUpdate(String adminId, String adminPasswd, String adminName, String adminTel) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update admin set adminpasswd = ?, adminname = ?, admintel = ? where adminid = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, adminPasswd);
			preparedStatement.setString(2, adminName);
			preparedStatement.setString(3, adminTel);
			preparedStatement.setString(4, adminId);

			preparedStatement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 생성한 순서의 역순대로 닫아준다! -> 퍼포먼스가 좋아짐.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // adminUpdate
	
	public String searchDaySales() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String daySales = "";

		try {
			connection = dataSource.getConnection();
			String query = "SELECT SUM(price) FROM orders ";
			String where = " WHERE DATE(orderdate) = CURDATE();";

			preparedStatement = connection.prepareStatement(query + where);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				int tmpDaySales = resultSet.getInt(1);
				daySales = DecimalFormat.getInstance().format(tmpDaySales);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return daySales;
	} // 일간 매출 조회
	
	public String searchWeekSales() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String weekSales = "0"; // 쿼리문 조회가 안 될 경우(주간 매출이 없는 경우) if문 자체가 돌지 않기 때문에 미리 초기화했다.

		try {
			connection = dataSource.getConnection();
			String query = "SELECT SUM(price) FROM orders";
			String where = " WHERE YEARWEEK(orderdate) = YEARWEEK(CURDATE()) GROUP BY YEARWEEK(orderdate);";

			preparedStatement = connection.prepareStatement(query + where);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				int tmpWeekSales = resultSet.getInt(1);
				weekSales = DecimalFormat.getInstance().format(tmpWeekSales);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return weekSales;
	} // 매출 조회
	
	public String searchMonthSales() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String monthSales = "";

		try {
			connection = dataSource.getConnection();
			String query = "SELECT SUM(price) FROM orders";
			String where = " WHERE YEAR(orderdate) = YEAR(CURDATE()) AND MONTH(orderdate) = MONTH(CURDATE());";

			preparedStatement = connection.prepareStatement(query + where);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				int tmpDaySales = resultSet.getInt(1);
				monthSales = DecimalFormat.getInstance().format(tmpDaySales);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) resultSet.close();
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return monthSales;
	} // 매출 조회

	
} // End

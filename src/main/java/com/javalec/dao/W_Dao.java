package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class W_Dao {

	
	DataSource dataSource;
	public W_Dao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvcshop");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public String joinIdChack(String id) {
		String result = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		try {
			connection = dataSource.getConnection();
			String query = "select count(userid) as id from user where userid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				result = resultSet.getString("id");
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "NO";
			return result;
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}

	
	public void join(String id, String pw, String name, String tel, String email, String address) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			String query = "insert into user (userid, userpasswd, username, usertel, useremail, useraddress, insertdate) values(?,?,?,?,?,?,now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, pw);
			preparedStatement.setString(3, name);
			preparedStatement.setString(4, tel);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, address);
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}

	public String loginChack(String id, String pw) {
		String result = "";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		
			connection = dataSource.getConnection();
			String query = "SELECT 'admin' AS type FROM admin WHERE adminid = ? AND adminpasswd = ? UNION ALL SELECT 'user' AS type FROM user WHERE userid = ? AND userpasswd = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, pw);
			preparedStatement.setString(3, id);
			preparedStatement.setString(4, pw);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = resultSet.getString("type");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		return result;
	}
	
	public void userUpdate(String id, String pw, String name, String tel, String email, String address) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			String query = "insert into user (userid, userpasswd, username, usertel, useremail, useraddress, insertdate) values(?,?,?,?,?,?,now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, pw);
			preparedStatement.setString(3, name);
			preparedStatement.setString(4, tel);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, address);
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}

}//end	
		

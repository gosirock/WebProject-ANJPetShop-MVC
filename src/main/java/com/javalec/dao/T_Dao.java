package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.T_productDto;

public class T_Dao {
	
	DataSource dataSource;
	
	public T_Dao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvcshop"); // context.xml에서 정보 가져오기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 장바구니에 담긴 상품 보여주기
	public ArrayList<T_productDto> list() {
	    ArrayList<T_productDto> dtos = new ArrayList<T_productDto>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    //String userid = request.getParameter("userid");

	    try {
	        connection = dataSource.getConnection();
	        String sql = "SELECT c.seq, c.count, c.userid, c.pid, p.pname, p.psize, p.pcolor, p.pprice " +
	                     "FROM user u, cart c, product p " +
	                     "WHERE u.userid = c.userid AND p.pid = c.pid"; //AND u.userid = '" + userid + "'";
	        preparedStatement = connection.prepareStatement(sql);
	       // preparedStatement.setString(1, userid);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            String pid = resultSet.getString("pid");
	            String pname = resultSet.getString("pname");
	            int psize = resultSet.getInt("psize");
	            String pcolor = resultSet.getString("pcolor");
	            int pprice = resultSet.getInt("pprice");
	            int count = resultSet.getInt("count");
	            //int pstock = resultSet.getInt("pstock");
	           // String pimage = resultSet.getString("pimage");

	            T_productDto dto = new T_productDto(pid, pname, psize, pcolor, pprice, count);
	            dtos.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null)
	                resultSet.close();
	            if (preparedStatement != null)
	                preparedStatement.close();
	            if (connection != null)
	                connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return dtos;
	}
	
	// 장바구니에서 수량변경
	public void update(String pid, int count) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "update cart set count = ? where pid = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setInt(1, count);
	        preparedStatement.setString(2, pid);

	        preparedStatement.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	            if (connection != null)
	                connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	// 장바구니에서 삭제
	public void delete(int seq) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "delete from cart where seq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, seq);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}



}

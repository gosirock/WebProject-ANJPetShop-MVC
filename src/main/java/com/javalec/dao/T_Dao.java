package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.T_ordersDto;
import com.javalec.dto.T_productDto;
import com.javalec.dto.T_userDto;

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
	        String sql = "SELECT c.seq, c.count, c.userid, c.pid, p.pname, p.psize, p.pcolor, p.pprice, p.pimage " +
	                     "FROM user u, cart c, product p " +
	                     "WHERE u.userid = c.userid AND p.pid = c.pid"; //AND u.userid = '" + userid + "'";
	        preparedStatement = connection.prepareStatement(sql);
	       // preparedStatement.setString(1, userid);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	        	String pimage = resultSet.getString("pimage");
	            String pid = resultSet.getString("pid");
	            String pname = resultSet.getString("pname");
	            int psize = resultSet.getInt("psize");
	            String pcolor = resultSet.getString("pcolor");
	            int pprice = resultSet.getInt("pprice");
	            int count = resultSet.getInt("count");
	            //int pstock = resultSet.getInt("pstock");
	           // String pimage = resultSet.getString("pimage");

	            T_productDto dto = new T_productDto(pimage, pid, pname, psize, pcolor, pprice, count);
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
	
	// 구매페이지 유저 정보
	public T_userDto userlist() {
	    T_userDto dto = null;
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "SELECT * FROM user WHERE userid = ?";
	        preparedStatement = connection.prepareStatement(query);

	        String userid = "do123"; // userid를 고정값으로 설정

	        preparedStatement.setString(1, userid);
	        resultSet = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            String username = resultSet.getString("username");
	            String usertel = resultSet.getString("usertel");
	            String useremail = resultSet.getString("useremail");
	            String address = resultSet.getString("address");

	            dto = new T_userDto();
	            dto.setUserid(userid);
	            dto.setUsername(username);
	            dto.setUsertel(usertel);
	            dto.setUseremail(useremail);
	            dto.setAddress(address);
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
	    return dto;
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

	// 주문하기
	public void orders(List<String> pidList, int count) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "INSERT INTO orders (ordernum, count, userid, pid) "
	                + "SELECT NOW(), ?, 'do123', ? "
	                + "FROM cart c "
	                + "JOIN user u ON u.userid = c.userid "
	                + "JOIN product p ON p.pid = c.pid "
	                + "WHERE u.userid = 'do123' AND c.pid = ?;";

	        preparedStatement = connection.prepareStatement(query);

	        for (String pid : pidList) {
	            preparedStatement.setInt(1, count);
	            preparedStatement.setString(2, pid);
	            preparedStatement.setString(3, pid);
	            preparedStatement.addBatch();
	        }

	        preparedStatement.executeBatch();

	        String query1 = "DELETE FROM cart WHERE userid = 'do123'";
	        preparedStatement = connection.prepareStatement(query1);
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

	// 주문하면 pstock에서 count만큼 빼주기
	public void updatePstock(List<String> pidList, int count) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "UPDATE product p " +
	                "JOIN orders o ON p.pid = o.pid " +
	                "SET p.pstock = p.pstock - o.count " +
	                "WHERE o.seq = o.seq AND p.pid = ?";
	        preparedStatement = connection.prepareStatement(query);

	        for (String pid : pidList) {
	            preparedStatement.setString(1, pid);
	            preparedStatement.executeUpdate();
	        }
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

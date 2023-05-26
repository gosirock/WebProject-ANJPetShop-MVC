package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.T_Dto;

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
	
	public ArrayList<T_Dto> list() {
	    ArrayList<T_Dto> dtos = new ArrayList<T_Dto>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    //String userid = request.getParameter("userid");

	    try {
	        connection = dataSource.getConnection();
	        String sql = "SELECT c.count, c.userid, c.pid, p.pname, p.psize, p.pcolor, p.pprice " +
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
	            //int pstock = resultSet.getInt("pstock");
	           // String pimage = resultSet.getString("pimage");

	            T_Dto dto = new T_Dto(pid, pname, psize, pcolor, pprice);
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


}

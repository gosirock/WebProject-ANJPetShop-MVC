package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.J_dto;

public class J_dao {
	DataSource dataSource;
	
	public J_dao() {
		// TODO Auto-generated constructor stub
		// DB 연결. 
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvcshop"); 		//context로 가서 디비 로그인 정보 알아냄 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// DB에 저장된 모든 제품 정보 불러오기 
	public ArrayList<J_dto> list(String queryName, String queryContent) {
		ArrayList<J_dto> dtos = new ArrayList<J_dto>();
		// db 읽어와서 <BDto> dtos에 넣어줌 
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from product ";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) { 		// db에서 한 줄에 있는 데이터를 열마다 분리해서 할당하는 과정.
				String pid = resultSet.getString("pid");
				String pname = resultSet.getString("pname");
				int psize = resultSet.getInt("psize");
				String pcolor = resultSet.getString("pcolor");
				int pprice = resultSet.getInt("pprice");
				int pstock = resultSet.getInt("pstock");
				String pimage = resultSet.getString("pimage");
				

				
				J_dto dto = new J_dto(pid, pname, psize, pcolor, pprice, pstock, pimage);

				dtos.add(dto); 		// 윗줄에서 한번에 묶은 속성들을 arrayllist에 추가 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close(); 	// ResultSet이 비면 닫아.
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	} 
	
	// 상품 상세 페이지 첫 화면 
	public J_dto contentView(String getPid) {
		J_dto dto = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from product where pid = '" + getPid + "'";
			preparedStatement = connection.prepareStatement(query);
			//preparedStatement.setString(1, getPid);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) { 		// db에서 한 줄에 있는 데이터를 열마다 분리해서 할당하는 과정.
				String pid = resultSet.getString("pid");
				String pname = resultSet.getString("pname");
				int psize = resultSet.getInt("psize");
				String pcolor = resultSet.getString("pcolor");
				int pprice = resultSet.getInt("pprice");
				int pstock = resultSet.getInt("pstock");
				String pimage = resultSet.getString("pimage");

				dto = new J_dto(pid, pname, psize, pcolor, pprice, pstock, pimage);					

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close(); 	// ResultSet이 비면 닫아.
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	public ArrayList<J_dto> selectSize(String getPid) {
		ArrayList<J_dto> dtos = new ArrayList<J_dto>();
		String searchPid = getPid.substring(0,4);
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select psize from product where pid like '" + searchPid + "%' order by psize";
			preparedStatement = connection.prepareStatement(query);
			//preparedStatement.setString(1, getPid);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) { 		// db에서 한 줄에 있는 데이터를 열마다 분리해서 할당하는 과정.
				int psize = Integer.parseInt(resultSet.getString("psize"));

				J_dto dto = new J_dto(psize);					
				dtos.add(dto);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close(); 	// ResultSet이 비면 닫아.
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
		
	}

	

}

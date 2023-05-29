package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.A_dto;

public class A_dao {

	DataSource dataSource;

	public A_dao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvcshop");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 상품목록 페이지 데이터 연결

	public ArrayList<A_dto> A_ProductView(String queryName, String queryContent, String sortOrder) {
		ArrayList<A_dto> dtos = new ArrayList<>();

		if (queryName == null) {
			queryName = "pname";
			queryContent = "";
		}

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String query = "SELECT pid, pname, pprice, pimage FROM product";
			String where = " WHERE " + queryName + " LIKE '%" + queryContent + "%'";

			if ("highprice".equals(sortOrder)) { // 높은 가격순으로 정렬
				query += where + " ORDER BY pprice DESC";
			} else if ("lowprice".equals(sortOrder)) { // 낮은 가격순으로 정렬
				query += where + " ORDER BY pprice ASC";
			} else { // 정렬하지 않음
				query += where;
			}

			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String pid = resultSet.getString("pid");
				String pname = resultSet.getString("pname");
				int pprice = resultSet.getInt("pprice");
				String pimage = resultSet.getString("pimage");

				A_dto dto = new A_dto(pid, pname, pprice, pimage);
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

	// 메인화면 페이지 상품목록 데이터 연결
	public ArrayList<A_dto> A_mainView() {
		ArrayList<A_dto> dtos = new ArrayList<A_dto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String query = "select pid, pname, pprice, pimage from product;";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String pid = resultSet.getString("pid");
				String pname = resultSet.getString("pname");
				int pprice = resultSet.getInt("pprice");
				String pimage = resultSet.getString("pimage");

				A_dto dto = new A_dto(pid, pname, pprice, pimage);
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String adminId = request.getParameter("adminid");
session.setAttribute("ADMINID", adminId);
%>
<c:set var="count" value="0" scope="page" />
<!DOCTYPE html>
<html>
<head>
<title>온라인 신발가게</title>
<link rel="stylesheet" type="text/css" href="o_style.css">
</head>
<body style="background-color: #ECEFF1;">
	<header>
		${sessionScope.ADMINID}님 환영합니다.
		<nav>
			<div>
				<ul>
					<li><a href="o_adminMain.do">홈</a></li>
					<li><a href="o_inventory.do">상품관리</a></li>
					<li><a href="o_searchUserInfo.do">회원정보</a></li>
				</ul>
			</div>
		</nav>
		<div class="user-info">
			<ul>
				<li><a href="o_adminInfo.do?adminid=${sessionScope.ADMINID}">마이페이지</a></li>
				<li><a href="w_login.jsp">로그아웃</a></li>
			</ul>
		</div>
	</header>

	<div class="center">
		<br /> <br />
		<h1>
			<b>주문 목록</b>
		</h1>
		<hr>
	</div>
	<!-- ---------- real body ------- -->
	<div class="center-form">
		<form>
			<table>
				<thead>
					<tr>
						<th style="width: 120px; text-align: center;">일간 매출</th>
						<td colspan="5" style="text-align: center;">${salesList[0]}원</td>
					</tr>
					<tr>
						<th style="width: 120px; text-align: center;">주간 매출</th>
						<td colspan="5" style="text-align: center;">${salesList[1]}원</td>
					</tr>
					<tr>
						<th style="width: 120px; text-align: center;">월간 매출</th>
						<td colspan="5" style="text-align: center;">${salesList[2]}원</td>
					</tr>
					<tr>
						<td colspan="6">
					</tr>
					<tr>
						<th style="width: 40px; text-align: center;">번호</th>
						<th style="width: 80px; text-align: center;">사용자 ID</th>
						<th style="width: 80px; text-align: center;">제품 번호</th>
						<th style="width: 40px; text-align: center;">수량</th>
						<th style="width: 120px; text-align: center;">주문 금액</th>
						<th style="width: 150px; text-align: center;">주문 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="dto">
						<c:set var="count" value="${count + 1}" scope="page" />
						<c:set var="count" value="${count + 1}" scope="page" />
						<tr>
							<td>${dto.ordernum}</td>
							<td>${dto.userid}</td>
							<td>${dto.pid}</td>
							<td>${dto.count}</td>
							<td>${dto.price}원</td>
							<td>${dto.orderdate}</td>
						</tr>
					</c:forEach>
					<tr>
						<td><b>건수</b></td>
						<td colspan="6" style="text-align: center;"><b>${count} 건</b></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>

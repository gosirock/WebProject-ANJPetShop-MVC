<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	String adminId = request.getParameter("adminid");
 	session.setAttribute("ADMINID", adminId);
 %>
<!DOCTYPE html>
<html>
<head>
    <title>온라인 신발가게</title>
    <link rel="stylesheet" type="text/css" href="o_style.css">
</head>
<body style="background-color: #ECEFF1;">
    <header>
        <ul>
            <li><a href="o_adminMain.do">홈</a></li>
            <li><a href="o_sales.do">매출현황</a></li>
            <li><a href="o_inventory.do">재고관리</a></li>
            <li><a href="o_searchUserInfo.do">회원정보 확인</a></li>
        </ul>
        <div class="user-info">
            <span>${sessionScope.ADMINID }님 안녕하세요</span>&nbsp;&nbsp;
            <ul>
	            <li><a href="w_login.jsp">로그아웃</a></li>&nbsp;
	            <li><a href="o_adminInfo.do?adminid=${sessionScope.ADMINID}">마이페이지</a></li>
            </ul>
        </div>
    </header>
    
    <div class="center">
        <h1>주문 현황</h1>
    </div>
    <!-- ---------- real body ------- -->
    <table>
	    <thead>
	    	<tr>
	    		<th style="width: 80px; text-align: center;">주문 번호</th>
	    		<th style="width: 80px; text-align: center;">사용자 ID</th>
	    		<th style="width: 80px; text-align: center;">제품 번호</th>
	    		<th style="width: 50px; text-align: center;">수량</th>
	    		<th style="width: 80px; text-align: center;">주문 금액</th>
	    		<th style="width: 200px; text-align: center;">주문 날짜</th>
	    	</tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${orders}" var="dto">
		        <c:set var="count" value="${count + 1}" scope="page"/>
		            <tr>
		                <td>${dto.ordernum}</td>
		                <td>${dto.userid}</td>
		                <td>${dto.pid}</td>
		                <td style="text-align: center;">${dto.count}</td>
		                <td>${dto.price} 원</td>
		                <td>${dto.orderdate}</td>
		            </tr>
		    </c:forEach>
	    </tbody>
    </table>
    
</body>
</html>

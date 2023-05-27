<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String adminid = request.getParameter("adminid");
 	session.setAttribute("ADMINID", adminid);
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
        <h1>매출 현황</h1>
    </div>
    <!-- -------------body------------- -->
    일 매출 : 
    월 매출 :
    연 매출
    
</body>
</html>

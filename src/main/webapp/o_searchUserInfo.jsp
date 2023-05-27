<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="count" value="0" scope="page"/>
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
        <h1>회원 정보 검색</h1>
    </div>
    <form action="o_searchUserInfo.do">
        검색 :
        <select name="query">
            <option value="userid" selected="selected">아이디</option>
            <option value="username">이름</option>
            <option value="usertel">전화번호</option>
        </select>
        <input type="text" name="content" size="30">
        <input type="submit" value="검색">
    </form>
    <hr>
	<table>
	    <thead>
	        <tr>
	            <th style="width: 80px; text-align: center;" >아이디</th>
	            <th style="width: 80px; text-align: center;">이름</th>
	            <th style="width: 120px; text-align: center;">전화번호</th>
	            <th style="width: 200px; text-align: center;">전자우편</th>
	            <th style="width: 350px; text-align: center;">주소</th>
	            <th style="width: 130px; text-align: center;">가입일자</th>
	            <th style="width: 130px; text-align: center;">탈퇴일자</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach items="${userlist}" var="dto">
	        <c:set var="count" value="${count + 1}" scope="page"/>
	            <tr>
	                <td>${dto.userid}</td>
	                <td>${dto.username}</td>
	                <td>${dto.usertel}</td>
	                <td>${dto.useremail}</td>
	                <td>${dto.useraddress}</td>
	                <td>${dto.insertdate}</td>
	                <td>${dto.deletedate}</td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
	<div class="summary">
	    총 인원은 ${count}명 입니다.
	</div>
</body>
</html>

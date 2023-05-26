<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="count" value="0" scope="page"/>
<!DOCTYPE html>
<html>

<head>
    <title>온라인 신발가게</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
        }

        /* Header styling */
        header {
            background-color: #f5f5f5;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        header ul li {
            display: inline-block;
            margin-right: 20px;
        }

        header ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        header .user-info {
            display: flex;
            align-items: center;
        }

        header .user-info span {
            margin-right: 10px;
        }

        /* Form styling */
        form {
            margin-bottom: 20px;
        }

        form select, form input[type="text"], form input[type="submit"] {
            padding: 8px;
            font-size: 14px;
        }

        form select {
            margin-right: 10px;
        }

        form input[type="text"] {
            width: 300px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        /* Table styling */
        table {
            border-collapse: collapse;
        }

        table th, table td {
            border: 3px solid #ddd;
            padding: 8px;
        }

        table th {
            background-color: #f2f2f2;
            text-align: left;
        }

        /* Summary styling */
        .summary {
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
        }
        /* Center align heading */
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <ul>
            <li><a href="o_adminMain.jsp">홈</a></li>
            <li><a href="sales.jsp">매출현황</a></li>
            <li><a href="inventory.jsp">재고관리</a></li>
            <li><a href="o_searchUserInfo.do">회원정보 확인</a></li>
        </ul>
        <div class="user-info">
            <span>admin1님 안녕하세요</span>
            <a href="w_login.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
            <a href="mypage.jsp">마이페이지</a>
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

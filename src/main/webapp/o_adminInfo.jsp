<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String adminid = (String)session.getAttribute("ADMINID");
 %>
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
            <li><a href="o_sales.do">매출현황</a></li>
            <li><a href="o_inventory.do">재고관리</a></li>
            <li><a href="o_searchUserInfo.do">회원정보 확인</a></li>
        </ul>
        <div class="user-info">
            <span>${adminid }님 안녕하세요</span>
            <a href="w_login.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
            <a href="o_adminInfo.do">마이페이지</a>
        </div>
    </header>
    
    <div class="center">
        <h1>주문 현황</h1>
    </div>
    
    관리자 아이디 : ${admin_info.adminid} <br/>
    관리자 비밀번호 : ${admin_info.adminpasswd}<br/>
    관리자 이름 : ${admin_info.adminname}<br/>
    관리자 전화번호 :${admin_info.admintel} <br/>
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>

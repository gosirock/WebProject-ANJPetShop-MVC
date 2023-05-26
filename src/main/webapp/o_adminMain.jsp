<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>온라인 신발가게</title>
    <style>
        /* 헤더 스타일링 */
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
    </style>
</head>
<body>
    <header>
        <ul>
            <li><a href="adminMain.jsp">홈</a></li>
            <li><a href="sales.jsp">매출현황</a></li>
            <li><a href="inventory.jsp">재고관리</a></li>
            <li><a href="user.jsp">유저정보</a></li>
        </ul>
        <div class="user-info">
            <span>000님 안녕하세요</span>
            <a href="w_login.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
            <a href="mypage.jsp">마이페이지</a>
        </div>
    </header>
</body>
</html>

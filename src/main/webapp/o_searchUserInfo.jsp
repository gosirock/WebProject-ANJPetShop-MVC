<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="count" value="0" scope="page"/>
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
            <li><a href="o_adminMain.jsp">홈</a></li>
            <li><a href="sales.jsp">매출현황</a></li>
            <li><a href="inventory.jsp">재고관리</a></li>
            <li><a href="o_searchUserInfo.do">유저정보</a></li>
        </ul>
        <div class="user-info">
            <span>000님 안녕하세요</span>
            <a href="w_login.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
            <a href="mypage.jsp">마이페이지</a>
        </div>
    </header>

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
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>전자우편</th>
            <th>주소</th>
            <th>가입일자</th>
            <th>탈퇴일자</th>
        </tr>
        <c:forEach items="${userlist}" var="dto">
            <c:set var="count" value="${count + 1}" scope="page"/> <!-- 반복마다 count 증가 -->
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
    </table>
    <br/>
    <hr>
    총 인원은 ${count}명 입니다.
</body>
</html>
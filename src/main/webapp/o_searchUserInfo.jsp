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
		${sessionScope.ADMINID}님 환영합니다.
	    <nav>
	        <div>
	            <ul>
	                <li><a href="o_adminMain.do">홈</a></li>
	                <li><a href="o_searchSales.do">매출현황</a></li>
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
		<br/><br/>
        <h1><b>회원 정보</b></h1>
    </div>
    
    <!-- ----real body ---- -->
    
    <form action="o_searchUserInfo.do" class="center">
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
    <br/><br/>
    
    <div class="center-form">
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
		    <tr>
		    	<td>총 인원</td>
		    	<td colspan="6" style="text-align: left;">${count}명</td>
		    </tr>
		</table>
	</div>

</body>
</html>

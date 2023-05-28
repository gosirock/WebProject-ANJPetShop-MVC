<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h1><b>주문 현황</b></h1>
        <hr>
    </div>
    <!-- -------------body------------- -->
    일간 매출 : ${salesList[0] } 원 <br>
    주간 매출 : ${salesList[1] } 원 <br>
    월간 매출 : ${salesList[2] } 원 <br>
    
</body>
</html>

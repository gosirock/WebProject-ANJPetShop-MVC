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
        <h1><b>재고 관리</b></h1>
    </div>
    
 <!-- --------- real body ------ -->
	<div class="center-form">
	    <form action="o_inventory.do" method="POST" name="productinfo">
	        <input type="hidden" name="pid" value="${000.pid }">
	        <table>
	            <tr>
	                <th>아이디</th>
	                <td><input type="text" name="adminid" value="${admin_info.adminid}" readonly="readonly"></td>
	            </tr>
	            <tr>
	                <th>비밀번호</th>
	                <td>
	                	<input type="password" name="adminpasswd" placeholder="비밀번호를 입력해주세요.">
	                	<input type="button" name="checkbtn" value="확인" onclick="showPasswordEditField()">
	                </td>
	                
	            </tr>
	            <tr>
	                <th>이름</th>
	                <td><input type="text" name="adminname" value="${admin_info.adminname}" readonly="readonly"></td>
	            </tr>
	            <tr>
	                <th>전화번호</th>
	                <td><input type="text" name="admintel" value="${admin_info.admintel}" readonly="readonly"></td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: right;">
	                    <input type="hidden" name="updatebtn" value="수정" onclick="showSuccessMessage()" >
	                </td>
	            </tr>
	        </table>
	    </form>
	</div>
 	

</body>
</html>

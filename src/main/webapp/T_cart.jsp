<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<h1>장바구니</h1>
	<hr width="80%" color="black" size="2">
	<form action="">
	<table border="2">
	<tr>
		<th>상품 및 옵션 정보</th>
		<th>수량</th>
		<th>주문금액</th>
	</tr>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td></td>
		</tr>
	</c:forEach>
	</table>
	</form>
</body>
</html>
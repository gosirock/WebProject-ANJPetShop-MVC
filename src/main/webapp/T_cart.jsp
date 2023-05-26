<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="MyCss.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>장바구니</title>
    <style>
     	h1 {
            position: absolute;
            top: 100px;
            left: 100px;
        }
        .pid {
            font-family: Arial, 맑은고딕; /* 원하는 글꼴로 변경 */
            font-size: 17px; /* 원하는 글꼴 크기로 변경 */
            font-weight: bold; /* 원하는 글꼴 굵기로 변경 */
            color: black; /* 원하는 글꼴 색상으로 변경 */
        }
         table {
            margin: 0 auto; /* 가운데 정렬 */
            width: 50%; /* 테이블 크기 조정 */
            height: 100px; /* 테이블 높이 조정 */
        }
    </style>
</head>
<body>

  <header>
    <nav>
      <ul>
        <li><a href="#">나이키</a></li>
        <li><a href="#">메뉴 항목 2</a></li>
        <li><a href="#">메뉴 항목 3</a></li>
      </ul>
    </nav>
  </header>
  
	<h1>장바구니</h1><br><br><br>
	<hr width="80%" color="black" size="2">
	<form action="cart.do" method="get">
	<table border="1">
	<c:forEach items="${list}" var="dto">
	<tr>
		<th></th>
		<th>상품 및 옵션 정보</th>
		<th>수량</th>
		<th>주문금액</th>
	</tr>
		<tr>
			<td>이미지</td>
			 <td>
                        <span class="pid">${dto.pid}</span><br>
                        ${dto.pname}<br>
                        ${dto.pcolor}<br>
                    </td>
		</tr>
	</c:forEach>
	</table>
		<input type="submit" value="주문하기">
		
	</form>
</body>
</html>
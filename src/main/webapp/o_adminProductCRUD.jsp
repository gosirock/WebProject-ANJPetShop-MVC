<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="count" value="0" scope="page" />
<c:set var="i" value="1" scope="page" />
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
					<li><a href="o_adminMain.do?adminid=${sessionScope.ADMINID}">홈</a></li>
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
		<br /> <br />
		<h1>
			<b>상품 관리</b>
		</h1>
	</div>

	<!-- --------- real body ------ -->
	<form action="o_inventory.do" class="center">
		검색 : <select name="query">
			<option value="pid" selected="selected">제품번호</option>
			<option value="pname">제품이름</option>
			<option value="psize">사이즈</option>
			<option value="pcolor">색상</option>
		</select> <input type="text" name="content" size="30"> <input type="submit" value="검색">
	</form>
	<!-- ------------------------------ -->
	<hr>
	<br />
	<br />
	<!-- ------------------------------ -->
	<div class="center-form">
		<table>
			<thead>
				<tr>
					<th style="width: 40px; text-align: center;">제품 코드</th>
					<th style="width: 80px; text-align: center;">제품 이름</th>
					<th style="width: 50px; text-align: center;">사이즈</th>
					<th style="width: 80px; text-align: center;">색상</th>
					<th style="width: 130px; text-align: center;">가격</th>
					<th style="width: 90px; text-align: center;">재고</th>
					<th style="width: 200px; text-align: center;">이미지 링크 주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<form action="o_productChange.do" method="post" name="productinfo">
					<c:forEach items="${productList}" var="dto">
						<input type="hidden" name="pid" value="${dto.pid}">
						<tr>
							<td>${dto.pid}</td>
							<td>${dto.pname}</td>
							<td>${dto.psize}</td>
							<td>${dto.pcolor}</td>
							<td><input type="number" name="pprice" value="${dto.pprice}" style="width: 80px;"> 원</td>
							<td><input type="number" min="0" name="pstock" value="${dto.pstock}" style="width: 40px;"> 개</td>
							<td><input type="text" name="pimage" value="${dto.pimage}" style="width: 180px;"></td>
							<td><input type="button" value="수정" onclick="updateCheck()"></td>
						</tr>
					</c:forEach>
				</form>
			</tbody>
		</table>
	</div>
	<!-- ------------------------------ -->
	<hr>
	<div class="center">
		<h1>
			<b>상품 추가</b>
		</h1>
	</div>

	<div class="center-form">
		<form action="o_productInsert.do" method="post" name="productInsert">
			<table>
				<thead>
					<tr>
						<td colspan="8" style="text-align: center; font-size: 20px; background-color: #cccccc;">새로운 제품 추가</td>
					</tr>
					<tr>
						<th style="width: 40px; text-align: center;">제품 코드</th>
						<th style="width: 80px; text-align: center;">제품 이름</th>
						<th style="width: 50px; text-align: center;">사이즈</th>
						<th style="width: 80px; text-align: center;">색상</th>
						<th style="width: 130px; text-align: center;">가격</th>
						<th style="width: 90px; text-align: center;">재고</th>
						<th style="width: 200px; text-align: center;">이미지 링크 주소</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="pid" style="width: 75px;"></td>
						<td><input type="text" name="pname" style="width: 80px;"></td>
						<td><select name="psize">
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
								<option value="270" selected="selected">270</option>
								<option value="280">280</option>
						</select></td>
						<td><input type="text" name="pcolor" style="width: 60px;"></td>
						<td><input type="number" min="0" name="pprice" value="0" step="1000" style="width: 80px;"> 원</td>
						<td><input type="number" min="0" name="pstock" step="5" value="10" style="width: 40px;"> 개</td>
						<td><input type="text" name="pimage" style="width: 180px;"></td>
						<td><input type="button" value="추가" onclick="insertCheck()"></td>
					</tr>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
</body>

<script type="text/javascript">
	function updateCheck() {

		const form = document.productinfo

		alert("수정이 완료되었습니다.");
		form.submit()
	}
	
	function insertCheck() {

		const result = "${result}"
		const form = document.productInsert
		const pid = form.pid.value
		const pname = form.pname.value
		const psize = form.psize.value
		const pstock = form.pstock.value
		const pcolor = form.pcolor.value
		const pimage = form.pimage.value
		const pprice = form.pprice.value

		if(pid == "" || pname == "" || psize == "" || pstock == "" || pcolor == "" || pimage == "" || pprice == ""){
			alert("상품 추가에 실패했습니다.\n 다시 입력해 주세요.")
			return
		}else{
			alert("상품이 추가되었습니다.")
		}
			form.submit()
	}
</script>

</html>

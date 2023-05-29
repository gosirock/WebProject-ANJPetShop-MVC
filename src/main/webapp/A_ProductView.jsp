<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="ProductCss.css">
</head>
<script type="text/javascript">
	
	function handleSortOrderChange() {
		var selectElement = document.getElementById("sortOrder");
		var selectedValue = selectElement.value;

		// 현재 페이지 URL에서 정렬 파라미터 제거
		var url = removeSortOrderParameter(window.location.href);

		// 선택된 정렬 파라미터 추가
		if (selectedValue !== '') {
			url += url.indexOf('?') === -1 ? '?sortOrder=' + selectedValue
					: '&sortOrder=' + selectedValue;
		}

		// 페이지 리로드
		window.location.href = url;
	}

	function removeSortOrderParameter(url) {
		var urlParts = url.split('?');
		if (urlParts.length > 1) {
			var queryParams = urlParts[1].split('&');
			var updatedQueryParams = queryParams.filter(function(param) {
				return !param.startsWith('sortOrder=');
			});
			return urlParts[0] + '?' + updatedQueryParams.join('&');
		}
		return url;
	}
</script>
<body>
	<!-- 사이트 헤더  -->
	
	
	<header>
		<nav>
			<ul>
				<li><a href="A_mainView.do">Main</a></li>
				<li><a href="A_ProductView.do">shoes</a></li>
				<li><a href="#">introduction</a></li>
				<li><a href="#">My Page</a></li>
				<li><a href="#">cart</a></li>
				<c:if test="${empty sessionScope.SUID }">

				</c:if>
				<c:if test="${not empty sessionScope.SUID }">
					<li><input type="button" value="Logout"></li>
				</c:if>
			</ul>
		</nav>
	</header>
	<br />
	<br />
	<br />
	<!-- z index값떄문에 가려져서 줄바꿈준것  -->




	<h1>shop collection</h1>


	<div style="text-align: right;">
		<form action="A_ProductView.do" class="center" method="get">
			<select name="query">
				<option value="pname" selected="selected">상품</option>
				<option value="pprice">금액</option>
			</select> <input type="text" name="content" size="30"> <input
				type="submit" value="검색"> <select id="sortOrder"
				name="sortOrder" onchange="handleSortOrderChange()">
				<option value="">가격순 정렬</option>
				<option value="highprice">높은 가격순</option>
				<option value="lowprice">낮은 가격순</option>
			</select>
		</form>

	</div>




	<!--상품목록 페이지 그리드 레이아웃 -->
	<div class="product-grid">
		<c:forEach items="${A_ProductView}" var="dto">
			<div class="product-item">
				<img src="${dto.pimage}" alt="${dto.pname}">
				<h3>${dto.pname}</h3>
				<h3>판매가격: ${dto.pprice}원</h3>
			</div>
		</c:forEach>
	</div>




</body>
</html>



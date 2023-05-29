<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BTY SHOE MARKET</title>
	<link rel="stylesheet" type="text/css" href="j_productDetailCss.css">
	
</head>
<body>
<%
	/* 제품 페이지에서 사용자가 선택한 제품의 제품번호 받아오기 */
	String pid = request.getParameter("pid");
	session.setAttribute("PRODUCTID", pid);
%>
	<header class="header">
		로고 카테고리 로그인 마이페이지 
	</header>
  
    <main class="main">				<!-- 메인 컨텐츠 - 좌 : 이미지 / 우 : 제품 상세 설명 -->
    	<div class="left-column">			<!-- 왼쪽 칼럼 : 제품 이미지  -->
	        <img src="${content_view.pimage }" alt="제품 이미지를 준비중입니다." style="width: 100%; height: auto;">
    	</div>
    	<div class="right-column">			<!-- 오른쪽 칼럼 : 제품 상세 설명 -->
    		<h1>${content_view.pname }제품이름</h1>	
    		<fmt:formatNumber value="${content_view.pprice }" pattern="#,###" /> 원 <br/><br/>
    		색상 <br/>
        	${content_view.pcolor }
        	<br/><br/>
        	사이즈 <br/>
       		${content_view.psize }&nbsp;&nbsp;
        	<br/><br/>
        	수량 &nbsp;&nbsp;
			<input type="button" onclick="clickMinus()" value="-">&nbsp;
			<input type="text" size="3" id="quantity" value="1" min="0" onchange="updateQuantity(this.value)" oninput="calcPrice(this.value)" style="text-align: center;">&nbsp;
			<input type="button" onclick="clickPlus()" value="+">&nbsp;&nbsp;
			<button onclick="resetSelection()">X</button>
        	<hr>
        	<br/>
        	
        	<!-- 사용자가 선택한 화면 보여주기 -->
        	<div class="selectedPOptions">
	        	<form action="<!-- 장바구니 및 결제 페이지로 넘겨주기  -->" method="get">
	        		선택하신 수량과 총 결제 예정 금액을 확인하세요. <br/>
					${content_view.pname }&nbsp;&nbsp;   		
					${content_view.pcolor }&nbsp;&nbsp; 		<!-- 선택한 색상 -->
					${content_view.psize }<br/>		<!-- 선택한 사이즈 -->  
					<h3 style="text-align: right;">TOTAL </h3>
					<h3 style="text-align: right;"> <span id="result">${content_view.pprice }</span></h3>
					
				</form>
			</div>
        	<br/><hr><br/>
       		
       		<!--  -->
        	<form action="<!-- /cart.do -->" method="get">
				<input type="submit" value="장바구니"> 
			</form>
			<form action="<!-- 태영이 바로구매 페이지? -->" method="get">
				<input type="submit" value="바로구매"> 
			</form>
       	
    	</div>
    </main>
    
    <footer class="footer">
    오시는길 주소 등등등
    </footer>

</body>
<script type="text/javascript" src="j_productDetail.js"></script>
</html>

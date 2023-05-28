<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<link rel="stylesheet" href="MyCss.css">
</head>
<body>
		<!--사이트 헤더  -->
				
				<header>
					  <nav>
					    <ul>
					      <li><a href="A_mainView.do">Main</a></li>
					      <li><a href="A_ProductView.do">shoes</a></li>
					      <li><a href="#">introduction</a></li>
					      <li><a href="#">My Page</a></li>
					      <li><a href="#">cart</a></li>
					      <li><input type="button" value="Logout"></li>					
					    </ul>
					  </nav>
				</header>

			
	
		<!-- 메인화면 1번  -->
				
				   <a href="A_ProductView.do"><img src="image_02.png" alt="My Image"></a><br/><br/>
				  		<h1>어제보다 나은 오늘을 위한</h1><br/>
				  		<h1>collection</h1>
				  <a href="A_ProductView.do"><img src="image_01.png" alt="My Image"></a><br/> 
			
			
				
				<h1>shop collection</h1>	
		
		<!-- 메인화면 2번 -->		
			  <div class="product-grid">
			    <c:forEach items="${A_mainView}" var="dto">
			      <div class="product-item">
			        <img src="${dto.pimage}" alt="${dto.pname}">
			        <h3>${dto.pname}</h3>
			        <p>Price: ${dto.pprice}</p>
			      </div>
			    </c:forEach>
			  </div>	

</body>
</html>
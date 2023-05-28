<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTY SHOE MARKET</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    .  .container {
    display: flex;
    flex-direction: column;
  }

  .column {
    flex: 1;
  }

  .product-image img {
    width: 100%;
    height: auto;
  }

  .product-details {
    padding: 20px;
    border: 1px solid #ccc;
  }

  .product-info {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .button-group {
    display: flex;
    align-items: center;
    gap: 5px;
  }
  

 </style>
<script>
	var selectedColor = ''; // 옵션 - 선택된 색상을 저장하는 변수
	var selectedSizes = []; // 옵션 - 선택된 사이즈들을 저장하는 배열

    function decreaseQuantity() {		/* 수량 파트 : (-) 클릭할 때 */
	 	var quantityField = document.getElementById('quantity');
	    var currentValue = parseInt(quantityField.value);
	    if (currentValue >= 1) {
	      quantityField.value = currentValue - 1;
	    }
	      calcPrice();
      }
      
      function increaseQuantity() {		/* 수량 파트 : (+) 클릭할 때 */
   	  	var quantityField = document.getElementById('quantity');
   	    var currentValue = parseInt(quantityField.value);
   	    quantityField.value = currentValue + 1;
   		calcPrice();
      }
      
      function updateQuantity(value) {	/* 수량 파트 : 사용자가 직접 입력할 때 */
   	  	var quantityField = document.getElementById('quantity');
   	    var parsedValue = parseInt(value);
   	    if (!isNaN(parsedValue) && parsedValue >= 1) {
   	      quantityField.value = parsedValue;
   	    } else {
   	      quantityField.value = 1;
   	    }
   	  	  calcPrice();
      }
      
      function calcPrice() {
    	  var quantityField = document.getElementById('quantity');
    	  var quantity = parseInt(quantityField.value);
    	  var price = parseInt(${content_view.pprice});
    	  var result = quantity * price;
    	  var resultElement = document.getElementById('result');
    	  resultElement.textContent = result.toLocaleString() + '원';
    	}
      
   	  /* 사용자 선택옵션 목록창 - x 버튼 클릭 시 선택 내용전부 삭제   */
      function resetSelection() {
		// 선택한 사이즈 초기화
		document.getElementById("selectedSize").textContent = "";

		// 수량 초기화
		document.getElementById("quantity").value = "1";

		// 결과 초기화
		document.getElementById("result").textContent = "";

		// 선택한 사이즈 배열 초기화
		selectedSizes = [];

		var selectedSizeElement = document.getElementById('productInfoContainer');
		selectedSizeElement.innerHTML = ""; // 선택한 사이즈 표시 초기화

		var productInfo = document.getElementById('productInfo');
		productInfo.style.display = 'none'; // 선택한 제품 정보 숨김
	}
      
      /* 사이즈 선택시 수행될 작업 */
      function handleSizeButtonClick(button) {
		  var selectedSize = button.value;
		  document.getElementById('selectedSize').textContent = selectedSize; // 선택한 사이즈 업데이트
		
		  if (selectedSizes.includes(selectedSize)) {
		    return;
		  }
		  selectedSizes.push(selectedSize);
		
		  var selectedSizeElement = document.querySelector('.product-info-size');
		  selectedSizeElement.textContent = selectedSize; // 선택한 사이즈 업데이트
		
		  var productInfo = document.getElementById('productInfo');
		  productInfo.style.display = 'flex';
		  productInfo.querySelector('.product-info-size').textContent = selectedSize; // 선택한 사이즈 업데이트
		
		  var newSelection = document.createElement('div');
		  newSelection.classList.add('product-info');
		  newSelection.innerHTML = `
		    ${content_view.pname }&nbsp;&nbsp;   		
		    ${content_view.pcolor }&nbsp;&nbsp; 		<!-- 선택한 색상 -->
		    <span class="product-info-size">${selectedSize}</span>&nbsp;&nbsp;			<!-- 선택한 사이즈 -->  
		    <input type="button" onclick="decreaseQuantity()" value="-">
		    <input type="text" size="3" id="quantity" value="1" min="0" onchange="updateQuantity(this.value)" oninput="calcPrice(this.value)" style="text-align: center;">
		    <input type="button" onclick="increaseQuantity()" value="+">
		    &nbsp;&nbsp;
		    <span id="result">${content_view.pprice }</span>
		    <button onclick="resetSelection()">X</button>
		  `;
		
		  var productInfoContainer = document.getElementById('productInfoContainer');
		  productInfoContainer.appendChild(newSelection);
		
		  // Calculate and display the updated price
		  calcPrice();
		}
      

      
      
      
  </script>
</head>
<body>
<%
	/* 제품 페이지에서 사용자가 선택한 제품의 제품번호 받아오기 */
	String pid = request.getParameter("pid");
	session.setAttribute("PRODUCTID", pid);
%>
	<header>
		로고 카테고리 로그인 마이페이지 
	</header>
    <!-- 메인 컨텐츠 -->
    <main class="main">
    	<div class="container">
    		<div class="column">
		        <div class="product-image">
		            <img src="${content_view.pimage }" alt="제품 이미지를 준비중입니다." style="width: 100%; height: auto;">
		        </div>
		    </div>
		    <div class = "column">
		        <div class="product-details">
		            <h1>${content_view.pname }</h1>
		            <fmt:formatNumber value="${content_view.pprice }" pattern="#,###" /> 원 <br/><br/>
					<form action="같은 제품의 다른 색상 페이지" method="get">								
			        	색상 <br/>
			        	${content_view.pcolor }
			        	<br/><br/>
			        	사이즈 <br/>
			        	<c:forEach items="${selectSize }" var="psize" >
			        		<input type="button" name="size" value="${psize.psize }" onclick="handleSizeButtonClick(this)">&nbsp;&nbsp;
			        	</c:forEach>
			        	<br/><br/><hr><br/>
		        	</form>
		        	
		        	<!-- 사용자가 선택한 부분 보여주기 -->
		        	<div class="product-info" id="productInfo" style="display: none;">
		        		<form action="<!-- 장바구니 및 결제 페이지로 넘겨주기  -->" method="get">
							${content_view.pname }&nbsp;&nbsp;   		
							${content_view.pcolor }&nbsp;&nbsp; 		<!-- 선택한 색상 -->
							<span id="selectedSize"></span>&nbsp;&nbsp;			<!-- 선택한 사이즈 -->  
							<input type="button" onclick="decreaseQuantity()" value="-">
							<input type="text" size="3" id="quantity" value="1" min="0" onchange="updateQuantity(this.value)" oninput="calcPrice(this.value)" style="text-align: center;">
							<input type="button" onclick="increaseQuantity()" value="+">
							&nbsp;&nbsp;
							<span id="result">${content_view.pprice }</span>
							<button onclick="resetSelection()">X</button>
						</form>
					</div>
					<div id="productInfoContainer"></div>
					
					
		        	<br/><br/><hr><br/>
		        	<form action="태영이 장바구니 페이지" method="get">
						<input type="button" value="장바구니"> 
					</form>
					<form action="어디로 간댔더라?">
						<input type="button" value="바로구매"> 
					</form>
       			</div>
		   	
		   </div>
		   
	    </div>	
	   
    </main>
   
    
    <footer>
    오시는길 주소 등등등
    </footer>

</body>
</html>

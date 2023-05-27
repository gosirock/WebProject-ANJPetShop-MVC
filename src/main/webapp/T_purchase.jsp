<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="MyCss.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문/결제</title>
</head>
<style>
     	/* h1 {
            position: absolute;
            top: 100px;
            left: 100px;
        } */
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
        /* .submit-button {
            position: absolute;
            top: 360px;
            right: 280px;
        } */
        td {
    	text-align: center;
  		}
  		
  		table {
		  border-collapse: collapse;
		}
		
		table tr:first-child {
		  border-top: 1px solid black;
		}
		
		table tr:last-child {
		  border-bottom: 1px solid black;
		}
		
		th {
        height: -20px; /* 원하는 너비로 조정 */
    	}
    </style>
    <script>
    
    // 숫자 단위정리
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 변경된 총 주문금액 재계산
    function calculateTotalPrice(selectElement, rowId) {
      var selectedCount = selectElement.value;
      var originalCount = selectElement.getAttribute("data-original-count");
      if (selectedCount !== originalCount) {
        var priceText = selectElement.getAttribute("data-price");
        var price = parseInt(priceText);
        var newTotalPrice = selectedCount * price;
        document.getElementById(rowId).textContent = numberWithCommas(newTotalPrice) + "원";
        calculateTotalAmount(); // 주문금액 변경 시 총 주문금액 재계산
      }
    }

    // 합계구하기
    function submitForm(pid, selectedCount) {
      var form = document.getElementById("form_" + pid);
      form.elements["count_" + pid].value = selectedCount;
      form.submit();
    }

    // 총 주문금액 계산하기
    function calculateTotalAmount() {
      var totalAmount = 0;
      var totalPriceElements = document.querySelectorAll("[id^='total_']");

      totalPriceElements.forEach(function(element) {
        var priceText = element.textContent.replace(/[^0-9]/g, "");
        var price = parseInt(priceText);

        if (!isNaN(price)) {
          totalAmount += price;
        }
      });

      var totalAmountElement = document.getElementById("totalAmount");
      totalAmountElement.textContent = numberWithCommas(totalAmount) + "원";
    }

    // 페이지 로드 시 총 주문금액 초기화
    window.addEventListener("load", calculateTotalAmount);
  </script>
  
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
	<h1 style="position: absolute; top: 100px; left: 100px;">주문/결제</h1><br><br><br>
	<hr width="80%" color="black" size="2">
  <table border="0" style="height: 20px;">
    <tr>
      <th style="width: 120px;"></th>
      <th style="width: 180px;">상품정보</th>
      <th style="width: 130px;">수량</th>
      <th style="width: 100px;">주문금액</th>
    </tr>
  </table>
  <c:forEach items="${list}" var="dto">
    <form id="form_${dto.pid}" action="T_cart.do?pid=${dto.pid}" method="get">
      <table border="0">
        <tr>
          <td style="width: 120px;">이미지</td>
          <td style="width: 180px; text-align: left;">
            <span class="pid">${dto.pid}</span><br>
            ${dto.pname}<br>
            ${dto.pcolor}<br>
          </td>
          <td style="width: 130px;">
           	${dto.count}개
           </td>
          <td id="total_${dto.pid}" style="width: 100px;">
            <fmt:formatNumber value="${dto.pprice * dto.count}" pattern="#,##0"/>원
          </td>
        </tr>
      </table>
    </form>
  </c:forEach>
  <table border="0">
      <tr>
        <td style="text-align: left;">총 주문금액 : </td>
        <td style="text-align: right;">
          <span id="totalAmount">
            <fmt:formatNumber value="${totalAmount}" pattern="#,##0"/>
          </span>
        </td>
      </tr>
    </table><br><br>
    <h1 style="position: absolute; top: 460; left: 100px;">주문자 정보</h1><br><br>
	<hr width="80%" color="black" size="2">
	
</body>
</html>

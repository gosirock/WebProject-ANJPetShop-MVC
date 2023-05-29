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
     	h1 {
            position: absolute;
            
            left: 150px;
        }
        .pid {
            font-family: Arial, 맑은고딕; /* 원하는 글꼴로 변경 */
            font-size: 17px; /* 원하는 글꼴 크기로 변경 */
            font-weight: bold; /* 원하는 글꼴 굵기로 변경 */
            color: black; /* 원하는 글꼴 색상으로 변경 */
        }
         table {
            margin: 0 auto; /* 가운데 정렬 */
            width: 60%; /* 테이블 크기 조정 */
            height: 100px; /* 테이블 높이 조정 */
        }
      
        td {
    	text-align: center;
  		}
  		
  		table {
		  border-collapse: collapse;
		}
		
		/* table tr:first-child {
		  border-top: 1px solid black;
		} */
		
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
    
 // 체크박스 클릭 시 데이터 채우기
     // 서버에서 전달된 JSON 값
  var serverData = {
    username: "${acontent_View.username}",
    usertel: "${acontent_View.usertel}",
    useremail: "${acontent_View.useremail}",
    address: "${acontent_View.address}"
  };

  function fillUserInfo(checkbox) {
    var usernameInput = document.getElementsByName("username")[0];
    var usertelInput = document.getElementsByName("usertel")[0];
    var useremailInput = document.getElementsByName("useremail")[0];
    var addressInput = document.getElementsByName("address")[0];

    if (checkbox.checked) {
      // 체크박스가 선택된 경우 데이터 채우기
      usernameInput.value = serverData.username;
      usertelInput.value = serverData.usertel;
      useremailInput.value = serverData.useremail;
      addressInput.value = serverData.address;
    } else {
      // 체크박스가 선택되지 않은 경우 데이터 비우기
      usernameInput.value = "";
      usertelInput.value = "";
      useremailInput.value = "";
      addressInput.value = "";
    }
  }
  
  function submitForm() {
      var form = document.createElement("form");
      form.action = "order.do";
      form.method = "post";

      var pidInputs = document.getElementsByName("pid");
      var countInputs = document.getElementsByName("count");
      
      for (var i = 0; i < pidInputs.length; i++) {
        var pidInput = document.createElement("input");
        pidInput.type = "hidden";
        pidInput.name = "pid";
        pidInput.value = pidInputs[i].value;
        form.appendChild(pidInput);

        var countInput = document.createElement("input");
        countInput.type = "hidden";
        countInput.name = "count";
        countInput.value = countInputs[i].value;
        form.appendChild(countInput);
      }

      document.body.appendChild(form);
      form.submit();
    }
  
  function confirmPurchase() {
	    var confirmed = confirm("구매하시겠습니까?");
	    if (confirmed) {
	      alert("구매가 완료되었습니다.");
	      submitForm(); // 구매를 확인한 경우에만 submitForm() 함수 호출
	    }
	  }
    
  </script>
  <meta charset="UTF-8">
  <title>주문/결제</title>
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
 
	<h1 style=" left: 160px;">주문/결제</h1><br><br>
	<!-- 카테고리명 테이블 -->
	<hr width="80%" color="black" size="2"><br>
  <table border="0" style="height: 20px; border-top: 1px solid black;">
    <tr>
      <th style="width: 600px;">상품정보</th>
      <th style="width: 180px;">수량</th>
      <th style="width: 140px;">주문금액</th>
    </tr>
  </table>
<!-- 상품정보 테이블 -->

<head>
  
</head>
<body>
  <form id="orderForm" method="post">
    <c:forEach items="${list}" var="dto">
      <table border="0" style="border-top: 1px solid black;">
        <tr>
          <td style="width: 100px; height: 100px;"><img alt="arter" src="${dto.pimage}"></td>
          <td style="width: 180px; text-align: left;">
            <span class="pid">${dto.pid}</span><br>
            <fmt:formatNumber value="${dto.pprice}" pattern="#,##0"/>원<br>
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

      <input type="hidden" name="count" value="${dto.count}">
      <input type="hidden" name="pid" value="${dto.pid}">
    </c:forEach>

    <table border="0">
      <tr>
        <td style="text-align: left;">총 주문금액 :</td>
        <td style="text-align: right;">
          <span id="totalAmount">
            <fmt:formatNumber value="${totalAmount}" pattern="#,##0"/>
          </span>
        </td>
      </tr>
    </table><br>
    
<!-- 배송지 정보 -->
<form>
<h1 style="position: absolute; top: 600; left: 160px;">배송지 정보 입력</h1><br><br>
<hr width="80%" color="black" size="2"><br>
  <input type="checkbox" name="checkbox" style="position: absolute; right: 300px;" onchange="fillUserInfo(this)">
  <label for="checkbox" style="position: absolute; right: 160px;">사용자 정보와 동일</label>
  <br>
  <table border="0" id="userDeliveryTable">
    <tr>
      <td style="font-size: 20px; order: bottom: 1px solid black;"><p>받으실 분 이름</p></td>
      <td><input type="text" name="username" size="50" style="font-size: 20px;" value="${delivery_View.username}"></td>
    </tr>
    <tr>
      <td style="font-size: 20px;"><p>휴대폰번호</p></td>
      <td><input type="text" name="usertel" size="50" style="font-size: 20px;" value="${delivery_View.usertel}"></td>
    </tr>
    <tr>
      <td style="font-size: 20px;"><p>이메일</p></td>
      <td><input type="text" name="useremail" size="50" style="font-size: 20px;" value="${delivery_View.useremail}"></td>
    </tr>
    <tr>
      <td style="font-size: 20px;"><p>배송지 주소</p></td>
      <td><input type="text" name="address" size="50" style="font-size: 20px;" value="${delivery_View.address}"></td>
    </tr>
  </table>
  <br><br>
</form>
    <button type="button" class="submit-button" style="display: block; margin: 0 auto; right: 305px; width: 120px; height: 30px; background-color: black; color: white; " onclick="confirmPurchase()">주문하기</button>
	<br><br><br>
  </form>

<!-- 총 주문금액 -->
<!-- 결제하기 -->
<!-- 주문자 정보 -->

</body>
</html>


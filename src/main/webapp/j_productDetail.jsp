<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>헤더 예시</title>
  <style>
    /* 구간별 스타일링 */
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .logo {
      flex-grow: 1;
    }

    .categories {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .category {
      margin: 0 10px;
      justify-content: center;
      flex-grow: 1;
    }

    .login-logout {
      margin-left: 10px;
    }
    
    /* main {
      padding: 20px;
    } */
    
     footer {
      background-color: #333;
      color: #fff;
      padding: 10px;
      text-align: center;
    }
     
     .product-container {
      display: flex;
    }

    .product-image {
      flex-basis: 45%;
      padding: 20px;
    }

    .product-details {
      flex-basis: 55%;
      padding: 20px;
    }

    .product-details h2 {
      margin-top: 0;
    }
    
  </style>
</head>
<body>
  <header>
    <div class="logo">
      <img src="logo.png" alt="로고">
    </div>

    <div class="categories">
      <div class="category">카테고리 1</div>
      <div class="category">카테고리 2</div>
      <div class="category">카테고리 3</div>
      <div class="category">카테고리 4</div>
    </div>

    <div class="login-logout">
      <button>로그인</button>
    </div>
  </header>
  <!-- <main> 페이지 가장 중앙 -제품 상세 내용
  <div class="product-container">
    <div class="product-image">
      <img src="product-image.jpg" alt="제품 이미지">
    </div>
    <div class="product-details">
      <h2>제품 상세 정보</h2>
      <p>제품 설명이나 추가 정보를 여기에 작성합니다.</p>
      <p>기타 상세 정보들도 여기에 포함됩니다.</p>
    </div>
  </div>
</main> -->



  <footer>
    <p>저작권 정보 및 연락처</p>
  </footer>
</body>
</html>
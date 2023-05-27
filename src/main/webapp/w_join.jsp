<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" href="w_divCenter.css">
<style>
.back {
  width: 300px;
  height: 40px;
  border-radius: 10px;
  font-size:14px;
}
.check {
  display: block;
  text-align: right;
  height:20px;
  font-size: 15px;
}
</style>
<body>
<h1>회원가입</h1>
	<hr>
	<div class="logo_box">
			<h2 style="font-family:굴림;font-size:50px"> 회원가입</h2>
		<form action="join.do" method="get" name="join">
		
			<span id="idwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="id" id="id" class="back" placeholder="아이디" ><br/>
			<span id="idCheckConfirm" class = "check">  </span>
			
			<span id="pwwrite" style="font-size: 15px"></span><br/>
				<input type="password" id = "pw1"class="back" name="passwd"  placeholder="비밀 번호"><br/>
				<span id="pwCheck" class = "check" >  </span>
			<span id="pw2write" style="font-size: 15px"></span><br/>
				<input type="password" id="pw2" class="back" name="passwd2"  placeholder="비밀 번호 확인"><br/>
			<span id="pwCheckConfirm" class = "check" ></span>
		
			<span id="namewrite" style="font-size: 15px"></span><br/>
				<input type="text" name="name" id="name" class="back" placeholder="이 름"><br/><br/>
			
			<span id="telwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="tel" id="tel" class="back" placeholder="전화번호"><br/><br/>
			
			<span id="emailwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="email" id="email" class="back" placeholder="이메일"><br/><br/>
			
			<span id="addresswrite" style="font-size: 15px"></span><br/>
				<input type="text" name="address" id="address" class="back" placeholder="주 소"><br/><br/>
					
				<input type="button" value="가입" onclick="checkjoin()" style="background: black;width: 310px;height: 50px;font-size: 20px;color: white" >
		</form>
	</div>

</body>

<script type="text/javascript" src="w_join.js" ></script> 

</html>

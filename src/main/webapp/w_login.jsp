<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<link rel="stylesheet" href="w_loginCenter.css">

<body>
	<h1>로그인</h1>
	<hr>
	<div class="login">
	
		<h2 style="font-family:굴림;font-size:50px"> LOG IN</h2>
		<form action="main.do" name="login">
			<input type="text" name="id" placeholder="아이디" style="width: 300px;height: 30px;font-size: 20px"><br/><br/>
			<input type="password" name="pw" placeholder="비밀번호" style="width: 300px;height: 30px;font-size: 20px"><br/><br/>
			<input type="button" value="로그인" onclick="loginCheck()" style="background: black;width: 310px;height: 50px;font-size: 20px;color: white">
	
		</form>
	</div>


</body>
<script type="text/javascript">
	function loginCheck() {
		const form = document.login
		const id = form.id.value;
		const passwd = form.pw.value;
		
		if(!id){
			alert("아이디를 입력해 주세요")
			form.id.select()
			return
		}
		
		if(!passwd){
			alert("비밀번호를 입력해 주세요")
			form.id.select()
			return
		}
		
		$.ajax({
			url:"loginCheck.do",
			type:"post",
			dataType:"text",
			data:{"id":id,"pw":passwd},
			success:function(data){
			if(data=="admin"){
				location.href = 'admin.do';
			}else if(data=="user"){
				form.submit()
			}else{
				alert("아이디, 비밀번호를 확인하세요");
			}
			},
			error:function(){
				alert("실패");
			}
		});
				
		
		
	}


</script>
</html>
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
<link rel="stylesheet" href="w_btn.css">

<body>

	<div class="login">
	
		<h2 style="font-family:굴림;font-size:50px"> LOG IN</h2><br/>
		<form action="main.do" name="login">
			<input type="text" name="id" placeholder=" 아이디" style="width: 300px;height: 30px;font-size: 20px; border-radius: 5px"><br/><br/>
			<input type="password" name="pw" placeholder=" 비밀번호" style="width: 300px;height: 30px;font-size: 20px;border-radius: 5px"><br/><br/>
		아직 회원이 아니신가요? <a href="w_join.jsp" >회원가입</a> <br/>
      
	<a class="a">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
			<input type="button" value="로그인" onclick="loginCheck()"  style="background: black;width: 310px;height: 50px;font-size: 20px;color: white; cursor: pointer">
    </a>
    </form>
	</div>

</body>
<script type="text/javascript">

	
	function loginCheck() {
		const form = document.login
		const id = form.id.value;
		const passwd = form.pw.value;
		
		//아이디 null값 경고
		if(!id){
			alert("아이디를 입력해 주세요")
			form.id.select()
			return
		}
		//비빌번호 null값 경고
		if(!passwd){
			alert("비밀번호를 입력해 주세요")
			form.id.select()
			return
		}
		
		// 아이디 패스워드 확인 후 보내기
		$.ajax({
			url:"loginCheck.do",
			type:"post",
			dataType:"text",
			data:{"id":id,"pw":passwd},
			success:function(data){
			if(data=="admin"){ 
				sessionStorage.setItem('ID', id)   //세션에 아디 넣기
				location.href = 'admin.do';
			}else if(data=="user"){
				sessionStorage.setItem('ID', id)
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
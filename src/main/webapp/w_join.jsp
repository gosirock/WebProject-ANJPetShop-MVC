<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" href="w_divCenter.css">

<script type="text/javascript">
	function checkId(){	/* function이 method다잉 */
		window.open("w_loginCheck.jsp","_blank","width=300px height=100px");
		let idcheck = document.join.id.value;
		
	}  /* documnet가 현재 창  */
</script>
<body>
<h1>로그인</h1>
	<hr>
			<h2 style="font-family:굴림;font-size:50px"> 회원가입</h2>
	<div class="logo_box">
		<form action="" method="get" name="join">
			아이디 : <input type="text" name="id" placeholder="아이디"> <input type="button" value="중복체크" onclick="checkId()"><img id="id_check_sucess" style="display: none;"><br/><br/>
			이 름 : <input type="text" name="name"  ><br/><br/>
			비밀번호 : <input type="text" name="passwd"  ><br/><br/>
			비밀번호 확인 : <input type="text" name="passwd2"  ><br/><br/>
			E-mail : <input type="text" name="email"  ><br/><br/>
			주 소 : <input type="text" name="address">
			<input type="submit" value="가입" style="background: black;width: 210px;height: 50px;font-size: 20px;color: white" >
	
		</form>
	</div>

</body>
</html>
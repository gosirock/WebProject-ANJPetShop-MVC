<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>온라인 신발가게</title>
<link rel="stylesheet" type="text/css" href="o_style.css">
</head>

<body style="background-color: #ECEFF1;">
	<header>
		${sessionScope.ADMINID}님 환영합니다.
		<nav>
			<div>
				<ul>
					<li><a href="o_adminMain.do?adminid=${sessionScope.ADMINID}">홈</a></li>
					<li><a href="o_inventory.do">상품관리</a></li>
					<li><a href="o_searchUserInfo.do">회원정보</a></li>
				</ul>
			</div>
		</nav>
		<div class="user-info">
			<ul>
				<li><a href="o_adminInfo.do?adminid=${sessionScope.ADMINID}">마이페이지</a></li>
				<li><a href="w_login.jsp">로그아웃</a></li>
			</ul>
		</div>
	</header>
	<br />
	<br />
	<div class="center">
		<h1>
			<b>관리자 정보 수정</b>
		</h1>
	</div>
	<hr>
	<br />
	<div class="center-form">
		<form action="o_adminUpdate.do" method="POST" name="admininfo">
			<input type="hidden" name="adminid" value="${sessionScope.ADMINID }">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="adminid" value="${admin_info.adminid}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="adminpasswd" placeholder="비밀번호를 입력해주세요."> <input type="button" name="checkbtn" value="확인" onclick="showPasswordEditField()"></td>

				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="adminname" value="${admin_info.adminname}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="admintel" value="${admin_info.admintel}" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input type="hidden" name="updatebtn" value="수정" onclick="showSuccessMessage()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>

<script>
    function showSuccessMessage() {
        alert('수정이 완료되었습니다.');
    }
    function showPasswordEditField() {
    	const form = document.admininfo
		const adminPassword = "${admin_info.adminpasswd}"
		const adminNameInput = form.querySelector('input[name="adminname"]')
		const adminTelInput = form.querySelector('input[name="admintel"]')
		
		if(form.adminpasswd.value == adminPassword){
			alert("확인되었습니다.")
			form.adminpasswd.type = "text"
			form.updatebtn.type = "submit"
			form.checkbtn.type = "hidden"
			adminNameInput.removeAttribute("readonly");
			adminTelInput.removeAttribute("readonly");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
</script>
</html>

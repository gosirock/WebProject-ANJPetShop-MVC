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
<link rel="stylesheet" href="w_btn2.css">
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
	<div class="logo_box">
			<h2 style="font-family:굴림;font-size:50px"> 회원가입</h2>
		<form action="join.do" method="get" name="join">
		
			<span id="idwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="id" id="id" class="back" placeholder=" 아이디" ><br/>
			<span id="idCheckConfirm" class = "check">  </span>
			
			<span id="pwwrite" style="font-size: 15px"></span><br/>
				<input type="password" id = "pw1"class="back" name="passwd"  placeholder=" 비밀 번호"><br/>
				<span id="pwCheck" class = "check" >  </span>
			<span id="pw2write" style="font-size: 15px"></span><br/>
				<input type="password" id="pw2" class="back" name="passwd2"  placeholder=" 비밀 번호 확인"><br/>
			<span id="pwCheckConfirm" class = "check" ></span>
		
			<span id="namewrite" style="font-size: 15px"></span><br/>
				<input type="text" name="name" id="name" class="back" placeholder=" 이 름"><br/><br/>
			
			<span id="telwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="tel" id="tel" class="back" placeholder=" 전화번호"><br/><br/>
			
			<span id="emailwrite" style="font-size: 15px"></span><br/>
				<input type="text" name="email" id="email" class="back" placeholder=" 이메일"><br/><br/>
			<span id="addresswrite" style="font-size: 15px"></span>
			<input type="button" class="btn-2" onclick="sample6_execDaumPostcode()" value="주소 찾기" style="float:right;border-radius: 0.5em; cursor: pointer"><br/>
				<input type="text" name="address" id="address" class="back" placeholder=" 주 소"><br/><br/>
				<button class="btn" onclick="checkjoin()"><span> 가입하기 </span></button>
		</form>
</div>
</body>
<script type="text/javascript" src="w_join.js" ></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } else {
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
</script>
</html>

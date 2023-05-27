	
	const regExpAddress = /^[가-힣0-9]*$/
	const regExpName = /^[가-힣]*$/		
	const regExpTel = /^\d{3}-\d{3,4}-\d{4}$/
	const regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	const regExpPw	= asswdCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);		


	$("#id").keyup(function() {
		let oId = $("#id").val();
		
		$.ajax({
			url:"idCheck.do",
			type:"post",
			dataType:"text",
			data:{"id":oId},
			success:function(data){
				
			
			if(data==0){
				if(oId==""){
					$("#idCheckConfirm").text("아이디를 입력해 주세요").css("color","black");
				}else{
					$("#idCheckConfirm").text("✔ 사용 가능한 아이디입니다.").css("color","blue");
					
				}
				
						
			}else{
				$("#idCheckConfirm").text("❌ 이미 등록된 아이디입니다.").css("color","red");	
			}
			
			},
			error:function(){
				alert("실패");
			}
		});
	});
	function checkjoin() {
		
		
	const form = document.join;
	const id = form.id.value;
	const name = form.name.value;
	const tel = form.tel.value;
	const email = form.email.value;
	const pw = form.passwd.value;
	const pw2 = form.passwd2.value;
	const address = form.address.value;
	
	
	if(!id){
		alert("아이디를 입력해 주세요")
		form.id.select()
		return
	}
	
	if(!pw){
		alert("비밀번호를 입력해 주세요.")
		form.pw.select()
		return
	}
	
	if(!regExpPw.test(pw)){
		alert("비밀번호를 확인해 주세요.")
		form.pw.select()
		return
	}
	if(!pw2){
		alert("비밀번호를 확인해 주세요.")
		form.pw2.select()
		return
	}
	if(pw!=pw2){
		alert("동일한 비밀번호를 입력해 주세요.")
		form.pw2.select()
		return
	}
	if(!name){
		alert("이름을 입력해 주세요.")
		form.name.select()
		return
	}
	if(!regExpName.test(name)){
		alert("이름은 한글만으로 입력해 주세요.")
		form.name.select()
		return
	}
	if(!tel){
		alert("전화번호를 입력해 주세요.")
		form.tel.select()
		return
	}
	if(!regExpTel.test(tel)){
		alert("전화번호 입력을 확인해 주세요.")
		return
	}
	if(!email){
		alert("이메일을 입력해 주세요.")
		form.eamil.select()
		return
	}
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인해 주세요.")
		form.email.select()
		return
	}
	if(!address){
		alert("주소를 입력해 주세요.")
		form.address.select()
		return
	}
	
	alert("회원가입이 완료 되었습니다.")
	form.submit()
	

}

	
	// 텍스트박스 클릭 이벤트
	$(document).ready(function() {
    	$(".back").focus(function() {
     	 $(this).css("background-color", "#E3EEFD");
     	 $(this).css("font-size", "18px");
    });
    	$("#id").focus(function() {
        	 $("#idwrite").text("ID");
       });
    	$("#pw1").focus(function() {
       		 $("#pwwrite").text("비밀번호");
       		 $("#pwCheck").text("영문,숫자,특수문자를 포함한 8글자 이상");
      });
    	$("#pw2").focus(function() {
          	 $("#pw2write").text("비밀번호 확인");
         });
    	$("#name").focus(function() {
          	 $("#namewrite").text("이 름");
         });
    	$("#tel").focus(function() {
         	 $("#telwrite").text("전화번호");
         	 $("#tel").attr("placeholder", "ex) 010-xxxx-xxxx");
        });
    	$("#email").focus(function() {
          	 $("#emailwrite").text("이메일");
          	 $("#email").attr("placeholder", "ex) xxxx@gmail.com");
         });
    	$("#address").focus(function() {
          	 $("#addresswrite").text("주 소");
         });
    $(".back").blur(function() {
      $(this).css("background-color", ""); // 포커스가 해제되면 원래 배경색으로
    });
  });
	// 비밀번호 확인 키업 이벤트
	
	$("#pw1").keyup(function(){
		let pwpw = $(this).val();
		if(pwpw==""){
			$("#pwCheck").text("비밀번호를 입력하세요").css("color","black");	
		}else if(regExpPw.test(pwpw)){
			$("#pwCheck").text("✔ 영문,숫자,특수문자를 포함한 8글자 이상").css("color","blue");	
		}else{
			$("#pwCheck").text("❌ 영문,숫자,특수문자를 포함한 8글자 이상").css("color","red");	
		}
	});
	$("#pw2").keyup(function(){
		let pw1 = $("#pw1").val();
		let pw2 = $("#pw2").val();
		if(pw2==""){
			
			$("#pwCheckConfirm").text("비밀번호를 입력하세요.").css("color","black");	
		}else if(pw1==pw2){
			$("#pwCheckConfirm").text("✔ 같은 비밀번호 입니다.").css("color","blue");	
		}else{
			$("#pwCheckConfirm").text("❌ 다른 비밀번호 입니다.").css("color","red");	
		}
	});
	
	
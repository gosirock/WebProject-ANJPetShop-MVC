$("#id").keyup(function() {
		let oId = $("#id").val();
		
		$.ajax({
			url:"loginCheck.do",
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
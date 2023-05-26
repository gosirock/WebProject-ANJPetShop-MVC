<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%	
		// result 값이 null 이거나 true/false
		Object result = request.getAttribute("idCheck");
		String userId =(String)request.getAttribute("userId");
	%>



<%if(result==null){ %>
	<form action="/member/idCheck.do" method="get">
		<input type="text" name="userId" placeholder="중복 체크할 ID를 입력하세요">
		<input type="submit" value="중복 체크">
	</form>
<%}else{ %>
	<form action="/member/idCheck.do" method="get">
		<input type="text" name="userId" value="<%=userId %>" placeholder="중복 체크할 ID를 입력하세요">
		<input type="submit" value="중복 체크">
	</form>
	<%if((boolean)result){ %>
		<span style="color:red">해당 ID는 이미 사용 중합니다.</span>
	<%}else{ %>
		<span style="color:blue">해당 ID는 사용이 가능합니다.</span>
		<button onclick="userId();">사용하기</button>
		
		<script>
		function userId(){
			window.opener.document.getElementById('userId').value='<%=userId%>';
			window.close();
		}
	</script>
	<%} %>
	
	
	
<%} %>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String adminid = (String)session.getAttribute("ADMINID");
 %>
<!DOCTYPE html>
<html>
<head>
    <title>온라인 신발가게</title>
	<link rel="stylesheet" type="text/css" href="o_style.css">
</head>
<body style="background-color: #ECEFF1;">
    <header>
        <ul>
            <li><a href="o_adminMain.do">홈</a></li>
            <li><a href="o_sales.do">매출현황</a></li>
            <li><a href="o_inventory.do">재고관리</a></li>
            <li><a href="o_searchUserInfo.do">회원정보 확인</a></li>
        </ul>
        <div class="user-info">
            <span>${sessionScope.ADMINID }님 안녕하세요</span>&nbsp;&nbsp;
            <ul>
	            <li><a href="w_login.jsp">로그아웃</a></li>&nbsp;
	            <li><a href="o_adminInfo.do?adminid=${sessionScope.ADMINID}">마이페이지</a></li>
            </ul>
        </div>
    </header>
    <br/>
    <br/>
    <div class="center">
        <h1>관리자 정보</h1>
    </div>
    
<div class="center-form">
    <form action="" method="POST" id="adminForm">
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="" value="${admin_info.adminid}" readonly="readonly"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="adminpasswd" value="${admin_info.adminpasswd}"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="adminname" value="${admin_info.adminname}"></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="admintel" value="${admin_info.admintel}"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <label>
                        <input type="radio" name="action" value="update" checked> 수정
                    </label>
                    <label>
                        <input type="radio" name="action" value="delete"> 삭제
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="확인" onclick="handleFormSubmit()">
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function handleFormSubmit() {
        var form = document.getElementById('adminForm');
        var actionValue = form.querySelector('input[name="action"]:checked').value;
        
        if (actionValue === 'update') {
            form.action = 'o_adminUpdate.do';
        } else if (actionValue === 'delete') {
            form.action = 'o_adminDelete.do';
        }
        
        form.submit();
    }
</script>
    
    
</body>
</html>

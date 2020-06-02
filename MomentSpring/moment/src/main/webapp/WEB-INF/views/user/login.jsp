<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="login">
    <h1>Login</h1>
    <form action="userlogin" method="post">
        <input type="text" id="userid" name="u" placeholder="Username" required="required" />
        <input type="password" id="userpw" name="p" placeholder="Password" required="required" />
       <a class='btn-fill' onclick="go_login()">로그인</a>
    </form>
</div>
<script type="text/javascript">
function go_login(){
	if( $('#userid').val()=='' ){
		alert('아이디를 입력하세요!');
		$('#userid').focus();
		return;
	}else if( $('#userpw').val()=='' ){
		alert('비밀번호를 입력하세요!');
		$('#userpw').focus();
		return;
	}

	$.ajax({
		type: 'post',
		url: 'userlogin',
		data: { userid:$('#userid').val(), userpw:$('#userpw').val()},
		success: function(data){
			if( data ){ 
				location.href="http://localhost/moment";
				alert( $('login_info.u_username') +'님 환영합니다!' );
			} else {
				alert('아이디나 비밀번호가 권한 없음 일치하지 않습니다!');
			}
		},error: function(req, text){
			alert('아이디 비밀번호가 일치하지 않습니다!!!');
		} 
		
	});
}
</script>

</body>
</html>
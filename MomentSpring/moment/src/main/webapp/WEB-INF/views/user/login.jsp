<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login1.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="login_page">
<div class="form">
    <h1 style="color:black;">Moment</h1>
    <form action="userlogin" method="post" class="login-form">
        <input type="text" id="u_userid" name="u" placeholder="abc123@abcd.com" required="required" />
        <input type="password" id="u_userpw" name="p" placeholder="Password" required="required" />
    </form>
       <a id='login_btn' onclick="go_login()">login</a>
</div>
</div>
<script type="text/javascript">
function go_login(){
	if( $('#u_userid').val()=='' ){
		alert('아이디를 입력하세요!');
		$('#u_userid').focus();
		return;
	}else if( $('#u_userpw').val()=='' ){
		alert('비밀번호를 입력하세요!');
		$('#u_userpw').focus();
		return;
	}

	$.ajax({
		type: 'post',
		url: 'userlogin',
		data: { u_userid:$('#u_userid').val(), u_userpw:$('#u_userpw').val()},
		success: function(data){
			if( data ){ 
				location.href="http://localhost/moment";
				alert( $('login_info.u_name') +'님 환영합니다!' );
			} else {
				alert('이메일 인증하지 않았습니다. 인증해주세요');
			}
		},error: function(req, text){
			alert('아이디 비밀번호가 일치하지 않습니다!!!');
		} 
		
	});
}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>푸시 보내기</h3>
<h3>광주</h3>
	<table>
	<tr>
		<th>제목</th>
		<th>
		<input type="text" id="gwangju_title" value="광주알림"/>
		</th>
	</tr>
	<tr>
		<th>내용</th>
		<th>
		<input type="text" id="gwangju_body" name="content" />
		</th>	
		<th><button onclick="gwangjufcm()" id="sendBtn">전송</button></th>
	</tr>
	</table>

<script type="text/javascript" src="js/fcmtest.js"></script>
</body>
</html>
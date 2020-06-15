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
<h3>푸시 보내기</h3>
<form action="/moment/sendPush" method="post">
	<h1>제목</h1>
		<input type="text" id="title" name="title"/>
	<H1>내용</H1>
		<input type="text" id="content" name="content"/>
	<H1>버튼</H1>
		<input type="submit" value="push"/>

		<input type="reset" value="cancel"/>

	</form>




</body>
</html>
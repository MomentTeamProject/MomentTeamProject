<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body { background-color:  white;}
table {  width: 80%; margin: 0 auto; border: 1px solid; border-collapse: collapse; }
table th, table td { border: 1px solid; padding: 5px 10px; }
#list-top { width: 60%; padding: 20px 10%; }
#content { width: 99%; color: black; margin: 0 auto; }
</style>
</head>
<body>
<h3>PICTURES</h3>
<div id="list-top">
<form action="list.bo" method="post">
<input type="hidden" name="curPage" value="2" >
	<div id="searchBox">
		
	</div>
</form>
</div>

<div id="content" style="margin: 0 auto;">
<table>
<tr><th class="w-px40">No</th><th class="w-px300">Title</th><th class="w-px100">Nick</th>
	<th class="w-px120">Place</th><th class="w-px100">Date</th><th class="w-px80">ReadCnt</th><th class="w-px80">DDABONG</th>
</tr>
<c:forEach items="${page.list}" var="list">
<tr><td>${list.no}</td>
	<td>${list.b_title}</td>
	<td>${list.b_nick}</td>
	<td>${list.b_local}</td>
	<td>${list.b_writedate}</td>
	<td>${list.b_readcnt}</td>
	<td>${list.b_ddabong}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>
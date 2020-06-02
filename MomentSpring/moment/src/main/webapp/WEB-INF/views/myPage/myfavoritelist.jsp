<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css?v=<%=new java.util.Date().getTime()%>">
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
</head>
<body>
<h3>즐겨 찾기  게시물</h3>
<!-- 임시  -->
<div class="top" style="float:left;">
<a class="btn-fill" href="mypostlist.moment"> 내글보기 </a>
<a class="btn-fill" href="myddabong.moment"> 좋아요 </a>
<a class="btn-fill" href="myfavorite.moment"> 즐겨찾기 </a>

</div>
<div id="data-list" style="clear:both;" >
	<ul class="grid">
	<c:forEach items="${list}" var="vo">	
				<li>
				<div><a href="mylist_detail.moment?id=${vo.b_no}" ><img src="img/${vo.b_imgpath}" style="width:99%; height:100%;"></a></div>			
				<div style="padding:0;"><a href="mylist_detail.moment?id=${vo.b_no}">${vo.b_title}</a><div>${vo.u_nick}</div></div>	
				<div style="font-size:80%;" ><img src="img/eye.png" style="width:20px; padding-bottom: 2px;">${vo.b_readcnt} / <img src="img/heart.png" style="padding-bottom: 2px; font-size:80%; width:15px">${vo.b_ddabong}
					&nbsp;&nbsp;&nbsp;${vo.b_writedate}
				</div>
			</li>
	</c:forEach>
	</ul>
</div>
<div class='btnSet' class="top">
	<jsp:include page="/WEB-INF/views/include/page.jsp" />
</div>

</body>
</html>
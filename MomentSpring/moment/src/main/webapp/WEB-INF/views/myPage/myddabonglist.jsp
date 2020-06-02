<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css?v=<%=new java.util.Date().getTime()%>">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
</head>
<style>
.top {width:65%; margin:0 auto;}
.btnSet {margin-top: 20px;}
.btnSet > a:not(:first-child) {margin-left: 5px;}
</style>
<body>
<form method="post" action="mypostlist.moment">
<input type="hidden" name="curPage" value="1"/>
</form>
<h3 style="color:white;">좋아요 한 게시글</h3>
<!-- 임시  -->
<div class="top" style="float:left;">
<a class="btn-fill" href="mypostlist.moment"> 내글보기 </a>
<a class="btn-fill" href="myddabong.moment"> 좋아요 </a>
<a class="btn-fill" href="myfavorite.moment"> 즐겨찾기 </a>
</div>

<div class="top" style="padding:50px 0;"></div>
<div id="data-list" style="clear:both;" >
	<ul class="grid">
	<c:forEach items="${page.list}" var="vo">	
					<li>
					<div style="height:200px;"><a href="mylist_detail.moment?id=${vo.b_no}" ><img src="img/${vo.b_imgpath}" style="width:98%; height:100%;"></a></div>			
					<div style="height: 10px" ><a href="mylist_detail.moment?id=${vo.b_no}">${vo.b_title}</a></div>	
					<div>${vo.u_nick}</div>
					<div ><img src="img/monster.png" style="width:15px; padding-bottom: 2px;">${vo.b_readcnt} / <img src="img/heart.png" style="padding-bottom: 2px; font-size:80%; width:15px">${vo.b_ddabong}
						&nbsp;&nbsp;&nbsp;${vo.b_writedate}
					</div>
				</li>
	</c:forEach>
	</ul>
</div>
<div class='btnSet' class="top">
	<jsp:include page="/WEB-INF/views/include/page.jsp" />
</div>

<script type="text/javascript">
/* 그리드 페이지 설정 */
$('#data-list ul').css('height', 
		( ($('.grid li').length%5>0 ? 1 : 0) + Math.floor($('.grid li').length/5) )
				* $('.grid li').outerHeight(true) - 20 );

</script>
</body>
</html>
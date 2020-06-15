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
ul.grid { width:1237px; margin:0 auto; padding: 0; min-width: 1237px; height: 1010px; min-height: 1010px;}
.grid li div:nth-child(4) { font-size:80%; height:15px; padding: 10 0 0 0; }
.grid li div:nth-child(5) { font-size:80%; height:20px; padding: 0 ;}	


</style>
<body>
<div class="contentbody">
	<h3>즐겨 찾기  게시물</h3>
	
	<!-- 임시  -->
	<div class="top" style="float:left;">
	<a class="btn-fill" href="mypostlist.moment"> 내글보기 </a>
	<a class="btn-fill" href="myddabong.moment"> 좋아요 </a>
	<a class="btn-fill" href="myfavorite.moment"> 즐겨찾기 </a>
	
	</div>
	
	<form method="post" action="myfavorite.moment">
	<input type="hidden" name="curPage" value="1"/>
	</form>
	
	<div class="top">	
	
		<div style="padding-bottom:45px;" >
		<a class="btn-fill" id="deleteBtn" style="float:right;">삭제</a>
		<a class="btn-fill" style="float:right;" >글쓰기</a>
		</div>
	</div>
	
	<!-- 즐겨찾기 게시글   -->
	<c:if test="${empty page.list}">		
		<a style="color:gray;"> 즐겨찾기 한 게시물이 없습니다. </a>
	</c:if>
	<c:if test="${!empty page.list}">
	<div id="data-list" style="clear:both;" >
		<ul class="grid">
		<c:forEach items="${page.list}" var="vo">	
					<li>
					<div></div>
					<div><a href="mylist_detail.moment?id=${vo.b_no}" ><img src="img/${vo.b_imgpath}" style="width:99%; height:100%; border: 2px black;"></a></div>			
					<div style="padding:0; height:10px;"><a href="mylist_detail.moment?id=${vo.b_no}">${vo.b_title}</a></div>
					<div><a href="memberpostlist.moment?userid=${vo.b_userid}">${vo.u_nick}</a></div>	
					<div><img src="img/eye.png" style="color:white; width:15px;">${vo.b_readcnt} / <img src="img/heart.png" style="font-size:80%; width:15px">${vo.b_ddabong}
							&nbsp;&nbsp;&nbsp;${vo.b_writedate}	</div>
				</li>
		</c:forEach>
		</ul>
	</div>
	</c:if>
	<div class='btnSet' class="top">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
	</div>
	 <form method="post" action="myfavorite.moment">
		<input type="hidden" name="curPage" value="1"/>
	  	<div class="top" style="padding-top: 30px">
			<select name="search" class="w-px80">
				<option value="all" ${page.search eq 'all' ? 'selected' : ''} >전체</option>
				<option value="title" ${page.search eq 'title' ? 'selected' : ''}>제목</option>
				<option value="content" ${page.search eq 'content' ? 'selected' : ''}>내용</option>
				<option value="writer" ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
			</select>
			<input type="text" name='keyword' class="btn-fill" value="${page.keyword}"/>
			<a class="btn-fill" onclick="$('form').submit()">SEARCH</a>			
		</div>	
	</form> 
</div>
<script type="text/javascript">


	/* 그리드 페이지 설정 */
	$('#data-list ul').css('height', 
			( ($('.grid li').length%4>0 ? 1 : 0) + Math.floor($('.grid li').length/5) )
					* $('.grid li').outerHeight(true) - 20 );
	
</script>


</body>
</html>
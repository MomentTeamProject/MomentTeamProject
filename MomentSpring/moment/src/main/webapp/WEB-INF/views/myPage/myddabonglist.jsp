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
select { width: 200px; color:white; background-color: black;
padding: .4em .2em;
border: 1.5px solid white; border-radius:3px;
-webkit-appearance: none; -moz-appearance: none; appearance: none; 
background: url('img/arrow.png') no-repeat 99% 50%;

	}	
	
option { width: 200px; color:white; background-color: black;}	
input {background-color: black; color:white; border: 1.5px solid white; padding: .4em .5em;
	background-color:#000000;
	border: 1.5px solid white;	border-radius:3px;
	box-shadow: 1px 1px 2px #c0c0c0; 
	color:#ffffff;
	}



</style>
<body>
<div class="contentbody">

<nav id="topMenu">
     <ul>
        <li><a class="menuLink" href="mypostlist.moment">내가 쓴 글 </a></li>
        <li><a class="menuLink" href="myddabong.moment"> 좋 아 요  </a></li>
        <li><a class="menuLink" href="myfavorite.moment">즐 겨 찾 기</a></li>                     
     </ul>
</nav>
	
<div class="top">	
		<div style="padding-bottom:45px;" >		
		<a class="btn-fill" style="float:right;" >글쓰기</a>
		</div>
</div>
	
	
	<!-- 좋아요 게시글  -->
	<c:if test="${empty page.list}">
		<div style="border:1px solid gray; width: 1237px; height: 400px;" >
		<a style="color:gray;">좋아요한 게시물이 없습니다</a>
		</div>
	</c:if>
	<c:if test="${!empty page.list}">
		<div id="data-list" style="clear:both;" >
			<ul class="grid">
				<c:forEach items="${page.list}" var="vo">	
								<li>
								<div></div>
								<div><a href="mylist_detail.moment?id=${vo.b_no}" ><img src="img/background/${vo.b_imgpath}" style="width:98%; height:100%;"></a></div>			
								<div><a href="mylist_detail.moment?id=${vo.b_no}">${vo.b_title}</a></div>	
								<div><a href="memberpostlist.moment?userid=${vo.b_userid}">${vo.u_nick}</a></div>
								<div><img src="img/eye.png" style="color:white; width:15px;">${vo.b_readcnt} / <img src="img/heart.png" style="font-size:80%; width:15px">${vo.b_ddabong}
								&nbsp;&nbsp;&nbsp;${vo.b_writedate}	</div>
							</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	
	
	
	<!-- 페이지  -->
	<div class='btnSet' class="top">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
	</div>
	

	
	<!-- 검색   -->	
	 <form method="post" action="myddabong.moment">
		<input type="hidden" name="curPage" value="1"/>
	  	  	<div class="top" style="background-color: black; float:right; padding-top: 30px">
			<select row="2" name="search" class="w-px80" >
				<option value="all" ${page.search eq 'all' ? 'selected' : ''} >제목+내용    </option>
				<option value="title" ${page.search eq 'title' ? 'selected' : ''}>제목</option>
				<option value="content" ${page.search eq 'content' ? 'selected' : ''}>내용</option>				
			</select>
			<input type="text" style="padding-bottom:1px; margin: 1px;" name='keyword' class="btn-fill" value="${page.keyword}"/>
			<a class="btn-fill" style="color: yellow;"onclick="$('form').submit()">SEARCH</a>			
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
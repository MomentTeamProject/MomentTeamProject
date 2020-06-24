<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>

</head>
<style>
body{font-family: 'Noto Serif KR', serif !important;}
.top {margin :0 auto; padding-bottom:0; padding-top: 30px;} 
.grid li div:nth-child(4) { font-size:80%; height:15px; padding: 10 0 0 0; }
.grid li div:nth-child(5) { font-size:80%; height:20px; padding: 0 ;}	

	
option { width: 200px; color:white; background-color: black;}	

.push { display: none; } 
input:focus {outline:none;}
</style>
<body>


<nav id="topMenu">
     <ul>
        <li><a class="menuLink" href="mypostlist.moment"> 내 게시글 </a></li>
        <li><a class="menuLink" href="myddabong.moment" style= "font-weight:bold; color: #f56437fa;"> 좋아요  </a></li>
        <li><a class="menuLink" href="myfavorite.moment"> 즐겨찾기 </a></li>                     
     </ul>
</nav>
	<div class="contentbody" style="padding-top: 50px;">
		<div class="top"></div>

		<!-- 좋아요 리스트 -->
		<c:if test="${empty page.list}">
			<div style="border: 1px solid gray; width: 1237px; height: 400px;">
				<div style="padding-bottom: 150px;"></div>
				<div style="color: gray;">좋아요한 게시물이 없습니다</div>
			</div>

		</c:if>
		<c:if test="${!empty page.list}">
			<div id="data-list" style="clear: both;">
				<ul class="grid">
					<c:forEach items="${page.list}" var="vo">
						<li>

							<div></div>
							<div style="padding: 0; width: 100%; padding-top: 10px;">
								<a onclick="detail(${vo.b_no})"><img
									src="img/background/${vo.b_imgpath}"
									style="width: 100%; height: 100%;"></a>
							</div>
							<div style="padding: 5px; height: 10px;">
								<a style="font-weight: bold;" onclick="detail(${vo.b_no})">${vo.b_title}</a>
							</div>
							<div>
								<a href="memberpostlist.moment?userid=${vo.b_userid}">${vo.u_nick}</a>
							</div>
							<div>
								<img src="img/eye.png" style="color: white; width: 15px;">${vo.b_readcnt}
								/ <img src="img/heart.png" style="font-size: 80%; width: 15px">${vo.b_ddabong}
								&nbsp;&nbsp;&nbsp;${vo.b_writedate}
							</div>
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
			<input type="hidden" name="curPage" value="1" />
			<div class="top"
				style="background-color: black; float: right; padding-top: 30px">
				<select row="2" name="search" class="mypageselect" style="font-family: 'Noto Serif KR', serif !important;">
					<option value="all" ${page.search eq 'all' ? 'selected' : ''}>제목+내용
					</option>
					<option value="title" ${page.search eq 'title' ? 'selected' : ''}>제목</option>
					<option value="content"
						${page.search eq 'content' ? 'selected' : ''}>내용</option>
				</select> <input type="text" id="searchinput" name='keyword'  style="color: white;" 
					value="${page.keyword}" /> <a class="btn-fill"
					style="color: #f56437fa;" onclick="$('form').submit()">SEARCH</a>
			</div>
		</form>
	</div>

	<!-- detail div -->
<div id="detail">
	<div class="detitleBox">
		<h3 class="detitle"></h3>
	</div>
</div>
<div id="detail-background"></div>

<!-- 디테일 js -->
<script type="text/javascript" src="js/detail.js"></script>

<script type="text/javascript">


//스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트
window.onscroll = function(){
		console.log('js 흐름탐');
		
		var scroll = window.scrollY + $(window).height();
		var endY = document.body.scrollHeight;
		
		console.log(scroll);
		console.log(endY);
		
		//content 영역의 최상위 위치 값
		var scrollTop = $(this).scrollTop();
		//content 영역의 (패딩영역합산한) content의 높이
		var innerHeight = $(this).innerHeight();
		
		
		//스크롤이 컨텐트아래 50 hegiht 를 넘어서면 이벤트 시작
		if (scroll > endY) {
			$("#confirm").css('color', 'white');
			$("#footer-wrap").slideDown();
		} else {
		 	$("#confirm").css('color', 'gray');
		 	$("#footer-wrap").slideUp();
		}
};














/* 그리드 페이지 설정 */
$('#data-list ul').css('height', 
		( ($('.grid li').length%4>0 ? 1 : 0) + Math.floor($('.grid li').length/5) )
				* $('.grid li').outerHeight(true) - 20 );

</script>
</body>
</html>
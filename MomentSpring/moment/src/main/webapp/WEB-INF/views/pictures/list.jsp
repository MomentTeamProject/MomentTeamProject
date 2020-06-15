<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contentBody { overflow-y: auto; }
#list-top { width: 60%; padding: 20px 10%; }
#content { width: 99%; color: black; margin: 0 auto; overflow-y: auto; }
#pictureBox { display: inline-block; }
#pictures { width: 600px; height: 300px; margin-bottom: 5px; }
.btnSet { margin-top: 50px; margin-bottom: 50px; display: none; }
#confirm { margin-top: 30px; }
</style>
</head>

<body class="contentBody">
<h3>PICTURES</h3>

<div id="list-top">
<form action="list.bo" method="post">
<input type="hidden" name="curPage" value="2" >
	<div id="searchBox">
		
	</div>
</form>
</div>

<div id="content" style="margin: 0 auto;">
<c:forEach items="${page.list}" var="list">
<div id="pictureBox">
<img src="background/${list.b_imgpath}" id="pictures"/>
</div>
</c:forEach>
</div>

<%-- <div class='btnSet'>
	<jsp:include page="/WEB-INF/views/include/page.jsp" />
</div> --%>

<button type="button" id="confirm" disabled >더보기</button>

<!-- 스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트 -->
<script type="text/javascript">
window.onscroll = function(){
		console.log('scroll');

		var scroll = window.scrollY + $(window).height();
		var endY = document.body.scrollHeight - $('#footer-wrap').height();
		
		//content 영역의 최상위 위치 값
		var scrollTop = $(this).scrollTop();
		//content 영역의 (패딩영역합산한) content의 높이
		var innerHeight = $(this).innerHeight();
		//content 영역의 스크롤된 모든 영역의 높이(스크롤되서 보이지않는 영역 높이까지 합산됨)
		var scrollHeight = $(this).prop('scrollHeight');
		
	//		if((this.scrollTop + this.clientHeight) == this.scrollHeight) {
	//			$("#confirm").attr('disabled', false);
	//		} else {
	//			$("#confirm").attr('disabled', true);
	//		}
	console.log(scroll);
	console.log(endY);
	
		if (scroll > endY) {
				$("#confirm").attr('disabled', false);
		} else {
			 	$("#confirm").attr('disabled', true);
		}	
};

</script>
</body>
</html>
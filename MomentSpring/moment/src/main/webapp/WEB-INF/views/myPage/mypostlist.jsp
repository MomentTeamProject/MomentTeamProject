<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

</head>
<style>

body{font-family: 'Noto Serif KR', serif !important;}
.top {margin :0 auto; padding-bottom:0; padding-top: 30px;} 
.grid li div:nth-child(4) { font-size:80%; height:20px; }

option { width: 200px; color:white; background-color: black;}	

.push { display: none; }
#active { font-weight:bold; color: #f56437fa; }
input:focus {outline:none;}

</style>
<body>
<nav id="topMenu">
     <ul>
        <li><a class="menuLink" href="mypostlist.moment" style= "font-family: 'Noto Serif KR', serif; font-weight:bold; color: #f56437fa;"> 내 게시글 </a></li>
        <li><a class="menuLink" href="myddabong.moment">  좋아요  </a></li>
        <li><a class="menuLink" href="myfavorite.moment">  즐겨찾기 </a></li>                     
     </ul>
</nav>


<div class="contentbody" style="padding-top:50px;">

		
	<!-- 게시글 리스트  -->
		<c:if test="${empty page.list}">
			<div class="top"></div>
			<div style="border: 1px solid gray; width: 1237px; height: 400px;">
				<div style="padding-bottom: 150px;"></div>
				<div style="color: gray;">작성한 게시물이 없습니다</div>
			</div>
		</c:if>


		<c:if test="${!empty page.list}">
			<div class="top">
				<p style="float: left; font-size: 90%">총 게시글 ${page.totalList}개
				</p>
				<div style="float: right; padding-bottom: 10px;">
					<input type="checkbox" id="allCheck" style="float: left; margin-top:7px;">
					<label for="allCheck" style="padding: 10px 10px 10px 0;">모두선택</label> 
					<a class="btn-fill" id="deleteBtn">삭제</a>
				</div>
			</div>
			<div id="data-list" style="clear: both;">
				<ul class="grid">
					<c:forEach items="${page.list}" var="vo">
						<li>
							<div>
								<input type="checkbox" name="delete" class="delete"
									style="float: left;" data-listno="${vo.b_no}">
							</div>
							<div style="padding: 0; width: 100%; padding-top: 10px;">
								<a onclick="detail(${vo.b_no})"><img src="img/background/${vo.b_imgpath}"
									style="width: 100%; height: 100%;"></a>
							</div>
							<div style="padding-top: 10px;">
								<a a style="font-weight: bold;" onclick="detail(${vo.b_no})">${vo.b_title}</a>
							</div>
							<div>
								<img src="img/eye.png" style="color: white; width: 15px; padding-bottom: 2px;">${vo.b_readcnt}
								/ <img src="img/heart.png" style="padding-bottom: 2px; font-size: 80%; width: 15px">${vo.b_ddabong}
								&nbsp;&nbsp;&nbsp;${vo.b_writedate}
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/include/page.jsp" />
</div>	

<!-- 검색창 -->
<form method="post" action="mypostlist.moment">
	<input type="hidden" name="curPage" value="1"/>	
	  	<div class="top" style="background-color: black; float:right; ">
			<select row="2" name="search" class="mypageselect" style="font-family: 'Noto Serif KR', serif !important;" >
				<option value="all" ${page.search eq 'all' ? 'selected' : ''} >제목+내용</option>
				<option value="title" ${page.search eq 'title' ? 'selected' : ''}>제목</option>
				<option value="content" ${page.search eq 'content' ? 'selected' : ''}>내용</option>				
			</select>
			<input type="text" id="searchinput" style="color: white;" name='keyword' value="${page.keyword}"/>
			<a class="btn-fill" style="color: #f56437fa;" onclick="$('form').submit()">SEARCH</a>			
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


/* 모두 선택 */
$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".delete").prop("checked", true);
	 } else {
	  $(".delete").prop("checked", false);
	 }
	});

$(".delete").click(function(){
	  $("#allCheck").prop("checked", false);
	 });


/* 선택된 글 삭제 */

	$("#deleteBtn").click(function() {
		if (!$("input[name='delete']:checked").val()) {
			alert('삭제할 글을 선택해주세요')
			return;
		}
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		if (confirm_val) {
			var checkArr = new Array();
			$("input[name='delete']:checked").each(function() {
				checkArr.push($(this).attr('data-listno')); // push : 배열에 값을 추가함
			});

			$.ajax({
				url : 'delete.moment',
				method : 'post',
				data : { 'ckbox' : checkArr },
				success : function() {
					
					history.go(0);	
					
				}
			}); //ajax

		}
	}); //click

 

	/* 그리드 페이지 설정 */
	$('#data-list ul').css('height', 
			( ($('.grid li').length%4>0 ? 1 : 0) + Math.floor($('.grid li').length/5) )
					* $('.grid li').outerHeight(true) - 20 );
	
</script>




</body>
</html>
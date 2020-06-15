<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css?v=<%=new java.util.Date().getTime()%>">
<script type="text/javascript" 	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
</head>
<style>

.top {margin :0; padding-bottom:0;}
.grid li div:nth-child(4) { font-size:80%; height:20px; }
select { width: 200px; color:white; background-color: black;
padding: .4em .2em;
border: 1.5px solid white; border-radius:3px;
-webkit-appearance: none; -moz-appearance: none; appearance: none; 
background: url('img/arrow.png') no-repeat 99% 50%;

	}	
	
option { width: 200px; color:white; background-color: black;}	
input {background-color: black; color:white; border: 1.5px solid white; padding: .4em .5em;
	text-align: center;	
	background-color:#000000;
	border: 1.5px solid white;	border-radius:3px;
	box-shadow: 1px 1px 2px #c0c0c0; 
	color:#ffffff;
	}
	
</style>
<body>

<!-- 임시버튼  -->
<div class="top" style="float:left; padding-top:150px; ">
	<a class="btn-fill" href="mypostlist.moment"> 내글보기 </a>
	<a class="btn-fill" href="myddabong.moment"> 좋아요 </a>
	<a class="btn-fill" href="myfavorite.moment"> 즐겨찾기 </a>
</div>

<div class="contentbody" style="border:soild 1px white;">
	
	<div class="top" style="padding-top:150px;"> 내가 쓴 게시글 : ${page.totalList} 개  </div>	
	<div class="top">	
		<input type="checkbox" id="allCheck" style="float:left;">
		<label for="allCheck" style="float:left;">모두선택</label>
		<div style="padding-bottom:50px;" >
		<a class="btn-fill" id="deleteBtn" style="float:right;">삭제</a>
		<a class="btn-fill" style="float:right;" >글쓰기</a>
		</div>
	</div>
	
	<!-- 게시글 리스트  -->
	<c:if test="${empty page.list}">
		<a style="color:gray;">작성하신 게시글이 없습니다</a>
	</c:if>
	<c:if test="${!empty page.list}">
		<div id="data-list" style="clear:both;" >
			<ul class="grid">	
				<c:forEach items="${page.list}" var="vo">	
						<li>
							<div><input type="checkbox" name="delete" class="delete" style="float:left;" data-listno="${vo.b_no}"></div>					
							<div style="border: 1px soild gray"><a href="mylist_detail.moment?id=${vo.b_no}" ><img src="img/${vo.b_imgpath}" style="width:98%; height:100%;"></a></div>			
							<div><a href="mylist_detail.moment?id=${vo.b_no}">${vo.b_title}</a></div>	
							<div><img src="img/eye.png" style="color:white; width:15px; padding-bottom: 2px;">${vo.b_readcnt} / <img src="img/heart.png" style="padding-bottom: 2px; font-size:80%; width:15px">${vo.b_ddabong}
								&nbsp;&nbsp;&nbsp;${vo.b_writedate}
							</div>
						</li>
				</c:forEach>
			</ul>	
		</div>
	</c:if>
	
<div class='btnSet' class="top">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
</div>	
<form method="post" action="mypostlist.moment">
		<input type="hidden" name="curPage" value="1"/>
	  	<div class="top" style="padding-top: 60px; background-color: black; float:left;">
			<select row="2" name="search" class="w-px80" >
				<option value="all" ${page.search eq 'all' ? 'selected' : ''} >제목+내용    </option>
				<option value="title" ${page.search eq 'title' ? 'selected' : ''}>제목</option>
				<option value="content" ${page.search eq 'content' ? 'selected' : ''}>내용</option>				
			</select>
			<input type="text" name='keyword' class="btn-fill" value="${page.keyword}"/>
			<a class="btn-fill" style="color: yellow;"onclick="$('form').submit()">SEARCH</a>			
		</div>	
	</form> 
</div>
<script type="text/javascript">

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
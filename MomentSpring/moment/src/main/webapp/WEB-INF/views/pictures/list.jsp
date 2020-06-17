<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Suez+One&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');

/* 사진효과 */
@import url(https://fonts.googleapis.com/css?family=Roboto:300,400);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1368 {
  font-family: 'Roboto', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  line-height: 1.4em;
}
figure.snip1368 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease;
  transition: all 0.4s ease;
}
figure.snip1368 img {
  opacity: 1;
  width: 100%;
  vertical-align: top;
}
figure.snip1368 h5 {
  position: absolute;
  top: 0%;
  width: 100%;
  background-color: #212121;
  z-index: 1;
  text-align: right;
  padding: 15px 25px 0px;
  margin: 0;
  font-weight: 300;
  font-size: 1.3em;
  -webkit-transform: translateY(-200%);
  transform: translateY(-200%);
}
figure.snip1368 h5:before {
  position: absolute;
  content: '';
  top: 100%;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 315px 55px 0;
  border-color: transparent #212121 transparent transparent;
}
figure.snip1368 figcaption {
  padding: 5px 25px 15px;
  position: absolute;
  width: 100%;
  z-index: 2;
  bottom: 0%;
  background-color: #141414;
  -webkit-transform: translateY(200%);
  transform: translateY(200%);
}
figure.snip1368 figcaption:before {
  position: absolute;
  content: '';
  bottom: 100%;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 55px 0 0 315px;
  border-color: transparent transparent transparent #141414;
}
figure.snip1368 .icons {
  margin-top: -10px;
  text-align: left;
}
figure.snip1368 i {
  padding: 0px 8px;
  display: inline-block;
  font-size: 24px;
  color: #ffffff;
  text-align: center;
  opacity: 0.7;
}
figure.snip1368 i:hover {
  opacity: 1;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1368:hover h5,
figure.snip1368.hover h5 {
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
figure.snip1368:hover figcaption,
figure.snip1368.hover figcaption {
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
/* 여기까지 */

#footer-wrap { display: none; }
.contentBody { overflow-y: auto; margin-top: 50px; }
#title { width: 100%; height: auto; font-family: 'Suez One', serif; color: white; font-size: 2em; }
#content { width: 100%; height: 850px; color: black; margin: 0 auto -100; background-color: black; }
.pictureBox { display: inline-block; }
.pictures { width: 500px; height: 250px;}
#confirm { margin-top: 30px; border-radius: 5px; color: gray; }

#detail { position:absolute;	width:800px;	height:800px;
				  left:50%;	top:50%;	transform:translate(-50%, -50%);
				  border:3px solid yellow; background-color: black;	display: none;
				  color: yellow; z-index: 4; opacity: 0.9;
}
#detail-background { position:absolute; left:0;	top:0;
										 width:100%;		height:100%; z-index: 3;
										 background-color:#000;	opacity:0.5; display: none;
}
/* 검색창  */
#list-top { width: 80%; padding: 20px 0; padding-left: 10%; }
#list-top ul { margin: 0; display: flex; }
#list-top ul li *{ vertical-align: middle; }
#list-top ul li:not(:first-child){ margin-left: 2px; }

ul { list-style: none; padding: 0; }
#list-top div { width: 100%; height: 32px; }
#list-top ul:first-child { float: left; }
#list-top ul:last-child { float: right; }
#btn { height: 280px;}
.btn-fill { color: white; background-color: black; font-style: italic; font-family: 'Sriracha', cursive; margin-left: 3px; }

select { font-size: 1em; width: 100px; height: 30px; font-family: 'Sriracha', cursive; padding: 0 0 1px 3px; }

.pictureContent { box-sizing: content-box; }
</style>
</head>

<body class="contentBody">

<div id="title">
<h2>POST</h2>
</div>
<div id="list-top">
<form action="list.bo" method="post">
<input type="hidden" name="curPage" value="1" >

	<div>
		<ul>
			<li>
				<select name="search" class="w-px80" style="">
					<option value="all" ${page.search eq 'all' ? 'selected' : '' }>ALL</option>
					<option value="title" ${page.search eq 'title' ? 'selected' : '' }>TITLE</option>
					<option value="content" ${page.search eq 'content' ? 'selected' : '' }>CONTENT</option>
					<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>WRITER</option>
				</select>
			</li>
			<li><input type="text" name="keyword" class="w-px300" value="${page.keyword }" style="font-size: 1em; width: 150px; height: 25px;" ></li>
			<li><a class="btn-fill" onclick="$('form').submit()" style="padding: 6px 10px 6px; line-height: 30px;">SEARCH</a></li>
		</ul>
		<ul>
				<li>
					<select name="viewType" class="w-px80" onchange="$('form').submit();" >
						<option value="lately" ${page.viewType eq 'lately' ? 'selected' : '' } >LATELY</option>
						<option value="ddabong" ${page.viewType eq 'ddabong' ? 'selected' : '' } >RANK</option>
					</select>
				</li>
<%-- 			<c:if test="${ !empty login_info }"> --%>
				<li><a class="btn-fill" href="new.bo">NEW</a></li>
<%-- 			</c:if> --%>
		</ul>
	</div>
	<input type="hidden" name="id" />
</form>
</div>

<div id="content" style="margin: 0 auto;">
	<div id="contentBox">
		<div class="pictureContent">
			<c:forEach items="${page.list}" var="list">
			<div class="pictureBox" onclick="detail(${list.b_no})">
				<figure class="snip1368">
					<img src="background/${list.b_imgpath}" class="pictures" alt="sample30"/>
					<h5 style="font-family: 'Gamja Flower', cursive;">${list.b_title}</h5>
					<figcaption>
			    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>
			      <a href="#"> <i class="ion-social-twitter-outline"></i></a>
			      <a href="#"> <i class="ion-social-vimeo-outline"></i></a>
			    </div>
			  </figcaption>
				</figure>
			</div>
			</c:forEach>
		</div>
	</div>
<div id="btn">
	<a type="button" id="confirm" class="btn-fill">MORE</a>
</div>
</div>



<div id="detail">
	<h3 class="detitle"></h3>
	<div></div>
</div>
<div id="detail-background"></div>

<!-- 포토 스피어 -->
<script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>

<!-- 글라이드 js (슬라이드 이미지) -->
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/glidejs.js"></script>

<script type="text/javascript">
//사진효과 js
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
//더보기 버튼클릭시 이벤트
$('#confirm').on('click', function() {
	console.log('더보기눌림')

	//10개의 사진 img 태그를 감싼 각각의 div 태그 10개를 감싼 하나의 div (pictureContent) 의 마지막 div 
	var lastPC = $('#contentBox').last();
 	lastPC.append('<div class="testDIV" style="color:white; width: 50px; height: 548px;">test</div>');

 	//눌렀을때 새로운값이 들어오면 바디의 높이 값이 더 증가하도록 #content의 높이를 늘려줌
 	var bodyH = $('#content').css('height');
 	var addPCH = lastPC.css('height');
 	console.log(bodyH);
 	console.log(addPCH);
 	bodyH += addPCH;
	$ajax.({
		type:
		
	});	
});

//스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트
window.onscroll = function(){
// 		console.log('js 흐름탐');
		
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

//이미지목록 클릭시 디테일 화면에 띄워주기
function detail(picNo) {
	$('#detail, #detail-background').css('display', 'block');
	console.log('클릭한 이미지 no : ' + picNo );
}

//백그라운드 클릭시 디테일창 사라짐
$('#detail-background').on('click', function(){
	$('#detail, #detail-background').css('display', 'none');
});


var viewer = new PhotoSphereViewer.Viewer({
  container: document.querySelector('#panorama-image'),
  panorama: 'upload/1591952911.3873103_result.jpg'
});



</script>
</body>
</html>
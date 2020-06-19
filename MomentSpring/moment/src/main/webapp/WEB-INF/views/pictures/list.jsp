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

#footer-wrap { display: none; z-index: 3; }
.contentBody { overflow-y: auto; margin-top: 50px; }
#title { width: 100%; height: auto; font-family: 'Suez One', serif; color: white; font-size: 2em; }
#content { width: 100%; height: 850px; color: black; margin: 0 auto -100; background-color: black; }
#contentBox { margin-bottom: 200px; }
.pictureBox { display: inline-block; }
.pictures { width: 500px; height: 250px; border-radius: 10px; }
#confirm { margin-top: 30px; border-radius: 5px; color: gray; }

/* 디테일 창 css처리 */
#detail { position:absolute;	width:800px;	height:800px; display: none;
				  left:50%;	top:50%;	transform:translate(-50%, -50%);
				  border:3px solid white; border-radius: 10px; background-color: #fc7703;	
				  color: #fc7703; z-index: 4; margin-top: 470px; overflow: auto;
}
#detail::-webkit-scrollbar-thumb { background-color: white; }
#detail::-webkit-scrollbar-track { background-color: gray; }
.detitleBox { width: 100%; height: 60px; background-color: #dd552bfa; padding-top: 30px; }
.detitle { font-weight: bold; font-size: 2em; font-family: 'Gamja Flower', cursive; color: white; margin: 0; }
.deimg { width: 100%; height: 500px; border: 0px; }

.decontent { padding: 10px; box-sizing: content-box; overflow: hidden; border-bottom: 5px solid #dd552bfa; }
.deprofileBox { width: 50px; height: 50px; float: left; margin-right: 10px; }
.deprofile { width: 50px; height: 50px; border-radius: 50px; float: left; background-color: white; }
.denick { float: left; color: white; width: 700px; height: 25px; text-align: left; padding-left: 3px; font-size: 1.2em; font-weight: bold; font-family: 'Gamja Flower', cursive; }
.delocation { float: left; color: white; width: 700px; height: 25px; text-align: left; padding-left: 3px; font-size: 0.9em; font-weight: bold;  font-family: 'Gamja Flower', cursive; }
.decoment { width: 100%; height: inherit; color: white; font-family: 'Gamja Flower', cursive; padding: 5px; font-size: 1.4em; text-align: left; padding-left: 60px; float: left; }
.decntBox { box-sizing: content-box; float: right; font-size: 14px; vertical-align: text-bottom; font-size: 25px; }
.cnt { width: 25px; height: 25px; margin-bottom: 8px; }
.like { width: 25px; height: 25px; margin-bottom: 6px; }
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
#selectBox { border: 1px solid white; border-radius: 5px; }
#keyBox { border: 1px solid white; border-radius: 5px; }


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
				<select id="selectBox" name="search" class="w-px80" style="">
					<option value="all" ${page.search eq 'all' ? 'selected' : '' }>ALL</option>
					<option value="title" ${page.search eq 'title' ? 'selected' : '' }>TITLE</option>
					<option value="coment" ${page.search eq 'coment' ? 'selected' : '' }>CONTENT</option>
					<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>WRITER</option>
				</select>
			</li>
			<li><input id="keyBox" type="text" name="keyword" class="w-px300" value="${page.keyword }" style="font-size: 1em; width: 150px; height: 25px;" ></li>
			<li><a class="btn-fill" onclick="$('form').submit()" style="padding: 6px 10px 6px; line-height: 30px;">SEARCH</a></li>
		</ul>
		<ul>
				<li>
					<select id="selectBox" name="viewType" class="w-px80" onchange="$('form').submit();" >
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
	
		<!-- pictureContent가 10개 사진 div 한묶음 -->
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
		<!-- 여기부분에 스크롤or버튼클릭시 다음페이지 출력. -->
	</div>
</div>



<div id="detail">
	<div class="detitleBox">
		<h3 class="detitle"></h3>
	</div>
</div>
<div id="detail-background"></div>

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

//스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트
window.onscroll = function(){
// 		console.log('js 흐름탐');
		
		var scroll = window.scrollY + $(window).height();
		var endY = document.body.scrollHeight + 30;
// 		console.log(scroll);
// 		console.log(endY);
		
		//content 영역의 최상위 위치 값
		var scrollTop = $(this).scrollTop();
		//content 영역의 (패딩영역합산한) content의 높이
		var innerHeight = $(this).innerHeight();
		
		
		//스크롤이 컨텐트아래 50 hegiht 를 넘어서면 이벤트 시작
		if (scroll > endY) {
			$("#confirm").css('color', 'white');
			$("#footer-wrap").slideDown();
			//10개의 사진 img 태그를 감싼 각각의 div 태그 10개를 감싼 하나의 div (pictureContent) 의 마지막 div 
			var lastPC = $('#contentBox').last();
			
		 	$.ajax({
		 	 	url: 'more.bo',
		 	 	type: 'post',
		 	 	data: { curPage: parseInt($('[name=curPage]').val()) },
		 	 	success: function(data){
		 	 	 	console.log('ajax success');
		 	 		var tag = '<div class="pictureContent">';
		 			$.each(data, function(key, value){
			 			if(data != null) {
			 	 				tag += '<div class="pictureBox" onclick="detail('+ value.b_no +')">';
			 	 					tag += '<figure class="snip1368">';
			 	 						tag += '<img src="background/'+ value.b_imgpath +'" class="pictures" alt="sample30"/>';
				 	 					tag	+= '<h5 style=&#39;font-family: "Gamja Flower", cursive;&#39;>'+ value.b_title +'</h5>';
				 	 					tag	+= '<figcaption>';
				 	 						tag += '<div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>';
				 	 							tag += '<a href="#"> <i class="ion-social-twitter-outline"></i></a>';
				 	 							tag += '<a href="#"> <i class="ion-social-vimeo-outline"></i></a>';
				 	 						tag += '</div>';
				 	 					tag += '</figcaption>';
			 	 					tag += '</figure>';
								tag += '</div>';
							console.log(value);
			 			} else {
				 			alert("마지막페이지입니다.");
			 			}
		 			});
		 					tag += '</div>';
		 	 				lastPC.append(tag);
		 	 	}, error: function(req, text){
		 	 	 	console.log('ajax fail');
				}
		 	});

		 	//눌렀을때 새로운값이 들어오면 바디의 높이 값이 더 증가하도록 #content의 높이를 늘려줌
		 	var bodyH = $('#content').css('height');
		 	var addPCH = lastPC.css('height');
		 	console.log(bodyH);
		 	console.log(addPCH);
		 	bodyH += addPCH;
		} else {
		 	$("#confirm").css('color', 'gray');
		 	$("#footer-wrap").slideUp();
		}
};

//이미지목록 클릭시 디테일 화면에 띄워주기
function detail(picNo) {
	//다시 눌렀을때 기존 요소들 삭제
	$('img.deimg').remove();
	$('div.decontent').remove();

	//스크롤 위치 확인해서 디테일창 떴을때 스크롤 고정
	var scroll = window.scrollY || document.documentElement.scrollTop;
	$('#detail, #detail-background').css('display', 'block');
	$('#detail, #detail-background').css('top', scroll );
	$('body').css('overflow-y','hidden');
	$('body').css('overflow-x','hidden');

	var place = $('#detail').last(); //detail div 안의 타이틀 아래부분에 tag append 됨
	console.log('클릭한 이미지 no : ' + picNo );
	$.ajax({
		url: 'detail.bo',
		type: 'post',
		data: { 'no' : picNo },
		success: function(data){
			$('.detitle').html(data.b_title);
			var tag = '<img class="deimg" src="background/'+ data.b_imgpath +'"/>';	//게시물사진
			
					tag +='<div class="decontent">';																		//게시물 내용담는 div
						tag +='<div class="deprofileBox">';																	//게시물 프로필사진 div
						tag +='<img class="deprofile" src="background/logo2.png"/>';				//게시자 프로필사진
						tag +='</div>';
						tag +='<div class="denick">'+ data.b_nick													
								+ '<div class="decntBox"><img class="cnt" src="icons/like.png"/>&nbsp;'+ data.b_ddabong + '&nbsp;&nbsp;&nbsp;&nbsp;<img class="like" src="icons/cnt.png"/>&nbsp;'+ data.b_readcnt +'</div></div>';  		//닉네임+조회수+추천수					 
						tag +='<div class="delocation" onclick="go_map('+data.b_local+')">'+ data.b_local +'</div>';						//게시물 위치정보
						tag +='<div class="decoment">'+ data.b_coment +'</div>';
							
						tag +='<div class="test" style="height: 500px;"></div>';
					tag +='</div>';
			place.append(tag);
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
}

//백그라운드 클릭시 디테일창 사라짐
$('#detail-background').on('click', function(){
	$('#detail, #detail-background').css('display', 'none');
	$('body').css('overflow-y','scroll');
});


var viewer = new PhotoSphereViewer.Viewer({
  container: document.querySelector('#panorama-image'),
  panorama: 'upload/1591952911.3873103_result.jpg'
});



</script>
</body>
</html>
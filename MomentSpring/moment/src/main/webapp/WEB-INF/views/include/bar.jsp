<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#bar-wrap{
	position: fixed;
	top: 0;
	width: 100%; height: 100%; background-color: #00000060;
	display: none;
	z-index: 21;
}
#bar-content {
	position: absolute;
	top: 0; right: -500px; z-index: 22;
	color: white;
	width: 500px; height: 100%; background-color: #1b1b1b;
	display: none;
}
.bar-menu { float: left; margin: 30px 0 0 30px; }
.bar-menu li { font-size: 22px; margin-top: 10px; text-align: left; }
.bar-menu li a { color: white; } 
.bar-user { margin: 20px 0 20px 20px; width: 480px; height: 100px; }
.bar-profile { 
	width: 100px; height: 100px; border: 2px solid #2f2f2f;
	border-radius: 50px; float: left;
	background-color: white; 
}
.bar-close{
	height: 40px;
	font-size: 40px;
	margin-bottom: 30px;
	text-align: left;
}
.bar-login { float: left; margin: 40px 0 0 20px; } 
.fa-caret-square-left:hover{ color: yellow; }


</style>
<div id="bar-wrap"></div>
	<div id="bar-content">
		<div class="bar-close">
			<a class="bar-close-btn">
				&nbsp;<i class="fas fa-caret-square-left"></i>
			</a>
		</div>
		<div class="bar-user">
			<div class="bar-profile">
				<c:if test="${empty login_info }">
					<p style="color: black; text-align: center; margin-top: 40px; ">회원정보 없음</p>
				</c:if>
			</div>
			<div class="bar-login">
				<c:if test="${empty login_info }">
					<a class="btn-fill" href='loginuser'>로그인</a>
					<a class="btn-empty" href='joinuser'>회원가입</a>
				</c:if>
			</div>
		</div>
		<ul class="bar-menu">
			<li><a href='<c:url value="/" />' >HOME</a></li>
			<li><a>사진</a></li>
			<li><a>파노라마 사진</a></li>
			<li><a>문의하기</a></li>
			<li><a>지도로 보기</a></li>
			<li><a href='room'>채팅</a></li>
		</ul>
	</div>
<script>
	$('#bar-button').on('click', function(){
		var scroll = window.scrollY || document.documentElement.scrollTop;
		$('#bar-wrap').css('display','block');
		$('#bar-content').css('display','block');
		$('#bar-content').css('top', scroll );
		$('#bar-content').show().animate({right: 0}, "slow");
		//스크롤바 제거
		$('body').css('overflow-y','hidden');
		$('body').css('overflow-x','hidden');
	});
	
	$('#bar-wrap, .bar-close-btn').on('click', function(){
		$('#bar-content').show().animate({right: -500}, "fast", function(){
			$(this).css('display','none');
		});
		$('#bar-wrap').css('display','none');
		//스크롤바 생성
		$('body').css('overflow-y','scroll');
	});
</script>
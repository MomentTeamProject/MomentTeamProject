<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<style>
	#wrap { position: fixed; width: 100%; background-color: black; height: 50px; line-height: 45px; top:0;  z-index: 20;}
	#header-top { 
		height: 50px; background-color: black; width: 70%;
		position: absolute; margin: 0 auto; left: 15%; top:0;
	}
	#header-menu { float: right; padding: 0; margin: 0;  overflow: hidden; }
	#header-menu li{ 
		list-style: none; display:inline-block; vertical-align:middle;
	}
	#header-menu li { color: yellow; }
	#header-menu li a { color: white; padding: 5px 17px; font-size: 17px; }
	#header-menu li a:hover, #header-top li a.active { color: yellow; cursor: pointer; }
	#header-home-image { float: left; }
	#header-home-image img { width: 50px; height: 50px;  }
</style>
<div id="wrap">
	<div id="header-top" class="category">
		<div id="header-home-image"><a href='<c:url value="/" />'><img src="background/logo1.jpg" alt="홈으로" /></a></div>
		<ul id="header-menu">
			<li><a href='<c:url value="/" />' class="${category eq 'home' ? 'active' : '' }">HOME</a>│</li>
			<li><a href="list.bo" class="${category eq 'bo' ? 'active' : '' }">사진</a>│</li>
			<li><a href="list.pa" class="${category eq 'pa' ? 'active' : '' }">파노라마 사진</a>│</li>
			<li><a href="list.qa" class="${category eq 'qa' ? 'active' : '' }">문의하기</a>│</li>
			<li><a href="list.map" class="${category eq 'qa' ? 'active' : '' }">지도로 보기</a>│</li>
			<li><a href="room" class="${category eq 'vr' ? 'active' : '' }">채팅</a>│</li>
			<li><a id="bar-button" style="font-size: 25px; color: yellow;"><i class="fas fa-bars"></i></a></li>
		</ul>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<style type="text/css">
* { margin: 0; padding: 0; border: 0; }
	body {
		margin: 100px auto;
		text-align: center;
	}
	#content { width: 1024px; }
	#card-view{ width:80%; margin: 30px auto; }
	#card-view li{ float: left; }
	#card-view ul li { width: 50%; height: 400px; }
	#card-view ul li img{ width: 100%; height: 100%; }
	
.slider {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.slider__wrapper {
  height: 100%;
  list-style: none;
  overflow: hidden;
  *zoom: 1;
  -webkit-backface-visibility: hidden;
  -webkit-transform-style: preserve-3d;
}
.slider__item {
  height: 100%;
  float: left;
  clear: none;
}
.slider__arrows-item {
  position: absolute;
  display: block;
  margin-bottom: -20px;
  padding: 20px;
}
.slider__arrows-item--right {
  bottom: 50%;
  right: 30px;
}
.slider__arrows-item--left {
  bottom: 50%;
  left: 30px;
}
.slider__nav {
  position: absolute;
  bottom: 30px;
}
.slider__nav-item {
  width: 12px;
  height: 12px;
  float: left;
  clear: none;
  display: block;
  margin: 0 5px;
  background: #fff;
}
.slider__nav-item--current {
  background: #ccc;
}
.slider__nav-item:hover { 
  background: #ccc;
}
.box img{ width: 1024px; height: 575px;}

#card-view { width: 1024px; height: 900px;  margin: 0px; }
.card-view-img { width: 510.5px; height: 300px; float: left; }
.card-view-img:nth-child(5) { width: 1024px; height: 300px; }
.card-view-img:nth-child(1), .card-view-img:nth-child(3) { margin-right: 3px; }
.card-view-img:nth-child(1), .card-view-img:nth-child(2),
					 .card-view-img:nth-child(3), .card-view-img:nth-child(4) { margin-bottom: 3px; }
.card-view-img img{ width: 100%; height: 100%; }

 #panorama-image {
    width: 1024px;
    height: 30vh;
  }
	
</style>

	<link rel="stylesheet" type="text/css" href="css/home_banner.css" />
	<!-- 글라이드 js (슬라이드 이미지) -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
	<!-- 포토스피어 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
</head>
<body>
<div id="content">
	<h3 class="left" style="margin-top: 100px" >인기 글 TOP5</h3>
	<div id="main-image-view">
		<div class="slider">
		  <ul class="slider__wrapper">
		    <li class="slider__item" ><div class="box" ><img src="img/test1.png" /></div></li>
		    <li class="slider__item" ><div class="box" ><img src="img/test2.png" /></div></li>
		    <li class="slider__item" ><div class="box" ><img src="img/test3.png" /></div></li>
		    <li class="slider__item" ><div class="box" ><img src="img/test4.png" /></div></li>
		    <li class="slider__item" ><div class="box" ><img src="img/test5.png" /></div></li>
		  </ul>
		</div> 
	</div>
	<h3 class="left" style="margin-top: 50px">PHOTO SPHERE</h3>
	<div id="panorama-image">
	
	</div>
	<h3 class="left" style="margin-top: 50px">최신 글</h3>
	<div id="card-view">
		<div class="card-view-img"><img src="img/test1.png" /></div>
		<div class="card-view-img"><img src="img/test2.png" /></div>
		<div class="card-view-img"><img src="img/test3.png" /></div>
		<div class="card-view-img"><img src="img/test4.png" /></div>
		<div class="card-view-img"><img src="img/test5.png" /></div>
	</div>
</div>


<!-- 포토 스피어 -->
<script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>

<!-- 글라이드 js (슬라이드 이미지) -->
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/glidejs.js"></script>
<script type="text/javascript">
var viewer = new PhotoSphereViewer.Viewer({
  container: document.querySelector('#panorama-image'),
  panorama: 'upload/capture_1591253769.5138812_rev.jpg'
});



</script>
</body>
</html>

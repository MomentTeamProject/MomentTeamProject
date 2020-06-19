<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#footer-wrap { display: none; z-index: 3; }
.contentBody { overflow-y: auto; margin-top: 50px; }
#title { width: 100%; height: auto; font-family: 'Suez One', serif; color: white; font-size: 2em; margin-top: 100px; }

#panorama-image { width: 80%; height: 60vh; margin: 0 auto; border: 5px solid #fc7703; }
.psv-navbar, .psv-navbar * { margin: 0 auto; }
</style>

<!-- 포토스피어 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
</head>
<body class="contentBody">

<div id="title"><h2> PANORAMA  360  VIEW </h2></div>

<div id="panorama-image">
	<!-- 포토스피어 뷰 들어오는 공간 -->
</div>




<!-- 포토 스피어 -->
<script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>

<script type="text/javascript">
var viewer = new PhotoSphereViewer.Viewer({
	  container: document.querySelector('#panorama-image'),
	  panorama: 'upload/0619test.jpg'
});
</script>
</body>
</html>
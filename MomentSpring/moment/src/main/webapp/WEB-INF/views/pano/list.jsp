<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/pano_bottom.css">

<style type="text/css">

#footer-wrap { display: none; z-index: 3; }
.contentBody { overflow-y: auto; margin-top: 50px; }
#title { width: 100%; height: auto; font-family: 'Suez One', serif; color: white; font-size: 2em; margin-top: 100px; }

#panorama-image { width: 80%; height: 60vh; margin: 0 auto; border: 5px solid #fc7703; }
.psv-navbar, .psv-navbar * { margin: 0 auto; }

body {
  padding: 0;
  box-sizing: border-box;
  font-family: Nunito;
}
.container {
  width: 80%;
  margin: 0 auto;
}
.carousel {
  max-width: 600px;
  margin: 0 auto;
}

img {
  max-width: 100%;
  display: block;
  padding: .5em;
}
.example-box {
  margin: 50px auto;
  /* box-shadow: 0 2px 5px rgba(0,0,0,.4); */
  padding: 1em;
  border-radius: 12px;
  border: 1px solid #DFDFDF;
}
.example-box h2 {
  margin: 0 0 20px !important;
}
.box {
  font-family: Arial, Helvetica, sans-serif;
  height: 150px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: linear-gradient(to bottom right, #2193b0, #6dd5ed);
  border: 3px solid #FFF;
  border-radius: 8px;
  color: #FFF;
  font-size: 26px;
}
.text-center {
  text-align: center;
}    
</style>

<!-- 포토스피어 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
</head>
<body class="contentBody">
<form action="panolist.pa" method="post">
<input type="hidden" name="curPage" value="1" >
</form>
<div id="title"><h2> PANORAMA  360  VIEW </h2></div>

<div id="panorama-image">
	<!-- 포토스피어 뷰 들어오는 공간 -->
</div>
<div class="container">
  <!-- MULTIPLE ITEMS -->
  <div class="example-box">
    <div class="carousel-multiple-items">
<%--     <c:forEach items="${ }" var="vo"> --%>
<!--       <div> -->
<!--         <div class="box">1</div> -->
<!--       </div> -->
<%--     </c:forEach> --%>
    </div>
  </div>
</div>



<!-- 포토 스피어 -->
<script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>

<script src="js/pano_bottom.js"></script>

<script type="text/javascript">

var viewer = new PhotoSphereViewer.Viewer({
	  container: document.querySelector('#panorama-image'),
	  panorama: 'upload/0619test.jpg'
});

new ElderCarousel('.carousel-multiple-items', { items: 8 });

</script>
</body>
</html>
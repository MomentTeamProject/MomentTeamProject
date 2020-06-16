<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300&display=swap');
body{ margin: 0 auto; }
#footer-wrap {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100px;
	background-color: #151515;
	margin-top: 30px;
	padding: 25px 0 60px 0;
	font-family: 'Dosis', sans-serif;
}
.footer-menu-box {
	max-width: 600px;
	width: 100%;
	margin: 0 auto;
	height: 250px;
}
.footer-menu li{
	float: left;
	padding: 0 20px;
	color: #b5b1b1 !important;
}
.footer-menu li a{
	color: #b5b1b1 !important;
}
.footer-menu li a:hover { color: #fc7703; cursor: pointer; }
.footer-menu2 { width: 100%; height: 30px; }
.push { height: 50px; }
</style>
<div class="push"></div>
<footer id="footer-wrap">
		<div class="footer-menu-box">
			<div class="footer-menu2">
				<ul class="footer-menu">
					<li><a href="">POST</a></li>
					<li><a href="">PANORAMA</a></li>
					<li><a href="#" >VR</a></li>
					<li><a href="#" >QnA</a></li>
					<li><a href="#" >MAP</a></li>
				</ul>
			</div>
			<div class="footer-menu2">
				<ul class="footer-menu">
					<li>test1</li>
					<li>test2</li>
				</ul>
			</div>
		</div>
</footer>

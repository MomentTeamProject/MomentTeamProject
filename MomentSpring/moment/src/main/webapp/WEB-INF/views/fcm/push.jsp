<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width:500px;
	height: 650px;
	margin: 50px auto;
	background-color: white;
	border-radius: 5px;
	color: black;
	
}
.topiclist {
	border: 1px solid #ffBB00;
}
.topictitle {
	width: 80px;
}
.topicbody {
	width: 200px;
}
#sendBtn{
 text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 60px;
  border: 0;
  border-radius:3px;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
#sendBtn:hover,#sendBtn:active,#sendBtn:focus {
  background: #43A047;
}
#sendBtn:hover{
  background-color: #4CAF50;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  border-radius:3px;
  color: #fff;
  transform: translateY(-7px);
  font-weight: bold;
}
.fcm {
width: 650px;
  padding: 7% 0 0;
  margin: auto;
  
}
.pushbox{
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 650px;
  width:100%;
  margin: 20px auto 70px;
  color: black;
  padding: 10px;
  text-align: center;
}

</style>
</head>
<body>
<div class="fcm">
<h3>푸시 보내기</h3>
	<table class="pushbox">
	
	<tr><th style="width:50px;">지역</th><th style="width:80px;">제목</th><th style="width:300px;">내용</th><th>전송</th></tr>
	<tr>
		<td>광주</td>
		<td><input type="text" class="topictitle" id="gwangju_title" value="광주 알림" /></td>
		<td><input type="text" class="topicbody" id="gwangju_body" name="content" /></td>	
		<td><button onclick="gwangjufcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>서울</td>
		<td><input type="text" class="topictitle" id="seoul_title" value="서울 알림"/></td>
		<td><input type="text" class="topicbody" id="seoul_body" name="content" /></td>	
		<td><button onclick="seoulfcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>부산</td>
		<td><input type="text" class="topictitle" id="busan_title" value="부산 알림"/></td>
		<td><input type="text" class="topicbody" id="busan_body" name="content" /></td>	
		<td><button onclick="busanfcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>경기</td>
		<td><input type="text" class="topictitle" id="kyungki_title" value="경기도 알림"/></td>
		<td><input type="text" class="topicbody" id="kyungki_body" name="content" /></td>	
		<td><button onclick="kyungkifcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>강원</td>
		<td><input type="text" class="topictitle" id="kangwon_title" value="강원도 알림"/></td>
		<td><input type="text" class="topicbody" id="kangwon_body" name="content" /></td>	
		<td><button onclick="kangwonfcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>충청</td>
		<td><input type="text" class="topictitle" id="chungchung_title" value="충청도 알림"/></td>
		<td><input type="text" class="topicbody" id="chungchung_body" name="content" /></td>	
		<td><button onclick="chungchungfcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>전라</td>
		<td><input type="text" class="topictitle" id="junra_title" value="전라도 알림"/></td>
		<td><input type="text" class="topicbody" id="junra_body" name="content" /></td>	
		<td><button onclick="junrafcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>경상</td>
		<td><input type="text" class="topictitle" id="kyungsang_title" value="경상도 알림"/></td>
		<td><input type="text" class="topicbody" id="kyungsang_body" name="content" /></td>	
		<td><button onclick="kyungsangfcm()" id="sendBtn">전송</button></td>
	</tr>
	<tr class="topiclist">
		<td>제주</td>
		<td><input type="text" class="topictitle" id="jeju_title" value="제주도 알림"/></td>
		<td><input type="text" class="topicbody" id="jeju_body" name="content" /></td>	
		<td><button onclick="jejufcm()" id="sendBtn">전송</button></td>
	</tr>

</table>
</div>
<script type="text/javascript" src="js/fcmtest.js"></script>
</body>
</html>
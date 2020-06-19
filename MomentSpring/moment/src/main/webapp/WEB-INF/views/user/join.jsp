<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table td {
	text-align: left;
}

.valid, .invalid {
	font-size: 13px;
	font-weight: bold;
}

.valid {
	color: green
}

.invalid {
	color: red
}


</style>
<link rel="stylesheet" href="css/join.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	
</script>

</head>
<body>
<div class="join_page">
	<div class="form">
	<h1 style="font-weight: bolder">회원가입</h1>
	<p 	style="margin: 0 auto; font-size: 13px; padding-bottom: 5px; float:right;">
	*은	필수 입력 항목 입니다.</p>

	<form action="userjoin" method="post"  enctype="multipart/form-data" >
		<table class='joinbox'>
			<tr><th>프로필</th>
		<td class='td-img left'>
				<input type="file" name='file' id="u_profileimg" size="20"/>
			<label>
				<img src='img/ps.png' class='file-img' style="width:70px; height:70px;" />
			<span id='preview'></span>
			<span id='file-name' ></span>
			<span id='delete-file' style='color:red; margin-left: 20px'><i class='fas fa-times font-img'></i></span>
			</label>
		</td>
		</tr>
			<tr>
				<th class="w-px160">*성명</th>
				<td><input type="text" name="u_name" size="20"/></td>
			</tr>
			<tr>
				<th class="w-px160">*닉네임</th>
				<td><input type="text" name="u_nick" class="chk" size="20"/>
				 <a class="check_btn"	id="btn_nick">중복확인</a><br>
					<div class="valid">닉네임을 입력하세요</div></td>
			</tr>
			<tr>
				<th>* 아이디</th>
				<td><input type="text" name="u_userid" class="chk"
					placeholder="abc1234@abcd.com" /> 
					<a class="check_btn" id="btn_id">중복확인</a>
					<div class="valid">아이디를 입력하세요(사용하는 이메일 형식으로 입력하세요)</div></td>
			</tr>
			<tr>
				<th>* 비밀번호</th>
				<td><input type="password" name="u_userpw" class="chk" size="20"/>
					<div class="valid">비밀번호를 입력하세요(영문대/소문자, 숫자를 모두 포함)</div></td>
			</tr>
			<tr>
				<th>* 비밀번호확인</th>
				<td><input type="password" name="u_userpw_ck" class="chk" size="20"/>
					<div class="valid">비밀번호를 다시 입력하세요.</div></td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
		<a id='login_btn' onclick="gojoin()">회원가입</a> 
		<a class="btn-empty"
			onclick="history.go(-1)">취 소</a>
	</div>
	</div>
</div>
<script type="text/javascript" src="js/image_preview.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/check_join_1.js"></script>
	<script type="text/javascript">
	window.onkeydown = function()	{
		if(event.keyCode == 13){
			gojoin();
		}
	};
		function gojoin() {
			if ($('[name=u_name]').val() == '') {
				alert('성명을 입력하세요!');
				$('[name=u_name]').focus();
				return;
			}
			//중복확인 여부에 따라 
			if($('[name=u_userid]').hasClass('chked')){
				if($('[name=u_userid]').siblings('div').hasClass('invalid')){
						alert('회원가입 불가 \n ' + join.u_userid.unusable.desc);
						$('[name=u_userid]').focus();
						return;
					}
			}else{
				if(!item_check($('[name=u_userid]') ) ) return;
				else {
					alert('회원가입 불가 \n ' + join.u_userid.valid.desc);
					$('[name=u_userid]').focus();
					return;
				}
			}
			if($('[name=u_nick]').hasClass('chked')){
				if($('[name=u_nick]').siblings('div').hasClass('invalid')){
						alert('회원가입 불가 \n ' + join.u_nick.unusable.desc);
						$('[name=u_nick]').focus();
						return;
					}
			}else{
				if(!item_check($('[name=u_nick]') ) ) return;
				else {
					alert('회원가입 불가 \n ' + join.u_nick.valid.desc);
					$('[name=u_nick]').focus();
					return;
				}
			}

			
			if(!item_check($('[name=u_userpw]') ) ) return;
			if(!item_check($('[name=u_userpw_ck]') ) ) return;
			
			$('form').submit();
			
			
		}//gojoin

		function item_check(item){
			var data = join.tag_status(item);
			if(data.code =='invalid'){
				alert('회원가입 불가\n' + data.desc);
				item.focus();
				return false;
			}else return true;
		}
		
			$('#btn_nick').on('click', function() {
				nick_check();
			});

			function nick_check() {
				var $u_nick = $('[name=u_nick]');
				var data = join.tag_status($u_nick);
				if(data.code != 'valid'){
					alert('닉네임 확인 불필요 \n' + data.desc);
					$u_nick.focus();
					return;
				}
			$.ajax({
				type:'post',
				url: 'usernick_check',
				data: {u_nick: $u_nick.val()},
				success: function(data){
					data = join.nick_usable(data);
					display_status( $u_nick.siblings('div'), data);//상태를 표현
					$u_nick.addClass('chked');
				},error: function(req, text){
					alert(text+":"+req.status);
					}
				});
			}

			/* 아이디 중복체크 */
			$('#btn_id').on('click', function(){
				id_check();
			});
			function id_check(){
				var $u_userid = $('[name=u_userid]');
				var data = join.tag_status($u_userid);
				if(data.code != 'valid'){
					alert('아이디 중복확인 불필요 \n' + data.desc );
					$u_userid.focus();
					return;
				}
				$.ajax({
					type: 'post',
					url: 'userid_check',
					data: { u_userid: $u_userid.val()},
					success: function(data){
						data = join.id_usable(data);
						display_status( $u_userid.siblings('div'), data);//상태를 표현
						$u_userid.addClass('chked');
					},error: function(req, text){
						alert(text+":"+req.status);
					}
					
				});
				
			}
// 			유효성 검사
			$('.chk').on('keyup', function(){
				if($(this).attr('name')=='u_nick'){
						$(this).removeClass('chked');
						validate($(this));
					
				}else validate($(this));
				
				validate($(this));
			});

			/* 유효성판단할 함수선언 */
			function validate( t ){
				var data = join.tag_status( t );
				display_status( t.siblings('div'), data);
			}
			function display_status(div, data){
				div.text(data.desc);
				div.removeClass('valid invalid');
				div.addClass(data.code );
			}


// 			$('#footer-wrap').css('display', 'none');
		
	</script>


</body>
</html>
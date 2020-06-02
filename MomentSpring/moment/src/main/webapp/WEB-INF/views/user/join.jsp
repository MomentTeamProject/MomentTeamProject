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
	color: yellow
}

.invalid {
	color: red
}


</style>
<link rel="stylesheet" href="css/login.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	
</script>

</head>
<body>

	<h3>회원가입</h3>
	<p class="w-pct60 right"
		style="margin: 0 auto; font-size: 13px; padding-bottom: 5px;">*은
		필수 입력 항목 입니다.</p>

	<form action="userjoin" method="post">
		<table class="w-pct60">
			<tr><th>프로필 사진</th>
				<td>
				<label>
					<img src="img/ps.png" class="ps-img" style="width:50px; height:50px;"/>
					<input type="file" name="file" id="attach-file"/>
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color:red;"></span>
				</td>
			</tr>
			<tr>
				<th class="w-px160">*성명</th>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<th class="w-px160">*닉네임</th>
				<td><input type="text" name="usernick u" class="chk"/> <a class="btn-fill-s"
					id="btn_nick">중복확인</a><br>
					<div class="valid">닉네임을 입력하세요</div></td>
			</tr>
			<tr>
				<th>* 아이디</th>
				<td><input type="text" name="userid p" class="chk"
					placeholder="abc1234@abcd.com" /> <a class="btn-fill-s" id="btn_id">중복확인</a><br>
					<div class="valid">아이디를 입력하세요(사용하는 이메일 형식으로 입력하세요)</div></td>
			</tr>
			<tr>
				<th>* 비밀번호</th>
				<td><input type="password" name="userpw" class="chk" />
					<div class="valid">비밀번호를 입력하세요(영문대/소문자, 숫자를 모두 포함)</div></td>
			</tr>
			<tr>
				<th>* 비밀번호확인</th>
				<td><input type="password" name="userpw_ck" class="chk" />
					<div class="valid">비밀번호를 다시 입력하세요.</div></td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="gojoin()">회원가입</a> <a class="btn-empty"
			onclick="history.go(-1)">취소</a>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/check_join.js"></script>
	<script type="text/javascript">
		function gojoin() {
			if ($('[name=username]').val() == '') {
				alert('성명을 입력하세요!');
				$('[name=username]').focus();
				return;
			}
			//중복확인 여부에 따라 
			if($('[name=userid]').hasClass('chked')){
				if($('[name=userid]').siblings('div').hasClass('invalid')){
						alert('회원가입 불가 \n ' + join.userid.unusable.desc);
						$('[name=userid]').focus();
						return;
					}
			}else{
				if(!item_check($('[name=userid]') ) ) return;
				else {
					alert('회원가입 불가 \n ' + join.userid.valid.desc);
					$('[name=userid]').focus();
					return;
				}
			}
			if($('[name=usernick]').hasClass('chked')){
				if($('[name=usernick]').siblings('div').hasClass('invalid')){
						alert('회원가입 불가 \n ' + join.usernick.unusable.desc);
						$('[name=usernick]').focus();
						return;
					}
			}else{
				if(!item_check($('[name=usernick]') ) ) return;
				else {
					alert('회원가입 불가 \n ' + join.usernick.valid.desc);
					$('[name=usernick]').focus();
					return;
				}
			}

			
			if(!item_check($('[name=userpw]') ) ) return;
			if(!item_check($('[name=userpw_ck]') ) ) return;
			
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
				var $usernick = $('[name=usernick]');
				var data = join.tag_status($usernick);
				if(data.code != 'valid'){
					alert('닉네임 확인 불필요 \n' + data.desc);
					$usernick.focus();
					return;
				}
			$.ajax({
				type:'post',
				url: 'usernick_check',
				data: {usernick: $usernick.val()},
				success: function(data){
					data = join.nick_usable(data);
					display_status( $usernick.siblings('div'), data);//상태를 표현
					$usernick.addClass('chked');
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
				var $userid = $('[name=userid]');
				var data = join.tag_status($userid);
				if(data.code != 'valid'){
					alert('아이디 중복확인 불필요 \n' + data.desc );
					$userid.focus();
					return;
				}
				$.ajax({
					type: 'post',
					url: 'userid_check',
					data: { userid: $userid.val()},
					success: function(data){
						data = join.id_usable(data);
						display_status( $userid.siblings('div'), data);//상태를 표현
						$userid.addClass('chked');
					},error: function(req, text){
						alert(text+":"+req.status);
					}
					
				});
				
			}
// 			유효성 검사
			$('.chk').on('keyup', function(){
				if($(this).attr('name')=='usernick'){
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


			
		
	</script>


</body>
</html>
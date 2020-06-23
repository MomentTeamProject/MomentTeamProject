//이미지목록 클릭시 디테일 화면에 띄워주기
function detail(picNo, userid) {
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
	console.log('클릭한 이미지 no : ' + picNo);
	console.log('클릭한 사용자 id : ' + userid);
	$.ajax({
		url: 'detail.bo',
		type: 'post',
		data: { 'no' : picNo, 'userid' : userid },
		success: function(data){
			$('.detitle').html(data.b_title);
			var tag = '<img class="deimg" src="background/'+ data.b_imgpath +'"/>';	//게시물사진
					tag +='<div class="decontent">';																		//게시물 내용담는 div
						tag +='<div class="deprofileBox">';																	//게시물 프로필사진 div
						tag +='<img class="deprofile" src="background/ <c:if test"!empty '+ data.b_profileimg +' ? '+ data.b_profileimg +' : logo2.png"/> "/>';										//게시자 프로필사진
						tag +='</div>';
						tag +='<div class="denick">'+ data.b_nick
								+ '<div class="decntBox">'
								+ '<img class="like" src="icons/like.png" onclick="ddabong(' + data.b_no + ',\'' + userid + '\',\'' + data.f_ddabong + '\',\'' + data.f_favorites + '\')"/>&nbsp;'+ data.b_ddabong + '&nbsp;&nbsp;&nbsp;&nbsp;'           
								+ '<img class="cnt" src="icons/cnt.png" />&nbsp;'+ data.b_readcnt 
								+ '</div></div>';  		//닉네임+조회수+추천수
						tag +='<div class="delocation" onclick="go_map('+ data.b_local +')">'+ data.b_local +'</div>';						//게시물 위치정보
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


//추천아이콘 클릭시 추천 이벤트
function ddabong(no, userid, ddabong, fav) {
	console.log("사용자의 추천상태"+ddabong);
	console.log("사용자의 즐찾상태"+fav);
	
	//비로그인사용자가 추천아이콘 클릭시
	if(userid == '') {
		var noLogin = confirm("로그인이 필요한 기능입니다. \n로그인화면으로 이동하시겠습니까?")
		if(noLogin) {
			location.href='loginuser';
		} else {
			return;
		}
	//로그인한 사용자가 추천아이콘 클릭시
	} else if (userid != ''){
		//클릭한 사용자가 이전에 추천한 이력이 없다면
		if(ddabong == 'N') {
			var ddabongTrue = confirm('추천하시겠습니까?');
			if(ddabongTrue) {
				var ddabong2 = 'Y';
				$.ajax({
					url: 'ddabong.bo',
					type: 'post',
					data: { 'no' : no , 'userid' : userid , 'ddabong' : ddabong2 , 'fav' : fav },
					success: function() {
						alert('추천하셨습니다.');
						$('#detail, #detail-background').css('display', 'none');
						$('body').css('overflow-y','scroll');
					}, error: function(req, text){
						alert(text+":"+req.status);
					}
				});
			}
		//클릭한 사용자가 이전에 추천한 이력이 있다면 ddabong='Y'
		} else if(ddabong == 'Y') {
			var ddabongFalse = confirm('추천을 취소하시겠습니까?');
			if(ddabongFalse) {
				var ddabong2 = 'N';
				$.ajax({
					url: 'ddabong.bo',
					type: 'post',
					data: { 'no' : no , 'userid' : userid , 'ddabong' : ddabong2 , 'fav' : fav },
					success: function() {
						alert('추천을 취소하셨습니다.');
						$('#detail, #detail-background').css('display', 'none');
						$('body').css('overflow-y','scroll');
					}, error: function(req, text){
						alert(text+":"+req.status);
					}
				});
			}
		}
	}
}

//즐겨찾기 아이콘 클릭시 즐겨찾기 이벤트
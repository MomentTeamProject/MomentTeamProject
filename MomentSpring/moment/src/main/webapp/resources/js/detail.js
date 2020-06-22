//이미지목록 클릭시 디테일 화면에 띄워주기
function detail(picNo) {
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
	console.log('클릭한 이미지 no : ' + picNo );
	$.ajax({
		url: 'detail.bo',
		type: 'post',
		data: { 'no' : picNo },
		success: function(data){
			$('.detitle').html(data.b_title);
			var tag = '<img class="deimg" src="background/'+ data.b_imgpath +'"/>';	//게시물사진
			
					tag +='<div class="decontent">';																		//게시물 내용담는 div
						tag +='<div class="deprofileBox">';																	//게시물 프로필사진 div
						tag +='<img class="deprofile" src="background/logo2.png"/>';				//게시자 프로필사진
						tag +='</div>';
						tag +='<div class="denick">'+ data.b_nick													
								+ '<div class="decntBox"><img class="cnt" src="icons/like.png"/>&nbsp;'+ data.b_ddabong + '&nbsp;&nbsp;&nbsp;&nbsp;<img class="like" src="icons/cnt.png"/>&nbsp;'+ data.b_readcnt +'</div></div>';  		//닉네임+조회수+추천수					 
						tag +='<div class="delocation" onclick="go_map('+data.b_local+')">'+ data.b_local +'</div>';						//게시물 위치정보
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
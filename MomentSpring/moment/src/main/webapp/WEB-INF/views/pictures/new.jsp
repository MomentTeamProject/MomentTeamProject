<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk&libraries=places&callback=initAutocomplete" 
async defer></script>
<style>
.push { display: none; }
#attach-file, #delete-file {display:none;}
.file-img {width:25px; height:25px;}

.content {height: 700px; width:700px; margin: 0 auto; padding:50px; border-radius:15px; background-color : #f56437fa;}
form {padding-top: 150px;  }
table { 
	width: 60%;	margin: 0 auto;	border-collapse:collapse;
}
table th, table td {  padding: 5px 10px; color: white; }
input { height:22px;  padding:3px 5px;	font-size:15px; width: 99%}

#map { height: 200px; width: 95%; padding-top:10px; color:black;  border: 1px solid black; }
#coment {height: 150px;}
input:focus {outline:none;}
#search {padding : 25px;}

</style>
</head>

<body>
<div class="content">
<form method="post" action="insert.bo" enctype="multipart/form-data">
	<table>
		<tr><th>제목</th>
			<td><input type='text' name='b_title' class='need' title='제목'/></td>
		</tr>
		<tr><th>작성자</th><td class="left">${login_info.u_nick}</td>
		</tr>
		<tr id="coment"><th>내용</th>
			<td><textarea name='b_coment' class='need' title='내용' style="width: 99%; height: 200px;"></textarea></td>
		</tr>
		
		<tr ><th>주소검색</th>
			<td id="search">
				<div style="float:left;"><input type= "text" id="location" placeholder="search" style="width:400px; " class='need' title='위치' 
				onkeypress="if( event.keyCode==13){where()}" >
						<input type= "hidden" id="b_latitude" name="b_latitude" >
						<input type= "hidden" id="b_longitude" name="b_longitude" >
						<input type= "hidden" id="b_local" name="b_local" >
			  	<a class="btn-fill" onclick="where()" >검색</a></div>
			  	<!-- <div id="address" style="color:white; height: 20px; padding: 10px;"></div> -->
				<div id="map"></div>
				<div id="locationField"></div>
			</td>
		</tr>
		<tr><th>첨부파일</th>
			<td class='td-img left'>
				<label><input type="file" name='file' id='attach-file' class='pic' title='사진'/>
					   <img src='background/select.png' class='file-img'/>
				</label>
				<span id='board_preview'></span>  <!-- 파일 미리보기  -->
				<div><span id='file-name'></span> <!-- 파일이름  -->
				<span id='delete-file' style='color:red; margin-left: 20px;'><i class='fas fa-times font-img'></i></span> <!-- 파일삭제  -->
				</div>
			</td>
		</tr>	
	</table>
		
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick="if( content_check()) $('form').submit()">저장</a>	
	<a class='btn-empty' href='list.bo'>취소</a>
</div>
</div>
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
<script type="text/javascript" src="js/image_preview.js"></script>



<script type="text/javascript">

/* 파일첨부  */
$('#attach-file').on('change', function(){
	if( this.files[0] ) $('#file-name').text(this.files[0].name);
	$('#delete-file').css('display','inline');
});

$('#delete-file').on('click', function(){
	$('#attach-file').val('');
	$('#file-name').text('');
	$('#delete-file').css('display','none');
});



//게시판 새글 미리보기
function isImage(filename){
	var ext = filename.substring(filename.lastIndexOf('.')+1).toLowerCase();
	var imgs = ['jpg', 'jpeg', 'gif','png','bmp'];
	if( imgs.indexOf(ext)>-1 )return true;
	else return false;
	
}


$('#attach-file').on('change', function(){
	var attach = this.files[0];
	if(attach){
		$('.file-img').css('display','none');
		if(isImage(attach.name)){			
			var img = '<img src="" style="width:200px; height:100px;"' 
						+' class="file-img" id="preview-img"/>';
			$('#board_preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		}else $('#board_preview').html('');
	}
});



//삭제처리
$('#delete-file').on('click', function(){
	$('#board_preview').html('');
	$('.file-img').css('display','inline');
});




/* 글쓰기 항목 체크 */

function content_check() { 
	
		if ($('[name=b_title]').val() == '') {
			alert("제목을 입력해주세요 ");
			$('[name=b_title]').focus();
			return;
		} 

		if ($('[name=b_coment]').val() == '') {
			alert("코멘트를 입력해주세요 ");
			$('[name=b_coment]').focus();
			return;
		} 

		if ($('[name=file]').val() == '') {
			alert("사진을 첨부해주세요");		
			return;
		} 

		if ($('[name=b_local]').val() == '') {
			alert("위치를 입력해주세요");
			$('[name=b_local]').focus();
			return;
		} 

		return true;
					
}




//처음 페이지 실행시 현재 위치 
$(document).ready(function() { 

	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {		   
				var lat = parseFloat(position.coords.latitude);
				var lng = parseFloat(position.coords.longitude);
				var address = '현재위치';
				initMap(lat, lng, address);		   
				
			}, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
		}
		getLocation();

});


//맵에 마커 표시하기
function initMap(lat, lng, address) {
	
  	var now = {lat:lat , lng: lng};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: now
    });
    
    var marker = new google.maps.Marker({
      position: now,
      map: map
    });


    var content = address;
    var infowindow = new google.maps.InfoWindow({
        content: content        
       /*  maxWidth: 200, */
        
      });

    infowindow.open(map, marker);
}
 

 function where(){
	 
	  var location = $('#location').val().replace(/ /gi, '');
      
	  
	 $.ajax({
			url: 'search_location',
			data: { address: location },
			success: function( data ){
				if (data) {


				//alert(data.lng+"+"+data.lat+"+"+data.address); // 지도 위도 경도 주소 값
				$('#address').html( data.address );
				document.getElementById("b_local").value = data.address;
				document.getElementById("b_latitude").value = data.lat;
				document.getElementById("b_longitude").value = data.lng;

				var lat = data.lat;
				var lng = data.lng;
				var address = data.address;
				initMap(lat,lng,address);
				
					
			    }		else {

			    	alert('정확한 주소를 입력해주세요');
					return;
					
				}		
				
			},error: function(req, text){
				alert( text+':'+req.status);
			}
			
		});
 }





//스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트
window.onscroll = function(){
//		console.log('js 흐름탐');
		
		var scroll = window.scrollY + $(window).height();
		var endY = document.body.scrollHeight;
		
		console.log(scroll);
		console.log(endY);
		
		//content 영역의 최상위 위치 값
		var scrollTop = $(this).scrollTop();
		//content 영역의 (패딩영역합산한) content의 높이
		var innerHeight = $(this).innerHeight();
		
		
		//스크롤이 컨텐트아래 50 hegiht 를 넘어서면 이벤트 시작
		if (scroll > endY) {
			$("#confirm").css('color', 'white');
			$("#footer-wrap").slideDown();
		} else {
		 	$("#confirm").css('color', 'gray');
		 	$("#footer-wrap").slideUp();
		}
};
</script>
</body>
</html>
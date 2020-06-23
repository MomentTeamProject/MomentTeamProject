<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
 <head>
    <title>Place Searches</title>
<!-- 구글 api  -->
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk&libraries=places&callback=initAutocomplete" 
async defer></script>




<style>
@import url('https://fonts.googleapis.com/css2?family=Suez+One&display=swap');
#map_ma {margin: 0 auto; width:1250px; height:700px; clear:both; border:solid 2px black; box-shadow: 1px 1px 2px black;}
#autocomplete {width:500px; height: 40px; border: 1px solid black; border-radius :15px; box-shadow: 1px 1px 2px black; padding:0 15px; }
#locationField {padding: 40px 20px 10px;  }
#title {width: 1237px; margin: 0 auto; color:white; padding-top:100px;font-size:30px; border-bottom : 1px solid gray;}
p {float: left; font-family: 'Suez One', serif; font-size: 38px; padding-left: 60px;}


/* footer */
#footer-wrap { display: none; }
.push { display: none; }


/* 지도 css */
#infoimg {width:119px; height:99px; float:left; } 	
#infocon {width :115px;  margin: 0 ;}    
#infotitle { width :110px;
text-overflow: ellipsis; white-space: nowrap;  
display: block; overflow: hidden; font-size:90%; /* 글줄임 */
font-weight: bolder;  text-align: center;} 

div.gm-style-iw.gm-style-iw-c {
	width: 150px !important; 
	height: 155px;
}


div.gm-style-iw-d {
	width: 99%; 
	height: 99%;
}

</style>
</head>
<body>


<div id ="title"><P > Search by Map.. </P> </div>
<div style="padding-top:10px; height: 1000px; background-color: #f56437fa;">
	
	 <!-- 주소검색  -->
	<div id="locationField">
	  <input id="autocomplete" placeholder="찾고 싶은 지역을 검색하세요" type="text">
	</div>
	 
	<input type="hidden" class="field" id="lat" />
	<input type="hidden" class="field"  id="lng" />	
	
	<!-- 지도  -->
	<div id="map_ma" style="color:black;"></div> 
</div>

<script type="text/javascript">

//스크롤해서 내려서 로딩된 이미지 끝에 다달았을때 다음페이지의 이미지 출력하는 스크립트
window.onscroll = function(){
		console.log('js 흐름탐');
		
		var scroll = window.scrollY + $(window).height();
		var endY = document.body.scrollHeight - 20;
		
		console.log(scroll);
		console.log(endY);
		
		//content 영역의 최상위 위치 값
		var scrollTop = $(this).scrollTop();
		//content 영역의 (패딩영역합산한) content의 높이
		var innerHeight = $(this).innerHeight();
		
		
		//스크롤이 컨텐트아래 50 hegiht 를 넘어서면 이벤트 시작
		if (scroll > endY) {
			$("#footer-wrap").slideDown();
		} else {
		 	$("#footer-wrap").slideUp();
		}
};


//처음 페이지 실행시 현재 위치 
$(document).ready(function() { 

	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {		   
				var lat = parseFloat(position.coords.latitude);
				var lng = parseFloat(position.coords.longitude);
				initMap(lat, lng);
				console.log("coords.lat: "+position.coords.latitude);		   
				console.log("coords.lng: "+position.coords.longitude);		   
				
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


// 마커 표시 
function initMap(lat,lng){
 
	//alert("함수"+lat + ' ' +lng);
	console.log("lat: "+lat);
	console.log("lng: "+lng);		 
	var map = new google.maps.Map(document.getElementById('map_ma'), {
	    
	    center: {
	        lat: lat,
	        lng: lng
	    },
	    
	    //처음 줌 값. 숫자가 작을수록 낮은 배율
	    zoom: 15
	});

	var marker = new google.maps.Marker({
		position: {lat:lat, lng: lng},
		map: map
		
	});
	
}


// 지도 검색시, 자동완성 및 DB에서 주변 정보 가져오기 
var placeSearch, autocomplete;

function initAutocomplete() {
	
  // Create the autocomplete object, restricting the search to geographical 
  autocomplete = new google.maps.places.Autocomplete(
    (document.getElementById('autocomplete')), {
      types: ['geocode']
    
    });

  autocomplete.addListener('place_changed', fillInAddress); //주소 선택시 검색창 채움
}




function fillInAddress() {  //좌표 얻어와서 창에 띄움. 
  
  var place = autocomplete.getPlace();
  document.getElementById("lat").value = place.geometry.location.lat();
  document.getElementById("lng").value = place.geometry.location.lng();

  var lat = parseFloat(document.getElementById("lat").value);
  var lng = parseFloat(document.getElementById("lng").value);
  var locationname = document.getElementById("autocomplete").value;	
  //var marker, i;
  
	$.ajax({
		type : 'post',
		url : 'nearMarker.moment', 
		data : {
			b_latitude : lat,
			b_longitude : lng
		},
		success : function(data) {
		 //alert('주변 정보 전달 성공');
		 
			var map = new google.maps.Map(document.getElementById('map_ma'), {        	    
        	    center: {
        	        lat: lat,
        	        lng: lng
        	    },        	    
        	   zoom: 17
        	});        		
         
	            for (var i = 0; i < data.length; i++) {	            
	               var marker = new google.maps.Marker({
	                    position: {lat: parseFloat( data[i].b_latitude ), lng: parseFloat(data[i].b_longitude)},
	                    map: map,	                    
	                });	                

	                var img = "<img id='infoimg' src='img/background/"+data[i].b_imgpath+"'>"
	                +"<div id='infocon'><a id='infotitle'>"+data[i].b_title+"&nbsp;&nbsp;<img style='width:8%; padding-bottom:1px' src='img/background/heart.png'>"
	                +data[i].b_ddabong+"</a><a href='' style='color:black;text-decoration: underline; font-size:70%'> 글보러 가기≫</a></div>"; 
	              	// 클릭시 글 번호로 글 상세 화면으로 넘어가게 함             	
	              	                        
	                
		            var infowindow = new google.maps.InfoWindow({
		                content: img,
		               /*  maxWidth: 200, */
		                
		              });

		            infowindow.open(map, marker);  //제일 처음에 info창 띄워주기 
		            bindInfoWindow(marker, map, infowindow); //클릭시 info창 띄워주기    
		        
	            } // for문


		 function bindInfoWindow(marker, map, infowindow ) { 
	 	     google.maps.event.addListener(marker, 'click', function() {
		     // infowindow.setContent(html); 
		    infowindow.open(map, marker); 
		         }); 
		
	     }//bindInfoWindow
	                    
	}, //success 
		error : function(req, text) {
			alert(text + ":" + req.status);

		}
	}); //ajax  
}

</script>
</body>
</html>


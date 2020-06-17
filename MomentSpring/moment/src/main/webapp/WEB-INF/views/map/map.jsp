<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
 <head>
    <title>Place Searches</title>
<!-- 구글 api  -->
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrfll4QoaTNLPA3Zhpd0P_72bmSVjqNYk&libraries=places&callback=initAutocomplete" 
async defer></script>




<style>
	#map_ma {margin: 0 auto; width:1250px; height:700px; clear:both; border:solid 2px gray;}
	#autocomplete {width:500px; height: 40px;  border-radius : 5px; box-shadow: 1px 1px 2px gray; padding:0 15px; }
	#locationField {padding: 10px; }
	#googleinfo { width :100px; text-overflow: ellipsis; white-space: nowrap; display: block; overflow: hidden; font-size:90%; font-weight: bolder;}
	#infobox  {width :100px; margin: 0 ; padding: 2px 5px; 
	   background-color: #0b2d70;  color: white;  }
	#title {width: 1237px; margin: 0 auto; color:white; padding-top:100px;font-size:30px; border-bottom : 1px solid gray;}
</style>
</head>
<body>


<div id ="title"><P style="float: left;"> 지도로 검색</P> </div>
<div style="padding-top:10px;">
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



//처음 페이지 실행시 현재 위치 
$(document).ready(function() { 

	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {		   
				var lat = parseFloat(position.coords.latitude);
				var lng = parseFloat(position.coords.longitude);
				initMap(lat, lng);		   
				
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
		 alert('주변 정보 전달 성공');
		 
			var map = new google.maps.Map(document.getElementById('map_ma'), {        	    
        	    center: {
        	        lat: lat,
        	        lng: lng
        	    },        	    
        	   zoom: 15
        	});        		
         
	            for (var i = 0; i < data.length; i++) {	            
	               var marker = new google.maps.Marker({
	                    position: {lat: parseFloat( data[i].b_latitude ), lng: parseFloat(data[i].b_longitude)},
	                    map: map,	                    
	                });	                

	                var img = "<img style='width:110px; height:60px;' src='img/background/"+data[i].b_imgpath+"'>"
	                +"<div id='infobox'><a id='googleinfo'>"+data[i].b_title+"</a></div>"; 
	              	// 클릭시 글 번호로 글 상세 화면으로 넘어가게 함 
	              	
	              	
	                //alert(parseFloat(data[i].b_latitude)+'----'+parseFloat(data[i].b_longitude));	                
	                
		           // var infowindow = new google.maps.InfoWindow({ content: img });
		            var infowindow = new google.maps.InfoWindow({
		                content: img,
		                maxWidth: 160,
		                
		              });

		            infowindow.open(map, marker);  //제일 처음에 info창 띄워주기 
		            bindInfoWindow(marker, map, infowindow); //클릭시 info창 띄워주기    
		        
	            } // for문


		 function bindInfoWindow(marker, map, infowindow ) { 
	 	     google.maps.event.addListener(marker, 'click', function() {
		     // infowindow.setContent(html); 
		    infowindow.open(map, marker); 
		         }); 

		  	 
        /*     google.maps.event.addListener(marker, 'click', function() {
            	   infowindow.open(map, marker); 
            });  */ 
		     
	/* 	    google.maps.event.addListener(marker, 'mouseout', function() {
		    infowindow.close();
	      }); 	
 */

	 	    /* google.maps.event.addListener(map, 'click', (function(infowindow) {
	            return function() {
	              infowindow.close();
	            }
	          })(infowindow));
		       */
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


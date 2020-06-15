/**
 * 파일 선택시 이미지인 경우 선택한 이미지파일 미리보기되게, 삭제시 미리보기된 이미지 없애기
 */

function isImage(filename){
	//abc.txt, abc.jpg
	var ext = filename.substring(filename.lastIndexOf('.')+1).toLowerCase();
	var imgs = ['jpg', 'jpeg', 'gif','png','bmp'];
	if( imgs.indexOf(ext)>-1 )return true;
	else return false;
	
}
$('#u_profileimg').on('change', function(){
	var attach = this.files[0];
	if(attach){//첨부파일이 있다면 : 파일을 선택했다면
		$('.file-img').css('display','none');
		if(isImage(attach.name)){//이미지 미리보기 가능한 이미지인지 확인
			//이미지 이므로 미리보기 가능
			var img = '<img src="" style="border-radius:50%;width:70px; height:70px;"' 
						+' class="file-img" id="preview-img"/>';
			$('#preview').html(img);

			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview-img').attr('src', e.target.result);
			}
			reader.readAsDataURL(attach);
		}else $('#preview').html('');
	}
});
// 삭제처리
$('#delete-file').on('click', function(){
	$('#preview').html('');
});
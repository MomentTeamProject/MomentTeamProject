<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu-box{ width: 80%; height: 50px; margin: 10px auto; text-align: center; }
.menu ul{ margin: 0 auto; }
.menu li{ float: none; margin: 0 10px;}
#content { margin-top: 150px; }
</style>
</head>
<body>
<h3>문의 하기</h3>
<div class="menu-box" style="margin-bottom: 80px;">
	<div id="list-top" >
	<div style="margin-bottom: 20px">
				<select name="search" class="w-px80">
					<option value="title" ${page.search eq title ? 'selected' : '' }>제목</option>
					<option value="content" ${page.search eq content ? 'selected' : '' }>내용</option>
					<option value="writer" ${page.search eq writer ? 'selected' : '' }>작성자</option>
					<option value="all" ${page.search eq all ? 'selected' : '' }>전체</option>
				</select>
			<input type="text" name="keyword" class="w-px300" value="${page.keyword}"/>
			<a class="btn-fill" onclick="search_list();">검색</a>
		</div>
		<div style="margin-bottom: 20px">
		<a class="btn-fill" id="faq">자주 묻는 질문과 답변</a>
		<a class="btn-empty" id="all_list">전체 질문 목록</a>
		<c:if test="${!empty login_info }">
			<a class="btn-empty" id="myq">내 질문 목록</a>
			<a class="btn-empty" id="question">질문하기</a>
		</c:if>
		<c:if test="${login_info.admin eq 'Y' }">	
			<a class="btn-empty" id="qlist">답변 할 목록</a>
			<a class="btn-empty" id="alist">답변 완료 목록</a>
		</c:if>
		</div>
		</div>
</div>
<div id="contents">
<!-- 자주 묻는 질문과 답변 -->
	<div class="faq_list" style="overflow: hidden;">
	<table>
		<tr>
			<th class="w-px60">번호</th>
			<th>제목</th>
			<th class="w-px100">작성자</th>
			<th class="w-px100">작성일자</th>
			<th class="w-px60">질문 현황</th>
		</tr>
		<c:forEach items="${page.list}" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td class="left"><a class="content_btn${vo.id }" onclick="content_view(${vo.id})">${vo.title }</a></td>
				<td>${vo.name }</td>
				<td>${vo.writedate }</td>
				<td>${vo.answer_result eq 'Y' ? '답변완료' : '진행중' }</td>
			</tr>
			<tr class="content_view${vo.id}" style="display: none; cursor: pointer;" onclick="content_close(${vo.id})">
				<td>답변</td>
				<td colspan="5" class="left">${vo.content }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="append">
	</div>
	
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
	</div>
</div>

<!-- 글작성 -->
<div id="question_write" style="display: none;">
	<form action="insert.qn" method="post">
	<table>
		<tr>
			<th class="w-px120">제목</th>
			<td><input type="text" name="title" class="need" title="제목" onkeypress="if(event.keyCode == 13){if(!necessary()) return false;}" /></td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td><textarea name="content" class="need" title="내용" ></textarea></td>
		</tr>
	</table>
	<div class="btnSet">
		<a class="btn-fill" onclick="if( necessary() ){ $('form').submit() }" >저장</a>
		<a class="btn-empty">취소</a>
	</div>
	</form>
</div>

<script type="text/javascript" src="js/qna_button.js"></script>
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript">
function content_view(id){
	$('.content_btn'+id).css('color','blue');
	$('.content_view'+id).css('display','table-row');
	$('.content_view'+id).siblings('td').eq(1).attr('colspan','5');
}

function content_close(id){
	$('.content_btn'+id).css('color','black');
	$('.content_view'+id).css('display','none');
}
//날짜 형식 포맷
function formatDate(date) { 
	var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	
	return [year, month, day].join('-'); 
}


//글삭제
function write_delete(qid, result, admin){
	if(admin == 'N'){
		if(result == 'Y') { alert('답변이 완료된 글은 삭제가 불가능합니다. '); return; }
	}
	
	if(!confirm("정말삭제?")) return;
	$.ajax({
		type: 'post',
		url: 'delete.qn',
		data: {id: qid},
		success: function(data){
			location.reload();
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
}

//답변 등록
function answer(a_id, a_content){
	if(!confirm("답변을 등록 하시겠습니까?")) return;
	$.ajax({
		type: 'post',
		url: 'answer.qn',
		data: { id: a_id, content: a_content },
		success: function(data){
			alert('답변이 등록되었습니다.');
			location.reload();
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
}

$('#faq').on('click', function(){
	$('#question_write').css('display','none');
	$('#contents').css('display','block');
	$('.faq_list').css('width','100%');
	$('.faq_list').css('height','100%');
	$('#append').html('');
});

//내 질문 목록
$('#myq').on('click', function(){
	$('#question_write').css('display','none');
	$('#contents').css('display','block');
	$('.faq_list').css('width','0');
	$('.faq_list').css('height','0');
	$('#append').html('');
	$.ajax({
		type: 'post',
		url: 'myquestion',
		success: function(data){
			var tag = '<table>';
			tag += '<tr><th class="w-px60">번호</th><th>제목</th><th class="w-px100">작성자</th><th class="w-px100">작성일자</th><th class="w-px60">질문 현황</th><th class="w-px60">글삭제</th></tr>';
			$.each(data, function(key, value){
				tag += '<tr><td>'+value.no+'</td>';								
				tag += '<td class="left"><a class="content_btn'+value.id+'" onclick="content_view('+value.id+')">'+value.title+'</a></td>' ;     
				tag += '<td>'+value.name+'</td><td>'+formatDate(value.writedate)+'</td>';
				tag += '<td>'+ (value.answer_result == 'Y' ? '답변완료' : '진행중') +'</td>';
				tag += '<td><a onclick="write_delete('+value.id+' ,\''+value.answer_result+'\' ,\'${login_info.admin}\')">삭제</a></td>';
				tag += '</tr>';
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>질문</td><td colspan="5" class="left">'+value.content.replace(/\n/g, '<br/>')+'</td></tr>'
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>답변</td><td colspan="5" class="left">'+(value.answer_content == null ? '아직 등록된 답변이 없습니다.' : value.answer_content.replace(/\n/g, '<br/>'))+'</td></tr>'
			console.log(value);
			});
			tag += '</table>';
			$('#append').html(tag);
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
});

$('#question').on('click', function(){
	$('#contents').css('display','none');
	$('#question_write').css('display','block');
	$('.faq_list').css('width','0');
	$('.faq_list').css('height','0');
	$('#append').html('');
});

//답변해야하는 목록
$('#qlist').on('click', function(){
	$('#question_write').css('display','none');
	$('#contents').css('display','block');
	$('.faq_list').css('width','0');
	$('.faq_list').css('height','0');
	$('#append').html('');

	$.ajax({
		type: 'post',
		url: 'question_list.qn',
		success: function(data){
			var tag = '<table>';
			tag += '<tr><th class="w-px60">번호</th><th>제목</th><th class="w-px100">작성자</th><th class="w-px100">작성일자</th><th class="w-px60">질문 현황</th><th class="w-px60">글삭제</th></tr>';
			$.each(data, function(key, value){
				tag += '<tr><td>'+value.no+'</td>';								
				tag += '<td class="left"><a class="content_btn'+value.id+'" onclick="content_view('+value.id+')">'+value.title+'</a></td>' ;     
				tag += '<td>'+value.name+'</td><td>'+formatDate(value.writedate)+'</td>';
				tag += '<td>'+ (value.answer_result == 'Y' ? '답변완료' : '진행중') +'</td>';
				tag += '<td><a onclick="write_delete('+value.id+')">삭제</a></td>';
				tag += '</tr>';
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>질문</td><td colspan="5" class="left">'+value.content+'</td></tr>'
				tag += '<tr class="content_view'+value.id+'" style="display: none;">'
					+'<td>답변</td><td colspan="5" class="left"><textarea name="content" id="content'+value.id+'" class="need" title="내용" ></textarea>'
					+'<a class="btn-fill" onclick="if( $(\'#content'+value.id+'\').val() != \'\'){ answer('+value.id+',$(\'#content'+value.id+'\').val()) } else{ alert(\'내용을 입력 바랍니다.\')}" >답변 등록 하기</a></td></tr>'
			console.log(value);
			});
			tag += '</table>';
			$('#append').html(tag);
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
});

//답변한 목록
$('#alist').on('click', function(){
	$('#question_write').css('display','none');
	$('#contents').css('display','block');
	$('.faq_list').css('width','0');
	$('.faq_list').css('height','0');
	$('#append').html('');
	$.ajax({
		type: 'post',
		url: 'answer_list.qn',
		success: function(data){
			var tag = '<table>';
			tag += '<tr><th class="w-px60">번호</th><th>제목</th><th class="w-px100">작성자</th><th class="w-px100">작성일자</th><th class="w-px60">질문 현황</th><th class="w-px60">글삭제</th></tr>';
			$.each(data, function(key, value){
				tag += '<tr><td>'+value.no+'</td>';								
				tag += '<td class="left"><a class="content_btn'+value.id+'" onclick="content_view('+value.id+')">'+value.title+'</a></td>' ;     
				tag += '<td>'+value.name+'</td><td>'+formatDate(value.writedate)+'</td>';
				tag += '<td>'+ (value.answer_result == 'Y' ? '답변완료' : '진행중') +'</td>';
				tag += '<td><a onclick="write_delete('+value.id+')">삭제</a></td>';
				tag += '</tr>';
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>질문</td><td colspan="5" class="left">'+value.content.replace(/\n/g, '<br/>')+'</td></tr>'
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>답변</td><td colspan="5" class="left">'+(value.answer_content == null ? '아직 등록된 답변이 없습니다.' : value.answer_content.replace(/\n/g, '<br/>'))+'</td></tr>'
			console.log(value);
			});
			tag += '</table>';
			$('#append').html(tag);
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
});

//전체 목록
$('#all_list').on('click', function(){
	search_list();
});

function search_list(){
	$('#question_write').css('display','none');
	$('#contents').css('display','block');
	$('.faq_list').css('width','0');
	$('.faq_list').css('height','0');

	
	$('#append').html('');
	$.ajax({
		type: 'post',
		url: 'all_list.qn',
		data: { search: $('[name=search]').val(), keyword : $('[name=keyword]').val() },
		success: function(data){
			var tag = '<table>';
			tag += '<tr><th class="w-px60">번호</th><th>제목</th><th class="w-px100">작성자</th><th class="w-px100">작성일자</th><th class="w-px60">질문 현황</th><c:if test="${login_info.admin eq \'Y\' }"><th class="w-px60">글삭제</th></c:if></tr>';
			$.each(data, function(key, value){
				tag += '<tr><td>'+value.no+'</td>';								
				tag += '<td class="left"><a class="content_btn'+value.id+'" onclick="content_view('+value.id+')">'+value.title+'</a></td>' ;     
				tag += '<td>'+value.name+'</td><td>'+formatDate(value.writedate)+'</td>';
				tag += '<td>'+ (value.answer_result == 'Y' ? '답변완료' : '진행중') +'</td>';
				tag += '<c:if test="${login_info.admin eq \'Y\' }"><td><a onclick="write_delete('+value.id+')">삭제</a></td></c:if>';
				tag += '</tr>';
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>질문</td><td colspan="5" class="left">'+value.content.replace(/\n/g, '<br/>')+'</td></tr>'
				tag += '<tr class="content_view'+value.id+'" style="display: none; cursor: pointer;" onclick="content_close('+value.id+')">'
					+'<td>답변</td><td colspan="5" class="left">'+(value.answer_content == null ? '아직 등록된 답변이 없습니다.' : value.answer_content.replace(/\n/g, '<br/>'))+'</td></tr>'
			console.log(value);
			});
			tag += '</table>';
			$('#append').html(tag);
		}, error: function(req, text){
			alert(text+":"+req.status);
		}
	});
		$('#all_list').removeClass();
		$('#faq').removeClass();
		$('#myq').removeClass();
		$('#question').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#all_list').addClass('btn-fill');
		$('#faq').addClass('btn-empty');
		$('#myq').addClass('btn-empty');
		$('#question').addClass('btn-empty');
		$('#qlist').addClass('btn-empty');
		$('#alist').addClass('btn-empty');
}
</script>
</body>
</html>
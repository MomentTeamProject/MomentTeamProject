/**
 * 	QnA 버튼 
 */
	$('#all_list').on('click', function(){
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
		$('[name=keyword]').val('');
	});
	
	$('#faq').on('click', function(){
		$('#all_list').removeClass();
		$('#faq').removeClass();
		$('#myq').removeClass();
		$('#question').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#faq').addClass('btn-fill');
		$('#all_list').addClass('btn-empty');
		$('#myq').addClass('btn-empty');
		$('#question').addClass('btn-empty');
		$('#qlist').addClass('btn-empty');
		$('#alist').addClass('btn-empty');
	});

	$('#myq').on('click', function(){
		$('#myq').removeClass();
		$('#faq').removeClass();
		$('#question').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#all_list').removeClass();
		$('#all_list').addClass('btn-empty');
		$('#myq').addClass('btn-fill');
		$('#faq').addClass('btn-empty');
		$('#question').addClass('btn-empty');
		$('#qlist').addClass('btn-empty');
		$('#alist').addClass('btn-empty');
	});
	
	$('#question').on('click', function(){
		$('#question').removeClass();
		$('#faq').removeClass();
		$('#myq').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#all_list').removeClass();
		$('#all_list').addClass('btn-empty');
		$('#question').addClass('btn-fill');
		$('#faq').addClass('btn-empty');
		$('#myq').addClass('btn-empty');
		$('#qlist').addClass('btn-empty');
		$('#alist').addClass('btn-empty');
	});
	
	$('#qlist').on('click', function(){
		$('#qlist').removeClass();
		$('#faq').removeClass();
		$('#myq').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#all_list').removeClass();
		$('#all_list').addClass('btn-empty');
		$('#qlist').addClass('btn-fill');
		$('#faq').addClass('btn-empty');
		$('#myq').addClass('btn-empty');
		$('#question').addClass('btn-empty');
		$('#alist').addClass('btn-empty');
	});
	
	$('#alist').on('click', function(){
		$('#alist').removeClass();
		$('#faq').removeClass();
		$('#myq').removeClass();
		$('#qlist').removeClass();
		$('#alist').removeClass();
		$('#all_list').removeClass();
		$('#all_list').addClass('btn-empty');
		$('#alist').addClass('btn-fill');
		$('#faq').addClass('btn-empty');
		$('#myq').addClass('btn-empty');
		$('#question').addClass('btn-empty');
		$('#qlist').addClass('btn-empty');
	});
/**
 * 회원가입시 입력항목의 유효성 확인 
 */
var join = {
	common:{
		empty:{ code: 'invalid', desc:'입력하세요'}
		, space: {code: 'invalid', desc: '공백없이 입력하세요'}
		, min: {code: 'invalid', desc: '최소5자 이상 입력하세요'}
		, max: {code: 'invalid', desc: '최대10자 이하 입력하세요'}
	}
	, userid: {
		invalid: {code: 'invalid', desc: '이메일 형식으로 입력해주세요' }
		, valid: {code: 'valid', desc: '아이디 중복확인하세요' }
		, usable: {code:'valid', desc: '사용가능한 아이디입니다'}
		, unusable: {code:'invalid', desc: '이미사용중인 아이디입니다'}
	}
	, usernick: {
		invalid: {code: 'invalid', desc: '닉네임을 입력하세요' }
		, valid: {code: 'valid', desc: '닉네임 중복확인하세요' }
		, usable: {code:'valid', desc: '사용가능한 닉네임입니다'}
		, unusable: {code:'invalid', desc: '이미사용중인 닉네임입니다'}
	}
	, userpw: {
		invalid: {code:'invalid', desc:'영문 대/소문자, 숫자만 입력하세요'}
		, valid: {code:'valid', desc:'사용가능한 비밀번호입니다'}
		, lack: {code:'invalid', desc:'영문 대/소문자, 숫자를 모두 포함해야 합니다'}
		, equal: {code:'valid', desc:'비밀번호가 일치합니다'}
		, notEqual: {code:'invalid', desc:'비밀번호가 일치하지 않습니다'}
	}
	, tag_status: function(tag){
		var data = tag.val();
		tag = tag.attr('name');
		if(tag=='userid') 				data = this.userid_status(data);
		else if(tag =='usernick')		data = this.usernick_status(data);
		else if(tag=='userpw')			data = this.userpw_status(data);
		else if(tag=='userpw_ck')		data = this.userpw_ck_status(data);
		return data;
	}
	, id_usable:function(data){
		if(data)	 return this.userid.usable /*data 값이 true일경우*/
		else		return this.userid.unusable;/*data 값이 false일경우*/
	}
	, nick_usable:function(data){
		if(data)	 return this.usernick.usable /*data 값이 true일경우*/
		else		return this.usernick.unusable;/*data 값이 false일경우*/
	}
	
	
	
	, userpw_ck_status: function(pw_ck){
		if(pw_ck=='')				return this.common.empty;
		else if (pw_ck == $('[name=userpw]').val())	
					return this.userpw.equal;
		else		return this.userpw.notEqual
	}
	
	, userpw_status: function(pw){
		var reg = /[^a-zA-Z0-9]/g;
		var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if(pw=='')					return this.common.empty;
		else if(pw.match(space)) 	return this.common.space;
		else if(reg.test(pw))		return this.userpw.invalid;
		else if(pw.length<5) 		return this.common.min;
		else if(pw.length>10) 		return this.common.max;
		else if(!upper.test(pw) || !lower.test(pw) || !digit.test(pw))	
									return this.userpw.lack;
		else 						return this.userpw.valid;
	}
	, userid_status: function(id){
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if( id=='') return this.common.empty;/*빈칸검사*/
		else if(id.match(space)) return this.common.space;/*공백입력검사*/
		else if(!reg.test(id)) return this.userid.invalid; /*아이디검사*/
		else 					return this.userid.valid;
		
	}
	, usernick_status: function(nick){
		if( nick=='') return this.common.empty;/*빈칸검사*/
		else if(nick.match(space)) return this.common.space;/*공백입력검사*/
		else return this.usernick.valid;
		
	}
	
	
	
	
	
};
var space = /\s/g;



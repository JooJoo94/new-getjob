/**
 * 회원가입 유효성 체크
 */
$("#joinForm").validate({
		rules : {
			userName : {
				required : true
			},
			userId : {
				required : true,
				minlength : 5,
				maxlength : 20
			},
			password : {
				required : true,
				minlength : 5,
				maxlength : 20
			},
			passwordCK : {
				required : true,
				equalTo : "#password"
			},
			email : {
				required : true,
				email : true
			},
			phone : {
				required : true,
				number: true
			}

		},
		messages : {
			userName : {
				required : "이름을 입력하세요",
			},
			userId : {
				required : "아이디를 입력하세요",
				minlength : "아이디는 5자리 이상 가능합니다",
				maxlength : "아이디는 20자리 이하만 가능합니다"
			},
			password : {
				required : "비밀번호를 입력하세요",
				minlength : "비밀번호는 5자리 이상 가능합니다",
				maxlength : "비밀번호는 20자리 이하만 가능합니다"
			},
			passwordCK : {
				required : "비밀번호를 다시 입력하세요",
				equalTo : "비밀번호가 일치하지 않습니다"
			},
			email : {
				required : "이메일을 입력하세요",
				email : "이메일이 형식에 맞지 않습니다"
			},
			phone : {
				required : "휴대전화 번호를 입력하세요",
				number: "휴대전화 번호를 정확히 입력하세요"
			}
		}
	});
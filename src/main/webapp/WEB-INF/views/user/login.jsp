<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<section class="p-5">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-12 text-center">
				<h2 id="title">로그인</h2>
			</div>
			<div class="col-lg-8 col-md-6 col-sm-8 ">
				<form>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="userId">아이디</label> <input class="form-control"
									name="userId" id="userId" type="text" placeholder="아이디를 입력하세요" />
							</div>
						</div>
						<br />
						<div class="col-sm-12">
							<div class="form-group">
								<label for="password">비밀번호</label> <input class="form-control"
									id="password" type="password" placeholder="비밀번호를 입력하세요" />
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<button id="login--submit"
							class="btn-block btn_4 boxed-btn">
							로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/script.jsp"%>
<script>
	$('#login--submit').on('click', function() {
		var data = {
			userId : $('#userId').val(),
			password : $('#password').val()
		};
		$.ajax({
			type : 'POST',
			url : '/user/login',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {			
			alert("로그인 성공");
			location.href = '/';
		}).fail(function(r) {
			alert("로그인 실패");
		})
	});
</script>
<%@include file="../include/footer.jsp"%>
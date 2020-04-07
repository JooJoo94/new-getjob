<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/nav.jsp"%>

<section class="section_padding p-5">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-12 ">
				<h2 class="join-title">개인정보수정</h2>
			</div>
			<form:form action="/user/profile" method="PUT" enctype="multipart/form-data" id="joinForm" class="joinForm">
				<input type="hidden" value="${sessionScope.principal.id}" name="id"/>
				<div class="col-lg-4 col-md-4 col-sm-4" style="display: inline-block; margin-top: auto; vertical-align: 100px;">
					<div class="col-sm-12 mb-3">
						<div class="form-group" style="text-align: center">
							<img class="rounded-circle my__img ml-auto mb-2" src="/media/${sessionScope.principal.profile}"
								width="200px" height="200px"
								onerror="javascript:this.src = '/images/unknown.jpg'" />
							<input type="file" class="form-control" name="profile" />
							<p class="my__profile"></p>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6" style="display: inline-block;">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="userName">이름</label> <input class="form-control" readonly="readonly"
									value="${sessionScope.principal.userName}" id="userName"
									type="text" name="userName" placeholder="이름을 입력하세요" />
							</div>
						</div>
						<br />
						<div class="col-sm-12">
							<div class="form-group">
								<label for="password">비밀번호</label> <input class="form-control"
									id="password" type="password" name="password"
									placeholder="비밀번호를 입력하세요" />
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="passwordCK">비밀번호 확인</label> <input
									class="form-control" id="passwordCK" type="password"
									name="passwordCK" placeholder="비밀번호를 다시 입력하세요" />
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="email">이메일</label> <input class="form-control"
									value="${sessionScope.principal.email}" id="email" name="email"
									type="text" placeholder="이메일을 입력하세요" />
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="phone">전화번호</label> <input class="form-control"
									readonly="readonly" value="${sessionScope.principal.phone}"
									id="phone" type="text" placeholder="전화번호 입력하세요" />
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<button type="submit" id="join--submit"
							class="button btn-block  button-contactForm btn_4 boxed-btn">
							수정하기</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</section>
<%@ include file="../include/script.jsp"%>
<script src="/js/joinValidation.js"></script>
<%@include file="../include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/nav.jsp"%>

<div class="job_details_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<!-- 기본정보 Form -->
				<div class="apply_job_form white-bg">
					<h4>기본정보</h4>
					<form id="form1" class="multiForm">
						<input class="col-md-12 job_form_title" type="text" name = "title"
							placeholder="이력서 제목" />
						<div class="row">
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">이름</label> <input class="col-md-9"
										id="name" name="name" type="text" placeholder="이름 입력" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">생년월일</label> <input class="col-md-9"
										id="birth" name="birth" type="text" placeholder="YYYYMMDD" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">이메일</label> <input class="col-md-9"
										id="email" name="email" type="text" placeholder="이메일 입력" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">전화번호</label> <input class="col-md-9"
										id="phone" name="phone" type="text" placeholder="전화번호 입력" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">주소</label> <input type="text"
										class="col-md-9" onclick="sample6_execDaumPostcode()"
										name="sample_address" id="sample_address" placeholder="주소" /><br>
									<label class="col-md-2" type="hidden"></label> <input
										name="sample_detailAddress" class="col-md-9" type="text"
										id="sample_detailAddress" placeholder="상세주소" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 기본정보 Form 끝-->

				<!-- 학력사항 Form -->
				<div class="apply_job_form white-bg">
					<h4>학력사항</h4>
					<form id="form2" class="multiForm">
						<div class="row">
							<div class="col-md-12 m-4">
								<div class="input_field text-center">
									<label for="elementary" class="col-md-3 p-3 level-education">초등학교
										졸업</label> <input type="hidden" id="elementary" value="1" /> <label
										for="middle" class="col-md-2 p-3 level-education">중학교
										졸업</label> <input type="hidden" id="middle" value="2" /> <label
										for="high" class="col-md-3 p-3 level-education">고등학교
										졸업</label> <input type="hidden" id="high" value="3" /> <label
										for="university" class="col-md-3 p-3 level-education">대학교
										졸업</label> <input type="hidden" id="university" value="4" />
								</div>
							</div>
							<br /> <br />
							<h4>
								<span></span>학교 정보 입력
							</h4>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">학교명</label> <input name="schoolName"
										class="col-md-9" type="text" placeholder="학교 입력">
								</div>
								<div class="input_field">
									<label class="col-md-2" for="name">지역</label> <input
										name="local" class="col-md-9" type="text" placeholder="지역 입력">
								</div>
							</div>

							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">재학기간</label> <input id="startYear"
										name="startYear" class="col-md-4" type="text"
										placeholder="입학 년도"> <input id="endYear"
										name="endYear" class="col-md-4" type="text"
										placeholder="졸업 년도">
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 학력사항 Form 끝-->

				<!-- 대학정보 Form -->
				<div class="apply_job_form white-bg" id="universityImformation">
					<h4>대학교 정보입력</h4>
					<form id="form3" class="multiForm">
						<div class="row">
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">대학</label>

									<button type="button"
										class="btn dropdown-toggle col-md-9 p-3 mb-4"
										data-toggle="dropdown">전공계열 선택</button>
									<div class="dropdown-menu col-md-9">
										<a class="dropdown-item">대학(2,3년)</a> <a
											class="dropdown-item">대학교(4년)</a> <a class="dropdown-item">대학원(석사)</a>
										<a class="dropdown-item">대학원(박사)</a>
									</div>

								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">학교명</label> <input class="col-md-9"
										name="schoolName" type="text" placeholder="학교 입력">
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">지역</label> <input name="local"
										class="col-md-9" type="text" placeholder="지역 입력">
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">전공</label> <input name="major"
										class="col-md-9" type="text" placeholder="전공 입력">
								</div>
							</div>
							<div class="col-md-12">
								<div class="input_field">
									<label class="col-md-2">재학기간</label><input name="startYear"
										id="startYear" class="col-md-4" type="text"
										placeholder="입학 년도"> <input id="endYear"
										name="endYear" class="col-md-4" type="text"
										placeholder="졸업 년도">
								</div>
								<div class="input_field">
									<label class="col-md-2">학점</label> <input name="score"
										class="col-md-5" type="text" placeholder="학점 입력"> <input
										class="col-md-4" type="text" placeholder="/4.5"
										readonly="readonly">
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 대학정보 Form 끝-->
				<div class="col-md-12 p-3">
					<div class="submit_btn" id="write--submit">
						<button class="boxed-btn3 w-100" type="submit">이력서 저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/juso.js"></script>
<script>

	$('#universityImformation').hide();
		
	$('.level-education').on('click', function() {
		$('.level-education').css('background-color', 'transparent');
		$(this).css('background-color', '#001D38');

		if ($(this).attr('for') == 'elementary') {
			$('.level-education').removeAttr('name');
			$("span").html("초등");
			$('#elementary').attr('name', 'level');
			$('#universityImformation').hide();	
		} else if ($(this).attr('for') == 'middle') {
			$('.level-education').removeAttr('name');
			$("span").html("중");
			$('#middle').attr('name', 'level');
			$('#universityImformation').hide();
		} else if ($(this).attr('for') == 'high') {
			$('.level-education').removeAttr('name');
			$("span").html("고등");
			$('#high').attr('name', 'level');
			$('#universityImformation').hide();
		} else if ($(this).attr('for') == 'university') {
			$('.level-education').removeAttr('name');
			$('#university').attr('name', 'level');
			$('#universityImformation').show();
		}
	});
</script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(
			function() {
				jQuery.fn.serializeObject = function() {
					var obj = null;
					try {
						// this[0].tagName이 form tag일 경우
						if (this[0].tagName
								&& this[0].tagName.toUpperCase() == "FORM") {
							var arr = this.serializeArray();
							if (arr) {
								obj = {};
								jQuery.each(arr, function() {
									// obj의 key값은 arr의 name, obj의 value는 value값
									obj[this.name] = this.value;
								});
							}
						}
					} catch (e) {
						alert(e.message);
					} finally {
					}
					return obj;
				};
			});

	$('#write--submit').on('click', function() {
		var reqResumeBasicDto = $('#form1').serializeObject();
		var reqResumeEducationDto = $('#form2').serializeObject();
		var reqResumeUniversityDto = $('#form3').serializeObject();

		var data = {reqResumeBasicDto, reqResumeEducationDto, reqResumeUniversityDto};
		console.log(data);
		$.ajax({
			type : 'POST',
			url : '/resume/write',
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			dataType : 'json'
		}).done(function(r) {
			if (r.statusCode == 200) {
				alert('수정 성공');
				location.href = '/';
			} else {
				alert('수정 실패');
			}
		}).fail(function(r) {
			alert('수정 실패');
		});

	});
</script>
<script>
	$('.dropdown-item').on('click', function() {
		$('.dropdown-toggle').html($(this).text());
	});
</script>


<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
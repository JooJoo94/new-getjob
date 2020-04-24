<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/nav.jsp"%>

<div class="job_details_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<!-- 자기소개서 Form -->
				<div class="apply_job_form white-bg" id="multiForm">
					<h4>
						<strong>자기소개서</strong>
					</h4>
					<div class="col-md-12 m-4 ">
						<div class="input_field text-right">
							<label class="col-md-3 p-3 text-center essayPlus" id="essayPlus">+ 자소서
								항목 추가</label>
						</div>
					</div>
					<form id="form1" class="multiForm">
						<div class="row">
							<div class="col-md-12">
								<input class="col-md-12 job_form_title" type="text" name="title"
									placeholder="자소서 제목" />
								<div class="input_field">
									<textarea placeholder="자소서 내용" class="essayContent"></textarea>
								</div>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-12 mr-2 text-right">
								<label class="p-3 text-center essayDelete"
									class="essayDelete">삭제</label>
								<label class="p-3 text-center grammerCheck"
									>맞춤법 검사</label>
							</div>
							</div>
					</form>
				</div>
				<!-- 기본정보 Form 끝-->
				<div class="col-md-12 p-3">
					<div class="submit_btn" id="write--submit">
						<button class="boxed-btn3 w-100" type="submit">자기소개서 저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/juso.js"></script>
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
				alert('이력서 저장');
				location.href = '/';
			} else {
				alert('저장 실패');
			}
		}).fail(function(r) {
			alert('저장 실패');
		});

	});
</script>
<script>
	$('.dropdown-item').on('click', function() {
		$('.dropdown-toggle').html($(this).text());
	});
	var i = 1;
	var form;
	$('.essayPlus').on('click', function() {
		i++;
		form = $("#form1").clone();
		form.attr('id', 'form'+i);
		form.find('.essayDelete').attr('id', 'essayDelete'+i);
		$('#multiForm').append(form);	
	});
	$('.essayDelete').on('click', function() {		
		var id=
		i--;
			
	});
</script>


<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
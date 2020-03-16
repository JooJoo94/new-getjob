<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<div class="job_listing_area plus_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="recent_joblist_wrap">
					<div class="recent_joblist white-bg ">
						<div class="row align-items-center">
							<div class="col-md-6">
								<h4>나의 이력서</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="job_lists m-0">
					<div class="row">
					<c:forEach var="resume" items="${resumes}">
						<div class="col-lg-12 col-md-12">
							<div class="single_jobs white-bg d-flex justify-content-between">
								<div class="jobs_left d-flex align-items-center">
									<div class="jobs_conetent">
										<a href="/resume/resumePreview/${resume.id}"><h4>${resume.title}</h4></a>
									</div>
								</div>
								<div class="jobs_right">
									<div class="apply_now">
										<a href="/resume/resumeUpdate/${resume.id}" class="boxed-btn3">Apply Now</a>
									</div>
									<div class="date">
										<p>${resume.createDate}</p>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="pagination_wrap">
								<ul>
									<li><a href="#"> <i class="ti-angle-left"></i>
									</a></li>
									<li><a href="#"><span>01</span></a></li>
									<li><a href="#"><span>02</span></a></li>
									<li><a href="#"> <i class="ti-angle-right"></i>
									</a></li>
								</ul>
							</div>
						</div>
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
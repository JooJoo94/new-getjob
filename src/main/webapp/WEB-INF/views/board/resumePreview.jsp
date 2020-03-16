<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<div class="job_details_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<c:forEach var="basicItem" items="${basic}">
				<div class="container" >
					<h2 style="text-align: center">${basicItem.title}</h2>
					<hr />
					<div class="container">
					<br/>
						<ul class="list-group" style="display: inline-block;">
							<li style="float: auto; width: 200px; height: 100px;" ><strong>${basicItem.name}</strong></li>
							<li style="float: left; width: 200px; height: 100px;" >
							<i class="ti-email"></i>
							${basicItem.email}  </li>
							<li style="float: left; width: 200px; height: 100px;" >
							<i class="ti-tablet"></i>
							${basicItem.phone} </li>
							<li style="float: left; width: 300px; height: 100px;" >
							<i class="ti-home"></i>
							${basicItem.sample_address} ${basicItem.sample_detailAddress}</li>
						</ul>
					</c:forEach>
					</div>
				</div>
				<br /> <br />
				<div class="container">
					<h3>학력</h3>
					<br />
					<table class="table" style="text-align: center">
						<thead class="thead-light">
							<tr>
								<th>재학기간</th>
								<th>구분</th>
								<th>학교명</th>
								<th>전공</th>
								<th>학점</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="educationItem" items="${education}">
							<tr>
								<td>${educationItem.startYear} - ${educationItem.endYear}</td>
								<td>졸업</td>
								<td>${educationItem.schoolName}</td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
						
						<c:forEach var="universityItem" items="${university}">
						<c:if test="${not empty universityItem.schoolName}">
							<tr>
								<td>${universityItem.startYear} - ${universityItem.endYear}</td>
								<td>졸업</td>
								<td>${universityItem.schoolName}</td>
								<td>${universityItem.major}</td>
								<td>${universityItem.score} / 4.5</td>
							</tr>
							</c:if>
						</c:forEach>
						
						</tbody>
					</table>
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
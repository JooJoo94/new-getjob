<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<div class="job_details_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="container" >
					<h2 style="text-align: center">${basic.title}</h2>
					<hr />
					<div class="container">
					<br/>
						<ul class="list-group" style="display: inline-block;">
							<li style="float: auto; width: 200px; height: 100px;" ><strong>${basic.name}</strong></li>
							<li style="float: left; width: 200px; height: 100px;" >
							<i class="ti-email"></i>
							${basic.email}  </li>
							<li style="float: left; width: 200px; height: 100px;" >
							<i class="ti-tablet"></i>
							${basic.phone} </li>
							<li style="float: left; width: 300px; height: 100px;" >
							<i class="ti-home"></i>
							${basic.sample_address} ${basic.sample_detailAddress}</li>
						</ul>
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
							<tr>
								<td>${education.startYear} - ${education.endYear}</td>
								<td>졸업</td>
								<td>${educationItem.schoolName}</td>
								<td></td>
								<td></td>
							</tr>
						<c:if test="${not empty university.schoolName}">
							<tr>
								<td>${university.startYear} - ${university.endYear}</td>
								<td>졸업</td>
								<td>${university.schoolName}</td>
								<td>${university.major}</td>
								<td>${university.score} / 4.5</td>
							</tr>
							</c:if>					
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/code.jquery.com/jquery-1.11.3.min.js"></script>

<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
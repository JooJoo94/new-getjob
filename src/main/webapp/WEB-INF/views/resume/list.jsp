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
										<a href="/resume/preview/${resume.id}"><h4>${resume.title}</h4></a>
									</div>
								</div>
								<div class="jobs_right">
									<div class="apply_now">
										<a href="/resume/update/${resume.id}" class="boxed-btn3">수정하기</a>
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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap");
h4 {
  font-family: "Roboto", sans-serif;
  font-weight: normal;
  font-style: normal;
}
</style>

<!-- job_listing_area_start  -->
<div class="job_listing_area plus_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="job_filter white-bg">
					<div class="form_inner white-bg">
						<h3>Filter</h3>
						<form action="#">
							<div class="row">
								<div class="col-lg-12">
									<div class="single_field">
										<input type="text" placeholder="Search keyword">
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">웹 개발</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">응용프로그램 개발</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">시스템 개발</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">서버.네트워크.보안</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">데이터베이스.DBA</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">하드웨어.소프트웨어</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">ERP.시스템분석.설계</button>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="single_field">
										  <button type="button" class="btn btn-outline-secondary btn-lg w-100 h-20">통신.모바일</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="range_wrap">
						<label for="amount">Price range:</label>
						<div id="slider-range"></div>
						<p>
							<input type="text" id="amount" readonly
								style="border: 0; color: #7A838B; font-size: 14px; font-weight: 400;">
						</p>
					</div>
					<div class="reset_btn">
						<button class="boxed-btn3 w-100" type="submit">Reset</button>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="recent_joblist_wrap">
					<div class="recent_joblist white-bg ">
						<div class="row align-items-center">
							<div class="col-md-6">
								<h4>Job Listing</h4>
							</div>
							<div class="col-md-6">
								<div class="serch_cat d-flex justify-content-end">
									<select>
										<option data-display="Most Recent">Most Recent</option>
										<option value="1">Marketer</option>
										<option value="2">Wordpress</option>
										<option value="4">Designer</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="job_lists m-0">
					<div class="row">
						<c:forEach var="job" items="${jobs}">
							<div class="col-lg-12 col-md-12">
								<div class="single_jobs white-bg d-flex justify-content-between">
									<div class="jobs_left d-flex align-items-center">
										<div class="thumb">
											<img src="${job.image}" alt="">
										</div>
										<div class="jobs_conetent ml-2">
											<a href="http://www.saramin.co.kr${job.href}"><h4 style="Roboto;">${job.title}</h4></a>
											<div class="links_locat d-flex align-items-center">
												<div class="location">
													<p>
														<i class="fa fa-map-marker"></i> ${job.companyName}
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="jobs_right">
										<div class="apply_now">
											</a> <a href="http://www.saramin.co.kr${job.href}" class="boxed-btn3">Apply Now</a>
										</div>
										<div class="date">
											<p>${job.deadLine}</p>
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
<!-- job_listing_area_end  -->
<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
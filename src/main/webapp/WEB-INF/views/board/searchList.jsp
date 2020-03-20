<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<!-- job_listing_area_start  -->
<div class="job_listing_area plus_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="recent_joblist_wrap">
					<div class="recent_joblist white-bg ">
						<div class="row align-items-center">
							<div class="col-md-6">
								<h4>&nbsp;<strong>채용정보</strong></h4>
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
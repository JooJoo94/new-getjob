<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

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
									<div class="job_btn">
										<a id="searchCategory" href="404" class="categoryBtn btn-lg">웹
											개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="407" class="categoryBtn btn-lg">응용프로그램
											개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="408" class="categoryBtn btn-lg">시스템
											개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="402" class="categoryBtn btn-lg">서버.네트워크.보안</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="416" class="categoryBtn btn-lg">데이터베이스.DBA</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="411" class="categoryBtn btn-lg">하드웨어.소프트웨어</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="409" class="categoryBtn btn-lg">ERP.시스템분석.설계</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory" href="410" class="categoryBtn btn-lg">통신.모바일</a>
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
								<h4>
									<strong>채용공고</strong>
								</h4>
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
											<a href="http://www.saramin.co.kr${job.href}"><h4>${job.title}</h4></a>
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
											<a href="http://www.saramin.co.kr${job.href}"
												class="boxed-btn3">지원하기</a>
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
								<ul id="paginate">
									<c:if test="${pageMaker.prev}">
										<li><a href="${pageMaker.startPage-1}"> <i
												class="ti-angle-left"></i>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="i">
										<c:choose>
											<c:when test="${pageMaker.cri.page==i}">
												<li><a href="#"><span>${i}</span></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${i}"><span>${i}</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li><a href="${pageMaker.endPage+1}"> <i class="ti-angle-right"></i>
										</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="perPageNum"
		value="${pageMaker.cri.perPageNum}">
</form>

<script>
	var jobForm = $('#jobForm');

	$('#pagenate a').on('click', function(event) {
		// 원래 a 링크 클릭을 막는다
		event.preventDefault();
		//$(this) = 내가 이벤트 준 것
		var targetPage = $(this).attr('href');
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr('action', '/list').attr('method', 'get');
		jobForm.submit();
	});

</script>

<!-- job_listing_area_end  -->
<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
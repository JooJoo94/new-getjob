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
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=404&pageNum=1"
											class="categoryBtn btn-lg">웹 개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=407&pageNum=1"
											class="categoryBtn btn-lg">응용프로그램 개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=408&pageNum=1"
											class="categoryBtn btn-lg">시스템 개발</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=402&pageNum=1"
											class="categoryBtn btn-lg">서버.네트워크.보안</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=416&pageNum=1"
											class="categoryBtn btn-lg">데이터베이스.DBA</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=411&pageNum=1"
											class="categoryBtn btn-lg">하드웨어.소프트웨어</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=409&pageNum=1"
											class="categoryBtn btn-lg">ERP.시스템분석.설계</a>
									</div>
								</div>
								<div class="col-lg-12 p-2">
									<div class="job_btn">
										<a id="searchCategory"
											href="/board/categoryList?categoryNum=410&pageNum=1"
											class="categoryBtn btn-lg">통신.모바일</a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<br />
					<br />
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
								<input type="hidden" name="currentPage" id="currentPage"
									value="${pageMaker.cri.page}" />
								<ul id="paginate">
									<c:if test="${pageMaker.prev}">
										<li><a
											href="/board/categoryList?categoryNum=${categoryNum}&pageNum=${pageMaker.startPage-1}"
											onclick="prev(this);" id="prev"> <i class="ti-angle-left"></i>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="i">
										<c:choose>
											<c:when test="${pageMaker.cri.page==i}">
												<li><a href="javascript:void(0)" id="page"><span>${i}</span></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="javascript:void(0)"
													onclick="submitCategory(this);"><span>${i}</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li><a
											href="/board/categoryList?categoryNum=${categoryNum}&pageNum=${pageMaker.endPage+1}"
											onclick="next(this);" id="next"> <i
												class="ti-angle-right"></i>
										</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<form id="categoryForm" action="/board/categoryList" method="GET">
						<input type="hidden" name="categoryNum" id="categoryNum"
							value="${categoryNum}" /> <input type="hidden" name="pageNum"
							id="pageNum" />


					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	// 현재 페이지 표시
	$('#page').css('border-color', '#00D363').css('border-width', '2px');

	function submitCategory(e) {

		var categoryForm = $('#categoryForm');
		var pageNum = $(e).text();
		$('#pageNum').attr('value', pageNum);
		categoryForm.submit();
	};

	function prev(e) {
		var startPage = '${pageMaker.startPage}';
		$('#pageNum').attr('value', startPage - 1);
	}

	function next(e) {
		var endPage = '${pageMaker.endPage}';
		$('#pageNum').attr('value', endPage + 1);
	}
</script>

<!-- job_listing_area_end  -->
<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
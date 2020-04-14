<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<!-- catagory_area -->
<div class="catagory_area">
	<div class="container">
		<div class="row cat_search">
			<div class="col-lg-6 col-md-8">
				<div class="single_input">
					<input type="text" id="searchWord" placeholder="검색어"
						onKeypress="enterKeyEvent(event)" />
				</div>
			</div>
			<div class="col-lg-3 col-md-4">
				<div class="single_input">
					<select class="wide" id="searchCategory">
						<option data-display="카테고리">전체</option>
						<option value="404">웹 개발</option>
						<option value="407">응용프로그램 개발</option>
						<option value="408">시스템 개발</option>
						<option value="402">서버.네트워크.보안</option>
						<option value="416">데이터베이스.DBA</option>
						<option value="411">하드웨어.소프트웨어</option>
						<option value="409">ERP.시스템분석.설계</option>
						<option value="410">통신.모바일</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-12">
				<div class="job_btn">
					<a id="search--submit" class="boxed-btn3">검색</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!--/ catagory_area -->

<form id="searchForm" action="/board/searchList" method="GET">
	<input type="hidden" name="wordSubmit" id="wordSubmit" /> <input
		type="hidden" name="categorySubmit" id="categorySubmit" />
</form>

<!-- popular_catagory_area_start  -->
<div class="popular_catagory_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section_title mb-40">
					<h3>직업별(직종)</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="404"/>
					<a href="javascript:void(0)"; onclick="submitCategory(this);"><h4>웹 개발</h4></a>
					<p>
						<span>3068</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="407"/>
					<a href="javascript:void(0)" onclick="submitCategory();"><h4>응용프로그램 개발</h4></a>
					<p>
						<span>3512</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" value="408"/>
					<a href="javascript:void(0)"><h4>시스템 개발</h4></a>
					<p>
						<span>496</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="402"/>
					<a href="javascript:void(0)"><h4>서버.네트워크.보안</h4></a>
					<p>
						<span>2144</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="416"/>
					<a href="javascript:void(0)"><h4>데이터베이스.DBA</h4></a>
					<p>
						<span>685</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="411"/>
					<a href="javascript:void(0)"><h4>ERP.시스템분석.설계</h4></a>
					<p>
						<span>2115</span> position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="409"/>
					<a href="javascript:void(0)"><h4>하드웨어.소프트웨어</h4></a>
					<p>
						<span>568</span>position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_catagory">
					<input type="hidden" class="categoryNum" value="410"/>
					<a href="javascript:void(0)"><h4>통신.모바일</h4></a>
					<p>
						<span>616</span> position
					</p>
				</div>
			</div>
		</div>
	</div>
</div>


<form id="categoryForm" action="/board/categoryList" method="GET">
	<input type="hidden" name="categoryNum" id="categoryNum" /> <input
		type="hidden" name="pageNum" id="pageNum" />
</form>

<!-- popular_catagory_area_end  -->

<!-- job_listing_area_start  -->
<div class="job_listing_area">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6">
				<div class="section_title">
					<h3>채용공고</h3>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="brouse_job text-right">
					<a href="jobs.html" class="boxed-btn4">Browse More Job</a>
				</div>
			</div>
		</div>
		<div class="job_lists">
			<div class="row">
				<div id="num"></div>
				<c:forEach var="board" items="${boards}">
					<div class="col-lg-12 col-md-12">
						<div class="single_jobs white-bg d-flex justify-content-between">
							<div class="jobs_left d-flex align-items-center">
								<div class="thumb">
									<img src="${board.image}"
										style="width: 80px; height: 50px; float: left; padding: auto" />
								</div>
								<div class="jobs_conetent">
									<a href="http://www.saramin.co.kr${board.href}"><h4>${board.title}</h4></a>
									<div class="links_locat d-flex align-items-center">
										<div class="location">
											<p>
												<i class="fas fa-building"></i>${board.companyName}
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="jobs_right">
								<div class="apply_now">
									</a> <a href="job_details.html" class="boxed-btn3">지원하기</a>
								</div>
								<div class="date">
									<p>${board.deadLine}</p>
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
										<li><a href="javascript:void(0)"><span id="page${i}"
												class="pageNum">${i}</span></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/board/page/${i}"><span class="pageNum">${i}</span></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li><a href="${pageMaker.endPage+1}"> <i
										class="ti-angle-right"></i>
								</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- job_listing_area_end  -->

<div class="top_companies_area">
	<div class="container">
		<div class="row align-items-center mb-40">
			<div class="col-lg-6 col-md-6">
				<div class="section_title">
					<h3>Top Companies</h3>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="brouse_job text-right">
					<a href="jobs.html" class="boxed-btn4">Browse More Job</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_company">
					<div class="thumb">
						<img src="/img/svg_icon/5.svg" alt="" />
					</div>
					<a href="jobs.html"><h3>Snack Studio</h3></a>
					<p>
						<span>50</span> Available position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_company">
					<div class="thumb">
						<img src="/img/svg_icon/4.svg" alt="" />
					</div>
					<a href="jobs.html"><h3>Snack Studio</h3></a>
					<p>
						<span>50</span> Available position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_company">
					<div class="thumb">
						<img src="/img/svg_icon/3.svg" alt="" />
					</div>
					<a href="jobs.html"><h3>Snack Studio</h3></a>
					<p>
						<span>50</span> Available position
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-xl-3 col-md-6">
				<div class="single_company">
					<div class="thumb">
						<img src="/img/svg_icon/1.svg" alt="" />
					</div>
					<a href="jobs.html"><h3>Snack Studio</h3></a>
					<p>
						<span>50</span> Available position
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('#search--submit').on('click', function() {

		var searchForm = $('#searchForm');
		var searchWord = $('#searchWord').val();
		$('#wordSubmit').attr('value', searchWord);
		var searchCategory = $('#searchCategory option:selected').val();
		$('#categorySubmit').attr('value', searchCategory);
		searchForm.submit();
	});

	function enterKeyEvent(e) {
		if (e.keyCode == 13) {
			var searchForm = $('#searchForm');
			var searchWord = $('#searchWord').val();
			$('#wordSubmit').attr('value', searchWord);
			var searchCategory = $('#searchCategory option:selected').val();
			searchForm.submit();
		} else {
			e.keyCode == 0;
			return;
		}
	}

	function submitCategory(){
		var categoryForm = $('#categoryForm');
		var categoryNum = $('.categoryNum').val();
		$('#categoryNum').attr('value', categoryNum);
		$('#pageNum').attr('value', 1);
		categoryForm.submit();
		};

	$('.pageNum').on('click', function() {
		$(this).css('border-color', '#00D363').css('border-width', '2px');
	});
</script>

<%@include file="../include/footer.jsp"%>
<%@include file="../include/script.jsp"%>
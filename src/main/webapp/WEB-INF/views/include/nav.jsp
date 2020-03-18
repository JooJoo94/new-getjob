<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Job Board</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/css/magnific-popup.css" />
<link rel="stylesheet" href="/css/font-awesome.min.css" />
<link rel="stylesheet" href="/css/themify-icons.css" />
<link rel="stylesheet" href="/css/nice-select.css" />
<link rel="stylesheet" href="/css/flaticon.css" />
<link rel="stylesheet" href="/css/gijgo.css" />
<link rel="stylesheet" href="/css/animate.min.css" />
<link rel="stylesheet" href="/css/slicknav.css" />

<link rel="stylesheet" href="/css/style.css" />
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid ">
					<div class="header_bottom_border">
						<div class="row align-items-center">
							<div class="col-xl-3 col-lg-2">
								<div class="logo">
									<a href="index.html"> <img src="/img/logo.png" alt="" />
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-7">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="/">홈</a></li>
											<li><a href="#">직무별 <i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="/resume/resumePreview">이력서보기 </a></li>
													<li><a href="/resume/resumeList">이력서목록 </a></li>
													<li><a href="elements.html">elements</a></li>
												</ul></li>
											<li><a href="/resume/resumeList">나의 이력서 <i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="/board/resume">이력서 작성</a></li>
												</ul></li>										
											<li><a href="contact.html">자기소개서</a></li>
										</ul>
									</nav>
								</div>
							</div>

							<c:choose>
								<c:when test="${not empty sessionScope.principal}">
									<div class="col-xl-3 col-lg-3 d-none d-lg-block">
										<div class="Appointment">
											<div class="phone_num d-none d-xl-block">
												<a>${sessionScope.principal.userName} <strong>님</strong></a>
											</div>
											<div class="phone_num d-none d-xl-block">
												<a href="/user/logout">로그아웃</a>
											</div>
											<div class="d-none d-lg-block">
												<a class="boxed-btn3" href="#">Post a Job</a>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-xl-3 col-lg-3 d-none d-lg-block">
										<div class="Appointment">
											<div class="phone_num d-none d-xl-block">
												<a href="/user/login">로그인</a>
											</div>
											<div class="phone_num d-none d-xl-block">
												<a href="/user/join">회원가입</a>
											</div>
											<div class="d-none d-lg-block">
												<a class="boxed-btn3" href="#">Post a Job</a>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>

							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->

	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider  d-flex align-items-center slider_bg_1">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-7 col-md-6"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider_area_end -->
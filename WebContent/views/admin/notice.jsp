<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeVO> notiList = (List<NoticeVO>) request.getAttribute("notiList");
%>	


<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>여행 꽉 잡아</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/themify-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/flaticon.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gijgo.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/slicknav.css">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->


<style>
#targetImg {
	clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
	width: 100%;
	height: 200px;
	object-fit: cover; /* 이미지 비율 유지 및 잘라낸 부분 보이기 */
}

hr {
	border: none; /* 기본 선 제거 */
	border-top: 3px solid gray; /* 원하는 굵기와 색상으로 선 추가 */
	margin: 20px 0;
	margin-left: auto; /* 왼쪽 마진을 자동으로 설정하여 센터 정렬 */
	margin-right: auto;
}

/*  */
input[type="text"] {
	border: 1px solid #ccc;
	/* 테두리 굵기는 1px로 설정하고, 색상은 연하게 회색(#ccc)로 설정합니다. */
}

.searchbar {
	text-align: right;
}

/* Middle column */
hr {
	border: 1px solid #eeebeb;
}

/* 검색창 */
.search-container {
	position: relative;
	width: 200px; /* 원하는 너비로 조절 */
	float: right;
}

input[type="text"] {
	width: 100%;
	padding: 8px;
	border: 2px solid #ccc; /* 테두리 선 굵기와 색상 설정 */
	border-top-color: transparent; /* 상단 테두리 투명하게 설정 */
	border-right-color: transparent; /* 오른쪽 테두리 투명하게 설정 */
	border-left-color: transparent; /* 왼쪽 테두리 투명하게 설정 */
	border-radius: 4px; /* 둥근 모서리 설정 */
}

.search-button {
	position: absolute;
	top: 50%;
	right: 10px; /* 원하는 오른쪽 여백으로 조절 */
	transform: translateY(-50%);
	background: none;
	border: none;
	cursor: pointer;
}

.column.middle {
	width: 60%;
	overflow: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	width: 50%; /* 또는 원하는 너비 */
}

/* 글쓰기 버튼 */
input[type="button"] {
	width: 70px;
	padding: 8px;
	border-radius: 5px;
	float: right;
	background-color: #ffffff;
}

/* footer */
footer {
	background-color: #f4f4f4;
	padding: 20px 0;
	position: relative;
	bottom: 0; /* footer를 페이지 하단에 고정 */
	width: 100%;
	margin-top: 50px; /* footer 위에 추가 공간 확보 */
}

/* 게시글 스타일 */
.board {
	padding: 20px;
	background-color: #ffffff;
	margin: 20px 0; /* 상하 여백 추가 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.post {
	border-bottom: 1px solid #e0e0e0;
	padding: 10px 0;
	position: relative;
	margin: 50px;
}

.post:last-child {
	border-bottom: none;
}

.post-date {
	color: #333;
	font-size: 0.8em;
}

.post-title {
	color: #666;
	margin-top: 10px; /* 게시글 내용 위쪽에 추가 공간 */
	font-size: 25px;
	font-weight: bold;
}

/* .post-title:hover {
    color: #666;
    margin-top: 10px;  /* 게시글 내용 위쪽에 추가 공간 
    color: blue;
}
 */
.post-writer {
	font-size: 1em;
	color: #999;
	margin: 5px;
}

/* 더보기 버튼 start */
.center-container {
	display: flex;
	justify-content: center; /* 버튼을 수평으로 센터 정렬 */
	align-items: center; /* 버튼을 수직으로 센터 정렬 */
	height: 200px; /* 전체 뷰포트 높이 */
	margin: 0; /* 기본 마진 제거 */
	font-family: Arial, sans-serif; /* 기본 폰트 설정 */
}

.more-button {
	width: 200px;
	padding: 10px 20px; /* 상하좌우 패딩 */
	border-radius: 5px; /* 둥근 모서리 설정 */
	cursor: pointer; /* 커서 스타일 변경 */
	transition: background-color 0.3s; /* 배경색 변화 트랜지션 */
	background-color: #ffffff;
}

.more-button:hover {
	background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}
.logo img, .footer_logo img {
	width: 200px;
	height: auto;
}
/* 더보기 버튼 end */
</style>
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid">
					<div class="header_bottom_border">
						<div class="row align-items-center">
							<div class="col-xl-2 col-lg-2">
								<div class="logo">
									<a href="notice.jsp"> <img src="<%=request.getContextPath() %>/resource/여행꽉자바_배경없음.png" alt="">
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a class="active" href="#">홈</a></li>
											<li><a href="#">여행 일정 만들기</a></li>
											<li><a href="#">여행기 쓰기</a>
											</l/li>
											<li><a href="#">커뮤니티</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 d-none d-lg-block">
								<div
									class="social_wrap d-flex align-items-center justify-content-end">
									<div class="number">
										<p>
											<i class="fa fa-phone"></i> 10(256)-928 256
										</p>
									</div>
									<div class="social_links d-none d-xl-block">
										<ul>
											<li><a href="#"> <i class="fa fa-instagram"></i>
											</a></li>
											<li><a href="#"> <i class="fa fa-linkedin"></i>
											</a></li>
											<li><a href="#"> <i class="fa fa-facebook"></i>
											</a></li>
											<li><a href="#"> <i class="fa fa-google-plus"></i>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="seach_icon">
								<a data-toggle="modal" data-target="#exampleModalCenter"
									href="#"> <i class="fa fa-search"></i>
								</a>
							</div>
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

	<div>
		<img id="targetImg" src="<%=request.getContextPath() %>/img/pi.jpg" alt="사진">
	</div>




	<!-- 커뮤니티 게시판 -->
	<div class="row">
		<div class="column middle" style="background-color: white;">

			<br>
			<hr>
			<br>

			<div class="search-container">
				<input type="text" placeholder="검색어를 입력하세요">
				<button class="search-button">
					<!-- 여기에 검색 아이콘 이미지나 텍스트 추가 -->
					<img src="<%=request.getContextPath() %>/img/icon.png" alt="검색" width="30" height="30">
				</button>
			</div>

			<div class="board" >
				
				
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">2 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">3 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">4 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">5 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">6 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">7 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">8 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">9 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
				<div class="post">
					<a href="#">
						<div class="post-date">2024-01-08</div>
						<div class="post-title">10 게시글 제목</div>
						<div class="post-writer">By신하림</div>
					</a>
				</div>
			</div>
			<div>
				<input type="button" value="글쓰기">
			</div>

			<div class="center-container">
				<button class="more-button">더보기</button>
			</div>

			<script>
				// 버튼 클릭 이벤트 리스너 추가 (예시: 콘솔에 메시지 출력)
				document.querySelector('.more-button').addEventListener(
						'click', function() {
							console.log('더보기 버튼이 클릭되었습니다.');
							// 여기에 "더보기" 기능을 추가할 수 있습니다.
						});
			</script>
		</div>




		<!--footer  -->

		<footer class="footer">
			<div class="footer_top">
				<div class="container">
					<div class="row">
						<div class="col-xl-4 col-md-6 col-lg-4 ">
							<div class="footer_widget">
								<div class="footer_logo">
									<a href="#"> <img src="<%=request.getContextPath() %>/img/footer_logo.png" alt="">
									</a>
								</div>
								<p>
									5th flora, 700/D kings road, green <br> lane New York-1782
									<br> <a href="#">+10 367 826 2567</a> <br> <a
										href="#">contact@carpenter.com</a>
								</p>
								<div class="socail_links">
									<ul>
										<li><a href="#"> <i class="ti-facebook"></i>
										</a></li>
										<li><a href="#"> <i class="ti-twitter-alt"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-instagram"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-pinterest"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-youtube-play"></i>
										</a></li>
									</ul>
								</div>

							</div>
						</div>
						<div class="col-xl-2 col-md-6 col-lg-2">
							<div class="footer_widget">
								<h3 class="footer_title">Company</h3>
								<ul class="links">
									<li><a href="#">Pricing</a></li>
									<li><a href="#">About</a></li>
									<li><a href="#"> Gallery</a></li>
									<li><a href="#"> Contact</a></li>
								</ul>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 col-lg-3">
							<div class="footer_widget">
								<h3 class="footer_title">Popular destination</h3>
								<ul class="links double_links">
									<li><a href="#">Indonesia</a></li>
									<li><a href="#">America</a></li>
									<li><a href="#">India</a></li>
									<li><a href="#">Switzerland</a></li>
									<li><a href="#">Italy</a></li>
									<li><a href="#">Canada</a></li>
									<li><a href="#">Franch</a></li>
									<li><a href="#">England</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copy-right_text">
				<div class="container">
					<div class="footer_border"></div>
					<div class="row">
						<div class="col-xl-12">
							<p class="copy_right text-center">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>


		<!-- Modal -->
		<div class="modal fade custom_search_pop" id="exampleModalCenter"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="serch_form">
						<input type="text" placeholder="Search">
						<button type="submit">search</button>
					</div>
				</div>
			</div>
		</div>
		<!-- link that opens popup -->
		<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
		<!-- JS here -->
		<script src="<%=request.getContextPath() %>/js/vendor/modernizr-3.5.0.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/vendor/jquery-1.12.4.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/isotope.pkgd.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/ajax-form.js"></script>
		<script src="<%=request.getContextPath() %>/js/waypoints.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.counterup.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/scrollIt.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.scrollUp.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/wow.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/nice-select.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.slicknav.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/plugins.js"></script>
		<script src="<%=request.getContextPath() %>/js/gijgo.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/slick.min.js"></script>



		<!--contact js-->
		<script src="<%=request.getContextPath() %>/js/contact.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.ajaxchimp.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
		<script src="<%=request.getContextPath() %>/js/jquery.validate.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/mail-script.js"></script>


		<script src="<%=request.getContextPath() %>/js/main.js"></script>
		<script>
			$('#datepicker').datepicker({
				iconsLibrary : 'fontawesome',
				icons : {
					rightIcon : '<span class="fa fa-caret-down"></span>'
				}
			});
		</script>
</body>

</html>
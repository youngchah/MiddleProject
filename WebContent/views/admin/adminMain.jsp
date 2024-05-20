<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<NoticeVO> notiList = (List<NoticeVO>) request.getAttribute("notiList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Main</title>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/resource/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">
<!-- <link rel="stylesheet" href="../../css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="../../css/themify-icons.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/nice-select.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/flaticon.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/gijgo.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
<!-- <link rel="stylesheet" href="../../css/slick.css"> -->
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
	object-fit: cover;
}

hr {
	border: none;
	border-top: 3px solid gray;
	margin: 20px 0;
	margin-left: auto;
	margin-right: auto;
}

input[type="text"] {
	border: 1px solid #ccc;
}

.searchbar {
	text-align: right;
}

.column.middle {
	width: 60%;
	overflow: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}

footer {
	background-color: #f4f4f4;
	padding: 20px 0;
	position: relative;
	bottom: 0;
	width: 100%;
	margin-top: 50px;
}

.board {
	padding: 20px;
	background-color: #ffffff;
	margin: 20px 0;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.post {
	border-bottom: 1px solid #e0e0e0;
	padding: 10px 0;
	position: relative;
}

.post:last-child {
	border-bottom: none;
}

.post-date {
	color: #333;
}

.post-title {
	color: #666;
	margin-top: 10px;
	font-size: large;
	font-weight: bold;
}

.post-title:hover {
	color: #666;
	margin-top: 10px;
	color: blue;
}

.post-writer {
	font-size: 0.8em;
	color: #999;
}

.logo img, .footer_logo img {
	width: 200px;
	height: auto;
}
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
									<a href="index.jsp"> <img
										src="<%=request.getContextPath() %>/resource/여행꽉자바_배경없음.png" alt="">
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a class="active" href="#">홈</a></li>
											<li><a href="#">여행 일정 만들기</a></li>
											<li><a href="#">여행기 쓰기</a></li>
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

	


	<!--  -->


	

			<br>
			<hr>
			<br> <br>
			<div class="searchbar">
				<input type="text" id="searchbar" placeholder="검색어를 입력하세요">
			</div>

			
			<table border="1">
			<tr>
			<th>게시글번호</th>
			<th>제목</th>
			<th>날짜</th>
			
			</tr>
					<%
						if (notiList.size() == 0) {
					%>
					<span> 공지사항이 존재하지 않습니다. </span>

					<%
						} else {

					for (NoticeVO nv : notiList) {
					%>
		<tr>
			<td><%=nv.getNotiNum() %></td>
			<td><%=nv.getNotiTitle()%></td> 
			<td><%=nv.getNotiCn() %></td>
			<td><%=nv.getNotiCreate()%></td>
			</tr>
					
					<%
						}
					}
					%>
				</table>


		<!--footer  -->

		<footer class="footer">
			<div class="footer_top">
				<div class="container">
					<div class="row">
						<div class="col-xl-4 col-md-6 col-lg-4 ">
							<div class="footer_widget">
								<div class="footer_logo">
									<a href="#"> <img src="<%=request.getContextPath() %>/resource/여행꽉자바_배경없음.png"
										alt="">
									</a>
								</div>
								<p>
									주소 : 대전광역시 중구 계룡로 846, 3-4층 <br> <a href="#">대표전화 :
										042-222-8202 팩스 : 070-8768-2972</a> <br> <a href="#">gjtmzl456@naver.com</a>
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
						<div class="col-xl-3 col-md-6 col-lg-3"></div>
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
<%@page import="member.vo.MemberVO"%>
<%@page import="member.vo.AdminVO"%>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Logger logger = LogManager.getLogger("log4jexam.sql.Query");
	// 	로그인하는 시점에 LOGIN_USER로 저장해놨으니까 꺼내오기
MemberVO mv = (MemberVO) session.getAttribute("LOGIN_USER");
AdminVO av = (AdminVO) session.getAttribute("LOGIN_ADMIN");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>TripCatch</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resource/favicon.png">
<!-- Place favicon.ico in the root directory -->


<!-- CSS here -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/nice-select.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/gijgo.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animate.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/slicknav.css">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->


<!-- 로그인 왼쪽에 있는 돋보기와 사람모양사진 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/c753e98170.js"
	crossorigin="anonymous"></script>
	



<!-- 최현명 CSS -->
<!-- 장소 추가 및 plan페이지 스타일 시트 -->
<!-- <link rel="stylesheet" href="/TripCatch/css/planstyles.css"> -->
<!-- 장소 추가 스타일 시트 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!--장소 추가 핀셋 아이콘-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<!-- 최현명 CSS -->



<script>
function adminSide() {
	//관리자 사이드바 버튼
	document.getElementById('adminBtn1').onclick = function() {
			/* console.log("Admin button clicked"); */
			var sidebar = document.getElementById("admin_sidebar");
			if (sidebar.style.width == "300px") {
				sidebar.style.width = "0";
			} else {
				sidebar.style.width = "300px";
			}
		}


	document.addEventListener('click', function(event) {
		var sidebar = document.getElementById('admin_sidebar');
		var menuBtn = document.getElementById('adminBtn1');

		// 메뉴 버튼 또는 사이드바 내부에서 클릭된 경우는 무시합니다.
		if (sidebar.contains(event.target)
				|| menuBtn.contains(event.target)) {
			return;
		}

		// 그 외의 경우에는 사이드바를 닫습니다.
		if (sidebar.style.width == "300px") {
			sidebar.style.width = "0";
		}
	});
	function confirmLogout() {
		// 확인 창을 띄우고 확인 누를 경우 로그아웃, 취소 누를 경우 페이지에 머무름
		return confirm("로그아웃 하시겠습니까?");
	}


}
document.addEventListener("DOMContentLoaded", adminSide)
</script>

<!-- 사이드바 css -->
<link rel="stylesheet" href="/TripCatch/css/sidebar-city.css">

</head>

<!-- header-start -->
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid">
				<div class="header_bottom_border">
					<div class="row align-items-center">
						<div class="col-xl-2 col-lg-2">
							<div class="logo">
								<a href="<%=request.getContextPath()%>/index.jsp"> <img
									src="<%=request.getContextPath()%>/resource/여행꽉자바_배경없음.png"
									alt="logo">
								</a>
							</div>
						</div>
						<div class="col-xl-8 col-lg-8">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation" style="text-align: right">
										<li><a class="active" href="#" id="menuBts">주요도시</a></li>


										<%
											if (mv == null) {
										%>
										<li><a href="<%=request.getContextPath() %>/login.do" onclick="loginAlert()">여행일정 만들기</a></li>
										<%
											} else {
										%>
										<li><a href="/TripCatch/views/plan/insertplan.jsp">여행일정
												만들기</a></li>
										<%
											}
										%>



										<li><a class=""
											href="<%=request.getContextPath()%>/log/logInsert.do">여행기록
												작성</a></li>
										<li><a class=""
											href="<%=request.getContextPath()%>/community/list.do">커뮤니티</a>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-2 col-lg-2 d-none d-lg-block">
							<div
								class="social_wrap d-flex align-items-center justify-content-end">
								<div class="number">
									<p>
										<!-- 검색 -->
										<a data-toggle="modal" data-target="#exampleModalCenter"
											href="#"> <i class="fa-solid fa-magnifying-glass"></i>
										</a>
									</p>
								</div>
								<div class="social_links d-none d-xl-block">
									<ul>
										<%
											if (mv != null) {
										%>
										<!-- 마이페이지 -->
										<li><a href="#"
											class="mypage" id="menuBts1"> <i class="fa-solid fa-user"></i>
												마이페이지
										</a></li>
										<%
											} else if (av != null) {
										%>
										<!-- 관리자 로그인 후 -->
										<!-- 관리자페이지 눌렀을 때 나오는 토글 메뉴 -->
										<li><a href="#"
											class="admin" id="adminBtn1"> <i class="fa-solid fa-user"></i>
												관리자페이지
										</a>
										 <%
											} else {
										%>
										<!-- 로그인 -->
										<li><a href="<%=request.getContextPath()%>/login.do">
												<i class="fa-solid fa-user"></i> 로그인
										</a></li>
										<%
											}
										%>

									</ul>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>


	<div id="admin_sidebar" class="admin_sidebar">
		<!-- ì¬ì´ëë° ë´ì© -->
		<div>
			<img src="<%=request.getContextPath()%>/img/maincity/프로필사진.png"
				alt="프로필 사진"> <span class="nick">관리자</span>
		</div><br>
		<hr>
		<!-- 회원 관리 -->
		<a href="<%=request.getContextPath()%>/memberList.do">회원 관리</a>
		<hr>
		<!-- 여행기록 관리 -->
		<a href="<%=request.getContextPath()%>/mypage/myTripLog.do">여행기록 관리</a>
		<hr>
		<!-- 여행일정 관리  -->
		<a href="<%=request.getContextPath()%>/##">여행일정 관리</a>
		<hr>
		<!-- 커뮤니티 관리 -->
		<a href="<%=request.getContextPath()%>/##">커뮤니티 관리</a>
		<hr>
		<!-- 고객센터 관리 -->
		<a href="<%=request.getContextPath()%>/mypage/cs">고객센터 관리</a>
		<hr><br><br><br>
		<!-- 로그아웃 -->
		<hr>
		<a href="<%=request.getContextPath()%>/adminLogout.do"
			onclick="return confirmLogout()">로그아웃</a>
		<hr>
	</div>


<div id="my_sidebar" class="my_sidebar">
	<!-- ì¬ì´ëë° ë´ì© -->
	<div class="imgnick">
	<img src="<%=request.getContextPath()%>/img/maincity/프로필사진.png" alt="프로필 사진">
	
	<%
	
		if(mv == null){
		
	
	%>
	
	<span class="nick">로그인</span>
	
	<%
	
		}else{
	%>
	
	
		<span class="nick">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=mv.getMem_Nick() %></span>
	
	<%
	
	
		}
	
	
	%>
	
	</div>
	<hr>
	<span class="plc">여행일정 1개&nbsp;&nbsp;&nbsp;여행기록 1개&nbsp;&nbsp;&nbsp;커뮤니티 1개</span>
	<hr>
	
	<%
	
			if(mv == null){
	
	%>
	
	
	<a href="<%=request.getContextPath() %>/pasdsad">여행일정관리</a><hr>
	
	<%
	
			}else{
	
	
	%>
	
		<a href="<%=request.getContextPath() %>/plan/list.do?mem_Id=<%=mv.getMem_Id()%>">여행일정관리</a><hr>
	
	<%
	
			}
	
	%>
	
	<a href="<%=request.getContextPath() %>/mypage/myTripLog.do">여행기록관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/myCommu.do">커뮤니티관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/memberInfo.do">계정관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/cs">고객센터</a><hr>
	<a href="<%=request.getContextPath() %>/memberinfo.do">서비스 탈퇴</a><hr>
	<br><br><br> <hr>
	<a href="<%=request.getContextPath() %>/Logout.do" onclick="return confirmLogout()">로그아웃</a><hr>
</div>



	<script>
	
		//주요 도시 사이드 바
		document.getElementById('menuBts').onclick = function(event) {
			var sidebar = document.getElementById("city_sidebar");
			if (sidebar.style.width === "500px") {
				sidebar.style.width = "0";
			} else {
				sidebar.style.width = "500px";
			}
			event.stopPropagation(); // 이 부분을 추가하세요.
		};

		document.addEventListener('click', function(event) {
			var sidebar = document.getElementById('city_sidebar');
			var menuBtn = document.getElementById('menuBts');

			// 메뉴 버튼 또는 사이드바 내부에서 클릭된 경우는 무시합니다.
			if (sidebar.contains(event.target)
					|| menuBtn.contains(event.target)) {
				return;
			}

			// 그 외의 경우에는 사이드바를 닫습니다.
			if (sidebar.style.width === "500px") {
				sidebar.style.width = "0";
			}
		});
		
		//마이페이지 사이드바 
		document.getElementById('menuBts1').onclick = function(event) {
			var sidebar = document.getElementById("my_sidebar");
			if (sidebar.style.width === "500px") {
				sidebar.style.width = "0";
			} else {
				sidebar.style.width = "500px";
			}
			event.stopPropagation(); // 이 부분을 추가하세요.
		};

		document.addEventListener('click', function(event) {
			var sidebar = document.getElementById('my_sidebar');
			var menuBtn = document.getElementById('menuBts1');

			// 메뉴 버튼 또는 사이드바 내부에서 클릭된 경우는 무시합니다.
			if (sidebar.contains(event.target)
					|| menuBtn.contains(event.target)) {
				return;
			}

			// 그 외의 경우에는 사이드바를 닫습니다.
			if (sidebar.style.width === "500px") {
				sidebar.style.width = "0";
			}
		});
		
		
		function loginAlert() {
			alert("로그인이 필요합니다");
		}
/////////////////////////////
			/// 관리자 로그아웃확인
			function confirmLogout() {
		// 확인 창을 띄우고 확인 누를 경우 로그아웃, 취소 누를 경우 페이지에 머무름
		return confirm("로그아웃 하시겠습니까?");
	}

		

	</script>


</header>

	
<!-- header-end -->
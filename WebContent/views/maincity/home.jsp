<%@page import="city.vo.MComVO"%>
<%@page import="city.vo.MLandVO"%>
<%@page import="city.vo.MCityVO"%>
<%@page import="community.vo.ComVO"%>
<%@page import="landmark.vo.LandmarkVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%
		List<MCityVO> cityList = (List<MCityVO>)request.getAttribute("CityList");
		List<MLandVO> landlist = (List<MLandVO>)request.getAttribute("LandList");
		List<MComVO> comlist = (List<MComVO>)request.getAttribute("ComList");
%>

<%@include file="../../include/header.jsp"%>


<%
	// 	vo		  LandMartList     ("land")
// plan vo 여행일정 planList			("plan")
// log vo 여행 기록  logList			("log")

// jsp 단독으로 홈페이지가 켜지는 경우는 서블릿을 통해 값을 안가져오는 코드가 있을때만 가능
// 하지만 jsp 단독으로 홈페이지가 안켜지는 경우는 서블릿을 통해 값을 가져와야되기 때문에 서블릿으로 켜서 홈페이지를 켜야함
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<title>LandMarkList</title>
<link rel="stylesheet" type="text/css"
	href="../../css/maincity/main.css">
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>
</head>


<body>
	<div class="city_name">
	
		<%
		for(MCityVO civ : cityList){
		%>
		<h3><%=civ.getCity_county() %></h3>
		<span class="citym_name"><%=civ.getCity_name() %></span>
		
	</div>

	<!-- 메뉴 -->
	<div class="button-container">
		<div class="button-wrapper" id="homeButton">
			<a href="<%=request.getContextPath()%>/maincity/main.do?city_num=<%=civ.getCity_num() %>">
			<button onclick="showContent('home')">전체</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripPlanButton">
			<a href="#"> 
			<button onclick="showContent('tripPlan')">여행 일정</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripLogButton">
			<a href="#"> 
			<button onclick="showContent('tripLog')">여행 기록</button>
			</a>
		</div>
		<div class="button-wrapper" id="landmarkButton">
			<a href="<%=request.getContextPath()%>/city/landmarklist"> <!-- 수정된 부분: 각 버튼에 하이퍼링크 추가 -->
				<button onclick="showContent('landmark')">랜드마크</button>
			</a>
		</div>
		<div class="button-wrapper" id="communityButton">
			<a href="<%=request.getContextPath()%>/maincity/community.do">
			<button onclick="showContent('community')">커뮤니티</button>
			</a>
		</div>
	</div>
	<%
		}
		%>

	<div class="content" id="contentArea">

		<!-- 여기에 버튼을 눌렀을 때 나타날 내용을 동적으로 추가할 예정입니다. -->
		<div class="home">

			<div class="travel-container">
				<br>
				<h2>여행일정</h2>
				<span>다양한 장소와 리뷰로 만들어진 여행일정을 확인해보세요.</span>
				<div class="more-button-travel">
					<a href="#">
						<button>더보기 🡪</button>
					</a>
				</div>

				<div class="images-container">
					<a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 1">
						<div class="travel">Travel</div>
						<div class="title">강원도 여행기</div> <br>
						<div class="nickname">By 닉네임</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 2">
						<div class="travel">Travel</div>
						<div class="title">강원도 여행기</div> <br>
						<div class="nickname">By 닉네임</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 3">
						<div class="travel">Travel</div>
						<div class="title">강원도 여행기</div> <br>
						<div class="nickname">By 닉네임</div>
					</a>
				</div>
			</div>


			<br> <br> <br>

			<div class="travel-container">
				<br>
				<h2>여행기록</h2>
				<span>여행을 공유 받고 여행에 대한 설렘을 느껴보세요.</span>
				<div class="more-button-schedule">
					<a href="#">
						<button>더보기 🡪</button>
					</a>
				</div>

				<div class="schedule-container">
					<a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 1">
						<div class="travel">Travel</div>
						<div class="title">여행1</div> <br>
						<div class="nickname">By닉네임</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 2">
						<div class="travel">Travel</div>
						<div class="title">여행2</div> <br>
						<div class="nickname">By닉네임</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 3">
						<div class="travel">Travel</div>
						<div class="title">여행3</div> <br>
						<div class="nickname">By닉네임</div>
					</a>
				</div>
			</div>

			<br> <br> <br>

			<div class="landmark-container">
				<div>
					<h2>랜드마크</h2>
					<span>도시의 이미지를 대표하는 랜드마크 정보를 확인해보세요.</span>
					<div class="more-button-landmark">
						<a href="#">
							<button>더보기 🡪</button>
						</a>
					</div>
				</div>

				<!-- 포문 돌리는 곳. -->
				<div class="landmark">
					<a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 1">
						<div class="travel">Travel</div>
						<div class="title">랜드마크1</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 2">
						<div class="travel">Travel</div>
						<div class="title">랜드마크2</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 3">
						<div class="travel">Travel</div>
						<div class="title">랜드마크3</div>
					</a> <a href="#"> <img src="../../img/maincity/프로필사진.png"
						alt="이미지 4">
						<div class="travel">Travel</div>
						<div class="title">랜드마크4</div>
				</div>
			</div>

			<br> <br> <br>

			<div class="community-container">
				<div>
					<h2>커뮤니티</h2>
					<span>여행을 사랑하는 친구들과 여행이야기를 나누어보세요.</span>
					<div class="more-button-community">
						<a href="<%=request.getContextPath()%>/community/list.do">
							<button>더보기 🡪</button>
						</a>
					</div>
				</div>

				<div class="community">
					<a href="#">
						<div class="date">2024-01-15</div>
						<div class="title">제목1</div>
						<div class="nick">By 닉네임</div>
					</a> <a href="#">
						<div class="date">2024-01-15</div>
						<div class="title">제목2</div>
						<div class="nick">By 닉네임</div>
					</a>
				</div>
			</div>


		</div>
	</div>


	<script src="../../js/main/main.js"></script>
	<%@include file="../../include/footer.jsp"%>
</body>
</html>

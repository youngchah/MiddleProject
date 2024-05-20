<%@page import="landmark.vo.LandmarkVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../include/header.jsp" %>

<%
	List<LandmarkVO> landList = (List<LandmarkVO>)request.getAttribute("landList");
// 	List<LandmarkVO> cityList = (List<LandmarkVO>)request.getAttribute("landList");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<title>LandMarkList</title>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/landmarkList.css">
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>
</head>

<body>

	<div class="city_name">

		<%
// 			for (LandmarkVO civ : landList) {
		%>
		<h3></h3>
		<h3><%=landList.get(0).getCityCounty()%></h3>
		<span class="citym_name"><%=landList.get(0).getCityName()%></span>

		<%
// 			}
		%>
	</div>
	<!-- 메뉴 -->
	<div class="button-container">
		<div class="button-wrapper" id="homeButton">
			<a
				href="<%=request.getContextPath()%>/maincity/main.do?city_num=<%=landList.get(0).getCityNum()%>">
				<button onclick="showContent('home')">전체</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripPlanButton">
			<a href="<%=request.getContextPath()%>/plan/listplanBycity.do?city_num=<%=landList.get(0).getCityNum()%>">
				<button onclick="showContent('tripPlan')">여행 일정</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripLogButton">
			<a
				href="<%=request.getContextPath()%>/log/loglistBycity.do?cityNum=<%=landList.get(0).getCityNum()%>">
				<button onclick="showContent('tripLog')">여행 기록</button>
			</a>
		</div>
		<div class="button-wrapper" id="landmarkButton">
			<a href="<%=request.getContextPath()%>/city/landmarklist?cityNum=<%=landList.get(0).getCityNum()%>"> <!-- 수정된 부분: 각 버튼에 하이퍼링크 추가 -->
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
    if (landList.size() == 0) {
%>
    alert("landList.size=0");
    <!-- 아무것도 없는 리스트 만들기 -->
<%
    } else {
        for (int i = 0; i < landList.size(); i++) {
            LandmarkVO lv = landList.get(i);
%>


	<!-- 리스트 테두리 포함 시작 khCmaL fwpVfi -->
	<div class="container__Container-sc-5ea7eb67-0 sc-d882d76e-9 khCmaL fwpVfi">

		<!-- 여기서부터 리스트 전체 시작 시작 aqwlW dvjTnb -->
		<div class="responsive__Responsive-sc-3353f9fe-0 sc-d882d76e-0 aqwlW dvjTnb">

			<!-- 여기서부터 리스트 중 한 개 시작 hgfquE dwcsWL -->
			<a	class="router-guarded-link__A-sc-823aa60e-0 hgfquE sc-d882d76e-1 dwcsWL"
				rel="noopener noreferer"
				href="<%=request.getContextPath() %>/city/landmarkdetail?landName=<%=lv.getLandName() %>"
			> 
				
				<!-- 여기서부터 리스트 중 한 개의 내부 container iLKpSz loescV -->
				<div class="container__Container-sc-5ea7eb67-0 sc-d882d76e-2 iLKpSz loescV">
					

					<!-- 리스트 중 한 개의 내부 중 첫번째 칸 iTfrgG jTkzfI -->
					<!-- 여행장소 번호 -->
					<div color="blue"
						class="text__Text-sc-6cffe184-0 sc-d882d76e-3 iTfrgG jTkzfI"><%=lv.getLandNum() %></div>

					<!-- 리스트 중 한 칸의 내부 중 가운데 iLKpSz dAxKfT -->
					<div class="container__Container-sc-5ea7eb67-0 sc-d882d76e-4 iLKpSz dAxKfT">

						<!-- 내부 가운데 중 타이틀 kMBrSA -->
						<!-- 여행장소 명 -->
						<div class="text__Text-sc-6cffe184-0 sc-d882d76e-5 kMBrSA"><%=lv.getLandName() %></div>

						<!-- 내부 가운데 중 설명 kmXOoF -->
						<!-- 여행장소 제목 -->
						<div size="14" color="gray800"
							class="text__Text-sc-6cffe184-0 sc-d882d76e-6 kmXOoF"><%=lv.getLandTitle() %></div>

						<!-- 하트 있는 곳 iLKpSz jYypYA -->
						<div class="container__Container-sc-5ea7eb67-0 sc-d882d76e-7 iLKpSz jYypYA">

							<!-- 하트 iLKpSz fobRlV -->
							<div
								class="container__Container-sc-5ea7eb67-0 flex-box__FlexBox-sc-df192771-1 iLKpSz fobRlV">
								<svg width="14" height="13" viewBox="0 0 14 13" fill="none"
									xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										clip-rule="evenodd"
										d="M9.41934 1.11108C8.1735 1.11108 7.39242 1.92142 6.99989 2.48619C6.60736 1.92142 5.82664 1.11108 4.58081 1.11108C3.07786 1.11108 1.94434 2.32911 1.94434 3.944C1.94434 7.03872 5.15425 9.1375 6.87856 10.2653C6.91539 10.2891 6.95764 10.3014 6.99989 10.3014C7.04214 10.3014 7.08439 10.2891 7.12086 10.2653C8.84553 9.1375 12.0554 7.03872 12.0554 3.944C12.0554 2.32911 10.9223 1.11108 9.41934 1.11108Z"
										fill="#FD2E69"></path>
                                    <path
										d="M9.41934 1.11108C8.1735 1.11108 7.39242 1.92142 6.99989 2.4862C6.60736 1.92142 5.82664 1.11108 4.58081 1.11108C3.07786 1.11108 1.94434 2.32911 1.94434 3.944C1.94434 7.03872 5.15425 9.1375 6.87856 10.2653C6.91539 10.2891 6.95764 10.3014 6.99989 10.3014C7.04214 10.3014 7.08439 10.2891 7.12086 10.2653C8.84553 9.1375 12.0554 7.03872 12.0554 3.944C12.0554 2.32911 10.9223 1.11108 9.41934 1.11108"
										stroke="#FD2E69" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round">
                                    </path>
                                </svg>
								<!-- 하트 옆 숫자 gYqlYq -->
								<span class="text__Text-sc-6cffe184-0 gYqlYq"><%=lv.getLandLike() %></span>
							</div>
						</div>
						<!-- 하트 있는 곳 끝 -->

						<!-- 내부 중 가운데 중 가장 밑 줄 RUqvc -->
						<div color="gray400" class="text__Text-sc-6cffe184-0 RUqvc"><%=lv.getCityName() %></div>
					</div>

					<img
						src="<%=request.getContextPath()%>/img/landmarkimg/랜드마크<%= i %>.jpg"
						class="sc-d882d76e-8 gffdPI">
				</div> 
				<!-- 여기까지 리스트 중 한 개의 내부 container loescV iLKpSz -->
			</a>
			<!-- 여기까지 리스트 중 한 개 끝 dwcsWL hgfquE -->

		</div>
	</div>

	<%
		}
	}
			
%>

<script src="<%=request.getContextPath() %>/js/landmarklist-script.js"></script>
<%@include file="../../include/footer.jsp" %>
</body>
</html>

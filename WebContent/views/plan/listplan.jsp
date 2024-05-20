<%@page import="plan.vo.CombinePlanVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/include/header.jsp"%>

<%
	//selectMyPlanList 목록
List<CombinePlanVO> myPlanList = (List<CombinePlanVO>) request.getAttribute("selectMyPlanList");
%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">



<style>
.align_center {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	height: 100vh;
	/* 화면의 높이에 맞게 가운데 정렬합니다. */
}

.in_wrap {
	background-color: white;
	border-radius: 8px;
	width: 95vh;
	height: 80vh;
	overflow: auto;
	/* 스크롤이 필요할 때만 스크롤바 표시 */
}

.detail_wrap {
	background-color: white;
	/* 배경을 화이트로 변경 */
	border: 2px solid #f0f0f0;
	/* 외곽 테두리를 옅은 흰색으로 변경 */
	border-radius: 8px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 23px;
	padding-top: 10px;
	padding-left: 10px;
	width: 90vh;
	height: 25vh;
	display: flex;
	transition: box-shadow 0.3s ease;
}

.detail_wrap:hover {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	/* 마우스를 올릴 때 그림자 효과 적용 */
	cursor: pointer;
	/* 커서를 손가락 모양으로 변경 */
}

.detail_map {
	background-color: darkgreen;
	border-radius: 8px;
	width: 35vh;
	height: 23vh;
}

.detail_title {
	background-color: white;
	border-radius: 8px;
	margin: 10px 10px 10px 10px;
	width: 63vh;
	height: 5vh;
	font-size: 1.3rem;
	/* 그림자 스타일 추가 */
}

.detail_date {
	background-color: white;
	border-radius: 8px;
	/* display: flex; */
	margin: 18vh 10px 10px 10px;
	padding-top: 20px;
	text-align: right;
	width: 40vh;
	height: 5vh;
	font-size: 1.0rem;
	/* 그림자 스타일 추가 */
}

.detail_location {
	background-color: white;
	border-radius: 8px;
	height: 45px;
	width: 35vh;
	margin-top: 20px;
	padding-top: 10px;
	padding-left: 10px;
	font-size: 1.005rem;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
	/* 그림자 스타일 추가 */
	overflow-x: auto;
	/* 가로 스크롤을 활성화합니다 */
	white-space: nowrap;
	/* 내용을 한 줄로 유지합니다 */
	overflow: hidden;
	/* 기본적으로 스크롤바 숨기기 */
}

/* 스크롤바 전체 스타일 */
.detail_location::-webkit-scrollbar {
	width: 10px;
	/* 스크롤바의 너비 */
	border-radius: 5px;
	/* 스크롤바의 전체 모서리를 둥글게 */
}

/* 스크롤바 트랙 (바탕) 스타일 */
.detail_location::-webkit-scrollbar-track {
	background: #f1f1f1;
	/* 트랙의 배경색 */
	border-radius: 5px;
	/* 트랙의 모서리를 둥글게 */
}

/* 스크롤바 핸들 (움직이는 부분) 스타일 */
.detail_location::-webkit-scrollbar-thumb {
	background: #888;
	/* 핸들의 배경색 */
	border-radius: 5px;
	/* 핸들의 모서리를 둥글게 */
}

.detail_location::-webkit-scrollbar-thumb:hover {
	background: #555;
	/* 핸들을 마우스로 가리킬 때의 배경색 */
}

.detail_location:hover {
	overflow-x: auto;
	/* 마우스 오버 시 가로 스크롤바 표시 */
}

.title-style {
	font-family: 'Arial', sans-serif;
	/* Font family */
	color: #333;
	/* Font color */
	font-size: 24px;
	/* Font size */
	font-weight: bold;
	/* Font weight */
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
	/* Text shadow for a little depth */
	padding: 10px;
	/* Padding around the text */
	display: inline-block;
	/* Ensures the border-bottom is not full width */
	margin-bottom: 20px;
	border-radius: 15px;
	/* Rounded corners */
	/* Spacing below the title */
}
</style>

<body>


	<!-- ================ contact section start ================= -->



	<div class="align_center">


		<div class="in_wrap">

			<span class="title-style">나의 여행일정</span>
			<!-- 포문 -->

			<%
				int index = 1;
				for (CombinePlanVO myPlan : myPlanList)

			{
			%>
			<a href="/TripCatch/views/plan/detailplan<%=index%>.jsp">
			<div class="detail_wrap" id="myElement_">

				<div id="detail_map" class="detail_map">

					<img
						src="https://maps.googleapis.com/maps/api/staticmap?center=<%=myPlan.getPlan_area_lati()%>,<%=myPlan.getPlan_area_long()%>&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C<%=myPlan.getPlan_area_lati()%>,<%=myPlan.getPlan_area_long()%>&key=AIzaSyBgTmLwYMUYaZiKFkCOfeyFGz-yV1nsALQ"
						alt="Google Map"
						style="width: 26vh; height: 23vh; border-radius: 8px;">


				</div>
				

				<div class="detail_title">

					<strong><%=myPlan.getPlan_title()%> <br> <%=myPlan.getPlan_date()%></strong>

					<div class="detail_location"><%=myPlan.getPlan_area_seq()%></div>

				</div>

				<div class="detail_date"><%=myPlan.getPlan_date_start()%>
					~
					<%=myPlan.getPlan_date_end()%></div>


			</div>
			</a>

			<%
			index++;
				}
			%>


			<!-- 포문 -->

		</div>

	</div>


	<%@include file="/include/footer.jsp"%>
</body>
</html>

<%@page import="city.vo.MComVO"%>
<%@page import="city.vo.MLandVO"%>
<%@page import="city.vo.MCityVO"%>
<%@page import="community.vo.ComVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	List<ComVO> comlist = (List<ComVO>) request.getAttribute("comList");
	List<MCityVO> cityList = (List<MCityVO>)request.getAttribute("CityList");
	List<MLandVO> landlist = (List<MLandVO>)request.getAttribute("LandList");
	List<MComVO> Mcomlist = (List<MComVO>)request.getAttribute("ComList");
%>

<%@include file="../../include/header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Jua&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<title>LandMarkList</title>
<link rel="stylesheet" type="text/css" href="../../css/maincity/community.css">
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>

<style>


body {
    margin: 0px;
    line-height: inherit;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
#contentArea {
    margin-left: 600px;
    margin-right: 600px;
}
*, ::before, ::after {
/*     box-sizing: inherit; */
    border-width: 0px;
    rder-style: none;
}

/* (이거) 도시 이름 */
.city_name {
	margin-left: 600px;
    margin-right: 600px;
    margin-top: 70px;
    margin-bottom: 30px;
	color: #FD4666;
	font-size: 50px;	
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}

.citym_name{
	margin-top: 80px;
}


/* 도시이름 끝 */


.button-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.button-container .button-wrapper {
	border: 1px solid lightgray;
}
.button-container button {
	padding: 15px 45px;
	font-size: 16px;
	background-color: white;
	color: black;
	border: none;
	border-radius: 0; /* 각지게 만들기 */
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	outline: none; /* 추가: 포커스 효과 제거 */
}

#communityButton button {
	padding: 15px 45px;
	font-size: 16px;
	background-color: black;
	color: white;
	border: none;
	border-radius: 0; /* 각지게 만들기 */
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	outline: none; /* 추가: 포커스 효과 제거 */
}

.button-container button:hover {
	background-color: black;
	color: white;
	border-radius: 0;
	border: none;
}

/* 양 옆에 빈공간 만들기 */
.content {
    margin: 20px;
    padding: 25px 25px;
    /* 좌우 25px 여백 추가 */
    box-sizing: border-box;
}

#home-content,
#places-content,
#schedule-content,
#journey-content,
#community-content {
    display: none;
    margin: 0 auto; /* 가운데 정렬을 위해 추가 */
    max-width: 700px; /* 최대 너비 지정 */
}

.search-container {
    display: flex;
    align-items: center;
    float:right;
}

.search-input {
    flex: 1;
    border: none; /* 테두리 제거 */
    padding: 5px; /* 내부 간격 설정 */
    outline: none; /* 포커스 효과 제거 */
}

.search-button {

    background-image: url('<%=request.getContextPath() %>/img/icon.png');
    background-repeat: no-repeat;
    background-size: 20px 20px;
    padding-left: 30px;
    cursor: pointer;
    border: none; /* 테두리 제거 */
    background-color: transparent; /* 배경색 제거 */
    /* 텍스트 숨김 */
    text-indent: -9999px;
    overflow: hidden;
    
}




</style>
</head>

<body>

	<!--이거 넣어주세요  -->
	<div class="city_name">
<%-- 	<% --%>
 		<!-- for(MCityVO civ : cityList){ -->
<%-- 		%> --%>
		<h3>여행을 사랑하는 친구들과 여행이야기를 나누어보세요.</h3>
		<span class="citym_name">커뮤니티</span>
	</div>

	<!-- 메뉴 -->
	<div class="button-container">
		<div class="button-wrapper" id="homeButton">
			<a
				href="<%=request.getContextPath()%>/maincity/main.do?city_num=<%=comlist.get(0).getCityNum()%>">
				<button onclick="showContent('home')">전체</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripPlanButton">
			<a href="<%=request.getContextPath()%>/plan/listplanBycity.do?city_num=<%=comlist.get(0).getCityNum()%>">
				<button onclick="showContent('tripPlan')">여행 일정</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripLogButton">
			<a
				href="<%=request.getContextPath()%>/log/loglistBycity.do?cityNum=<%=comlist.get(0).getCityNum()%>">
				<button onclick="showContent('tripLog')">여행 기록</button>
			</a>
		</div>
		<div class="button-wrapper" id="landmarkButton">
			<a href="<%=request.getContextPath()%>/city/landmarklist?cityNum=<%=comlist.get(0).getCityNum()%>"> 
				<button onclick="showContent('landmark')">랜드마크</button>
			</a>
		</div>
		<div class="button-wrapper" id="communityButton">
			 <a href="<%=request.getContextPath() %>/views/maincity/community.do">
				<button onclick="showContent('community')">커뮤니티</button>
			</a>
		</div>
	</div>



	<div class="content" id="contentArea">
	

			<br>
			<br>

			<div class="search-container">
				<form action="./search.do" method="get" class="search-container">
        			<input type="text" name="com_title" class="search-input" placeholder="검색어를 입력하세요">
       				 <!-- 이미지를 추가한 부분 -->
        			<input type="submit" value="검색" class="search-button">
    			</form>
			</div>
			
			<br>
			<br>
		
			<div class="board" >
			
<%
					for(ComVO cv : comlist){
%>									
				<div class="post">
				
					<div class="post-date" style="padding: 10px 0;" ><%=cv.getComRegi() %></div>
					<a href="<%=request.getContextPath() %>/community/detail.do?com_num=<%=cv.getComNum()%>" style="font-size: 20px;">
						<strong><%=cv.getComTitle()%></strong>
					</a>

					</a>

					
					<%-- <a href="./detail.do?memId=<%=mv.getMemId() %>"><%=mv.getMemName() %></a> --%>
					
					<div class="post-nick" style="padding: 10px 0;">BY <%=cv.getMemNick() %></div>
					<hr>
				</div>
<%		
				}
%>
			</div>
			
	</div>

			
<script src="../../js/maincity/main.js"></script>
<%@include file="../../include/footer.jsp" %>
</body>
</html>

<%@page import="city.vo.MCityVO"%>
<%-- <%@page import="com.itextpdf.tool.xml.html.Div"%> --%>
<%@page import="file.vo.AtchFileVO"%>
<%@page import="log.vo.LogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
	List<MCityVO> cityList = (List<MCityVO>)request.getAttribute("CityList");

	List<LogVO> logList = (List<LogVO>)request.getAttribute("logList");
	List<LogVO> CityLogList = (List<LogVO>)request.getAttribute("CityLogList");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<title>Log List by city</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/loglist.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/maincity/main.css">

<!-- 폰트  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&display=swap" rel="stylesheet">
	
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI/t1f1fVmE2tmJMRd6B1p2JC4l/0S+X55lPf6GI="
            crossorigin="anonymous"></script>


</head>

<style>
.city_name {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}
</style>
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
			<div class="button-wrapper">		<!-- 카멜표기법 주의 -->
			<a href="<%=request.getContextPath()%>/maincity/main.do?city_num=<%=civ.getCity_num()%>">
			<button onclick="showContent('home')">전체</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripPlanButton">
			<a href="#"> 
			<button onclick="showContent('tripPlan')">여행 일정</button>
			</a>
		</div>
		<div class="button-wrapper" id="landmarkButton">
			<a href="<%=request.getContextPath()%>/log/loglistBycity.do?cityNum=<%=civ.getCity_num()%>"> 
			<button onclick="showContent('tripLog')">여행 기록</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripLogButton">
			<a href="<%=request.getContextPath()%>/city/landmarklist?cityNum=<%=civ.getCity_num()%>"> <!-- 수정된 부분: 각 버튼에 하이퍼링크 추가 -->
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
		<div class="custom-hr"></div>

	<!-- 검색   -->
    <div class="loglist-header di_flex">
        <div>
            <ul class="loglist-sel-wrap">
               <li>
                    <!-- 여행 기간과 정렬 옵션을 나타내는 드롭다운 메뉴 -->
                    <select id="logSearchType" name="logSearchType" class="loglist-selbox">
                        <option value="">제목</option>
                    </select>
                    <input type="text" id="logTitle" name="logTitle" placeholder="검색어를 입력하세요." class="loglist-search-box">
                </li>
            </ul>
        </div>
        <div class="loglist-search-form">
            <!-- 검색 버튼을 a 태그로 변경하고 href 속성에 직접 링크 주소 지정 -->
            <a href="#" onclick="performSearch()">
                <i class="fa-solid fa-magnifying-glass">검색</i>
            </a>
        </div>
    </div>
	
            <% if (CityLogList != null && !CityLogList.isEmpty()) { 
                for (LogVO log : CityLogList) {
            %>
	<div class="log-container" id="log-container-<%=log.getLogNum()%>">
        
        <!-- 로그 리스트 아이템 -->
        <div class="log-list">
    <a class="log-link" rel="noopener noreferrer" href="<%=request.getContextPath()%>/log/logdetail.do?logNum=<%=log.getLogNum()%>" style="text-decoration: none;">
        <div class="log-container-inner" style="display: flex;">

            <!-- 로그 내용 컨테이너 -->
            <div class="log-content-container" style="flex: 1;">
                <!-- 카테고리 및 날짜 -->
                <div class="log-category-container">
                    <div style="color: #FD4666;" class="log-category"><%=log.getLogCat() %></div>
                    <div class="log-category-date"><%=log.getLogStart() %>~<%=log.getLogEnd() %></div>
                </div>

                <!-- 로그 제목 -->
                <div style="font-size: 20px; font-weight: bold;" class="log-title"><%=log.getLogTitle() %></div>

                <!-- 작성자 -->
                <div class="log-author"><%=log.getMemNick() %></div>
            </div>

            <!-- 이미지 컨테이너 -->
            <div class="log-image-container" style="flex: 1; text-align: right;">
                <!-- 이미지 요소를 여기에 추가 -->
                <!-- 예: <img src="이미지 경로" alt="이미지 설명"> -->
            </div>
        </div>
    </a>
</div>

        </div>


	<script>
        // HTML 문자열 파싱
        var logContHtml = '<%=log.getLogCont()%>';
        var parser = new DOMParser();
        var logContDoc = parser.parseFromString(logContHtml, 'text/html');

        // 첫 번째 이미지 추출
        var firstImage = logContDoc.getElementsByTagName('img')[0];
        var imgSrc = firstImage ? firstImage.getAttribute('src') : '<%=request.getContextPath()%>/resource/프로필사진_테두리없음.png';
        
        // 이미지 요소 생성 및 추가
        var imgElement = document.createElement('img');
        imgElement.setAttribute('src', imgSrc);
        imgElement.setAttribute('class', 'log-image');
        
        var logContainerId = 'log-container-' + '<%=log.getLogNum()%>';
        var logImageContainer = document.querySelector('#' + logContainerId + ' .log-image-container');
        logImageContainer.appendChild(imgElement);
    </script>
<% } 
                } %>









<script>
function performSearch() {
    var logTitle = document.getElementById("logTitle").value;

    var url = "<%=request.getContextPath()%>/log/logsearch.do?logTitle=" + encodeURIComponent(logTitle);
            
    window.location.href = url;
    
    console.log("컴온");
}


</script>
	

	<script src="../../js/main/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/loglist-script.js"></script>
	<script src="https://kit.fontawesome.com/cf11eabcae.js"
		crossorigin="anonymous"></script>
	<%@include file="/include/footer.jsp"%>
</body>
</html>

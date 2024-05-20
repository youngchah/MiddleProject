<%@page import="java.util.List"%>
<%@page import="log.vo.LogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
    List<LogVO> searchList = (List<LogVO>)request.getAttribute("searchList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
    <title>Log Search Results</title>
    <link rel="stylesheet" type="text/css"
        href="<%=request.getContextPath()%>/css/loglist.css">
<%--     <!-- <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/reset.css"> --> --%>
</head>

<style>
</style>

<body>

    <!-- 메뉴 -->
	<div class="button-wrapper-one">
		<div class="button-container">
			<div class="button-wrapper">
				<button onclick="showContent('home')">전체</button>
			</div>
			<div class="button-wrapper">
				<button onclick="showContent('tripPlan')">여행 일정</button>
			</div>
			<div class="button-wrapper" id="landmarkButton">
				<button onclick="showContent('tripLog')">여행 기록</button>
			</div>
			<div class="button-wrapper">
				<button onclick="showContent('landmark')">랜드마크</button>
			</div>
			<div class="button-wrapper">
				<button onclick="showContent('community')">커뮤니티</button>
			</div>
		</div>
		<div class="custom-hr"></div>
	</div>

	<!-- 검색   -->
    <div class="loglist-header di_flex">
        <div>
            <ul class="loglist-sel-wrap">
               <li>
                    <!-- 여행 기간과 정렬 옵션을 나타내는 드롭다운 메뉴 -->
                    <select id="logSearchType" name="logSearchType" class="loglist-selbox">
                        <option value="">제목</option>
                    </select>
                    <input type="text" id="logTitle" name="logTitle" placeholder="내용을 검색하세요" class="loglist-search-box">
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

    <!-- 검색 결과가 없을 때 표시할 문구 -->
        <% if (searchList != null && !searchList.isEmpty()) { %>
                <% for (LogVO log : searchList) { %>
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
              } else { %>
                <!-- 검색 결과가 없을 때 표시할 내용 -->
                <div class="no-result-message">
                    <p>검색 결과 없음</p>
                </div>
            <% } %>





<script>
function performSearch() {
    var logTitle = document.getElementById("logTitle").value;

    var url = "<%=request.getContextPath()%>/log/logsearch.do?logTitle=" + encodeURIComponent(logTitle);
            
    window.location.href = url;
    
    console.log("컴온");
}


</script>


	<script src="<%=request.getContextPath()%>/js/loglist-script.js"></script>
	<script src="https://kit.fontawesome.com/cf11eabcae.js"
		crossorigin="anonymous"></script>
	<%@include file="/include/footer.jsp"%>
</body>
</html>

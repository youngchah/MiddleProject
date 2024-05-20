<%@page import="log.vo.LogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/header.jsp" %>

<%

	List<LogVO> myLogList = (List<LogVO>)request.getAttribute("myLogList");

%>


<link rel="stylesheet" href="/TripCatch/css/mypage-tripLog.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/mypage-loglist.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/maincity/main.css">
	
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI/t1f1fVmE2tmJMRd6B1p2JC4l/0S+X55lPf6GI="
            crossorigin="anonymous"></script>

<style>
#memberWithdrawBtn {

    background-color: white;
    color: black;
    padding: 10px 20px 13px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 15px;
    cursor: pointer;
    border-radius: 30px;

    /* Remove border */
    border: none;

    /* Add shadow effect */
    box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for background and color */



}

#memberInfoBtn {
    background-color: white;
    color: black;
    padding: 10px 20px 13px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 0px;
    cursor: pointer;
    border-radius: 30px;
    margin-left: -170px; 

    /* Remove border */
    border: none;

    /* Add shadow effect */
    box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for background and color */
}

#memberInfoBtn:hover {
    background-color: black; /* Background becomes black */
    color: white; /* Text becomes white */
}

#memberWithdrawBtn:hover {
    background-color: black; /* Background becomes black */
    color: white; /* Text becomes white */
}

.title2 {

    text-align: center;
    /* 가운데 정렬 */
    margin: 20px 0;
    /* 상하 여백 설정 */
    font-family: 'IBM Plex Sans KR', sans-serif;
    transform: translateX(-280px);

}


.commitButton {

    padding: 5px 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
    background-color: #f4f4f4;
    cursor: pointer;
    margin-left: 1225px;
    margin-bottom: 30px;
    
}

.commitButton:hover {
    background-color: #e0e0e0;
}


.container2 {
    width: 800px;
    /* 필요에 따라 이 값을 조정하세요. */
    margin: 0 auto;
    /* 위 아래 마진 0, 좌우 마진 auto로 설정하여 가운데 정렬합니다. */
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: relative;

    /* 내부 요소들의 절대 위치를 위한 기준점 */
    margin-bottom: 50px;
    /* 아래쪽 여백을 50px로 설정 */
}


.deleteButton {
    background-color: white; /* 배경색 흰색 */
    border: 1px solid grey; /* 진한 회색 테두리 */
    color: black; /* 글자색 검은색 */
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 1200px;
    margin-bottom: 20px;
    cursor: pointer;
    border-radius: 8px;
}

.deleteButton:hover {
    background-color: black; /* 호버시 배경색 검은색 */
    color: white; /* 호버시 글자색 흰색 */
}

/* 리스트 박스안 마진값 알아서 조절 */
.log-container {

    padding: 20px 10px 5px;
    min-width: 280px;
    max-width: 768px;
    box-sizing: border-box;
    float: none;
    background-color: var(--color-white);
    margin-left: auto;
    margin-right: auto;
}

.log-list {
    display: grid;
    grid-template-rows: repeat(5, 1fr);
    justify-items: center;
    column-gap: 20px;
}

.log-link {
    color: -webkit-link;
}

.log-link, .log-item {
    display: inline-block;
    width: 100%;
    border-bottom: 1px solid var(--color-gray-light);
}





.log-container-inner {
    display: grid;
    grid-template-columns: 28px 1fr 125px;
    grid-template-areas: "rank content image";
}




.log-category {
    grid-area: rank;
    color: #FD4666;
    font-weight: bold;
    text-align: left; /* 수정된 부분: 가로 정렬을 위해 text-align를 left로 변경 */
    font-size: 16px;
}

.log-content-container {
    grid-area: content;
    width: 100%;
}

.log-city {
    color: var(--color-blue);
    font-weight: bold;
    font-size: 16px;
}

.log-title {
    color: var(--color-gray);
    font-weight: 500;
    margin: 0;
    font-size: 14px;
    line-height: 20px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
}

.log-heart {
    margin-bottom: 5px;
}

.heart-icon {
    display: inline-flex;
}

.log-author {
    color: var(--color-gray-light);
    font-weight: 500;
    font-size: 13px;
}
/* 사진크기조절  */
.log-image {
    grid-area: image;
    width: 150px;  /*썸네일 가로*/
    height: 150px; /*썸네일 세로*/
    margin-left: 15px;
    border-radius: 6px;
    object-fit: cover;
}

/* Additional Styling for Log Item */
.log-item .log-image-wrap {
    display: inline-block;
    width: 110px;
    height: 110px;
    margin-right: 15px;
    overflow: hidden;
    border-radius: 6px;
}

.log-item .log-image-wrap img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.log-item .log-text-wrap {
    flex-grow: 1;
}

.log-info {
    list-style: none;
    padding: 0;
    margin: 0;
}

.log-schedule, .log-title, .log-nick {
    margin: 0;
    padding: 0;
    font-size: 14px;
    line-height: 1.5;
    color: var(--color-gray);
}

.log-schedule .log-category {
    font-weight: bold;
    color: var(--color-blue);
}

.log-nick {
    color: var(--color-gray-light);
}

.loglist-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    max-width: 780px;
    margin: 0 auto;
}

.loglist-select-wrap {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}


.loglist-select-box, .loglist-textbox {
    outline: none;
    padding: 5px;
    border: none;
    border-bottom: 1px solid var(--color-gray-light);
}

.loglist-search-form button {
    margin-left: 5px;
    background-color: #FD2E69;
    color: var(--color-white);
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}



.log-list-item-divider {
    width: 100%;
    border-bottom: 1px solid var(--color-gray200); /* 변경된 부분 */
   
}

/* 추가된 스타일 */

.log-list {
    display: flex;
    flex-direction: column;
}

.log-list a.log-link {
    display: flex;
    flex-direction: column;
}

.log-list a.log-link::after {
    content: "";
    display: block;
    height: 1px; /* 변경된 부분: 세로선의 길이를 height로 지정 */
    width: 100%;
    background-color: var(--color-gray200); /* 변경된 부분: border-bottom 대신 배경색 사용 */
    position: relative;
    top: 20px; /* 변경된 부분: 여백 추가 */
}




.log-category {
    grid-area: rank;
    color: #FD4666;
    font-weight: bold;
    text-align: left; /* 수정된 부분: 가로 정렬을 위해 text-align를 left로 변경 */
    font-size: 16px;
}



.log-container-inner {
    display: grid;
    grid-template-columns: 28px 1fr 1fr 1fr 125px;
    grid-template-areas: "rank content start end image";
}

.log-category {
    grid-area: rank;
    color: #FD4666;
    font-weight: bold;
    text-align: left;
    font-size: 16px;
}

.log-schedule {
    grid-area: start;
    font-size: 14px;
    line-height: 1.5;
    color: var(--color-gray);
}

.log-end-date {
    grid-area: end;
    font-size: 14px;
    line-height: 1.5;
    color: var(--color-gray);
}

.log-content-container {
    grid-area: content;
    width: 100%;
}

.log-list a.log-link {
    display: flex;
    flex-direction: column;
}



/* 추가된 스타일 */


.log-list {
    display: flex;
    flex-direction: column;
}
.log-category-container {
	margin-bottom: 20px;
}


.log-author {
	
	margin-top: 10px;
	
}

.log-link {
    color: inherit; /* 현재 상속된 색상 사용 */
    text-decoration: none; /* 밑줄 제거 */
}

.log-link:hover {
    color: inherit; /* 현재 상속된 색상 사용 */
}


</style>

<body>
    <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Trip Log</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- ================ contact section start ================= -->

	    <!--planinsert.jsp 폰트-->

    
    <div class="infoAndDelete">
        <button id="memberInfoBtn">나의 여행기록</button>
<!--         <button id="memberWithdrawBtn">임시저장한 여행기록</button> -->
    </div>

<div id="memberInfoContent" class="content">


    <div class="wrapper1">



<!--         <h2 class="title1">나의 여행기록</h2> -->
        <div class="container1">
            <section>
                <form class="formMargin">

	<%
		if (myLogList != null && !myLogList.isEmpty()) { 
			
	    	for (LogVO log : myLogList) {
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
         	</div>
			<% 
			} 
	 }
	%>
	
	
	            
                </form>
            </section>

        </div>
    </div>



    <!-- ================ contact section end ================= -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
    <script>
    	$(document).ready(function () {
    	  $('#memberInfoBtn').click(function () {
    	      $('#memberInfoContent').show();
    	      $('#memberWithdrawContent').hide();
    	  });

    	  $('#memberWithdrawBtn').click(function () {
    	      $('#memberWithdrawContent').show();
    	      $('#memberInfoContent').hide();
    	  });
    	  
    	  
//     	  // 게시글 링크에 대한 클릭 이벤트 처리
//           $('.log-link').click(function (event) {
//              event.preventDefault(); // 기본 동작 중단 (링크 이동 방지)

//              // 선택한 게시글의 ID 가져오기
//              var logId = $(this).data('log-id');

//              // 선택한 게시글로 이동하는 URL 생성
<%-- <%--              var url = '<%=request.getContextPath() %>/log/logdetail.do?logNum=' + logNum; --%> --%>

//              // 새로운 페이지로 이동
//              window.location.href = url;
//           });
    	  
    	});
    	
    </script>

<%@include file="/include/footer.jsp" %>

</body>
</html>
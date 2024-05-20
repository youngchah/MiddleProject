<%@page import="cs.vo.QnaVO"%>
<%@page import="cs.vo.FaqVO"%>
<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<%
QnaVO qv = (QnaVO)request.getAttribute("qv");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripCatch</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cs-css/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&family=Nothing+You+Could+Do&display=swap" rel="stylesheet">

<style>

hr {
	width: 100%;
	border-style: solid;
	border-color: black;
}

.text-container {
    width: 100%;
    margin-top: 30px;
    text-align: left;
    padding: 10px;
    height: 300px;
}


  
.title-wrapper {
    display: flex;
    justify-content: space-between;
}
.title-container {
    text-align: center;
}


.title {
    text-align: center;
    margin: 0;
}
.date {
    margin-left: auto; /* Move the date to the right */
    text-align: right;
    font-size: 16px;
    color: lightgray;
}

.button-container {
	margin-bottom: 40px;
}

.tit {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}

.content-bottom {
/* 	height: 200px; */
	
}

.list-botton-wrapper {
    display: flex;
    justify-content: flex-end; 
}

.list-button, .edit-button, .delete-button{
align-self: flex-end;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 5px;
    background-color: white;
    border: 1px solid lightgray;
    color: black;
    cursor: pointer;
    margin-left: auto; /* 추가: 왼쪽 여백을 최대화하여 오른쪽 정렬 */
}


.list-button:hover {
    background-color: white; 
    color: black;
}

.content.active {
    max-width: 50%; /* 원하는 최대 가로 너비로 조절하세요 */
    margin: 0 auto; /* 중앙 정렬을 위해 추가 */
}

#inquiryButton button {
	background-color: black;
	color: white;
}

#noticeButton button {
	background-color: white;
	color:black;
}
.text-overlay {

	font-family: 'Nothing You Could Do', cursive !important;
}

</style>
</head>
<body>

	<div class="cs_img">
        <img src="<%=request.getContextPath()%>/resource/고객센터.jpg"
            alt="csIMG">
        <div class="text-overlay">Cs Center</div>
    </div>

    <div class="button-container">
		<div class="button-wrapper" id="noticeButton" onclick="location.href='./cs'">
			<button onclick="showContent('notice')">공지사항</button>
		</div>
		<div class="button-wrapper">
			<button onclick="showContent('faq')">자주 묻는 질문</button>
		</div>
		<div class="button-wrapper" id="inquiryButton" onclick="location.href='./qnalist'">
			<button onclick="showContent('inquiry')">1:1 문의하기</button>
		</div>
	</div>


	<div class="content active" id="inquiryContent">
    <div class="board" id="listArea" style="width: 100%;">
        <div class="title-wrapper">
            <div class="cat" style="margin-right: auto;"><%=qv.getQnaCat()%></div>
            <div class="title-container">
                <!-- Center-align only the qnaTitle -->
                <div class="tit" style="text-align: center;"><%=qv.getQnaTitle()%></div>
            </div>
            <div class="date">
                <span class="date"><%=qv.getQnaDate()%></span>
            </div>
        </div>
    </div>
    <!-- 타이틀 밑 수평선태그 추가 -->
    <hr>
    <div class="text-container">
        <p class="noti-cn">
            <%=qv.getQnaCn()%>
        </p>
    </div>
    <hr>
    <!-- 답변 부분 추가 -->
    <% 
    String ansCn = qv.getAnsCn();
    if (ansCn != null && !ansCn.isEmpty()) { 
    %>
        <div class="text-container">
            <p class="noti-cn">
                <strong>답변:</strong>         	<!-- 관리자 로그인 버튼 기능 -->
			<%=ansCn %>
            </p>
        </div>
        <hr>
    <% } else { %>
        <div class="text-container">
            <p class="noti-cn">
                <strong>답변:</strong> 
                        	<%
        		if(av != null){
        	%>
		
		<div>
		<form action="<%=request.getContextPath()%>/qnaAnsInsert.do?notiNum=<%=qv.getQnaNum()%>"
			method="get">
			<input type="hidden" name="qnaNum" value="<%=qv.getQnaNum()%>">
		
			<input type="submit" class="btn btn-danger btn-mb-3" value="답변등록">
		</form>
	</div>
			<%
        		}
         		else{
        	%>
        			<%
        		}
			%>
			아직 답변이 없습니다.
            </p>
        </div>
        <hr>
    <% } %>
    <!--★★목록버튼 오른쪽 정렬 -->
    <div class="content-bottom"></div>
    <div class="row">
			<div class="col-lg-12">
				<!-- 수정, 삭제 버튼 추가 -->
				
				
				<%
					boolean qnaUpdate = (boolean)request.getAttribute("qnaUpdate");
				if (qnaUpdate == true){
					%>
				<button class="edit-button"	onclick="location.href='./qnaupdate.do?qnaNum=<%=qv.getQnaNum()%>'">수정</button>
				<%} %>
				<%  
				boolean qnaDelete = (boolean)request.getAttribute("qnaDelete");
				if(qnaDelete == true){
					%>
				<button class="delete-button" onclick="confirmDelete()">삭제</button>
				<%}%>
				
				
				<button class="list-button"
					onclick="location.href='<%=request.getContextPath()%>/mypage/qnalist'">목록</button>
			</div>
		</div>
</div>






	<div class="faq-container content" id="faqContent">
    <%
    List<FaqVO> faqList = (List<FaqVO>) request.getAttribute("faqList");

    if (faqList != null) {
        int index = 0;
        for (FaqVO fv : faqList) {
    %>
        <div class="board-item">
            <div class="question" onclick="toggleContent('<%= "faqToggle" + index %>', '<%= "faqContent" + index %>')">
                <p>Q <%=fv.getFaqQn() %></p>
                <div class="toggle-icon" id="<%= "faqToggle" + index %>">▼</div>
            </div>
            <div class="toggle-content" id="<%= "faqContent" + index %>">
                <p><b>A </b> <%=fv.getFaqAn() %></p>
            </div>
        </div>
    <%
            index++;
        }
    } else {
    %>
        <p>FAQ 목록이 없습니다.</p>
    <%
    }
    %>
    
    <!-- 추가 FAQ 항목이 있을 경우 반복 -->
</div>
    
    <div class="content" id="inquiryContent">
        <p>1:1 문의하기 내용</p>
    </div>
    
    
<script>
function confirmDelete() {
    // qnaDelete 값이 true일 때만 삭제 확인 대화상자를 띄웁니다.
    var qnaDelete = <%= request.getAttribute("qnaDelete") %>;
    
    if (qnaDelete) {
        // 사용자에게 정말 삭제할 것인지 확인하는 대화상자를 띄웁니다.
        var confirmResult = confirm("정말 삭제하시겠습니까?");

        // 확인을 선택한 경우
        if (confirmResult) {
            // 삭제를 위한 페이지로 이동
            var qnaNum = '<%=qv.getQnaNum()%>';
            location.href = '<%=request.getContextPath()%>/mypage/qnadelete.do?qnaNum=' + qnaNum;
        }
    } else {
        // 삭제 권한이 없는 경우 경고 메시지를 표시할 수 있습니다.
        alert("게시물을 삭제할 권한이 없습니다.");
    }
}
</script>    



<script>
function confirmDelete() {
    // 사용자에게 정말 삭제할 것인지 확인하는 대화상자를 띄웁니다.
    var confirmResult = confirm("정말 삭제하시겠습니까?");

    // 확인을 선택한 경우
    if (confirmResult) {
        // 삭제를 위한 페이지로 이동
        var qnaNum = '<%=qv.getQnaNum()%>';
        location.href = '<%=request.getContextPath()%>/mypage/qnadelete.do?qnaNum=' + qnaNum;
    }
}

</script>

		
<script src="<%=request.getContextPath()%>/js/cs-js/mypage-script-qnalist.js"></script>
</body>
<%@include file="/include/footer.jsp"%>
</html>
<%@page import="cs.vo.FaqVO"%>
<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<%
	NoticeVO nv = (NoticeVO) request.getAttribute("nv");
//List<NoticeVO> notiDetail =(List<NoticeVO>) request.getAttribute("notiDetail");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/cs-css/mypage.css">
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

p.noti-cn {
	white-space: pre-line;
	color: black;
	line-height: 1.5; /* 텍스트 라인 간격을 조절하여 여백을 주세요 */
}

.noti-cn {
	width: 100%;
	white-space: pre-line;
	color: black;
	line-height: 1.5;
	margin-bottom: 0;
}

.title-wrapper {
	display: flex;
	justify-content: space-between;
}

.title {
	/* Remove any existing styles that might affect the layout */
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
	text-align: left; /* 왼쪽으로 정렬 추가 */
}

.content-bottom {
	/* 	height: 200px; */
	
}

.list-botton-wrapper {
	display: flex;
	justify-content: flex-end;
}

.list-button {
/* 	align-self: flex-end; */
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 5px;
	background-color: white;
	border: 1px solid lightgray;
	color: black;
	cursor: pointer;
	/* margin-left: auto; */ /* 추가: 왼쪽 여백을 최대화하여 오른쪽 정렬 */
}

.list-button:hover {
	background-color: white;
	color: black;
}

.content.active {
	max-width: 50%; /* 원하는 최대 가로 너비로 조절하세요 */
	margin: 0 auto; /* 중앙 정렬을 위해 추가 */
}
.btns {
  display: flex;
  justify-content: center;
}

.text-overlay {

	font-family: 'Nothing You Could Do', cursive !important;

}
</style>
</head>
<body>

	<div class="cs_img">
		<img src="<%=request.getContextPath()%>/resource/고객센터.jpg" alt="csIMG">
		<div class="text-overlay">Cs Center</div>
	</div>

	<div class="button-container">

		<div class="button-wrapper" id="noticeButton"
			onclick="location.href='<%=request.getContextPath()%>/mypage/cs'">
			<button onclick="showContent('notice')">공지사항</button>
		</div>


		<div class="button-wrapper">
			<button onclick="showContent('faq')">자주 묻는 질문</button>
		</div>
		<div class="button-wrapper"
		onclick="location.href='<%=request.getContextPath()%>/mypage/qnalist'">
			<button onclick="showContent('inquiry')">1:1 문의하기</button>
		</div>
	</div>


	<div class="content active" id="noticeContent">
		<div class="board" id="listArea" style="width: 50%;">
			<div class="title-wrapper">
				<div class="title">
					<span class="tit"><%=nv.getNotiTitle()%></span>
				</div>
				<div class="date">
					<span class="date"><%=nv.getNotiCreate()%></span>
				</div>
			</div>
		</div>
		<!-- 타이틀 밑 수평선태그 추가  -->
		<hr>
		<div class="text-container">
			<p class="noti-cn">
				<%=nv.getNotiCn()%>
			</p>
		</div>
		<hr>
		<!--★★목록버튼 오른쪽 정렬  -->
		<div class="content-bottom"></div>
		
		<div class="row">
			<div class="col-lg-12 btns">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="list-button"
					onclick="location.href='<%=request.getContextPath()%>/mypage/cs'">
					목록</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 수정삭제	 -->
				<!-- 관리자 로그인 버튼 기능 -->
	<%
		if(av != null){
	%>
	<!-- <a href="/TripCatch/views/mypage/updateNotice.jsp">공지사항 수정</a> -->
<!-- 	<a -->
<%-- 		href="<%=request.getContextPath()%>/noticeUpdate.do?notiNum=<%=nv.getNotiNum()%>">공지사항 --%>
<!-- 		수정</a> -->
<!-- 	<div> -->
		<form action="<%=request.getContextPath()%>/noticeUpdate.do?notiNum=<%=nv.getNotiNum()%>"
			method="get" onsubmit="return update()">
			<input type="hidden" name="notiNum" value="<%=nv.getNotiNum()%>">
			<input type="submit" class="btn btn-danger btn-mb-3" value="수정하기">
		</form>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 	</div> -->
<!-- 		<div> -->
		<form action="<%=request.getContextPath()%>/noticeDelete.do" method="post" onsubmit="return confirmDelete()">
			<input type="hidden" name="notiNum" value="<%=nv.getNotiNum()%>">
			<input type="submit" class="btn btn-danger btn-mb-3" value="삭제하기">
		</form>
<!-- 	</div> -->
	
	<%
		}else{}
	%>
					
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
			<div class="question"
				onclick="toggleContent('<%="faqToggle" + index%>', '<%="faqContent" + index%>')">
				<p>
					Q
					<%=fv.getFaqQn()%></p>
				<div class="toggle-icon" id="<%="faqToggle" + index%>">▼</div>
			</div>
			<div class="toggle-content" id="<%="faqContent" + index%>">
				<p>
					<b>A </b>
					<%=fv.getFaqAn()%></p>
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
	    function update(){
	    	return confirm("공지사항을 수정하시겠습니까?")
	    }
	    
	    
        function confirmDelete() {
            return confirm("공지사항을 삭제하시겠습니까?");
        }
    </script>
	<script src="<%=request.getContextPath()%>/js/cs-js/mypage-script.js"></script>
</body>
<%@include file="/include/footer.jsp"%>
</html>
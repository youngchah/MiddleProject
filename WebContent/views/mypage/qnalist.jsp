<%@page import="cs.vo.QnaVO"%>
<%@page import="cs.vo.FaqVO"%>
<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>TripCatch 고객센터</title>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&family=Nothing+You+Could+Do&display=swap" rel="stylesheet">
									
<style>

.cs_img {
	width: 100%;
	height: 300px;
	margin-top: 20px;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	margin-bottom: 20px;
}

.cs_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0.65;
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 60px;
	font-weight: bold;
}

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

.button-container button:hover {
	background-color: black;
	color: white;
	border-radius: 0;
	border: none;
}

.content {
	display: none;
	padding: 10px;
	margin-top: 10px;
	text-align: center;
}

.content.active {
	display: block;
}
/*초기에 활성화된 버튼  */
#inquiryButton button {
	background-color: black;
	color: white;
}

table {
	/*   table-layout: fixed; */
	
}

table, th, tr {
	text-align: center;
}

.board {
	margin: 0 auto;
}

.pager {
	float: left;
}

#pageArea {
	display: flex;
	justify-content: center;
}

/* FAQ 토글이벤트 */
.board-item {
	border: 1px solid #ccc;
	margin: 10px;
	padding: 10px;
}

.question {
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.toggle-icon {
	margin-left: 10px;
	cursor: pointer;
}

.toggle-content {
	display: none;
	padding-top: 10px;
}

.faq-container {
	width: 50%; /* 이미지의 가로 크기에 따라 조절 */
	margin: 0 auto; /* 중앙 정렬을 위해 추가 */
}

#inquiryContent {
	width: 50%;
	margin: 0 auto; /* 가로 가운데 정렬을 위한 margin 속성 */
}

.board-footer {
	text-align: center;
	margin-top: 20px;
}

.board-footer button {
	padding: 10px 25px;
	font-size: 16px;
	background-color: white;
	color: black;
	border-radius: 10px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
	outline: none;
}

.board-footer button:hover {
	background-color: black;
	color: white;
}
.text-overlay {

	font-family: 'Nothing You Could Do', cursive !important;
}
</style>

</head>
<body>

	<div class="cs_img">
		<img src="<%=request.getContextPath()%>/resource/고객센터.jpg" alt="csIMG">
		<div class="text-overlay">Cs center</div>
	</div>

	<div class="button-container">
		<div class="button-wrapper" id="noticeButton" onclick="location.href='./cs'">
			<button onclick="showContent('notice')">공지사항</button>
		</div>
		<div class="button-wrapper">
			<button onclick="showContent('faq')">자주 묻는 질문</button>
		</div>
		<div class="button-wrapper" id="inquiryButton">
			<button onclick="showContent('inquiry')">1:1 문의하기</button>
		</div>
	</div>

	<div class="content active" id="noticeContent">
		<div class="board" id="listArea" style="width: 50%;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 15%">번호</th>
						<th style="width: 40%">제목</th>
						<th style="width: 15%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
                        List<NoticeVO> notiList = (List<NoticeVO>)request.getAttribute("notiList");
                        if(notiList != null){
                            for(int i=0; i<notiList.size(); i++){
                    %>
					<tr>
						<td><%=notiList.get(i).getNotiNum() %></td>
						<td>
							<!--페이지 링크 상세보기 만들기   --> <a
							href="./notidetail?notiNum=<%=notiList.get(i).getNotiNum()%>">
								<%=notiList.get(i).getNotiTitle() %></a>
						</td>
						<td><%=notiList.get(i).getNotiCreate() %></td>
					</tr>
					<%
                            }//for end
                        } else {
                    %>
					<tr>
						<td colspan="3">게시물 없음</td>
					</tr>
					<%
                        }
                    %>
				</tbody>
			</table>
		</div>
		<!-- 페이징 영역 start -->
		<div id="pageArea">

			<ul class="pager">
				<li class="prev"><a href="#">Prev</a></li>
			</ul>

			<ul class="pagination pager">
				<%
            int sPage = (int)request.getAttribute("sPage");
            int ePage = (int)request.getAttribute("ePage");
            int cPage = (int)request.getAttribute("cPage");
    
            for(int i=sPage; i<=ePage; i++){
                //페이지번호 활성화 처리
                if(cPage == i){
        %>
				<li class="active"><a href="#"><%=i %></a></li>
				<%          
                }else{
        %>
				<li><a href="#"><%=i %></a></li>
				<%
                }
            }//for end %>
			</ul>

			<ul class="pager">
				<li class="next"><a href="#">></i></a></li>
			</ul>
		</div>

	</div>



	<!-- FAQ 섹션을 클릭했을 때 나타날 내용 -->




	<div class="faq-container content" id="faqContent">
		<%
    List<FaqVO> faqList = (List<FaqVO>) request.getAttribute("faqList");
            		

    if (faqList != null) {
        int index = 0;
        for (FaqVO fv : faqList) {
    %>
		<div class="board-item">
			<div class="question"
				onclick="toggleContent('<%= "faqToggle" + index %>', '<%= "faqContent" + index %>')">
				<p>
					Q
					<%=fv.getFaqQn() %></p>
				<div class="toggle-icon" id="<%= "faqToggle" + index %>">▼</div>
			</div>
			<div class="toggle-content" id="<%= "faqContent" + index %>">
				<p>
					<b>A </b>
					<%=fv.getFaqAn() %></p>
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



	<div class="content active" id="inquiryContent">
    <!-- QnA 게시판 -->
    <div class="board" id="qnaBoard">
        <h2>QnA</h2>
        <div class="board-content">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th style="width: 10%;">NO</th>
                        <th style="width: 15%;">유형</th>
                        <th style="width: 45%;">제목</th>
                        <th style="width: 15%;">상태</th>
                        <th style="width: 15%;">등록일자</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	
                        List<QnaVO> qnaCusList = (List<QnaVO>) request.getAttribute("qnaCusList");
                        if (qnaCusList != null && !qnaCusList.isEmpty()) {
                            int index = qnaCusList.size();
                            for (QnaVO qv : qnaCusList) {
                    %>
                                <tr>
                                    <td><%=index%></td>
                                    <td><%=qv.getQnaCat()%></td>
                                    <td>
                                        <a href="./qnacusdetail.do?qnaNum=<%= qv.getQnaNum() %>">
                                            <%=qv.getQnaTitle()%>
                                        </a>
                                    </td>
                                    <td>
                                        <% if (qv.getAnsCn() != null && !qv.getAnsCn().isEmpty()) { %>
                                            <p>답변 완료</p>
                                        <% } else { %>
                                            <p>미답변</p>
                                        <% } %>
                                    </td>
                                    <td><%=qv.getQnaDate()%></td>
                                </tr>
                    <%
                                index--;
                            }
                        } else {
                    %>
                            <tr>
                                <td colspan="6">문의 내역이 없습니다.</td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>




    <!-- 등록하기 버튼 -->
	<div class="board-footer">
    <!-- 문의하기 버튼을 클릭하면 '/your/other/link.jsp'로 이동 -->
    <a href="./qna"><button colspan="6">문의하기</button></a>
</div>
</div>

        

<script>

	
var $j = jQuery.noConflict();

$j(document).ready(function() {
    // 페이징 부분
    $j('.pagination li').on('click', function() {
        // 페이지 이동
        var page = $j(this).text();
        location.href = "/TripCatch/mypage/cs?page=" + page;
    });

    $j('.next').on('click', function() {
        // 다음 페이지로 이동
        var currentPage = parseInt($j('.pagination').children().last().text()) + 1;

        // 현재 페이지가 totalPage보다 클 때 페이지 정보를 넘기지 않음
        var totalPage = <%=request.getAttribute("ttPage")%>;
        if (totalPage < currentPage) return;

        location.href = "/TripCatch/mypage/cs?page=" + currentPage;
    });

    $j('.prev').on('click', function() {
        // 이전 페이지로 이동
        var currentPage = parseInt($j('.pagination').children().first().text()) - 1;

        // 현재 페이지가 0보다 작거나 같을 때 페이지 정보를 넘기지 않음
        if (currentPage <= 0) return;

        location.href = "/TripCatch/mypage/cs?page=" + currentPage;
    });
});
</script>

	<script
		src="<%=request.getContextPath()%>/js/cs-js/mypage-script-qnalist.js"></script>

	<%@include file="/include/cs-footer.jsp"%>

</body>
</html>

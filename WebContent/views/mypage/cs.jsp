<%@page import="cs.vo.QnaVO"%>
<%@page import="cs.vo.FaqVO"%>
<%@page import="cs.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TripCatch 고객센터</title>
									<!--경로에 그냥 /css/mypage.css라고 하면 적용안됨..  -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cs-css/mypage.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&family=Nothing+You+Could+Do&display=swap" rel="stylesheet">
<style>

.text-overlay {

	font-family: 'Nothing You Could Do', cursive !important;

}

</style>


</head>





<body>

    <div class="cs_img">
        <img src="<%=request.getContextPath()%>/resource/고객센터.jpg"
            alt="csIMG">
            <!--글씨체 변경해주세요.  -->
        <div class="text-overlay">Cs center</div>
    </div>

    <div class="button-container">
        <div class="button-wrapper" id="noticeButton">
            <button onclick="showContent('notice')">공지사항</button>
        </div>
        <div class="button-wrapper">
            <button onclick="showContent('faq')">자주 묻는 질문</button>
        </div>
        <div class="button-wrapper">
            <button onclick="redirectToQnaList()">1:1 문의하기</button>
        </div>
    </div>


    <div class="content active" id="noticeContent">
        <div class ="board" id="listArea" style="width: 50%;">
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
                        <td> <!--페이지 링크 상세보기 만들기   -->
                        <a href="./notidetail?notiNum=<%=notiList.get(i).getNotiNum()%>">
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
          <li class="prev"><a href="#"><i class="fa-solid fa-angles-left"></i></a></li>
        </ul>
        
        <ul class="pagination pager">
        <%
          	int sPage = (int)request.getAttribute("sPage");
            int ePage = (int)request.getAttribute("ePage");
            int cPage = (int)request.getAttribute("cPage");
            
/*             int sPage = (int)request.getSession().getAttribute("sPage");
            int ePage = (int)request.getSession().getAttribute("ePage");
            int cPage = (int)request.getSession().getAttribute("cPage"); */
    
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
          <li class="next"><a href="#"><i class="fa-solid fa-angles-right"></i></a></li>
        </ul>

		</div>

			<!-- 관리자 로그인 버튼 기능 -->
			<%
				if(av != null){
			%>
			<div>
				<form action="<%=request.getContextPath()%>/noticeInsert.do">
					<input type="submit" class="btn btn-danger btn-mb-3" value="공지사항 등록">
				</form>
			</div>
			<%
				}
			else{
			%>
			<%}
			%>
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






		<!-- 추가 FAQ 항목이 있을 경우 반복 -->




	<div class="content" id="inquiryContent">
		<!-- QnA 게시판 -->
		<div class="board" id="qnaBoard">
			<h2>QnA</h2>
			<div class="board-content">
				<%
					List<QnaVO> qnaCusList = (List<QnaVO>) request.getAttribute("qnaCusList");
				if (qnaCusList != null && !qnaCusList.isEmpty()) {
					for (QnaVO qv : qnaCusList) {
				%>
				<div class="board-item">
					<p>
						Q
						<%=qv.getQnaTitle()%></p>
					<p>
						<b>A </b>
						<%=qv.getAnsCn()%></p>
				</div>
				<%
					}
				} else {
				%>
				<p>QnA 목록이 없습니다.</p>
				<%
					}
				%>
			</div>
		</div>
		<!-- 등록하기 버튼 -->
		<div class="board-footer">
			<!-- 문의하기 버튼을 클릭하면 '/your/other/link.jsp'로 이동 -->
			<a href="./qna"><button>문의하기</button></a>
		</div>




	</div>




	<script>
		function redirectToQnaList() {
			location.href = "/TripCatch/mypage/qnalist";
		}

		var $j = jQuery.noConflict();

		$j(document)
				.ready(
						function() {
							// 페이징 부분
							$j('.pagination li')
									.on(
											'click',
											function() {
												// 페이지 이동
												location.href = "/TripCatch/mypage/cs?page="
														+ $j(this).text();
											});

							$j('.next')
									.on(
											'click',
											function() {
												// 다음 페이지로 이동
												currentPage = parseInt($j(
														'.pagination')
														.children().last()
														.text()) + 1;

												// 현재 페이지가 totalPage보다 클 때 페이지 정보를 넘기지 않음
												if (
	<%=request.getAttribute("ttPage")%>
		< currentPage)
													return;
												location.href = "/TripCatch/mypage/cs?page="
														+ currentPage;
											});

							$j('.prev')
									.on(
											'click',
											function() {
												// 이전 페이지로 이동
												currentPage = parseInt($j(
														'.pagination')
														.children().first()
														.text()) - 1;

												// 현재 페이지가 0보다 작거나 같을 때 페이지 정보를 넘기지 않음
												if (currentPage <= 0)
													return;
												location.href = "/TripCatch/mypage/cs?page="
														+ currentPage;
											});
						});
	</script>
<script src="<%=request.getContextPath()%>/js/cs-js/mypage-script.js"></script>
<script src="https://kit.fontawesome.com/cf11eabcae.js"
		crossorigin="anonymous"></script>
<%@include file="/include/cs-footer.jsp"%>
</body>
</html>

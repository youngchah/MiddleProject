<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
}

table {
	/*     table-layout: fixed;  */
	
}

table, tr {
	text-align: center;
}

th {
	white-space: nowrap; /* 강제로 줄 바꿈 방지 */
	overflow: hidden; /* 내용이 넘치면 숨기기 */
	text-overflow: ellipsis; /* 내용이 넘칠 경우 말줄임(...) 표시 */
}

td {
	white-space: nowrap; /* 기본 줄 바꿈 허용 */
	overflow: visible; /* 내용이 넘치더라도 숨기지 않음 */
	text-overflow: clip; /* 말 줄임표 사용하지 않음 */
}

.pager {
	float: left;
}

#pageArea {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
    <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Member List</h3>
                    </div>
                </div>
            </div>
        </div>
    </div><br><br><br><br>
	<div style="display: flex; justify-content: center;">
		<div class="col-sm-8 text-left">

			<!-- 리스트출력 영역 start -->

			<h2>회원 전체 리스트</h2>
			<div id="listArea">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 10%">ID</th>
							<th style="width: 10%">이름</th>
							<th style="width: 10%">닉네임</th>
							<th style="width: 10%">이메일</th>
						</tr>
					</thead>
					<tbody>

						<%
							// 메서드: 날짜를 원하는 형식으로 포맷
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

						List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");
						%>

	<%-- 					<%
							if (list.size() == 0) {
						%>
						<tr>
							<td>게시물 없음</td>
						</tr>
						<%
							} else {
 --%>					<% 
						for (MemberVO mmv : list) {
							String formattedDate = dateFormat.format(mmv.getMem_Bir());
						%>
						<tr>
							<td><%=mmv.getMem_Id()%></td>
							<td><%=mmv.getMem_Name()%></td>
							<td><a href="./detail.do?mem_Id=<%=mmv.getMem_Id()%>"><%=mmv.getMem_Nick()%></a></td>
							<td><%=mmv.getMem_Email()%></td>
						</tr>
						<%
							} //for end
						/* } */
						%>


					</tbody>
				</table>
			</div>
			<!-- 리스트출력 영역 end -->

			<!-- 페이징 영역 start -->
			<div id="pageArea">

					<%
					int sPage = (int) request.getAttribute("sPage");
					int ePage = (int) request.getAttribute("ePage");
					int cPage = (int) request.getAttribute("cPage");
					int ttPage = (int) request.getAttribute("ttPage");
					
					%>
				<%if(cPage > 1) {
				%>	
				<ul class="pager">
					<li class="prev"><a href="/TripCatch/memberList.do?page=<%= cPage - 1%>">이전&emsp;</a></li>
				</ul>
				
					<%
				}else{}
					%>			
				
					
				<ul class="pagination pager">
					<% 
					for (int i = sPage; i <= ePage; i++) {
						//페이지번호 활성화 처리
						if (cPage == i) {
					%>
					<li class="active"><a href="#"><%=i%>&emsp;</a></li>
					<%
						} else {
					%>
					<li><a href="/TripCatch/memberList.do?page=<%=i%>"><%=i%>&emsp;</a></li>
					<%
						}
					} //for end
					%>
				</ul>
			
				<%if(ttPage > cPage){
				
				%>
				<ul class="pager">
					<li class="next"><a href="/TripCatch/memberList.do?page=<%=cPage + 1%>">다음</a></li>
				</ul>
				<% 
				}else{}
				%>
					
			</div>
			<!-- 페이징 영역 end -->
		
		</div>

		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script>
			$('.pagination li').on('click', function() {
				// 		alert( $(this).text() );
				location.href = "/TripCatch/memberList.do?page=" + $(this).text();
			});

			$('.next').on('click',function() {
				// 		alert( parseInt($('.pagination').children().last().text()) +1 );
				currentPage = parseInt($('.pagination').children().last().text()) + 1;
				console.log(currentPage)

				//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
				if (<%=request.getParameter("ttPage")%> < currentPage ) return;
					location.href = "/TripCatch/memberList.do?page=" + currentPage;
					});
			$('.prev').on('click',function() {

				currentPage = parseInt($('.pagination').children()
								.first().text()) - 1;
				//현재페이지가 0보다 작거나 같을 때
				if (currentPage <= 0) return;
				location.href = "/TripCatch/memberList.do?page=" + currentPage;
					});
		</script>





	</div>
	<%@include file="/include/cs-footer.jsp"%>
</body>
</html>
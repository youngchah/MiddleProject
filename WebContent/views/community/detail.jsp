<%@page import="community.vo.ComVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.vo.MemberVO" %>

<%@include file="../../include/header.jsp" %>

<%
	ComVO cv = (ComVO)request.getAttribute("cv"); //멤닉을 가져온것임
	
	String nick = (String)session.getAttribute("nick");
	
	//LOGIN_USER 객체를 가져와서  닉네임을 꺼낸다.
	MemberVO mmv = (MemberVO) session.getAttribute("LOGIN_USER");
	
	

%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 상세보기</title>
    <link rel="stylesheet" href="../css/comment.css" />
    <style>
* {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
}

body {
	font-size: 20px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
}

.post {
	border: 1px solid #ccc;
	padding: 20px;
	margin-bottom: 20px;
	border-radius: 5px;
}

.post-title {
	font-size: 24px;
	margin-bottom: 10px;
}

.post-info, .post-city {
	font-size: 14px;
	color: #777;
	margin-bottom: 10px;
}

.post-content {
	margin-bottom: 20px;
}

.comment-section {
	border-top: 1px solid #ccc;
	padding-top: 20px;
	text-align: center;
}

.comment-input {
	width: 97%;
	padding: 10px;
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.comment-button {
	padding: 10px 20px;
	background-color: #ffffff;
	color: #3b3a3a;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	position: absolute;
	right: 590px;
	bottom: 255px;
	font-size: 15px;
}

.list-link,
.action-button {
    border: 1px solid #3b3a3a;
    display: inline-block;
    padding: 10px 20px;
    background-color: #ffffff;
    color: #3b3a3a;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-size: 18px;
    margin: 5px; /* 수정한 부분: auto 제거 */
}

.action-button {
    margin-left: 10px; /* 수정한 부분: 오른쪽으로 간격 추가 */
}

.list-link:hover,
.action-button:hover {
    background-color: #555;
    color: #ffffff;
}

.comment-section {
    text-align: center;
}
</style>
</head>

<body>

    <div class="container">
        <div class="post">
            <div class="post-city"><%=cv.getCityName()%></div>
            
            <div class="post-title"><%=cv.getComTitle()%></div>
            <div class="post-info"> <%=cv.getMemNick()%>&nbsp;&nbsp;│&nbsp;&nbsp;<%=cv.getComRegi()%></div>
            
            <hr>
            <br>
            <div class="post-content"><%=cv.getComCont()%></div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <!-- 추가된 목록 하이퍼링크 버튼 -->
            <div class="comment-section">
    <a href="./list.do" class="list-link">목록</a> <!-- 목록으로 이동하는 하이퍼링크 -->

    <%
    if(mmv != null) {
        if(cv.getMemNick().equals(mmv.getMem_Nick())){
    %>
            <a href="update.do?com_num=<%=cv.getComNum()%>" onclick="return confirm('정말로 수정하시겠습니까?');" class="action-button">수정</a>
            <a href="delete.do?com_num=<%=cv.getComNum()%>" onclick="return confirm('정말로 삭제하시겠습니까?');" class="action-button">삭제</a>
            <input type="hidden" id="nickValue" value="<%=mmv.getMem_Nick()%>" />
    <%
        }
    }
    %>

    <div>
                    <ul class="comment">
                        <li class="comment-form">
                            <form id="commentFrm">
                                <h4>댓글쓰기 <span></span></h4>
                                <span class="ps_box">
                                    <input type="text" placeholder="댓글 내용을 입력해주세요." class="int" name="content" />
                                </span>
                                <%-- <a href=commentinsert.do?content=<%= %>>등록</a> --%>
                                 <input type="submit" class="btn" value="등록" />
                            </form>
                        </li>
                        <li id="comment-list"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
<%--     <input type="hidden" id="nickValue" value="<%=nick%>" /> --%>

    
    

</body>

</html>
<script src="../../js/comment.js"></script>
<%@include file="../../include/cs-footer.jsp" %>
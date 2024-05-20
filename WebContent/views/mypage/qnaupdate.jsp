<%@page import="cs.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 꽉 자바 고객센터</title>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&family=Nothing+You+Could+Do&display=swap" rel="stylesheet">

<%-- 	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cs-css/main.css" /> --%>
<%--     <noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/css/cs-css/noscript.css" /></noscript> --%>

<style>
section {
	width: 60%;
	margin: auto;
	padding: 20px;
}

.content {
	width: 50%;
	margin: auto;
}

form {
	width: 100%;
}

.field {
	margin-bottom: 15px;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="radio"] {
	margin-right: 5px;
}

/* 문의글 등록 버튼 */
ul.actions {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: flex-end; /* Move the button to the right */
}

input[type="submit"] {
	background-color: #FD4666; /* Set the background color to FD4666 */
	color: white;
	padding: 10px 15px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s; /* Add a smooth transition effect */
}

input[type="submit"]:hover {
	background-color: #FF667F;
	/* Change the hover background color to a lighter shade */
}

.field.third {
	display: inline-block;
	width: calc(25% - 5px);
	
}

.cs-1 {
	text-align: center;
}

/* 헤더 밑 이미지 */
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

#successMessage {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #FD4666; /* Updated to the main color */
    color: white;
    text-align: center;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
    
    <section>
        <header>
            <h3 class="cs-1">1:1 문의 수정</h3>
        </header>
        <div class="content">
    					
    					
    	<%QnaVO qv = (QnaVO) request.getAttribute("qv"); %>				
    					
    					
    										<!-- 컨트롤러 webServlet의 경로를 맞춰야 한다 ... 보내려는 곳 .. 그쪽으로 가야 짜놓은 로직이 실행됨 -->
            <form method="post" action="<%=request.getContextPath()%>/mypage/qnaupdate.do" enctype="multipart/form-data">
            	<input type="hidden" name="qnaNum" value ="<%=qv.getQnaNum()%>">
                <div class="fields">
                    <div class="field half">
                        <label for="name">제목</label>
                        <input type="text" name="qnaTitle" id="name" value="<%=qv.getQnaTitle()%>">
                    </div>
                   
                    <div class="field third">
                        <input type="radio" id="priority-low" name="qnaCat" value="<%=qv.getQnaCat()%>">
                        <label for="priority-low">회원관련</label>
                    </div>
                    <div class="field third">
                        <input type="radio" id="priority-normal" name="qnaCat" value="<%=qv.getQnaCat()%>">
                        <label for="priority-normal">일정관련</label>
                    </div>
                    <div class="field third">
                        <input type="radio" id="priority-high" name="qnaCat" value="<%=qv.getQnaCat()%>">
                        <label for="priority-high">기록관련</label>
                    </div>
                     <div class="field third">
                        <input type="radio" id="priority-high" name="qnaCat" value="<%=qv.getQnaCat()%>">
                        <label for="priority-high">기타문의</label>
                    </div>
                   
                    <div class="field">
                        <label for="message">문의내용</label>
                        <textarea name="qnaCn" id="message" rows="6"><%=qv.getQnaCn() %></textarea>
                    </div>
                    
                    
                    
                    
                    
                </div>
                <ul class="actions">
                    <li><input type="submit" name="submit" id="submit" value="문의글 등록"></li>
                </ul>
            </form>
    
        </div>
    </section>
    


<div id="successMessage">
    문의글이 성공적으로 수정되었습니다.
</div>


<script>


	function showSuccessMessage() {
		var successMessage = document.getElementById('successMessage');
		successMessage.style.display = 'block';

		// Optionally, you can set a timeout to hide the message after a few seconds
		setTimeout(function() {
			successMessage.style.display = 'none';
		}, 5000); // 5000 milliseconds (5 seconds)
	}

	function validateForm() {
		var title = document.getElementById('name').value;
		var category = document.querySelector('input[name="qnaCat"]:checked');
		var message = document.getElementById('message').value;

		if (title.trim() === '' || category === null || message.trim() === '') {
			alert('양식을 모두 입력하세요.');
			return false;
		}

		return true;
	}

	document.getElementById('submit').addEventListener('click',
			function(event) {
				if (!validateForm()) {
					event.preventDefault(); // 폼 제출을 막습니다.
				} else {
					showSuccessMessage();
				}
			});
</script>
<%@include file="/include/cs-footer.jsp"%>

</body>


</html>
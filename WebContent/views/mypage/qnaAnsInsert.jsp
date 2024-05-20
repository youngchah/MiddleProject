<%@page import="cs.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/include/header.jsp" %>
    
<%
QnaVO qv = (QnaVO) request.getAttribute("qv");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
<style>
.qnaAns {
	width: 410px;
	position: absolute;
	left: 50%;
	top: 50%;
	/* 	border: 1px solid red; */
	transform: translate(-50%, -50%);
}

.qnaAns h2 {
	padding: 0 0 20px;
	border-bottom: 1px solid black;
	text-align: center;
	line-height: 1; /* 간격 */
	font-size: 32px;
	color: black;
}

.qnaAns p {
	padding: 0 0 20px;
}

.qnaAns p input {
	width: 100%;
	box-sizing: border-box;
	height: 46px;
}
/* placeholder 속성 잡는방법 */
.qnaAns p input::-webkit-input-placeholder {
	font-size: 16px;
}

#ans_cn {
	width: 100%;
}

.qnaAns input[type="submit"] {
	width: 100%;
	height: 56px;
	background: rgb(253, 70, 102);
	font-size: 18px;
	color: white;
}
/* .login button{
	width: 100%;
	height: 56px;
	background: rgb(253,70,102);
	font-size: 18px;
	color: white;
} */

img {
	size: 100px;

}
</style>
</head>
<body>
	<form action="<%=request.getContextPath() %>/qnaAnsInsert.do" method="post" onsubmit="return valid()">
		<section class="qnaAns">
		<input type="hidden" name="qna_num" value ="<%=qv.getQnaNum()%>">
			<h2>답변 등록</h2>
			<div class="text-container">
				<p>
				문의 내용 : <%=qv.getQnaCn()%>
				</p> 
				
				<p>
					<textarea rows="10" placeholder="답변입력" title="내용" name="ans_cn" id="ans_cn" ></textarea>
				</p>
				<%
					if(av != null){
				%>
				<div>
					<input type="submit" id="insertAns" value="답글 등록">
					<!-- <button>로그인</button> -->
				</div>
				<% 
					}
				else{
				%>
				<%} %>
				<!-- 		<li></li>   -->
			</div>

		
		</section>

	</form>
	<script>

		function valid() {
			var content = document.getElementById("ans_cn").value;

			if (content.trim() == "") {
				alert("답변이 등록되지 않았습니다");
				return false;
			} else {

				return confirm("답변을 등록합니다");
			}s

		}
	</script>

</body>
</html>
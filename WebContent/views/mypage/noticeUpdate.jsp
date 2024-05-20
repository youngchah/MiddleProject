<%@page import="cs.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/include/header.jsp" %>
    
<%
NoticeVO nv = (NoticeVO) request.getAttribute("nv");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
.notiUpdate {
	width: 410px;
	position: absolute;
	left: 50%;
	top: 50%;
	/* 	border: 1px solid red; */
	transform: translate(-50%, -50%);
}

.notiUpdate h2 {
	padding: 0 0 20px;
	border-bottom: 1px solid black;
	text-align: center;
	line-height: 1; /* 간격 */
	font-size: 32px;
	color: black;
}

.notiUpdate p {
	padding: 0 0 20px;
}

.notiUpdate p input {
	width: 100%;
	box-sizing: border-box;
	height: 46px;
}
/* placeholder 속성 잡는방법 */
.notiUpdate p input::-webkit-input-placeholder {
	font-size: 16px;
}

#noti_cn {
	width: 100%;
}

.notiUpdate input[type="submit"] {
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
	<form action="<%=request.getContextPath() %>/noticeUpdate.do" method="post" onsubmit="return valid()">
		<section class="notiUpdate">
		<input type="hidden" name="noti_num" value ="<%=nv.getNotiNum()%>">
			<h2>공지 사항 수정</h2>
			<div>
				<p>
					<input type="text" placeholder="공지사항 제목" title="제목" name="noti_title" value="<%=nv.getNotiTitle() %>" id="noti_title">
				</p>
				<p>
					<textarea rows="10" placeholder="내용" title="내용" name="noti_cn" id="noti_cn" ><%=nv.getNotiCn() %></textarea>
				</p>
				<div>
					<input type="submit" id="updatenotic" value="공지사항 수정">
				</div>
			</div>

		
		</section>

	</form>
	
<script>
	function valid(){
		return confirm("공지사항을 수정합니다");
		
	}

</script>

</body>
</html>
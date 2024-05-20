<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
.notiInsert {
	width: 410px;
	position: absolute;
	left: 50%;
	top: 50%;
	/* 	border: 1px solid red; */
	transform: translate(-50%, -50%);
}

.notiInsert h2 {
	padding: 0 0 20px;
	border-bottom: 1px solid black;
	text-align: center;
	line-height: 1; /* 간격 */
	font-size: 32px;
	color: black;
}

.notiInsert p {
	padding: 0 0 20px;
}

.notiInsert p input {
	width: 100%;
	box-sizing: border-box;
	height: 46px;
}
/* placeholder 속성 잡는방법 */
.notiInsert p input::-webkit-input-placeholder {
	font-size: 16px;
}

#noti_cn {
	width: 100%;
}

.notiInsert input[type="submit"] {
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
	<form action="<%=request.getContextPath() %>/noticeInsert.do" method="post" onsubmit="return valid()">
		<section class="notiInsert">
			<h2>공지 사항 등록</h2>
			<div>
				<p>
					<input type="text" placeholder="공지사항 제목" title="제목" name="noti_title" id="noti_title">
				</p>
				<p>
					<textarea rows="10" placeholder="내용" title="내용" name="noti_cn" id="noti_cn" ></textarea>
				</p>
				<div>
					<input type="submit" id="insertnotic" value="공지사항 등록">
				</div>
			</div>

		
		</section>

	</form>
	
	<script>
        function valid() {
            var title = document.getElementById("noti_title").value;
            var content = document.getElementById("noti_cn").value;

            if (title.trim() === "" || content.trim() === "") {
                alert("제목과 내용을 입력해주세요.");
               return false;
               
            } else {
                return confirm("공지사항을 등록하시겠습니까?");
            }
        }
    </script>
</body>

</html>
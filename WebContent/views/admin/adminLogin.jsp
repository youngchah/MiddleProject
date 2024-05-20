<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style>
.login {
	width: 410px;
	position: absolute;
	left: 50%;
	top: 50%;
	/* 	border: 1px solid red; */
	transform: translate(-50%, -50%);
}

.login h2 {
	padding: 0 0 20px;
	border-bottom: 1px solid black;
	text-align: center;
	line-height: 1; /* 간격 */
	font-size: 32px;
	color: black;
}

.login p {
	padding: 0 0 20px;
}

.login p input {
	width: 100%;
	box-sizing: border-box;
	height: 46px;
}
/* placeholder 속성 잡는방법 */
.login p input::-webkit-input-placeholder {
	font-size: 16px;
}

.login p input[type="checkbox"] {
	position: absolute;
	left: -3000%;
}

.login p input[type="checkbox"]+label:before {
	content: "";
	display: inline-block;
	margin: 10px;
	width: 18px;
	height: 18px;
	border: 1px solid black;
	background: white;
	vertical-align: -14px;
}

.login p input[type="checkbox"]:checked+label:before {
	size: 5px
}

.login p input[type="checkbox"]:checked+label:before {
	background: url(img/icon_check.png) no-repeat rgb(253, 70, 102);
} /* 체크이미지 낫파운드  확인 해야됨 */
.login input[type="submit"] {
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
#search {
	display: felx;
	justify-content: center;
}

#search p {
	position: relative;
	padding: 0 18px;
}

#search a {
	font-size: 14px;
	color: black;
}
img {
	size: 100px;

}
</style>
</head>
<body>
	<form action="adminLogin.do" method="post" onsubmit="valid()">
		<section class="login">
			<div class="logo">
				<a href="./index.jsp"><img src="./resource/여행꽉자바_배경없음.png" width="500" height="300" alt="로고"></a>
			</div>
			<h2>관리자 로그인</h2>
			<div>
				<p>
					<input type="text" placeholder="관리자 아이디" title="아이디입력" name="admin_Id" id="admin_Id">
				</p>
				<p>
					<input type="password" placeholder="관리자 비밀번호" title="비밀번호입력" name="admin_Pass" id="admin_Pass">
				</p>

				<div>
					<input type="submit" id="loginForm" value="로그인">
					<!-- <button>로그인</button> -->
				</div>
				<!-- 		<li></li>   -->
			</div>


		</section>

	</form>
	
	    <script>
        function valid() {
            var adminId = document.getElementById("admin_Id").value;
            var adminPass = document.getElementById("admin_Pass").value;

            // 아이디와 비밀번호의 유효성을 검사하고 실패 시 alert을 띄웁니다.
            if (adminId.trim() === "" || adminPass.trim() === "") {
                alert("아이디와 비밀번호를 입력해주세요.");
                return false;
            }

            return true;
        }
    </script>
	
	
	
<%
    String message = (String) request.getAttribute("message");
    if (message != null ) {
%>
    <script>alert("<%= message %>");</script>
<%
    }
%>

</body>
</html>
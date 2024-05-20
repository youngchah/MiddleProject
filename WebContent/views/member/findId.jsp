<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("euc-kr"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
s
</style>
</head>
<body>
	<form action="findId.do" method="post" onsubmit="valid()">
		<section class="login">
			<div class="logo">
				<a href="./index.jsp"><img src="resource/여행꽉자바_배경없음.png" width="500" height="300" alt="로고"></a>
			</div>
			<h2>아이디 찾기</h2>
			<div>
				<p>
					<input type="text" placeholder="이름" title="이름입력" name="mem_Name" id="mem_Name">
				</p>
				<p>
					<input type="email" placeholder="이메일" title="이메일입력" name="mem_Email" id="mem_Email">
				</p>
				<div>
					<input type="submit" id="findId" value="아이디찾기">
					<!-- <button>로그인</button> -->
				</div>
				<!-- 		<li></li>   -->
			</div>

			<div id="search">
				<p>
					&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;
					&nbsp; <a href="login.do">로그인</a> &nbsp; <span>/</span> &nbsp; <a
						href="findPw.do">비밀번호 찾기</a>
				</p>
			</div>
			
			<script>
			 //서블릿에서 전달한 메시지 가져오기
            var findId = "<%= request.getAttribute("findid") %>";

            console.log("findId: ", findId);
            
            // 메시지가 비어있지 않고, null이 아닌 경우에만 alert 창으로 출력
            if (findId !== null && findId !== "null" && findId.trim() !== "") {
                alert("회원님의 아이디는 " + findId + " 입니다.");
            } else if (findId == "") {
                alert("이름과 이메일을 입력해주세요.");
                // 또는 다른 작업 수행 (예: 입력된 값을 초기화하거나, 화면을 리로드)
            } 
            	
			</script> 
	    
		</section>

	</form>
	
		    <script>
        function valid() {
            var memName = document.getElementById("mem_Name").value;
            var memEmail = document.getElementById("mem_Email").value;

            // 아이디와 비밀번호의 유효성을 검사하고 실패 시 alert을 띄웁니다.
            if (memName.trim() === "" || memEmail.trim() === "") {
                alert("이름과 이메일을 입력해주세요.");
                return null;
            }

            return true;
        }
    </script>

</body>
</html>
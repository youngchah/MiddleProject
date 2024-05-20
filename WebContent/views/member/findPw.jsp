<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	<form onsubmit="valid()">
		<section class="login">
			<div class="logo">
				<a href="./index.jsp"><img src="resource/여행꽉자바_배경없음.png" width="500" height="300" alt="로고"></a>
			</div>
			<h2>비밀번호 찾기</h2>
			<div>
				<p>
					<input type="text" placeholder="아이디" title="아이디" name="mem_Id" id="mem_Id">
				</p>
				<p>
					<input type="email" placeholder="이메일" title="이메일입력" name="mem_Email" id="mem_Email">
				</p>
				<div>
					<input type="submit" id="findPw" value="비밀번호찾기">
					<!-- <button>로그인</button> -->
				</div>
				<!-- 		<li></li>   -->
			</div>

			<div id="search">
				<p>
					&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;
					&nbsp; <a href="<%=request.getContextPath() %>/login.do">로그인</a> &nbsp; <span>/</span> &nbsp; <a
						href="<%=request.getContextPath() %>/findId.do">아이디 찾기</a>
				</p>
			</div>


		</section>

	</form>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
    function valid(){
    	
        var memId = document.getElementById("mem_Id").value;
        var memEmail = document.getElementById("mem_Email").value;

        // 아이디와 비밀번호의 유효성을 검사하고 실패 시 alert을 띄웁니다.
        if (memId.trim() === "" || memEmail.trim() === "") {
            alert("아이디와 이메일을 입력해주세요.");
            return false;
        }
    	
    
    	event.preventDefault();
    	
    	let memIdVal = $('#mem_Id').val();
    	let memEmVal = $('#mem_Email').val();
    	
		$.ajax({
			type: 'post',
			url: '<%=request.getContextPath() %>/findPw.do',
			data: {mem_Id: memIdVal, mem_Email: memEmVal}, //기본  urlencoded형식으로 넘어감
			success:function(res){
				console.log("성공>> ", res);
				if(res == "success"){
					alert("\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0입력하신 이메일로 임시 비밀번호를 전송했습니다. \n\n\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0로그인후 변경해주세요");
					location.href = "<%=request.getContextPath() %>/login.do";
				} else if ( res =="failure"){
					alert("일치하는 회원 정보가 없습니다.")	
					
				}
			},
			error:function(xhr){
				alert(xhr.status);
			}
		});    	
    	
    	
    }
        
        
        
    </script>
	

</body>
</html>
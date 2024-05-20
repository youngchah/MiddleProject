<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

    <style>
        body,
        html {
            font-family: 'IBM Plex Sans KR', sans-serif;
            margin: 0;
            padding: 0;
        }

        .formMargin {
            padding: 0px 10px;
            margin-top: 30px;
        }

        .form-row {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px;
            font-family: 'IBM Plex Sans KR', sans-serif;
            justify-content: space-between;
        }

        .form-row label {
            width: 20%;
            min-width: 20%;
            text-align: left;
            padding-right: 10px;
            background-color: #f2f2f2;
            padding: 10px;
            border-radius: 8px;
        }

        .container1 {
            width: 800px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
            margin-bottom: 50px;
        }

        .content1 {
        display: flex; /* Flexbox를 사용 */
    justify-content: space-between; /* 요소들을 양쪽 끝에 배치 */
    align-items: center; /* 수직 중앙 정렬 */
    width: 100%; /* 전체 너비 사용 */
            flex-grow: 1;
            margin-left: 10px;
        }

        .wrapper1 {
            position: relative;
        }

        .title2 {
            text-align: center;
            margin: 20px 0;
            font-family: 'IBM Plex Sans KR', sans-serif;
            transform: translateX(-280px);
        }

        span {
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        .commitButton {
            padding: 5px 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: #f4f4f4;
            cursor: pointer;
            margin-left: 1225px;
            margin-bottom: 30px;
        }

        .commitButton:hover {
            background-color: #e0e0e0;
        }

        /* 기존 텍스트 필드 스타일 유지 */
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            border: none;
            outline: none;
            width: 20vh;
            max-width: 25vh;
            border-bottom: 1px solid transparent;
        }

        /* 텍스트와 이메일 필드에 포커스 될 때 밑줄 애니메이션 추가 */
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border: none;
            border-bottom: 1px solid lightgray;
            transition: border-bottom 0.3s ease-in-out;
        }

        #disp {

            font-size: 12px;
            white-space: nowrap;

        }

        #disp2 {

            font-size: 12px;
            white-space: nowrap;

        }

        #disp1 {

            font-size: 12px;
            color: red;
            white-space: nowrap;
        }

        .btn-info.btn-sm {
            background-color: rgb(253, 70, 102);
            /* 버튼 배경 색상 */
            color: white;
            /* 글자 색상 */
            border-radius: 5px;
            /* 버튼 모서리 둥글게 */
            padding: 10px 15px;
            /* 버튼 안쪽 여백 */
            border: none;
            /* 테두리 제거 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            /* 그림자 효과 */
            transition: all 0.3s ease;
            /* 부드러운 효과 */
        }

        .btn-info.btn-sm:hover,
        .btn-info.btn-sm:focus {
            background-color: rgb(253, 70, 102);
            /* 호버 시 배경 색상 변경 */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            /* 호버 시 그림자 효과 증가 */
            transform: translateY(-2px);
            /* 호버 시 약간 위로 이동 */
        }

        .btn-info.btn-sm:active {
            background-color: #117a8b;
            /* 클릭 시 배경 색상 변경 */
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
            /* 클릭 시 그림자 효과 감소 */
            transform: translateY(1px);
            /* 클릭 시 다시 아래로 이동 */
        }

        .button-container1 {
            display: flex;
            width: 200px;
            justify-content: flex-end;
             flex-shrink: 0;
            /* 오른쪽 정렬 */
        }

        .button-container2 {
            display: flex;
            justify-content: flex-start;
            /* 아이템들을 왼쪽으로 정렬 */
            margin-left: 133vh;
            margin-bottom: 30px;
            
            /* 필요에 따라 조정 */
        }
        .form-control {
    flex-grow: 1; /* 가능한 모든 공간을 차지하도록 설정 */
    margin-right: 10px; /* 오른쪽 여백 설정 */
}
    </style>
</head>
<body>



	<div class="wrapper1">
        <h2 class="title2">여행꽉자바 회원가입</h2>
        <div class="container1">
            <section>
                <form action="./join.do" method="post" class="formMargin" id="submit_Form" enctype="application/x-www-form-urlencoded" accept-charset="UTF-8">
                    <div class="form-row">
                        <label for="signup-type">아이디</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="id" name="mem_Id" placeholder="영문,숫자 3-9자리"
                                required pattern="[a-zA-Z][a-zA-Z0-9]{3,9}">
                        </div>
                        <span id="disp"></span>
                    </div>

                    <div class="form-row">
                        <label for="signup-name">비밀번호</label>
                        <div class="content1">
                            <input type="password" class="form-control" id="pass" name="mem_Pass"
                                placeholder="영문,숫자,특수문자를 포함한 8자이상" required
                                pattern="(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$%\^&amp;\*\(\)_\+\|]).{8,}">
                        </div>
                        <span id="disp1"></span>
                    </div>

                    <div class="form-row">
                        <label for="signup-name">비밀번호 재입력</label>
                        <div class="content1">
                            <input type="password" class="form-control" id="pass1" name="mem_Pass1"
                                placeholder="영문,숫자,특수문자를 포함한 8자이상" required
                                pattern="(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$%\^&amp;\*\(\)_\+\|]).{8,}"
                                oninput="checkPasswordMatch()">
                        </div>
                        <span id="disp1"></span>
                    </div>

                    <div class="form-row">
                        <label for="signup-nick">이름</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="name" name="mem_Name" placeholder="이름" required
                                pattern="[가-힣]{2,8}">
                        </div>
                    </div>

                    <div class="form-row">
                        <label for="signup-tel">닉네임</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="nick" name="mem_Nick" placeholder="닉네임" required
                                pattern="[가-힣]{2,8}">
                        </div>
                        <span id="disp2"></span>
                    </div>

                    <div class="form-row">
                        <label for="signup-email">이메일</label>
                        <div class="content1">
                            <input type="email" class="form-control" id="mail" name="mem_Email" required
                                pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
                        </div>
                        <button type="button" id="maillbtn" class="btn btn-info btn-sm">인증번호
                            요청</button>
                    </div>
                    <div class="form-row">
                        <label for="mail1">인증번호</label>
                        <div class="content1">
                            <input type="text" id="mail1" class="form-control" name="mem_Email1">
                            <div class="button-container1">

                                <button type="button" id="maill1btn" class="btn btn-info btn-sm">인증번호
                                  확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="signup-email">전화번호</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="tel" name="mem_Tel" placeholder="000-0000-0000"
                                required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="signup-email">생년월일</label>
                        <div class="content1">
                            <input type="date" class="form-control" id="bir" name="mem_Bir" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="signup-email">우편번호</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="postAddr" name="mem_Pc" required>
                            <div class="button-container1">

                                <button type="button" id="addrBtn" class="btn btn-info btn-sm">주소검색</button>

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="signup-email">주소</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="addr1" name="mem_Addr1" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="signup-email">상세주소</label>
                        <div class="content1">
                            <input type="text" class="form-control" id="addr2" name="mem_Addr2" required>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <div class="button-container2">

            <input type="submit" value="가입하기" id="submit" class="btn btn-info btn-sm">
        </div>
    </div>


	<!-- 주소록 api -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    document.getElementById('submit').addEventListener('click', function () {
        document.getElementById('submit_Form').submit();
    });
    $(document).ready(function () {
        // 비밀번호 확인 기능
        function checkPasswordMatch() {
            var password = $("#pass").val();
            var confirmPassword = $("#pass1").val();
            var messageElement = $("#disp1");  // disp1로 변경

            if (password !== confirmPassword) {
                messageElement.text("비밀번호가 일치하지 않습니다.").css("color", "red");
            } else {
                messageElement.text("비밀번호가 일치합니다.").css("color", "green");
            }
        }

        // 주소 검색 기능
        $("#addrBtn").click(function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 주소 처리 로직
                    var roadAddr = data.roadAddress;
                    $("#postAddr").val(data.zonecode);
                    $("#addr1").val(roadAddr);
                },
                onerror: function (err) {
                    console.error('주소 검색 에러', err);
                }
            }).open();
        });

        // 아이디 중복 체크
        $('#id').on('keyup', function () {
            $.ajax({
                url: '/TripCatch/views/member/idCheck.jsp',
                data: { id: $('#id').val() },
                success: function (data) {
                    if (data.rst == "ok") {
                        $('#disp').text(data.msg).css('color', 'green');
                    } else {
                        $('#disp').text(data.msg).css('color', 'red');
                    }
                },
                error: function (xhr) {
                    alert(xhr.status);
                },
                dataType: 'json'
            });
        });

        // 닉네임 중복 체크
        $('#nick').on('keyup', function () {
            $.ajax({
                url: '/TripCatch/views/member/nickCheck.jsp',
                data: { nick: $('#nick').val() },
                success: function (data) {
                    if (data.rst == "ok") {
                        $('#disp2').text(data.msg).css('color', 'green');
                    } else {
                        $('#disp2').text(data.msg).css('color', 'red');
                    }
                },
                error: function (xhr) {
                    alert(xhr.status);
                },
                dataType: 'json'
            });
        });

        // 이메일 인증 요청
        $("#maillbtn").on("click", function () {
            // 이메일 입력값 확인
            var userEmail = $("#mail").val();
            if (userEmail == "") {
                alert("이메일을 입력해주세요.");
                return;
            }

            // AJAX를 이용하여 CodeSend 서블릿에 이메일 정보 전송
            $.ajax({
                type: "POST",
                url: "/TripCatch/codeSend.do",
                data: { mem_Email: userEmail },
                success: function (response) {
                    if (response != null) {
                        code = response;
                        console.log("code", code);
                        alert("인증번호가 이메일로 전송되었습니다.");
                    } else {
                        alert("인증번호 전송에 실패했습니다.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 에러: " + status + ", " + error);
                }
            });
        });

        // 인증번호 확인
        $("#maill1btn").on("click", function () {

            var enteredCode = $("#mail1").val();

            // 세션에 저장된 인증번호 가져오기
            var serverCode = "<%= session.getAttribute("verificationCode") %>"; // 이부분 바꾸기

            console.log("Entered Code:", enteredCode);
            console.log("Server Code:", serverCode);

            // 인증번호 비교
            if (enteredCode == code) {
                // 인증번호 일치할 때
                alert("인증에 성공했습니다.");
                $("#submit").show();  // 가입 버튼 보이기
                $("#maillbtn, #maill1btn").hide();  // 인증요청버튼과 인증확인버튼 숨기기
            } else {
                // 인증번호 불일치할 때
                alert("인증에 실패했습니다.");
                $("#submit").hide();  // 가입 버튼 숨기기
            }


            // 인증번호 확인 로직
        });

        // 비밀번호 일치 확인 이벤트
        $("#pass, #pass1").on("input", checkPasswordMatch);
    });
</script>
<!-- 		// 		function valid(){ -->
<!-- 		// 			//submit의 기본기능을 막아서 action(현재 url)의 위치로 이동 중지 -->
<!-- 		// 			event.preventDefault();  -->

<!-- 		// 			//form안의 입력양식 요소들의 정보를 직렬화(jQuery의 serialize())하고 서버페이지로 전달예정	 -->
<!-- 		// 			let data = $('form').serialize(); -->
<!-- 		// 			console.log(data); -->

<!-- 		// 			//serializeArray(): name과 value로 구성된 연관배열 형태의 값을 생성해줌 -->
<!-- 		// 			// ㄴ JSON.stringify(form.serializeArray())한 결과를 서버페이지로 전송하고 처리하기는 개인별로 작성해보기  -->

<!-- 		// // 			회원정보 insert -->
<!-- 		// 			$.ajax({ -->
<!-- 		// 				method : 'post', -->
<!-- 		// 				url : 'joinInsert.jsp', -->
<!-- 		// 				data : data, -->
<!-- 		// 				success : function(rst){ -->
<!-- 		// 					console.log(rst);//1 -->
<!-- 		// 					if(rst == 1){ -->
<!-- 		// 						let conf = confirm("가입성공했습니다. 로그인 페이지로 이동?");  -->
<!-- 		// 						if(conf) location.href="login.html"; -->
<!-- 		// 						$('#joinspan').text("가입성공").css('color','green'); -->
<!-- 		// 						$(':input').val(""); //가입 성공시 직전 작성된 내용 초기화 -->
<!-- 		// 					}else $('#joinspan').text("가입실패").css('color','red'); -->
<!-- 		// 				}, -->
<!-- 		// 				error : function(xhr){ -->
<!-- 		// 					alert(xhr.status); -->
<!-- 		// 				} -->
<!-- 		// 		// 		,dataType : '' -->
<!-- 		// 			}); -->

<!-- 		// 		} -->

</body>
</html>
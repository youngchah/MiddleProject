<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/header.jsp" %>

<%
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

String formattedDate = dateFormat.format(mv.getMem_Bir());
%>

<link rel="stylesheet" href="/TripCatch/css/planstyles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<style>
    /* 모달 스타일 */
.modal11 {
    display: none; /* 초기에 모달 숨김 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.4); /* 배경 어둡게 설정 */
}
.modal12 {
    display: flex; /* 초기에 모달 숨김 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, 0.4); /* 배경 어둡게 설정 */
}

/* 모달 내용 스타일 */
.modal-content11 {
    background-color: #fefefe;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    max-width: 500px; /* 최대 너비 설정 (선택 사항) */
    border-radius: 8px;
    box-sizing: border-box;
     flex-direction: column; /* 세로 방향으로 나열되도록 설정 */
}

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
    }

    /* 모달 내용 스타일 */
    span {
        font-size: 20px;
    }

    hr {
        margin-top: 10px;
        margin-bottom: 15px;
        border: 0;
        border-top: 1px solid #eee;
    }

    /* 입력란 스타일 */
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    /* 버튼 스타일 */
    button {
        background-color: rgb(253, 70, 102);
        color: white;
        padding: 10px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-align: right;
    }

    button:hover {
        background-color: rgb(253, 70, 102);
    }
</style>
<style>
#memberWithdrawBtn {

    background-color: white;
    color: black;
    padding: 10px 20px 13px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 15px;
    cursor: pointer;
    border-radius: 30px;

    /* Remove border */
    border: none;

    /* Add shadow effect */
    box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for background and color */



}

#memberInfoBtn {
    background-color: white;
    color: black;
    padding: 10px 20px 13px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 0px;
    cursor: pointer;
    border-radius: 30px;

    /* Remove border */
    border: none;

    /* Add shadow effect */
    box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for background and color */
}

#memberInfoBtn:hover {
    background-color: black; /* Background becomes black */
    color: white; /* Text becomes white */
}

#memberWithdrawBtn:hover {
    background-color: black; /* Background becomes black */
    color: white; /* Text becomes white */
}

.title2 {

    text-align: center;
    /* 가운데 정렬 */
    margin: 20px 0;
    /* 상하 여백 설정 */
    font-family: 'IBM Plex Sans KR', sans-serif;
    transform: translateX(-280px);

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


.container2 {
    width: 800px;
    /* 필요에 따라 이 값을 조정하세요. */
    margin: 0 auto;
    /* 위 아래 마진 0, 좌우 마진 auto로 설정하여 가운데 정렬합니다. */
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: relative;

    /* 내부 요소들의 절대 위치를 위한 기준점 */
    margin-bottom: 50px;
    /* 아래쪽 여백을 50px로 설정 */
}


.deleteButton {
    background-color: white; /* 배경색 흰색 */
    border: 1px solid grey; /* 진한 회색 테두리 */
    color: black; /* 글자색 검은색 */
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left: 1200px;
    margin-bottom: 20px;
    cursor: pointer;
    border-radius: 8px;
}

.deleteButton:hover {
    background-color: black; /* 호버시 배경색 검은색 */
    color: white; /* 호버시 글자색 흰색 */
}

</style>

<body>
    <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Member Info</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- ================ contact section start ================= -->

	    <!--planinsert.jsp 폰트-->

    
    <div class="infoAndDelete">
        <button id="memberInfoBtn">회원정보</button>
        <button id="memberWithdrawBtn">회원탈퇴</button>
    </div>

    <div id="memberInfoContent" class="content">


        <div class="wrapper1">



            <h2 class="title1">로그인 정보</h2>



<%
					
				
%>

            <div class="container1">
                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-type">가입 타입</label>
                            <div class="content1">일반</div>
                            <button class="edit-button" id="edit-type-button" type="button">가입타입 수정</button>
                        </div>


                        <div class="form-row">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="content1 profile-pic">
                                <img src="<%=request.getContextPath()%>/resource/프로필사진_테두리없음.png" alt="Profile Picture">
                            </div>
                            <button class="edit-button" id="edit-pic-button" type="button">사진 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-name">이름</label>
                            <div class="content1"><%=mv.getMem_Name() %></div>
                            <button class="edit-button" id="edit-name-button" type="button">이름 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-nick">닉네임</label>
                            <div class="content1"><%=mv.getMem_Nick() %></div>
                            <button class="edit-button" id="edit-nick-button" type="button">닉네임 수정</button>
                        </div>

<!--                         <div class="form-row">
                            <label for="signup-intro">한줄 소개(공란)</label>
                            <div class="content1">당신은 따봉도치의 행운을 받았습니다.</div>
                            <button class="edit-button" id="edit-intro-button" type="button">소개 수정(공란)</button>
                        </div -->

                        <!-- <button type="submit">저장</button> -->
                    </form>
                </section>




            </div>

            <h2 class="subtitle1">개인 정보</h2>
            <div class="container1">

                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-tel">생일</label>
                            <div class="content1"><%=formattedDate %></div>
                            <button class="edit-button" id="edit-tel-button" type="button">연락처 수정</button>
                        </div>
                        
                        <div class="form-row">
                            <label for="signup-tel">연락처</label>
                            <div class="content1"><%=mv.getMem_Tel() %></div>
                            <button class="edit-button" id="edit-tel-button" type="button">연락처 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-email">이메일</label>
                            <div class="content1"><%=mv.getMem_Email()%></div>
                            <button class="edit-button" id="edit-email-button" type="button">이메일 수정</button>
                        </div>



                        <!-- <button type="submit">저장</button> -->
                    </form>
                </section>
            </div>

        </div>


    </div>


    <div id="memberWithdrawContent" class="content" style="display: none;">

        <div class="wrapper1">

            <h2 class="title2">회원탈퇴 신청 정보</h2>

            <div class="container1">
                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-type">아이디</label>
                            <div class="content1"><%=mv.getMem_Id() %></div>
                        </div>

                        <div class="form-row">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="content1 profile-pic">
                                <img src="<%=request.getContextPath()%>/resource/프로필사진_테두리없음.png" alt="Profile Picture">
                            </div>
                        </div>

                        <div class="form-row">
                            <label for="signup-name">이름</label>
                            <div class="content1"><%=mv.getMem_Name() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-nick">닉네임</label>
                            <div class="content1"><%=mv.getMem_Nick() %></div>
                        </div>


                        <div class="form-row">
                            <label for="signup-tel">연락처</label>
                            <div class="content1"><%=mv.getMem_Tel() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-email">이메일</label>
                            <div class="content1"><%=mv.getMem_Email() %></div>
                        </div>

                    </form>
                </section>
            </div>

            <button class="deleteButton" id="deleteButton1" type="button">회원 탈퇴</button>



        </div>
    </div>

<!-- 회원탈퇴 모달창 -->
<div id="myModalDelete" class="modal11">
    <div class="modal-content11">
        <span class="closeDelete close">&times;</span>
        <span>회원 탈퇴</span>
        <hr>
        <div>
            <span style="font-weight: bold;">비밀번호</span>
            <input type="password" id="withdrawPasswordInput" placeholder="비밀번호를 입력하세요">
        </div>
        <br>
        <button id="confirmDeleteButton" type="button">확인</button>
        <button id="cancelDeleteButton" type="button">취소</button>
    </div>
</div>
<!--  -->


    <!-- 모달 창-->

    <div id="myModalNick" class="modal1">

        <!-- Modal content -->
        <div class="modal-content1">
            <span class="closeNick">&times;</span>
            <span>닉네임 수정</span>
            <hr>
            <div>
                <span style="font-weight: bold;">닉네임</span>
                <input type="text" id="planInput" placeholder="새 닉네임을 입력하세요">


            </div>
            <br>
            <button id="cancelNickButton" type="button">취소</button>
            <button id="confirmNickButton" type="button">확인</button>
        </div>

    </div>


    <div id="myModalTel" class="modal1">
        <div class="modal-content1">
            <span class="closeTel close">&times;</span>
            <span>연락처 수정 내용</span>
            <hr>
            <div>
                <span style="font-weight: bold;">연락처</span>
                <input type="text" id="planInput" placeholder="새 연락처를 입력하세요">
            </div>
            <br>
            <button id="cancelTelButton" type="button">취소</button>
            <button id="confirmTelButton" type="button">확인</button>
            <!-- 여기에 연락처 수정 내용을 추가합니다 -->
        </div>
    </div>

    <div id="myModalEmail" class="modal1">
        <div class="modal-content1">
            <span class="closeEmail close">&times;</span>
            <span>이메일 수정 내용</span>
            <hr>
            <div>
                <span style="font-weight: bold;">이메일</span>
                <input type="text" id="planInput" placeholder="새 이메일을 입력하세요">
            </div>
            <br>
            <button id="cancelEmailButton" type="button">취소</button>
            <button id="confirmEmailButton" type="button">확인</button>

        </div>
    </div>


    <div id="myModalName" class="modal1">
        <div class="modal-content1">
            <span class="closeName close">&times;</span>
            <span>이름 수정 내용</span>
            <hr>
            <div>
                <span style="font-weight: bold;">이름</span>
                <input type="text" id="planInput" placeholder="새 이메일을 입력하세요">
            </div>
            <br>
            <button id="cancelNameButton" type="button">취소</button>
            <button id="confirmNameButton" type="button">확인</button>
        </div>
    </div>
    
    <!-- ================ contact section end ================= -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
    <script>
    	$(document).ready(function () {
    	  $('#memberInfoBtn').click(function () {
    	      $('#memberInfoContent').show();
    	      $('#memberWithdrawContent').hide();
    	  });

    	  $('#memberWithdrawBtn').click(function () {
    	      $('#memberWithdrawContent').show();
    	      $('#memberInfoContent').hide();
    	  });
    	});
    </script>

<script>
<!-- 회원탈퇴 버튼 클릭 시 모달 띄우기 -->
$(document).ready(function () {
    // 초기에 모든 모달을 감추기
    $('.modal11').hide();

    // 회원탈퇴 버튼 클릭 시 모달 띄우기
    $('#deleteButton1').click(function () {
        event.preventDefault();
        $('#withdrawPasswordInput').val('');
        showModalDelete();
        //스타일 변경
        $('#myModalDelete').attr('class','modal12');
        $('#myModalDelete').removeAttr('style');
    });

    // 모달 창 닫기 버튼 클릭 시
    $('.closeDelete, #cancelDeleteButton').click(function () {
        $('.modal12').hide();
    });

    // 회원탈퇴 모달 확인 버튼 클릭 시
    $('#confirmDeleteButton').click(function () {
        var enteredPassword = $('#withdrawPasswordInput').val();
        $.ajax({
            type: "POST",
            url: "/TripCatch/Delete.do",
            data: { password: enteredPassword },
            success: function (response) {
                if (response === 'success') {
                    alert('회원 탈퇴가 완료되었습니다.');
                    window.location.href = '/TripCatch/Logout.do';
                } else {
                    alert('비밀번호가 일치하지 않습니다.');
                }
            },
            error: function () {
                alert('서버 오류가 발생했습니다.');
            },
            complete: function () {
                $('.modal11').hide();
            }
        });
    });

    // 함수로 모달 띄우기 처리
    function showModalDelete() {
        $('#myModalDelete').show();
    }
});
</script>

<%@include file="/include/footer.jsp" %>

</body>
</html>
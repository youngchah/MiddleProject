<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/header.jsp" %>


<link rel="stylesheet" href="/TripCatch/css/mypage-tripLog.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


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
                        <h3>Trip Plan</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- ================ contact section start ================= -->

	    <!--planinsert.jsp 폰트-->

    
    <div class="infoAndDelete">
        <button id="memberInfoBtn">나의 여행일정</button>
        <button id="memberWithdrawBtn">관심 여행일정</button>
    </div>

    <div id="memberInfoContent" class="content">


        <div class="wrapper1">



            <h2 class="title1">나의 여행일정</h2>
<%
					
				
%>
            <div class="container1">
                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-type">가입 타입</label>
                            <div class="content1">소셜</div>
                            <button class="edit-button" id="edit-type-button" type="button">소셜 수정</button>
                        </div>


                        <div class="form-row">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="content1 profile-pic">
                                <img src="/TripCatch/img/dummy/ddabong.png" alt="Profile Picture">
                            </div>
                            <button class="edit-button" id="edit-pic-button" type="button">사진 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-name">이름</label>
                            <div class="content1">최현명</div>
                            <button class="edit-button" id="edit-name-button" type="button">이름 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-nick">닉네임</label>
                            <div class="content1">따봉도치</div>
                            <button class="edit-button" id="edit-nick-button" type="button">닉네임 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-intro">한줄 소개(공란)</label>
                            <div class="content1">당신은 따봉도치의 행운을 받았습니다.</div>
                            <button class="edit-button" id="edit-intro-button" type="button">소개 수정(공란)</button>
                        </div>

                        <!-- <button type="submit">저장</button> -->
                    </form>
                </section>




            </div>

            <h2 class="subtitle1">개인 정보</h2>
            <div class="container1">

                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-tel">연락처</label>
                            <div class="content1">010-1234-4567</div>
                            <button class="edit-button" id="edit-tel-button" type="button">연락처 수정</button>
                        </div>

                        <div class="form-row">
                            <label for="signup-email">이메일</label>
                            <div class="content1">choi_wise@naver.com</div>
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
                            <div class="content1">choi_wise</div>
                        </div>

                        <div class="form-row">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="content1 profile-pic">
                                <img src="/TripCatch/img/dummy/ddabong.png" alt="Profile Picture">
                            </div>
                        </div>

                        <div class="form-row">
                            <label for="signup-name">이름</label>
                            <div class="content1">최현명</div>
                        </div>

                        <div class="form-row">
                            <label for="signup-nick">닉네임</label>
                            <div class="content1">따봉도치</div>
                        </div>


                        <div class="form-row">
                            <label for="signup-tel">연락처</label>
                            <div class="content1">010-1234-4567</div>
                        </div>

                        <div class="form-row">
                            <label for="signup-email">이메일</label>
                            <div class="content1">choi_wise@naver.com</div>
                        </div>

                    </form>
                </section>
            </div>

            <button class="deleteButton" id="deleteButton" type="submit">회원 탈퇴</button>



        </div>
    </div>


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

<%@include file="/include/footer.jsp" %>

</body>
</html>
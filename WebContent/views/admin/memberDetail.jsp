<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>    
<%@include file="/include/header.jsp" %>

<%
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	MemberVO mmv = (MemberVO) request.getAttribute("mv");

String formattedDate = dateFormat.format(mmv.getMem_Bir());
%>

<link rel="stylesheet" href="/TripCatch/css/planstyles.css">
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
    margin-left: 680px;
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
        <button id="memberInfoBtn">불량 회원 탈퇴</button>
    </div>





	
    <div id="memberWithdrawContent" class="content" >

        <div class="wrapper1">

            <h2 class="title2">회원 상세 정보</h2>

            <div class="container1">
                <section>
                    <form class="formMargin">

                        <div class="form-row">
                            <label for="signup-type">아이디</label>
                            <div class="content1"><%=mmv.getMem_Id() %></div>
                        </div>

                        <div class="form-row">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="content1 profile-pic">
                                <img src="<%=request.getContextPath()%>/resource/프로필사진_테두리없음.png" alt="Profile Picture">
                            </div>
                        </div>

                        <div class="form-row">
                            <label for="signup-name">이름</label>
                            <div class="content1"><%=mmv.getMem_Name() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-nick">닉네임</label>
                            <div class="content1"><%=mmv.getMem_Nick() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-bir">생일</label>
                            <div class="content1"><%=formattedDate%></div>
                        </div>


                        <div class="form-row">
                            <label for="signup-tel">연락처</label>
                            <div class="content1"><%=mmv.getMem_Tel() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-email">이메일</label>
                            <div class="content1"><%=mmv.getMem_Email() %></div>
                        </div>

                        <div class="form-row">
                            <label for="signup-pc">우편번호</label>
                            <div class="content1"><%=mmv.getMem_Pc() %></div>
                        </div>
                        <div class="form-row">
                            <label for="signup-addr1">주소</label>
                            <div class="content1"><%=mmv.getMem_Addr1() %></div>
                        </div>
                        <div class="form-row">
                            <label for="signup-addr2">상세주소</label>
                            <div class="content1"><%=mmv.getMem_Addr2() %></div>
                        </div>

                    </form>
                </section>
          
		<form action="<%=request.getContextPath()%>/memberDelete.do"
			method="post">
			<input type="hidden" name="mem_Id" value="<%=mmv.getMem_Id()%>">
			<input type="submit" id="deleteButton" class="btn btn-danger btn-mb-3 deleteButton" value="회원탈퇴">
		</form>
	</div>


        </div>
    </div>


    <!-- ================ contact section end ================= -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
     <script>
    	$(document).ready(function () {
    	  $('#memberInfoBtn').click(function () {
    	      $('#memberInfoContent').hide();
    	      $('#memberWithdrawContent').show();
    	  });

    	  $('#memberWithdrawBtn').click(function () {
    	      $('#memberWithdrawContent').show();
    	      $('#memberInfoContent').hide();
    	  });
    	});
    	
    	
    	$(document).ready(function () {
            $('#deleteButton').click(function (event) {
                // 탈퇴 여부를 확인하는 경고창 표시
               if (!confirm("정말로 탈퇴시키시겠습니까?")) {
                // 사용자가 "취소"를 클릭한 경우, 기본 동작(stopPropagation) 취소
                event.preventDefault();
            	}
            });
        });
    	
    	
    	
    </script>

<%@include file="/include/footer.jsp" %>

</body>
</html>
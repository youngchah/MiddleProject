<%@page import="log.vo.LogComVO"%>
<%@page import="file.vo.AtchFileVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="log.vo.LogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp" %>

<%
	List<LogVO> logDetailList = (List<LogVO>)request.getAttribute("logDetailList");
	
	List<AtchFileVO> atchFileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
	
	List<LogComVO> updatedCommentList = (List<LogComVO>)request.getAttribute("updatedCommentList");
	
	MemberVO mVO = (MemberVO) session.getAttribute("LOGIN_USER");
	
	int countComment = (int)request.getAttribute("countComment");


%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기록 상세보기</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/comment.css" />
<style>
* {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
}

body {
    font-size: 20px;
}

.ban-button {
    border-width: 1px;
    display: inline-block;
    padding: 8px 15px;
    background-color: #ffffff;
    color: #3b3a3a;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-size: 10px;
    float: right;
    position: absolute;
    right: 590px;
    top: 220px;
}

.ban-button:hover {
    background-color: #555;
    color: #ffffff;
}

.container {
    max-width: 800px;
    margin: 0 auto;
}

.post {
    border: 1px solid #ccc;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
}

.post-title {
    font-size: 24px;
    margin-bottom: 10px;
}

.post-info,
.post-city {
    font-size: 14px;
    color: #777;
    margin-bottom: 10px;
}

.post-content {
    margin-bottom: 20px;
}

.comment-section {
    border-top: 1px solid #ccc;
    padding-top: 20px;
    text-align: right;
}

.comment-input {
    width: 97%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.comment-button {
    padding: 10px 40px;
    background-color: #ffffff;
    color: #3b3a3a;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
    position: absolute;
    right: 590px;
    bottom: 255px;
    font-size: 15px;
    height: 100%;
}

.list-link {
    border: 1px solid #3b3a3a;
    display: inline-block;
    padding: 10px 20px;
    background-color: #ffffff;
    color: #3b3a3a;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-size: 18px;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    margin-top: 10px; /* 목록 버튼 상단 여백 추가 */
}

.list-link:hover {
    background-color: #555;
    color: #ffffff;
}

.action-button {
    border: 1px solid #3b3a3a;
    display: inline-block;
    padding: 10px 20px;
    background-color: #ffffff;
    color: #3b3a3a;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-size: 18px;
    margin-left: 10px;
    left: 50%;
    transform: translateX(-100%);
    margin-top: 10px;
    position: relative;
    left: calc(30%-50px); /* 오른쪽으로 100px 이동 */
    margin-top: 10px;
}

.action-button:hover {
    background-color: #555;
    color: #ffffff;
}

.comment {
    font-size: 14px;
}

.comment-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.comment-list li {
    margin-bottom: 10px;
    font-size: 15px;
    font-family: 'Arial', sans-serif;
    color: #333;
}

.comment-list li:last-child {
    margin-bottom: 0;
}

#commBtn {
    padding: 10px 30px;
    height: 100%;
    background-color: #FD4666;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
}

#commBtn:hover {
    background-color: #FF6384;
}

.comment-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    font-size: 15px;
    font-family: 'Arial', sans-serif;
    color: #333;
}

.comment-item .author {
    font-weight: bold;
    margin-right: 10px;
    color: #000000;
}

.comment-item .content {
    flex: 1;
    color: #555;
}

.comment-space {
    margin-right: 10px;
}

.post-nick {
    font-size: 15px;
    margin-bottom: 10px;
}

.comment-section {
    text-align: center;
}

</style>
</head>

<body>
	
     <div class="container">
        <div class="post">
            <div class="post-city"><%=logDetailList.get(0).getLogCat()%></div>
            <div class="post-title"><%=logDetailList.get(0).getLogTitle()%>&nbsp;(<%=countComment%>)</div>
            <div class="post-info">등록일&nbsp;&nbsp;│&nbsp;&nbsp; <%=logDetailList.get(0).getLogRegi()%>&nbsp;&nbsp;
            &nbsp;&nbsp;By&nbsp;&nbsp;<%=logDetailList.get(0).getMemNick()%></div>
            
            <hr>
            <br>
            <div class="post-content">
                <!-- logDetailList의 각 LogVO 객체에서 log_sn을 가져와서 출력 -->
                <%
                	for (LogVO lgv : logDetailList) {
                %>
                    <p><%=lgv.getLogCont()%></p>
                  <input type="hidden" id ="logNum" value="<%=lgv.getLogNum()%>" >                                
                    <input type="hidden" id ="memId" value="<%=lgv.getMemId()%>" /> 
                    <%
                     	}
                     %>
                     
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <!-- 추가된 목록 하이퍼링크 버튼 -->
            <div class="comment-section">
                <a href="<%=request.getContextPath() %>/log/loglist.do" class="list-link">목록</a> <!-- 목록으로 이동하는 하이퍼링크 -->
           <%
           	if (mVO != null) {
           	if (mVO.getMem_Id().equals(logDetailList.get(0).getMemId())) {
           %>
				
                <a href="logupdate.do?logNum=<%=logDetailList.get(0).getLogNum()%>" onclick="return confirm('정말로 수정하시겠습니까?');" class="action-button">수정</a>
        <a href="logdelete.do?logNum=<%=logDetailList.get(0).getLogNum()%>" onclick="return confirm('정말로 삭제하시겠습니까?');" class="action-button">삭제</a>
						 <input type="hidden" id="memId" value="<%=mVO.getMem_Id()%>" />
             <%
	                }
                }
				%>        
	
	
					
              <div>
                    <ul class="comment">
                        <li class="comment-form">
                            <form id="commentFrm">
                                <h4><span class="comment-count">댓글(<%=countComment%>)</span></h4>
                                <span class="ps_box">
                                    <input type="hidden" id ="logNum" value="<%=logDetailList.get(0).getLogNum()%>" name="logNum">
                                    <input type="text" id="logComCn" placeholder="댓글 내용을 입력해주세요." class="int" name="logComCn" />
                                </span>
							 <%
                if(mVO != null) {
                	if(mVO.getMem_Id().equals(logDetailList.get(0).getMemId())){
                		
            %>
				                
                                <%-- <a href=commentinsert.do?content=<%= %>>등록</a> --%>
                               		<input type="hidden" id ="memId" value="<%=mVO.getMem_Id()%>"> 
                                 <%-- <a href=commentinsert.do?content=<%= %>>등록</a> --%>
								<%
									}
								}
								%>
								<input type="button" id="commBtn" class="btn" value="등록" />
                            </form>
                        </li>
                         <li id="comment-list">
                            <%
                                for (LogComVO lcv : updatedCommentList) {
                            %>
                                    <div class="comment-item">
                                        <div class="author"><%= lcv.getMemNick() %></div>
                                        <div class="content"><%= lcv.getLogComCn() %></div>
                                    </div>
                            <%
                                }
                            %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

	
	

    
    <%-- <input type="hidden" id="nickValue" value="<%=mv.getNick()%>" /> --%>
    
<script>

//댓글 목록 갱신 스크립트 부분
document.addEventListener('DOMContentLoaded', function () {
  var commentForm = document.getElementById('commentFrm');
  var formBtn = document.querySelector('#commBtn');
  var commentList = document.getElementById('comment-list');
  var logComCnInput = document.getElementById('logComCn');
  var commentCountSpan = document.querySelector('.comment h4 .comment-count');

	// 페이지 로딩 시 초기 댓글 수 표시
  updateCommentCount(<%=countComment%>);
  
  formBtn.addEventListener('click', function (event) {
      // 로그인 여부 확인
      var loginUser = '<%= session.getAttribute("LOGIN_USER") %>';
      if (!loginUser) {
          // 로그인이 필요한 경우 확인 창 띄우기
          var confirmLogin = confirm('로그인이 필요합니다. 로그인 하시겠습니까?');
          if (confirmLogin) {
              // "예"를 선택한 경우 로그인 페이지로 리다이렉트
              window.location.href = '<%= request.getContextPath() %>/login.jsp?redirect=<%= request.getRequestURI() %>';
          }
          return;
      }

      // 로그인이 된 경우 댓글 등록 진행
      var formData = new FormData(commentForm);

      var xhr = new XMLHttpRequest();
      xhr.open('POST', '<%=request.getContextPath()%>/log/logdetail.do', true);
      xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
              var jsonResponse = JSON.parse(xhr.responseText);
              console.log("비동기");

              updateCommentList(jsonResponse);
              logComCnInput.value = '';
              // 댓글 수 갱신 추가
              updateCommentCount(jsonResponse.length);
          }
      };
      xhr.send(formData);
  });

  function updateCommentList(commentListData) {
	    commentList.innerHTML = '';

	    for (var i = 0; i < commentListData.length; i++) {
	        var commentItem = document.createElement('li');
	        commentItem.classList.add('comment-item'); // 클래스 추가

	        var memNick = commentListData[i].memNick;
	        var logComCn = commentListData[i].logComCn;

	        // 작성자와 내용을 담는 추가적인 클래스도 지정
	        var authorClass = 'comment-author';
	        var contentClass = 'comment-content';

	        var commentText = '<span class="' + authorClass + '"><strong>' + memNick + '</strong></span><span class="comment-space"></span><span class="' + contentClass + '">' + logComCn + '</span>';

	        commentItem.innerHTML = commentText || '';
	        commentList.appendChild(commentItem);
	        
	     // 새로 생성된 댓글 아이템에 스타일을 직접 적용
	        commentItem.style.fontSize = '16px';
	        commentItem.style.fontFamily = 'Arial, sans-serif';
	        commentItem.style.color = '#333';

	        commentList.appendChild(commentItem);
	    }
	}

  // 댓글 수 갱신 함수 추가
  function updateCommentCount(count) {
      if (commentCountSpan) {
          commentCountSpan.textContent = '댓글(' + count + ')';
      }
      applyCommentStyle();
  }
  
//여기서 추가: 비동기 요청 후 스타일 재적용 함수
 function applyCommentStyle() {
    var commentItems = document.querySelectorAll('.comment-item');
    if (commentItems) {
        commentItems.forEach(function (item) {
            item.style.fontSize = '16px';
            item.style.fontFamily = 'Arial, sans-serif';
            item.style.color = '#333';
        });

        var authors = document.querySelectorAll('.comment-item .author');
        if (authors) {
            authors.forEach(function (author) {
                author.style.fontWeight = 'bold';
                author.style.marginRight = '12px';
                author.style.color = '#000000';
            });
        }

        var contents = document.querySelectorAll('.comment-item .content');
        if (contents) {
            contents.forEach(function (content) {
                content.style.flex = '1';
                content.style.color = '#555';
            });
        }
    }
}
});


    </script>
</body>
<!-- <input type="hidden" id="nickValue" value="닉네임" /> -->
<%@include file="/include/footer.jsp" %>
</html>
<script src="<%=request.getContextPath() %>/js/comment.js"></script>


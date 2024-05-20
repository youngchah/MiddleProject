<%@page import="community.vo.ComVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	List<ComVO> comlist = (List<ComVO>) request.getAttribute("comList");
%>

	<%@include file="../../include/header.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>여행 꽉 잡아</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#targetImg {
	clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
	width: 100%;
	height: 200px;
	object-fit: cover; /* 이미지 비율 유지 및 잘라낸 부분 보이기 */
}

hr {
	border: none; /* 기본 선 제거 */
	border-top: 3px solid gray; /* 원하는 굵기와 색상으로 선 추가 */
	margin: 20px 0;
	margin-left: auto; /* 왼쪽 마진을 자동으로 설정하여 센터 정렬 */
	margin-right: auto;
}

/*  */
input[type="text"] {
	border: 1px solid #ccc;
	/* 테두리 굵기는 1px로 설정하고, 색상은 연하게 회색(#ccc)로 설정합니다. */
}

.searchbar {
	text-align: right;
}

/* Middle column */
hr {
	border: 1px solid #eeebeb;
}

/* 검색창 */
.search-container {
	position: relative;
	width: 200px; /* 원하는 너비로 조절 */
	float: right;
}

input[type="text"] {
	width: 100%;
	padding: 8px;
	border: 2px solid #ccc; /* 테두리 선 굵기와 색상 설정 */
	border-top-color: transparent; /* 상단 테두리 투명하게 설정 */
	border-right-color: transparent; /* 오른쪽 테두리 투명하게 설정 */
	border-left-color: transparent; /* 왼쪽 테두리 투명하게 설정 */
	border-radius: 4px; /* 둥근 모서리 설정 */
}

.search-button {
	position: absolute;
	top: 50%;
	right: 10px; /* 원하는 오른쪽 여백으로 조절 */
	transform: translateY(-50%);
	background: none;
	border: none;
	cursor: pointer;
}

.column.middle {
	width: 60%;
	overflow: auto;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	width: 50%; /* 또는 원하는 너비 */
}

/* 글쓰기 버튼 */
.button {
	width: 70px;
	padding: 8px;
	border-radius: 5px;
	float: right;
	background-color: #ffffff;                                        
}

/* footer */
footer {
	background-color: #f4f4f4;
	padding: 20px 0;
	position: relative;
	bottom: 0; /* footer를 페이지 하단에 고정 */
	width: 100%;
	margin-top: 50px; /* footer 위에 추가 공간 확보 */
}

/* 게시글 스타일 */
.board {
	padding: 20px;
	background-color: #ffffff;
	margin: 20px 0; /* 상하 여백 추가 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.post {
	border-bottom: 1px solid #e0e0e0;
	padding: 10px 0;
	position: relative;
	margin: 50px;
}

.post:last-child {
	border-bottom: none;
}

.post-date {
	color: #333;
	font-size: 0.8em;
}

.post-title {
	color: #666;
	margin-top: 10px; /* 게시글 내용 위쪽에 추가 공간 */
	font-size: 25px;
	font-weight: bold;
}

.post-title:hover {
    color: #666;
    margin-top: 10px;  /* 게시글 내용 위쪽에 추가 공간 */
    color: rgb(42, 41, 41);
}
 
.post-writer {
	font-size: 1em;
	color: #999;
	margin: 5px;
}

/* 더보기 버튼 start */
.center-container {
	display: flex;
	justify-content: center; /* 버튼을 수평으로 센터 정렬 */
	align-items: center; /* 버튼을 수직으로 센터 정렬 */
	height: 200px; /* 전체 뷰포트 높이 */
	margin: 0; /* 기본 마진 제거 */
	font-family: Arial, sans-serif; /* 기본 폰트 설정 */
}

.more-button {
	width: 200px;
	padding: 10px 20px; /* 상하좌우 패딩 */
	border-radius: 5px; /* 둥근 모서리 설정 */
	cursor: pointer; /* 커서 스타일 변경 */
	transition: background-color 0.3s; /* 배경색 변화 트랜지션 */
	background-color: #ffffff;
}

.more-button:hover {
	background-color: black; /* 마우스 호버 시 배경색 변경 */
}

.search-container {
            display: flex;
            align-items: center;
        }

        .search-input {
            flex: 1;
            border: none; /* 테두리 제거 */
            padding: 5px; /* 내부 간격 설정 */
            outline: none; /* 포커스 효과 제거 */
        }

        .search-button {
            background-image: url('<%=request.getContextPath() %>/img/icon.png');
            background-repeat: no-repeat;
            background-size: 20px 20px;
            padding-left: 30px;
            cursor: pointer;
            border: none; /* 테두리 제거 */
            background-color: transparent; /* 배경색 제거 */
            /* 텍스트 숨김 */
            text-indent: -9999px;
            overflow: hidden;
        }
/* 더보기 버튼 end */
</style>
</head>

<body>
	
	<div>
		<img id="targetImg" src="<%=request.getContextPath() %>/img/pi.jpg" alt="사진">
	</div>




	<!-- 커뮤니티 게시판 -->
	<div class="row">
		<div class="column middle" style="background-color: white;">

			<br>
			<hr>
			<br>

			<div class="search-container">
				<form action="search.do" method="post" class="search-container">
    			<input type="text" name="com_title" class="search-input" placeholder="검색어를 입력하세요">
    				<!-- 이미지를 추가한 부분 -->
    			<input type="submit" value="검색" class="search-button">
				</form>
			</div>

			<div class="board" >
			
<%
					for(ComVO cv : comlist){
%>									
				<div class="post">
				
					<div class="post-date" style="padding: 10px 0;" ><%=cv.getComRegi() %></div>
					<a href="./detail.do?com_num=<%=cv.getComNum() %> "style="font-size: 30px;"> <%=cv.getComTitle()%> </a>
					
					<%-- <a href="./detail.do?memId=<%=mv.getMemId() %>"><%=mv.getMemName() %></a> --%>
					
					<div class="post-nick" style="padding: 10px 0;">BY <%=cv.getMemNick() %></div>
				</div>
<%		
				}
%>	 			
				
			</div>
			<div>
				<button class="button"><a href="./insert.do">글쓰기</button></a>
			</div>

			<div class="center-container">
				<button class="more-button">더보기</button>
			</div>

			<script>
				// 버튼 클릭 이벤트 리스너 추가 (예시: 콘솔에 메시지 출력)
				document.querySelector('.more-button').addEventListener(
						'click', function() {
							console.log('더보기 버튼이 클릭되었습니다.');
							// 여기에 "더보기" 기능을 추가할 수 있습니다.
						});
				
				function validateSearch() {
		            var searchTerm = document.querySelector('.search-input').value.trim();

		            if (searchTerm === "") {
		            	alert("검색어를 입력하세요.");
		                return false;
		            }
		            // 검색어가 비어있지 않으면 제출을 허용
		            return true;
		        }
			</script>
		</div>




		<%@include file="../../include/footer.jsp" %>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../../include/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>communityInsert</title>


<link rel="stylesheet" href="/TripCatch/css/commuInsertStyle.css">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	
<!-- jQuery 자동완성플러그인 -->	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
	
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS JS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<%-- <script src="<%=request.getContextPath() %>/js/summernote-lite.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/lang/summernote-ko-KR.js"></script> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote-lite.css"> --%>




<style>
/* * { */
/* 	margin: 0; */
/* 	padding: 0; */
/* 	font-family: 'Arial', sans-serif; */
/* } */

/* body { */
/* 	font-size: 20px; */
/* } */

/* .commuContainer { */
/* 	/*  position: relative; */ */
/* 	max-width: 800px; */
/* 	margin: 0 auto; */
/* } */


body, html {
	font-family: 'IBM Plex Sans KR', sans-serif;
	margin: 0;
	padding: 0;
}
.header {
	display: flex;
	flex-direction: column;
	align-items: left;
	padding: 20px;
	background-color: white; /* 배경색 조정 */
	text-align: center; /* 제목을 가운데 정렬 */
}

.title-input {
	width: 80%; /* 폭 조정 */
	padding: 10px;
	margin-bottom: 20px; /* 여백 조정 */
	font-size: 20px; /* 폰트 크기 조정 */
	border: none; /* 모든 테두리 제거 */
	border-bottom: 2px solid #ccc; /* 항상 보이는 아래 테두리 */
	outline: none; /* 클릭 시 브라우저 기본 아웃라인 제거 */
	text-align: left;
	transition: all 0.3s ease-in-out; /* 부드러운 전환 효과 */
}


/* 기록 전체 container */
.commuContainer {
    width: 40%; /* 화면 너비의 80%를 차지하도록 설정 */
    margin: 0 auto; /* 좌우 마진을 auto로 설정하여 가운데 정렬 */
    border: 1px solid #ccc; /* 외곽 테두리 설정 */
    padding: 20px; /* 내부 여백 추가 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
    background: #fff; /* 배경색 흰색으로 설정 */
    min-height: 200px; /* 최소 세로 크기 설정 */
    border-radius: 4px; /* 테두리 모서리 둥글게 */
    position: relative; /* 후속 요소의 위치를 상대적으로 설정 */
    top: 50px; /* 페이지 상단에서부터 50px 아래에 위치 */
}

/* #title, #city { */
/* 	width: 100%; */
/* 	padding: 10px; */
/* 	margin-bottom: 10px; */
/* 	border: 1px solid #ccc; */
/* 	border-radius: 5px; */
/* 	box-sizing: border-box; */
/* 	overflow: auto; */
/* 	/* 오른쪽, 왼쪽, 위쪽 투명 */ */
/* 	border-right-color: transparent; */
/* 	border-left-color: transparent; */
/* 	border-top-color: transparent; */
/* } */

/* #city label { */
/* 	font-size: 100px; /* 도시(label 안에 있는)의 폰트 크기를 늘림 */ */
/* } */

/* #city:focus, .title:focus { */
/* 	outline: none; /* 포커스시 테두리 제거 */ */
/* } */

/* #city, #title, .content { */
/* 	margin-bottom: 30px; /* 빈 공간 추가 */ */
/* } */

/* .city label, .title label, .content label { */
/* 	font-size: 20px; */
/* } */

/* #content { */
/* 	width: 100%; */
/* 	height: 500px; */
/* 	padding: 10px; */
/* 	border: 1px solid #ccc; */
/* 	border-radius: 5px; */
/* 	box-sizing: border-box; */
/* 	overflow: auto; */
/* 	border-top: 1px solid transparent; /* 상단 투명 */ */
/* 	border-left: 1px solid transparent; /* 왼쪽 투명 */ */
/* 	border-right: 1px solid transparent; /* 오른쪽 투명 */ */
/* } */

/* .btn-link { */
/* 	display: inline-block; */
/* 	padding: 10px 20px; */
/* 	text-align: center; */
/* 	text-decoration: none; */
/* 	color: white; */
/* 	background-color: #292a2a; */
/* 	border: 1px solid #292a2a; */
/* 	border-radius: 5px; */
/* 	cursor: pointer; */
/* 	margin: 50px 600px; */
/* } */

/* .content { */
/* 	position: relative; */
/* 	padding: 0; */
/* 	margin-bottom: 0px; */
/* 	/* display: flex; */ */
/* 	justify-content: flex-end; */
/* 	align-items: center; */
/* } */

/* .content button { */
/* 	padding: 5px 10px; */
/* 	border: 1px solid rgb(206, 204, 204); */
/* 	background-color: #fff; */
/* 	border-radius: 5px; */
/* 	cursor: pointer; */
/* 	transition: background-color 0.3s; */
/* 	margin-left: auto; */
/* } */

/* .content a { */
/* 	position: absolute; */
/* 	right: 0; */
/* } */

/* 발행버튼 */
#writeBtn {
	padding: 10px 20px; /* 버튼 패딩 */
	cursor: pointer;
	background-color: rgb(253, 70, 102); /* 배경색 */
	color: white;
	border: none;
	border-radius: 4px;
	position: absolute; /* 화면에 고정 */
	bottom: -50px; /* 아래에서 20px */
	right: 140px; /* 오른쪽에서 20px */
	z-index: 1000; /* 다른 요소들 위에 배치 */
	box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
}

/* .img_put { */
/* 	position: absolute; */
/* 	top: 50px; */
/* 	right: 15px; */
/* 	padding: 1px; */
/* 	font-size: 12px; */
/* } */
</style>
</head>
<body>

	<div class="commuContainer">
		
		<form method="post" action="<%=request.getContextPath()%>/community/insert.do"
			 enctype="multipart/form-data">

			<div class="city">
					
				<input type="text" class="title-input" name="city_name" placeholder="도시를 입력해 주세요" />
			</div>

			<div class="title">
				<input type="text" class="title-input" name=com_title placeholder="제목을 입력해 주세요" />
				
			</div>

			<div class="content">
			
				<textarea name="contents" id="summernote"></textarea>
			
			
<!-- 				<div id="content" contenteditable="true" -->
<!-- 					style="border: 1px solid black; min-height: 100px; padding: 5px;"> -->
<!-- 					사용자는 여기에 텍스트를 입력하고, 이미지도 삽입될 것입니다 -->
<!-- 				</div> -->
<!-- 				<input type="file" id="imageInput" name="con_cn" -->
<!-- 					style="display: none;" multiple onchange="insertImages()" /> -->
<!-- 				<button onclick="document.getElementById('imageInput').click()" -->
<!-- 					class="img_put" type="button">이미지 삽입</button> -->

			
<!-- 			<input class="btn-link" type="submit" onclick="submitForm()" -->
<!-- 				value="저장"> -->

				<button id="writeBtn" name="button" value="issue" type="submit">발행</button>
			</div>
		</form>
		
	</div>





	<script>
	$(document).ready(function() {
		
		$('#summernote').summernote({
			height : "500px",
			});

        // 발행 버튼 클릭 이벤트 처리
        $("#writeBtn").on('click', function(e) {
            alert("커뮤니티가 등록되었습니다");
        });
	});
	
	/* 이미지 업로드 요청용 메서드 */
	function sendFile(file, el) {
		//파일 전송을 위한 폼 생성
		data = new FormData();
		data.append("file", file);

		$.ajax({
			data : data,
			type : "POST",
			enctype : 'multipart/form-data',
			url : "/community/insert.do",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				console.log('editor', $(el));
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
	$(document).ready(function() {
		// 더미 도시 데이터
		var cityData = [ "서울특별시", "인천광역시", "대전광역시", "대구광역시",
						"울산광역시", "부산광역시", "광주광역시", "세종특별자치시", "수원시", "용인시",
						"고양시", "성남시", "고양시", "화성시", "부천시", "남양주시", "안산시",
						"평택시", "안양시", "시흥시", "파주시", "김포시", "의정부시", "광주시",
						"하남시", "광명시", "군포시", "양주시", "오산시", "이천시", "안성시",
						"구리시", "의왕시", "포천시", "여주시", "동두천시", "과천시", "양평군",
						"가평군", "연천군", "춘천시", "원주시", "강릉시", "동해시", "태백시",
						"속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군",
						"철원군", "화천군", "양구군", "인제군", "고성군", "양양군", "청주시",
						"충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군",
						"괴산군", "음성군", "단양군", "천안시", "공주시", "보령시", "아산시",
						"서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군",
						"청양군", "홍성군", "예산군", "태안군", "전주시", "익산시", "군산시",
						"정읍시", "남원시", "김제시", "무주군", "완주군", "부안군", "고창군",
						"임실군", "순창군", "진안군", "장수군", "목포시", "여수시", "순천시",
						"나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군",
						"화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군",
						"영광군", "장성군", "완도군", "진도군", "신안군", "포항시", "경주시",
						"김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시",
						"경산시", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군",
						"성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군", "창원시",
						"김해시", "양산시", "진주시", "거제시", "통영시", "사천시", "밀양시",
						"함안군", "거창군", "창녕군", "고성군", "하동군", "합천군", "남해군",
						"함양군", "산청군", "의령군", "제주시", "서귀포시" ];

		// cityName에 대한 자동완성 기능 추가
		$("input[name='city_name']").autocomplete({
			source : cityData,
			minLength : 1, // 최소 글자수 (1글자부터 자동완성 시작)
		select : function(event, ui) {
			// 사용자가 도시를 선택했을 때의 동작
			console.log("Selected city: " + ui.item.value);
			}
		});
		
		// Enter 키 입력 방지
		$("form").on("keydown",	"input[name='city_name'], input[name='com_title']",function(event) {
			if (event.key === "Enter") {
				event.preventDefault();
			}
		});
	});
	
	
	
	
// 		function changeFontSize(size) {
// 			document.getElementById('content').style.fontSize = size;
// 		}

// 		function resetCursorPosition() {
// 			var content = document.getElementById('content');
// 			content.value = '';
// 			content.focus();
// 		}

// 		function handleLinkClick() {
// 			alert("저장되었습니다!");
// 		}

		
		
// 		var selectedFiles = [];
		
// 		function insertImages() {
// 	        var files = document.getElementById('imageInput').files;
// 	        var contentDiv = document.getElementById('content');
	        
// 	        selectedFiles.push(...files);

// 	        for (var i = 0; i < files.length; i++) {
// 	            var file = files[i];

// 	            if (file.type.startsWith('image/')) {
// 	                var img = document.createElement('img');
// 	                img.classList.add('uploaded-image');
// 	                img.file = file;
// 	                img.style.maxWidth = '65%'; // 최대 너비를 100%로 설정
// 		            img.style.height = 'auto'; // 높이를 자동으로 조절

// 	                contentDiv.appendChild(img);

// 	                var reader = new FileReader();
// 	                reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result; }; })(img);
// 	                reader.readAsDataURL(file);
// 	            }
// 	        }
// 	    }
		
// 		function submitForm() {
// 		    var formData = new FormData();
// 		    for (var i = 0; i < selectedFiles.length; i++) {
// 		        formData.append('con_cn', selectedFiles[i], selectedFiles[i].name);
// 		    }

// 		    // AJAX 요청을 사용하여 formData를 서버로 전송
// 		    var xhr = new XMLHttpRequest();
// 		    xhr.open('POST', '/community/insert.do', true);
// 		    xhr.send(formData);
// 		}
		
		
		
		
		
		
		
	</script>

</body>
</html>



<%-- <%@include file="../../include/cs-footer.jsp"%> --%>


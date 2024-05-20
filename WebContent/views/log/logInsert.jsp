<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../include/header.jsp"%>

<%

	boolean isLoggedIn = (session.getAttribute("LOGIN_USER") != null);

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>logInsert</title>

<link rel="stylesheet" href="/TripCatch/css/logInsert.css">

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

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<%-- <script src="<%=request.getContextPath() %>/js/summernote-lite.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/lang/summernote-ko-KR.js"></script> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote-lite.css"> --%>


<style>
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

/* 날짜 선택 부분 */
.date-picker {
    display: flex;
    justify-content: space-between;
    width: 80%; /* 폭 조정 */
}

.date-picker input[type="text"] {
    width: 48%; /* 폭 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.date-picker button {
    padding: 10px 20px;
    cursor: pointer;
    background-color: #5cb85c;
    color: white;
    border: none;
    border-radius: 4px;
}

/* 카테고리 부분 */
.logCate {
    min-width: 200px;
    vertical-align: top;
    font-size: 14px;
    text-align: left;
    padding: 10px;
/*     margin-bottom: 20px; */
    margin-top: 10px;
}

.cateName {
    margin-right: 10px;
}

.cate {
    cursor: pointer;
}

/* 여행일정 버튼 */
#tripPlanBtn {
    padding: 5px 5px;
    margin-left: 10px;
    box-shadow: 0 4px 6px 0 rgba(0,0,0,0.2);
    background-color: white; /* 배경색 */
    color: black;
    border: none;
    border-radius: 4px;
    z-index: 9999;
    margin-bottom: 20px;
}

#tripPlanBtn:hover {
    box-shadow: 0 4px 6px 0 rgba(0,0,0,0.2);
    background-color: rgb(253,70,102); /* 배경색 */
    color: white;
    border: none;
    border-radius: 4px;
}

/* 기록 전체 container */
.logContainer {
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


/* 임시저장 버튼 */
#tempStore {
	border: 1px black;
    padding: 10px 20px; /* 버튼 패딩 */
    cursor: pointer;
    background-color: white; /* 배경색 */
    color: black;
    border: none;
    border-radius: 4px;
    position: absolute; /* 화면에 고정 */
    bottom: -50px; /* 아래에서 20px */
    right: 80px; /* 오른쪽에서 20px */
    z-index: 1000; /* 다른 요소들 위에 배치 */
    box-shadow: 0 4px 6px 0 rgba(0,0,0,0.2);
    margin-bottom: -20px;
}

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
	right: 0px; /* 오른쪽에서 20px */
	z-index: 1000; /* 다른 요소들 위에 배치 */
	box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
	margin-bottom: -20px;
}

/* 사이드바 */
#my_sidebar_log {
	border: 1px solid black;
	height: 100%;
	width: 0px;
	position: fixed;
	z-index: 10;
	top: 0;
	right: 0;
	background-color: white;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
	opacity: 1;
}

#my_sidebar_log a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 20px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

#my_sidebar_log a:hover {
	color: #f1f1f1;
}

/* 여행일정 불러오기 */
.itinerary-item {
	padding: 10px;
	cursor: pointer;
	border-bottom: 1px solid #ddd;
	transition: background-color 0.3s ease;
}

.itinerary-item:hover {
	background-color: #f9f9f9;
}
</style>
</head>
<body>

	<form method="post" action="<%=request.getContextPath() %>/log/logInsert.do" enctype="multipart/form-data">
		<div class="logContainer">

			<div class="header">

				<input type="text" class="title-input" name="cityName" placeholder="도시를 입력해 주세요" />
				<input type="text" id="datepicker" placeholder="날짜 선택" /> 
				<input type="hidden" name="startDate" id="hiddenStartDate">
				<input type="hidden" name="endDate" id="hiddenEndDate">
				
				<input type="text" class="title-input" name="logTitle" placeholder="제목을 입력해 주세요" />

				<fieldset class="logCate" data-role="controlgroup">
					<span class="cateName">카테고리</span> 
						<input type="radio"	name="logCat" value="자유여행" class="cate" id="freeTrip" checked />자유여행&nbsp;
						<input type="radio" name="logCat" value="효도여행" class="cate" id="hyodoTrip" />효도여행&nbsp; 
						<input type="radio" name="logCat" value="우정여행" class="cate" id="friendTrip" />우정여행&nbsp; 
						<input type="radio" name="logCat" value="커플여행" class="cate" id="coupleTrip" />커플여행&nbsp; 
						<input type="radio" name="logCat" value="가족여행" class="cate" id="familyTrip" />가족여행&nbsp;
				</fieldset>
			</div>

			<!-- 여행일정 버튼 -->
			<button id="tripPlanBtn" type="button">여행일정</button>

			<div class="align_center">
				<div class="in_wrap" id="my_sidebar_log" class="my_sidebar_log">
					<!-- 사이드바에 여행 일정을 동적으로 추가할 영역 -->
					
<!-- 					// HTML 일정 포맷팅 예시 -->
<!-- 					<div class="itinerary"> -->
<%-- 					    <p class="itinerary-title"><strong>여행 일정:</strong> <%= itinerary.title %></p> --%>
<%-- 					    <p class="itinerary-location"><strong>위치:</strong> <%= itinerary.location %></p> --%>
<%-- 					    <p class="itinerary-date"><strong>날짜:</strong> <%= itinerary.date %></p> --%>
<!-- 					</div> -->
					
					
					
				</div>

				<textarea name="contents" id="summernote"></textarea>
			
				<button id="tempStore" name="button" value="temp" type="submit">임시저장</button>
				<button id="writeBtn" name="button" value="issue" type="submit">발행</button>
			</div>
	</form>


	<script>
		$(document).ready(function() {
			
			$('#summernote').summernote({
				height : "500px",
				});

			// 임시저장 버튼 클릭 이벤트 처리
	        $("#tempStore").on('click', function(e) {
	            alert("임시저장 되었습니다");
	        });

	        // 발행 버튼 클릭 이벤트 처리
	        $("#writeBtn").on('click', function(e) {
	            alert("여행기록이 등록되었습니다");
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
				url : "/log/logInsert.do",
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					console.log('editor', $(el));
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}

		/* 달력 날짜선택 */
		document.addEventListener('DOMContentLoaded',function() {
			flatpickr("#datepicker",
					{
				mode : "range",
				minDate : null,
				dateFormat : "Y-m-d",
				
				onChange : function(selectedDates,
						dateStr, instance) {
					// 시작 날짜와 종료 날짜 가져오기
					if (selectedDates.length === 2) {
						var startDate = selectedDates[0];
						var endDate = selectedDates[1];
						
						// 날짜 형식을 문자열로 변환 (예: '2024-01-01')
						var startDateFormatted = instance.formatDate(startDate,"Y-m-d");
						var endDateFormatted = instance.formatDate(endDate,"Y-m-d");
						
						document.getElementById('hiddenStartDate').value = startDateFormatted;
						document.getElementById('hiddenEndDate').value = endDateFormatted;

						// 콘솔에 출력 (또는 다른 처리)
						console.log("시작 날짜: "+ startDateFormatted);
						console.log("종료 날짜: "+ endDateFormatted);
						}
					}
			});
		});

		document.addEventListener('DOMContentLoaded', function() {
// 		$(document).ready(function() {

			// 여행 일정을 정의
			var itineraries = [ {
				title : "서울여행",
				location : "남산 공원 > 광장시장 > 동대문종합시장",
				date : "2024-01-22 ~ 2024-01-23",
				mapCenter : {
					lat : -34.397,
					lng : 150.644
				}
			},
			{
				title : "서울여행",
				location : "UN빌리지 > 디뮤지엄 > 누데이크 성수",
				date : "2024-01-22 ~ 2024-01-23",
				mapCenter : {
					lat : -34.397,
					lng : 150.644
				}
			}
			
			// 여행 일정 추가 가능
			];

			// 여행 일정을 동적으로 추가하여 사이드바 생성
			loadItineraries(itineraries);

			// 여행 일정 버튼 클릭 시 사이드바 열기/닫기 토글
// 			$("#tripPlanBtn").on("click", function() {
// 	            var sidebar = $("#my_sidebar_log");
// 	            if (sidebar.width() === 0) {
// 	                openSidebar();
// 	            } else {
// 	                closeSidebar();
// 	            }
//         	});
			
			
			document.getElementById('tripPlanBtn').addEventListener('click',
					function() {
						toggleSidebar();
			});

			// 사이드바 외부를 클릭하면 사이드바 닫기
			 $(document).on("click", function(e) {
		            var sidebar = $("#my_sidebar_log");
		            var tripPlanBtn = $("#tripPlanBtn");

		            if (!sidebar.is(e.target) && sidebar.has(e.target).length === 0 &&
		                !tripPlanBtn.is(e.target) && tripPlanBtn.has(e.target).length === 0) {
		                closeSidebar();
		            }
		        });
		    });
			
			
// 			document.addEventListener('click', function(e) {
// 				var sidebar = document.getElementById("my_sidebar_log");
// 				var tripPlanBtn = document.getElementById('tripPlanBtn');

// 				if (e.target !== sidebar && e.target !== tripPlanBtn
// 						&& !sidebar.contains(e.target)) {
// 					closeSidebar();
// 				}
// 			});
// 		});

		function loadItineraries(itineraries) {
			// 여행 일정을 동적으로 추가할 사이드바 엘리먼트
			var sidebar = document.getElementById('my_sidebar_log');

			// 데이터를 순회하면서 여행 일정을 사이드바에 추가
			itineraries.forEach(function(itinerary) {
				// 여행 일정을 표시할 아이템 생성
				var itineraryItem = document.createElement('div');
				itineraryItem.classList.add('itinerary-item');
				itineraryItem.textContent = itinerary.title;

				// 각 아이템에 클릭 이벤트 리스너 추가
				itineraryItem.addEventListener('click', function() {
					// 여행 일정 선택 시 Summernote 에디터에 추가
					var content = $('#summernote').summernote('code');
					content += '<div class="itinerary">';
					content += '<p class="itinerary-title"><strong>일정 이름:</strong> ' + itinerary.title + '</p>';
				    content += '<p class="itinerary-location"><strong>장소:</strong> ' + itinerary.location + '</p>';
				    content += '<p class="itinerary-date"><strong>날짜:</strong> ' + itinerary.date + '</p>';
				    content += '</div>';

// 							'<p>' + itinerary.title + '<br>'
// 							+ itinerary.location + '<br>' + itinerary.date
// 							+ '</p>';
					$("#summernote").summernote('code', content);

					// 여행 일정 선택 시 실행할 동작 추가
					alert('선택한 여행 일정: ' + itinerary.title);
				});

				// 사이드바에 아이템 추가
				sidebar.appendChild(itineraryItem);
			});
		}

		function toggleSidebar() {
			var sidebar = document.getElementById("my_sidebar_log");
			if (sidebar.style.width === "500px") {
				closeSidebar();
			} else {
				openSidebar();
			}
		}
		
		
// 		function openSidebar() {
// 	        var sidebar = $("#my_sidebar_log");
// 	        sidebar.animate({ width: "500px" }, 500);
// 	    }

// 	    function closeSidebar() {
// 	        var sidebar = $("#my_sidebar_log");
// 	        sidebar.animate({ width: "0" }, 500);
// 	    }

		function openSidebar() {
			var sidebar = document.getElementById("my_sidebar_log");
			sidebar.style.width = "500px";
		}

		function closeSidebar() {
			var sidebar = document.getElementById("my_sidebar_log");
			sidebar.style.width = "0";
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
			$("input[name='cityName']").autocomplete({
				source : cityData,
				minLength : 1, // 최소 글자수 (1글자부터 자동완성 시작)
			select : function(event, ui) {
				// 사용자가 도시를 선택했을 때의 동작
				console.log("Selected city: " + ui.item.value);
				}
			});
			
			// Enter 키 입력 방지
			$("form").on("keydown",	"input[name='cityName'], input[name='logTitle']",function(event) {
				if (event.key === "Enter") {
					event.preventDefault();
					}
			});

		});
		
		
	</script>

</body>
</html>

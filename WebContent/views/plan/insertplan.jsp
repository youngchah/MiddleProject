<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@include file="/include/header.jsp"%>
<link rel="stylesheet" href="/TripCatch/css/planstyles.css">
<body>

	<!--여기서부터 여행기록 기능-->

	<div class="planContainer">
		<div class="header">
			<input type="text" class="title-input" id="planTitle"
				placeholder="제목을 입력해 주세요" /> <input type="text" id="datepicker"
				placeholder="날짜 선택"> <input type="hidden"
				id="hiddenStartDate" name="startDate"> <input type="hidden"
				id="hiddenEndDate" name="endDate">
		</div>

		<div id="map" style="height: 400px;"></div>
		<!-- Map placeholder -->

		<div class="addDay" id="daysContainer">
			<!-- Days will be added here -->
		</div>

		<button id="addDayBtn" type="button">날짜 추가</button>
<!-- 		<button id="writeBtn" type="button">발행</button> -->
<%-- 		<a id="writeBtn" href="/plan/list.do?memId=<%=mv.getMem_Id()%>" onclick="onButtonClickPlan()" type="button">발행</a> --%>
		<button id="writeBtn" onclick="onButtonClickPlan()">발행</button>
		<script type="text/javascript" src="/TripCatch/js/planScript.js"></script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgTmLwYMUYaZiKFkCOfeyFGz-yV1nsALQ&callback=initMap&libraries=places">
        </script>
	</div>



	<div id="sidebar" class="sidebar">
		<div id="insidebar">
			<input id="placeInput" type="text" placeholder="장소 검색">
			<button id="placeButton" onclick="searchPlaces()">검색</button>
			<div id="placeResults"></div>
		</div>
	</div>

	<div id="modal" class="modal">
		<div class="modal-content">
			<h4 class="modal-title">경고</h4>
			<p>Day 1 이하로는 삭제할 수 없습니다.</p>
			<button class="modal-confirm-button" onclick="closeModal()">확인</button>
		</div>
	</div>
	
	<input type="hidden" id="mem_id" value="<%=mv.getMem_Id() %>">

	<br>
	<br>
	<br>
	<br>
	<br>


	<script>

	document.getElementById('writeBtn').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 제출 동작을 막습니다

	    if (!validateInput()) {
	        return; // 유효성 검사 실패 시 진행하지 않습니다.
	    }

	    var jsonData = {};

	    // 'content' 관련 데이터 먼저 추가
	    jsonData.content = {};
	    jsonData.content.planTitle = document.getElementById('planTitle').value;
	    jsonData.content.startDate = document.getElementById('hiddenStartDate').value;
	    jsonData.content.endDate = document.getElementById('hiddenEndDate').value;
	    jsonData.content.memId = document.getElementById('mem_id').value;
	    
	    var dayContainers = document.querySelectorAll('.addDay .day');

	    // forEach 대신 전통적인 함수 사용
	    Array.prototype.forEach.call(dayContainers, function(dayContainer, index) {
	        var dayTitle = 'Day ' + (index + 1); // Day 키값을 동적으로 생성
	        var placeElements = dayContainer.querySelectorAll('.place-add');
	        var places = [];

	        // forEach 대신 전통적인 함수 사용
	        Array.prototype.forEach.call(placeElements, function(placeElement) {
	            // 텍스트 컨텐츠에서 장소 이름 추출
	            var placeName = placeElement.textContent.trim().replace('location_pin', '').trim();
	            // 숨겨진 input에서 위도와 경도 값 추출
	            var latitude = placeElement.querySelector('.latitude').value;
	            var longitude = placeElement.querySelector('.longitude').value;
	            var cityname = placeElement.querySelector('.cityname').value;

	            // 각 장소에 대한 정보를 객체로 생성하여 배열에 추가
	            places.push({
	                name: placeName,
	                latitude: latitude,
	                longitude: longitude,
	                cityname: cityname
	            });
	        });

	        // 해당 일자의 장소 정보를 JSON 데이터에 추가
	        jsonData[dayTitle] = places;
	    });

	    // 데이터를 JSON 문자열로 변환
	    var cleanedJsonString = JSON.stringify(jsonData, null, 2);
	    console.log(cleanedJsonString);

	    var xhr = new XMLHttpRequest();

	    // JSP 페이지 URL로 POST 요청 설정
	    xhr.open('POST', '/TripCatch/plan/insert.do', true);

	    // 요청 헤더 설정
	    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

	    // 요청이 완료될 때의 콜백 정의
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4) { // 요청 완료
	            if (xhr.status === 200) { // 요청이 성공적
	                // 서버 응답을 여기서 처리합니다.
	                console.log('서버 응답:', xhr.responseText);
	                location.reload();
	            } else {
	                // 필요한 경우 오류 처리
	                console.error('서버로 JSON 데이터 전송 중 오류 발생');
	            }
	        }
	    };

	    // JSON 데이터를 서버로 보냅니다.
	    xhr.send(cleanedJsonString);
	});


    function validateInput() {
        var startDate = document.getElementById('hiddenStartDate').value;
        var endDate = document.getElementById('hiddenEndDate').value;
        var inputValue = document.querySelector('.title-input').value;

        if (inputValue === '') {
            alert('제목을 입력해 주세요');
            return false;
        }

        if (startDate === '') {
            alert('시작 날짜를 선택해 주세요');
            return false;
        }

        if (endDate === '') {
            alert('종료 날짜를 선택해 주세요');
            return false;
        }

        return true;
    }
    
    function onButtonClickPlan() {
        var memId = '<%= mv.getMem_Id() %>';
        var servletUrl = '/TripCatch/plan/list.do?mem_Id=' + encodeURIComponent(memId);
        window.location.href = servletUrl;
    }

        
        
    </script>

<%-- 	<%@include file="/include/footer.jsp"%> --%>

</body>

</html>
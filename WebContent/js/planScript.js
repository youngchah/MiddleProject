let map;
let dayCount = 0; // Initialize day counter
let daysData = {};

function initMap() {
    // Initialize the Google Map with placeholder coordinates
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 37.5117, lng: 127.0592 }, // 기본 위치 서울 코엑스
        zoom: 13,
        mapTypeControl: false // 이 부분을 추가하여 지도 유형 컨트롤을 비활성화합니다.
    });
}


//일정 추가 버튼


function addDay() {
    // Function to add a new day to the itinerary
    dayCount++;
    const daysContainer = document.getElementById('daysContainer');
    const dayDiv = document.createElement('div');
    dayDiv.className = 'day';
    dayDiv.id = 'day' + dayCount;

    // Header container를 먼저 생성
    const headerContainer = document.createElement('div');
    headerContainer.className = 'day-header';

    // 제목을 headerContainer에 추가
    const dayTitle = document.createElement('h3');
    dayTitle.textContent = `Day ${dayCount}`;
    headerContainer.appendChild(dayTitle);

    //제목을 클릭하면 경로변경
    dayTitle.onclick = function() {
        showDayPath(dayDiv.id);
    };

    // 휴지통 버튼을 headerContainer에 추가
    const deleteButton = document.createElement('button');
    deleteButton.innerHTML = '🗑️'; // 휴지통 아이콘
    deleteButton.className = 'delete-button';
	deleteButton.type = 'button';
    deleteButton.onclick = function() {
        deleteDay(dayDiv.id);
    };
    headerContainer.appendChild(deleteButton);

    // 컨테이너를 dayDiv에 추가
    dayDiv.appendChild(headerContainer);

    // 일정 추가 버튼 생성 및 추가
    const addScheduleButton = document.createElement('button');
    addScheduleButton.id = 'addScheduleButton';
    addScheduleButton.textContent = '일정 추가';
	addScheduleButton.type = 'button';
    addScheduleButton.onclick = function() {
        addSchedule(this);
    };
    dayDiv.appendChild(addScheduleButton);

    // 스케줄 컨테이너 생성 및 추가
    const scheduleContainer = document.createElement('div');
    scheduleContainer.className = 'scheduleContainer';
    dayDiv.appendChild(scheduleContainer);

    // dayDiv를 daysContainer에 추가
    daysContainer.appendChild(dayDiv);
    daysContainer.scrollLeft = daysContainer.scrollWidth;

    // 새로운 일정에 대한 데이터 초기화
    daysData['day' + dayCount] = {
        markers: [],
        markerPath: null
    };
}






document.addEventListener('DOMContentLoaded', (event) => {
    addDay();

    document.getElementById('addDayBtn').addEventListener('click', addDay);
});





///////////////////////////////////////////////

let currentDayId = null;

function addSchedule(button) {
    // 검색 모달 표시
    // document.getElementById('placeSearchModal').style.display = 'block';


    //사이드바 표시
    var sidebar = document.getElementById("sidebar");
    if (sidebar.style.width === "330px") {
        sidebar.style.width = "0";
    } else {
        sidebar.style.width = "330px";
    }

    // const scheduleDiv = button.nextElementSibling;
    // const newSchedule = document.createElement('div');
    // newSchedule.textContent = 'New Schedule';
    // scheduleDiv.appendChild(newSchedule);

    currentDayId = button.parentNode.id;

   
}

function searchPlaces() {
    const input = document.getElementById('placeInput');
    const query = input.value;

    // 검색 결과를 초기화
    document.getElementById('placeResults').innerHTML = '';

    // Places API 검색 실행
    const service = new google.maps.places.PlacesService(map);
    service.textSearch({query: query}, function(results, status) 
    {
        if (status === google.maps.places.PlacesServiceStatus.OK) 
        {
            for (let i = 0; i < results.length; i++) 
            {
                addPlaceResult(results[i]);
            }
        }
    });
}



//마커 기능
function addMarker(location) {
    const dayData = daysData[currentDayId];

    // Create a new numbered marker
    const markerNumber = dayData.markers.length + 1;
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        label: markerNumber.toString()
    });

    // Add the marker to the current day's marker list
    dayData.markers.push(marker);

    // 다른 날짜의 마커와 경로를 숨김
    for (let key in daysData) {
        if (key !== currentDayId) {
            daysData[key].markers.forEach(marker => marker.setMap(null));
            if (daysData[key].markerPath) {
                daysData[key].markerPath.setMap(null);
            }
        }
    }

    // Draw or update the path connecting the markers
    if (dayData.markerPath) {
        dayData.markerPath.setMap(null); // Remove existing path
    }
    const pathCoordinates = dayData.markers.map(m => m.getPosition());
    dayData.markerPath = new google.maps.Polyline({
        path: pathCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });
    dayData.markerPath.setMap(map);

    // 모든 마커를 포함하는 경계를 계산
    let bounds = new google.maps.LatLngBounds();
    dayData.markers.forEach(marker => bounds.extend(marker.getPosition()));

    // 지도의 경계와 줌을 조정
    if (!bounds.isEmpty()) {
        map.fitBounds(bounds);
    }

    // ... existing marker listener (if any) ...
}


let pinsetNumber = 0;

function addPlaceResult(place) {

    const resultsContainer = document.getElementById('placeResults');
    const placeDiv = document.createElement('div');
    placeDiv.className = 'place-result';

    // 장소 이름을 위한 요소 생성
    const placeName = document.createElement('div');
    placeName.className = 'place-name';
    placeName.innerHTML = '📍 ' + place.name; // 핀셋 아이콘 추가

    // 장소 주소를 위한 요소 생성
    const placeAddress = document.createElement('div');
    placeAddress.className = 'place-address';
    placeAddress.textContent = place.formatted_address;

    // 장소 이름과 주소를 placeDiv에 추가
    placeDiv.appendChild(placeName);
    placeDiv.appendChild(placeAddress);

    placeDiv.onclick = function() {
        // 장소 선택 시 모달 숨기기
        // document.getElementById('sidebar').style.display = 'none';

        //장소 선택시 사이드바 숨기기
        var sidebar = document.getElementById("sidebar");
        sidebar.style.width = "0";

        // 장소에 기하학적 속성이 있는지 확인
        if (place.geometry && place.geometry.location) {
            // 선택된 장소로 지도를 이동
            map.panTo(place.geometry.location);
            map.setZoom(15);

            // 선택된 위치에 마커 추가
            addMarker(place.geometry.location);
        }

        
        if (currentDayId) {

            pinsetNumber++;


   			const subplaceArray = place.formatted_address.split(' ');
      		const subplace = subplaceArray.length > 1 ? subplaceArray[1] : null; // 대전광역시, 서울특별시, 세종특별시, 대구광역시........

            const currentDayScheduleContainer = document.querySelector(`#${currentDayId} .scheduleContainer`);
            const placeNameDiv = document.createElement('div');
            placeNameDiv.className = 'place-add';
            placeNameDiv.innerHTML = `
          
                <div class="marker-icon">
                <span class="material-icons">location_pin</span>
                </div>

             	${place.name}
          		<input type="hidden" class="latitude" value="${place.geometry.location.lat()}">
          		<input type="hidden" class="longitude" value="${place.geometry.location.lng()}">
          		<input type="hidden" class="cityname" value="${subplace}">`;

            currentDayScheduleContainer.appendChild(placeNameDiv);
        }

  
    };
    
    resultsContainer.appendChild(placeDiv);
    

}

/////////////
function showDayPath(dayId) {
    // 모든 날짜의 경로와 마커를 숨김
    for (let key in daysData) {
        if (daysData[key].markerPath) {
            daysData[key].markerPath.setMap(null);
        }
        daysData[key].markers.forEach(marker => marker.setMap(null));
    }

    // 선택된 날짜의 경로와 마커만 표시
    if (daysData[dayId].markerPath) {
        daysData[dayId].markerPath.setMap(map);
    }
    daysData[dayId].markers.forEach(marker => marker.setMap(map));

    // 모든 마커를 포함하는 경계를 계산
    let bounds = new google.maps.LatLngBounds();
    daysData[dayId].markers.forEach(marker => bounds.extend(marker.getPosition()));

    // 지도의 경계와 줌을 조정
    if (!bounds.isEmpty()) {
        map.fitBounds(bounds);
    }
}



function deleteDay(dayId) {
    // day1인 경우 모달 창 표시
    if (dayId === 'day1') {
      showModal();
    } else {
        // ... 나머지 삭제 로직 ...
        const dayElement = document.getElementById(dayId);
        dayElement.remove();
      
        // daysData 객체에서 해당 일정의 데이터를 제거
        delete daysData[dayId];
      
        // 남은 일정의 id 및 제목을 업데이트
        updateDays();
    }
  }



function updateDays() {
    const dayElements = document.getElementsByClassName('day');
    let newDayCount = 0;
    const newDaysData = {};

    for (let i = 0; i < dayElements.length; i++) {
        // 기존의 'day1', 'day2', ... 에 해당하는 데이터를 새로운 객체에 업데이트
        const oldDayId = dayElements[i].id;
        newDayCount++;
        const newDayId = 'day' + newDayCount;
        dayElements[i].id = newDayId;
        dayElements[i].querySelector('h3').textContent = 'Day ' + newDayCount;

        // 새로운 ID를 사용하여 daysData 객체를 업데이트
        newDaysData[newDayId] = daysData[oldDayId];
    }

    dayCount = newDayCount; // 전역 dayCount를 업데이트
    daysData = newDaysData; // 전역 daysData를 업데이트
}

function showModal() {
    // Get the modal
    var modal = document.getElementById("modal");
  
    // Open the modal 
    modal.style.display = "flex";
  }
  
function closeModal() {
    // Get the modal
    var modal = document.getElementById("modal");
  
    // Close the modal
    modal.style.display = "none";
}

document.addEventListener('DOMContentLoaded', function() {
    flatpickr("#datepicker", {
        mode: "range",
        minDate: "today",
        dateFormat: "Y-m-d",

        onChange: function(selectedDates, dateStr, instance) {
            // 시작 날짜와 종료 날짜 가져오기
            if (selectedDates.length === 2) {
                var startDate = selectedDates[0];
                var endDate = selectedDates[1];

                // 날짜 형식을 문자열로 변환 (예: '2024-01-01')
                var startDateFormatted = instance.formatDate(startDate, "Y-m-d");
                var endDateFormatted = instance.formatDate(endDate, "Y-m-d");
				
				
				document.getElementById('hiddenStartDate').value = startDateFormatted;
        		document.getElementById('hiddenEndDate').value = endDateFormatted;

                // 콘솔에 출력 (또는 다른 처리)

			
                console.log("시작 날짜: " + startDateFormatted);
                console.log("종료 날짜: " + endDateFormatted);
            }
        }
        
    });
});



//닉네임 수정 모달
var modalNick = document.getElementById("myModalNick");

// 모달을 여는 버튼 가져오기
var btnNick = document.getElementById("edit-nick-button");

// 모달을 닫는 <span> 요소 가져오기
var spanNick = document.getElementsByClassName("closeNick")[0];

// 사용자가 버튼을 클릭하면 모달 열기
btnNick.onclick = function() {
  modalNick.style.display = "block";
}


// <span> (x)를 클릭하면 모달 닫기
spanNick.onclick = function() {
  modalNick.style.display = "none";
}

// 사용자가 모달 외부를 클릭하면 모달 닫기
window.onclick = function(event) {
  if (event.target == modalNick) {
    modalNick.style.display = "none";
  }
}


var cancelButtonNick = document.getElementById("cancelNickButton");
cancelButtonNick.onclick = function() {
  modalNick.style.display = "none";
}

// 확인 버튼 이벤트 리스너
var confirmButtonNick = document.getElementById("confirmNickButton");
confirmButtonNick.onclick = function() {
  // 확인 버튼 클릭 시 수행할 작업
  modalNick.style.display = "none";
}




var modalTel = document.getElementById("myModalTel");

// 연락처 수정 버튼 가져오기
var btnTel = document.getElementById("edit-tel-button");

// 연락처 수정 모달 닫기 버튼 가져오기
var spanTel = document.getElementsByClassName("closeTel")[0];

// 연락처 수정 버튼 클릭 시 모달 열기
btnTel.onclick = function() {
  modalTel.style.display = "block";
}

// 연락처 수정 모달 닫기 버튼 클릭 시 모달 닫기
spanTel.onclick = function() {
  modalTel.style.display = "none";
}



var cancelButtonTel = document.getElementById("cancelTelButton");
cancelButtonTel.onclick = function() {
  modalTel.style.display = "none";
}

// 확인 버튼 이벤트 리스너
var confirmButtonTel = document.getElementById("confirmTelButton");
confirmButtonTel.onclick = function() {
  // 확인 버튼 클릭 시 수행할 작업
  modalTel.style.display = "none";
}



// 이메일 수정 모달 가져오기
var modalEmail = document.getElementById("myModalEmail");

// 이메일 수정 버튼 가져오기
var btnEmail = document.getElementById("edit-email-button");

// 이메일 수정 모달 닫기 버튼 가져오기
var spanEmail = document.getElementsByClassName("closeEmail")[0];

// 이메일 수정 버튼 클릭 시 모달 열기
btnEmail.onclick = function() {
  modalEmail.style.display = "block";
}

// 이메일 수정 모달 닫기 버튼 클릭 시 모달 닫기
spanEmail.onclick = function() {
  modalEmail.style.display = "none";
}

// 모달 외부 클릭 시 모든 모달 닫기
window.onclick = function(event) {
  if (event.target == modalTel || event.target == modalEmail) {
    modalTel.style.display = "none";
    modalEmail.style.display = "none";
  }
}


var cancelButtonEmail = document.getElementById("cancelEmailButton");
cancelButtonEmail.onclick = function() {
  modalEmail.style.display = "none";
}

// 확인 버튼 이벤트 리스너
var confirmButtonEmail = document.getElementById("confirmEmailButton");
confirmButtonEmail.onclick = function() {
  // 확인 버튼 클릭 시 수행할 작업
  modalEmail.style.display = "none";
}





// 이름 수정 모달 가져오기
var modalName = document.getElementById("myModalName");

// 이름 수정 버튼 가져오기
var btnName = document.getElementById("edit-name-button");

// 이름 수정 모달 닫기 버튼 가져오기
var spanName = document.getElementsByClassName("closeName")[0];

// 이름 수정 버튼 클릭 시 모달 열기
btnName.onclick = function() {
  modalName.style.display = "block";
}

// 이름 수정 모달 닫기 버튼 클릭 시 모달 닫기
spanName.onclick = function() {
  modalName.style.display = "none";
}

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
  if (event.target == modalName) {
    modalName.style.display = "none";
  }
}


var cancelButtonName = document.getElementById("cancelNameButton");
cancelButtonName.onclick = function() {
  modalName.style.display = "none";
}

// 확인 버튼 이벤트 리스너
var confirmButtonName = document.getElementById("confirmNameButton");
confirmButtonName.onclick = function() {
  // 확인 버튼 클릭 시 수행할 작업
  modalName.style.display = "none";
}


document.getElementById('deleteButton').addEventListener('click', function() {
  document.querySelector('.formMargin').submit();
});














  












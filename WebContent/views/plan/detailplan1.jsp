<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/include/header.jsp" %>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<style>
.plan_wrap {
	border-radius: 8px;
	background-color: white;
	width: 80vh;
	height: 105vh;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 20px 20px 20px 20px;
	position: relative;
	left: 490px;
	/* 오른쪽으로 20px 이동 */
}

#plan_title {
	margin-top: 10px;
	margin-bottom: 20px;
}

.schedule_date {
	border-radius: 8px;
	background-color: white;
}

.plan_date {
	display: inline;
}

.hr_slider {
	border-radius: 8px;
	background-color: white;
	margin-top: 20px;
	margin-bottom: 20px;
}

#map {
	border-radius: 8px;
	background-color: darkgoldenrod;
	width: 70vh;
	height: 50vh;
	position: relative;
	left: 0px;
}

.list_wrap {
    border-radius: 8px;
    background-color: white;

    width: 70vh;
    height: 28vh;

    position: relative;
    left: 35px;

    margin-top: 15px;
    
	left: -2vh;
    overflow-x: auto;
    white-space: nowrap;
}

.list_wrap_content {
	height: 100%; /* Set the height to 100% to match the parent's height */
}

.date_wrap {
	display: inline-block;
	border-radius: 8px;
	vertical-align: top;
	/* background-color: floralwhite; */
	border: 1px solid #ccc;
	width: 23vh;
	height: 25vh;
	position: relative;
	left: 20px;
	top: 15px;
}

#plan_edit {
	border-radius: 8px;
	margin-bottom: 10px;
	position: relative;
	left: 1105px;
	background-color: black;
	/* 배경색 검정 */
	color: white;
	/* 글자색 흰색 */
	padding: 15px 32px;
	/* 내부 여백 */
	text-align: center;
	/* 텍스트 정렬 */
	text-decoration: none;
	/* 텍스트 장식 제거 */
	display: inline-block;
	/* 인라인 블록으로 표시 */
	font-size: 16px;
	/* 글꼴 크기 */
	margin: 4px 2px;
	/* 외부 여백 */
	cursor: pointer;
	/* 커서 스타일 */
	border: 2px solid white;
	/* 흰색 테두리 */
	border-radius: 8px;
	/* 테두리 둥글게 */
	transition: all 0.3s;
	/* 부드러운 전환 효과 */
}

#plan_edit:hover {
	background-color: white;
	/* 마우스 오버 시 배경색 흰색 */
	color: black;
	/* 마우스 오버 시 글자색 검정 */
	border: 2px solid black;
	/* 마우스 오버 시 검정 테두리 */
}

#plan_edit:active {
	background-color: grey;
	/* 클릭 시 배경색 회색 */
	border-color: darkgrey;
	/* 클릭 시 테두리색 어두운 회색 */
}

#dayTtile {
	background-color: black;
	border-radius: 8px;
	color: white;
	padding-bottom: 10px;
	padding-top: 10px;
	padding-left: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border-radius: 8px;
}

th, td {
	padding: 8px;
	text-align: left;
}

.locationTitle {
	padding-bottom: 10px;
	font-weight: 500;
	font-size: 1.0rem;
	line-height: 1.3;
	white-space: normal;
	border-bottom: 0.1rem solid #242424;
	width: 70%;
	margin-left: 20px;
	margin-bottom: 10px;
	/* 가로 크기를 50%로 설정 */
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





    <form>
        <div class="plan_wrap">
            <span>여행일정</span>
            <h2 id="plan_title">서울여행</h2>

            <div class="schedule_date">
                <span>plan</span>
                <div class="plan_date">2024-01-22 ~ 2024-01-23</div>
            </div>

            <div class="hr_slider">

                <span>서울특별시</span>

            </div>
            <hr>

            <div id="map">





            </div>


            <div class="list_wrap">

                <div class="date_wrap">

                    <h2 id="dayTtile">Day 1</h2>
                    <div class="locationTitle">서울특별시</div>



                    <div>

                        <table>
                            <tr>
                                <th>1</th>
                                <td>남산공원</td>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>광장시장</td>
                            </tr>
                             <tr>
                                <th>3</th>
                                <td>동대문 종합시장</td>
                            </tr>

                        </table>

                    </div>

                </div>
                
                
                <div class="date_wrap">

                    <h2 id="dayTtile">Day 2</h2>
                    <div class="locationTitle">서울특별시</div>



                    <div>

                        <table>
                            <tr>
                                <th>1</th>
                                <td>UN빌리지</td>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>디뮤지엄</td>
                            </tr>
                            <tr>
                                <th>3</th>
                                <td>누데이크 성수</td>
                            </tr>

                        </table>

                    </div>

                </div>



            </div>
            
            
            



        </div>

        <button id="plan_edit" type="button">수정</button>


    </form>






<%@include file="/include/footer.jsp" %>

</body>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgTmLwYMUYaZiKFkCOfeyFGz-yV1nsALQ&callback=initMap&libraries=places">
</script>

</html>
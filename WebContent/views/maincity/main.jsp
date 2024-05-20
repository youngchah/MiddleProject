<%@page import="java.util.Random"%>
<%@page import="plan.vo.CombinePlanVO"%>
<%@page import="city.vo.AllVO"%>
<%@page import="city.vo.MCityVO"%>
<%@page import="city.vo.MComVO"%>
<%@page import="city.vo.MLandVO"%>
<%@page import="community.vo.ComVO"%>
<%@page import="landmark.vo.LandmarkVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		
		List<AllVO> allList = (List<AllVO>)request.getAttribute("allList");
		List<MCityVO> cityList = (List<MCityVO>)request.getAttribute("CityList");
		List<MLandVO> Mlandlist = (List<MLandVO>)request.getAttribute("LandList");
		List<MComVO> comlist = (List<MComVO>)request.getAttribute("ComList");
		List<LandmarkVO> landList = (List<LandmarkVO>)request.getAttribute("landList");
		List<CombinePlanVO> planList = (List<CombinePlanVO>) request.getAttribute("Plan");

%>


<%@include file="../../include/header.jsp"%>


<%
	// 	vo		  LandMartList     ("land")
// plan vo 여행일정 planList			("plan")
// log vo 여행 기록  logList			("log")

// jsp 단독으로 홈페이지가 켜지는 경우는 서블릿을 통해 값을 안가져오는 코드가 있을때만 가능
// 하지만 jsp 단독으로 홈페이지가 안켜지는 경우는 서블릿을 통해 값을 가져와야되기 때문에 서블릿으로 켜서 홈페이지를 켜야함

// 전체 검색 할대
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
<title>LandMarkList</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/maincity/main.css">
<%-- <link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/reset.css"> --%>
<head>
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI/t1f1fVmE2tmJMRd6B1p2JC4l/0S+X55lPf6GI="
            crossorigin="anonymous"></script>
   


<style>

.images-container {
    display: flex;
    flex-direction: row; /* 자식 요소들을 가로로 나열 */
    flex-wrap: nowrap; /* 가로로만 나열하고 줄바꿈하지 않음 */
    overflow-x: hidden; /* 기본 상태에서는 가로 스크롤 숨김 */
    width: 700px; /* 고정 너비 */
    height: 350px; /* 고정 높이 */
    padding: 10px;
}

.images-container:hover {
    overflow-x: auto; /* 마우스를 올렸을 때 가로 스크롤 표시 */
}

.images-container > * {
    flex-shrink: 0; /* 자식 요소들이 줄어들지 않도록 설정 */
    margin-right: 10px; /* 자식 요소들 사이의 간격 */
}
.title_city{
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}



</style>

</head>


<body>
	<!--이거 넣어주세요  -->

	<!-- 이부분을 if걸고 어떤걸 거냐 comlist  landlist  cityList 이게 널이면 특별시 서울 특별시가 안뜨게하고 -->
	<!-- if{comlist != null || landlist != null || cityList != null} -->
	<!-- else{}  -->
	<!-- 특별시 자리에 검색결과 단어를 넣고  여기는 니가 검색을 한 단어가 들어와야함 -->
	<div class="city_name">

		<%
			for (MCityVO civ : cityList) {
		%>
		<div class="title_city">
		
		<h3><%=civ.getCity_county()%></h3>
		<span class="citym_name"><%=civ.getCity_name()%></span>
		
		</div>

	</div>

	<!-- 메뉴 -->
	<div class="button-container">
		<div class="button-wrapper" id="homeButton">
			<a
				href="<%=request.getContextPath()%>/maincity/main.do?city_num=<%=civ.getCity_num()%>">
				<button onclick="showContent('home')">전체</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripPlanButton">
			<a href="<%=request.getContextPath()%>/plan/listplanBycity.do?city_num=<%=civ.getCity_num()%>">
				<button onclick="showContent('tripPlan')">여행 일정</button>
			</a>
		</div>
		<div class="button-wrapper" id="tripLogButton">
			<a
				href="<%=request.getContextPath()%>/log/loglistBycity.do?cityNum=<%=civ.getCity_num()%>">
				<button onclick="showContent('tripLog')">여행 기록</button>
			</a>
		</div>
		<div class="button-wrapper" id="landmarkButton">
			<a href="<%=request.getContextPath()%>/city/landmarklist?cityNum=<%=civ.getCity_num()%>"> <!-- 수정된 부분: 각 버튼에 하이퍼링크 추가 -->
				<button onclick="showContent('landmark')">랜드마크</button>
			</a>
		</div>
		<div class="button-wrapper" id="communityButton">
			<a href="<%=request.getContextPath()%>/maincity/community.do">
				<button onclick="showContent('community')">커뮤니티</button>
			</a>
		</div>
	</div>


	<div class="content" id="contentArea">

		<!-- 여기에 버튼을 눌렀을 때 나타날 내용을 동적으로 추가할 예정입니다. -->
		<div class="home">

			<div class="travel-container">
				<br>
				<h2>여행일정</h2>
				<span>다양한 장소와 리뷰로 만들어진 여행일정을 확인해보세요.</span>
				<div class="more-button-travel">
					<a href="#">
						<button>더보기 🡪</button>
					</a>
				</div>

				
				<div class="images-container">
				
				
					
				<%
				

				
					int index = 1;
					for(CombinePlanVO cbp : planList){
				
						 	double minLongitude = 126.7644;
					        double maxLongitude = 127.1836;
					        double minLatitude = 37.4258;
					        double maxLatitude = 37.7017;

					        // Random 객체 생성
					        Random random = new Random();

					        // 랜덤 경도, 위도 생성
					        double randomLongitude = minLongitude + (maxLongitude - minLongitude) * random.nextDouble();
					        double randomLatitude = minLatitude + (maxLatitude - minLatitude) * random.nextDouble();
				%>
				
						<a href="/TripCatch/views/plan/detailplan<%=index%>.jsp"> <img src="https://maps.googleapis.com/maps/api/staticmap?center=<%=randomLatitude%>,<%=randomLongitude%>&zoom=15&size=600x600&maptype=roadmap&markers=color:red%7Clabel:C%7C36.<%=randomLatitude%>,<%=randomLongitude%>&key=AIzaSyBgTmLwYMUYaZiKFkCOfeyFGz-yV1nsALQ"
                        alt="Google Map">
						<div class="travel">Travel&nbsp;&nbsp;<%=cityList.get(0).getCity_name() %></div>
						<div class="title"><%=cbp.getPlan_title() %></div> <br>
						<div class="nickname">하림&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cbp.getPlan_date() %></div>
						</a> 
				
				
				<%
					index++;
						}
				
				%>
			</div>


			<br> <br> <br>

			<div class="travel-container">
				<br>
				<h2>여행기록</h2>
				<span>여행을 공유 받고 여행에 대한 설렘을 느껴보세요.</span>
				<div class="more-button-schedule">
					<a href="<%=request.getContextPath()%>/log/loglistBycity.do?cityNum=<%=civ.getCity_num()%>">
						<button>더보기 🡪</button>
					</a>
				</div>

				<div class="schedule-container">
					<a href="#"> 
						<img src="<%=request.getContextPath()%>/img/maincity/메인시티_로그0.jpg" alt="이미지 1">
						<div class="travel">자유여행</div>
						<div class="title">경복궁 야간개장!</div> <br>
						<div class="nickname">By여행이좋아</div>
					</a> 
					<a href="#"> 
						<img src="<%=request.getContextPath()%>/img/maincity/메인시티_로그1.jpg" alt="이미지 2">
						<div class="travel">자유여행</div>
						<div class="title">망그러진 곰 팝업스토어</div> <br>
						<div class="nickname">By코딩왕</div>
					</a> 
					<a href="#"> 
						<img src="<%=request.getContextPath()%>/img/maincity/메인시티_로그2.jpg"alt="이미지 3">
						<div class="travel">자유여행</div>
						<div class="title">서울식물원 다녀온 후기</div> <br>
						<div class="nickname">By사과</div>
					</a>
				</div>
			</div>
			<br> <br> <br>

			<div class="landmark-container">
				<div>
					<h2>랜드마크</h2>
					<span>도시의 이미지를 대표하는 랜드마크 정보를 확인해보세요.</span>
					<div class="more-button-landmark">
						<a href="<%=request.getContextPath()%>/city/landmarklist?cityNum=<%=civ.getCity_num()%>">
							<button>더보기 🡪</button>
						</a>
					</div>
				</div>

<%
		}
		%>

				<!-- 포문 돌리는 곳. -->
				<div class="landmark">
				<%
					for (int i = 0; i < 4; i++) {
						LandmarkVO mlv = landList.get(i);
				%> 
<%-- 					<a href="<%=request.getContextPath() %>/city/landmarkdetail?cityNum=<%=lv.getCity_num() %>&?=landNmae<%=lv.getLand_name() %>"> --%>
	
					<a href="<%=request.getContextPath() %>/city/landmarkdetail?cityname=<%=mlv.getCityName() %>&landName=<%=mlv.getLandName() %>">
						<img src="<%=request.getContextPath()%>/img/landmarkimg/랜드마크<%= i %>.jpg" alt="이미지 1">
						<div class="travel"><%=mlv.getCityName() %></div>
						<div class="title"><%=mlv.getLandName() %></div>
						<div class="stitle"><%=mlv.getLandTitle() %></div>
					</a> 
				<% 
					}
				%>
				</div>
			</div>

			<br> <br> <br>

			<div class="community-container">
				<div>
					<h2>커뮤니티</h2>
					<span>여행을 사랑하는 친구들과 여행이야기를 나누어보세요.</span>
					<div class="more-button-community">
						<a href="<%=request.getContextPath()%>/community/list.do">
							<button>더보기 🡪</button>
						</a>
					</div>
				</div>

				<div class="community">
				<%
					for(MComVO cv : comlist){
				%>
					<a href="#">
						<div class="date"><%=cv.getCom_regi()  %></div>
						<div class="title"><%=cv.getCom_title() %></div>
						<div class="nick">By<%=cv.getMem_nick() %></div>
					</a> 
				<%
					}
				%>
				</div>
			</div>


		</div>
	</div>


	<script src="../../js/main/main.js"></script>
	<%@include file="../../include/footer.jsp"%>
</body>
</html>

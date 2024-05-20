<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="include/header.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=IBM+Plex+Sans+KR&family=Nothing+You+Could+Do&display=swap" rel="stylesheet">
<style>
span, h2, p, li, a, body {
	font-family: 'IBM Plex Sans', 'IBM Plex Sans KR', sans-serif !important;
}

</style>

<body>
<!-- 대문사진 시작-->
<div class="slider_area">
   <div class="slider_active owl-carousel">
      <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-xl-12 col-md-12">
                  <div class="slider_text text-center">
                     <h3>Danyang</h3>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-xl-12 col-md-12">
                  <div class="slider_text text-center">
                     <h3>Chungju</h3>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-xl-12 col-md-12">
                  <div class="slider_text text-center">
                     <h3>Busan</h3>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                        <p>&nbsp</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- 대문사진 끝 -->


<!-- 여행기록 top8 시작 -->
<div class="popular_places_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 ">
                <div class="section_title mb_70">
                    <h2>🔥여행기록 TOP 8</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production80/d995/2029352e-a052-4592-8912-9399f1fdf8d9.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="서울">
                    </div>
                    <div class="place_info">
                        <a href="<%=request.getContextPath() %>/log/loglistBycity.do?cityNum=1">
                            <h3>TOP 1. 서울</h3>
                        </a>
                        <p>옛것과 새것의 조화를 느낄 수 있는 곳</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">5.0/5.0</a>
                            </span>
                          <!--   <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production25/d1963/ff270ab5-b325-4090-9dc0-0662678fb965.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="부산">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 2. 부산</h3>
                        </a>
                        <p>활기 넘치는 휴가를 보내고 싶을 때</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">5.0/5.0</a>
                            </span>
                            <!-- <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production124/d914/245ce1ee-2bf1-44a8-a5cd-2e0e4bcb7678.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="제주도">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 3. 제주도</h3>
                        </a>
                        <p>제주의 매력을 가까이에서 듬뿍</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">4.9/5.0</a>
                            </span>
                            <!-- <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production104/d146/7db7c35a-6af7-4e67-8731-43054d6e3dbe.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="인천">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 4. 인천</h3>
                        </a>
                        <p>역사와 문화가 살아숨쉬는 곳</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">4.7/5.0</a>
                            </span>
                           <!--  <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production0/d368/157ac754-8ee5-44d6-a55e-5ad6f6a09771.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="여수">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 5. 여수</h3>
                        </a>
                        <p>여유있고 한가로운 여행을 선사</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">4.6/5.0</a>
                            </span>
                           <!--  <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production53/d1881/911ec313-bba0-460c-9076-b8dbcda2596c.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="수원">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 6. 수원</h3>
                        </a>
                        <p>눈과 입이 즐거운 곳</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">4.5/5.0</a>
                            </span>
                            <!-- <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production48/d510/097c8b7a-3bb5-4be3-ad27-5088ca6b8040.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="대전">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 7. 대전</h3>
                        </a>
                        <p>호젓한 힐링과 지식 여행의 완성</p>
                         <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">4.3/5.0</a>
                            </span>
                            <!-- <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#">5 Days</a>
                            </div> -->
                        </div> 
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production146/d1723/747b786b-adbb-4985-a75f-d99d99c3733e.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>TOP 8. 광주</h3>
                        </a>
                        <p>맛과 멋을 두루 느낄 수 있는 곳</p>
                        <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <a href="#">3.9/5.0</a>
                            </span>
                            <!-- <div class="days">
                                <i class="fa fa-clock-o"></i>
                                <a href="#"></a>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 여행기록 top8 끝 -->



<!-- 요즘 국내 여행은 여기 시작  -->
<div class="popular_destination_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="section_title mb_70">
                    <h2>🚗요즘 국내 여행은 여기</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single_destination">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production60/d1151/fe560f4a-af39-4252-b611-96dba50a6674.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="삼척">
                    </div>
                    <div class="content">
                        <p class="d-flex align-items-center">  <!-- <a href="#">  07 Places</a> --> </p>
                        
                    </div>
                </div>
                <p class="destination-name">숨겨진 여행지 삼척!</p>
                <p class="destination-description">보물 같은 산책로가 가득한 곳</p>
                <br>
                <span class="nick">트래블러 님의 여행</span>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_destination">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production143/d1081/c79ad7b9-4274-4697-b114-376d4dd7991b.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="">
                    </div>
                    <div class="content">
                        <p class="d-flex align-items-center"> <!-- <a href="#">  03 Places</a> --> </p>
                        
                    </div>
                </div>
                <p class="destination-name">전주의 현지 맛집 베스트 10</p>
                <p class="destination-description">친구들과 먹고, 놀고, 먹고!</p>
                <br>
                <span class="nick">배배 님의 여행</span>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_destination">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production61/d903/3440db45-de3e-48fe-b3ab-90facaf9b533.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="거북거북">
                    </div>
                    <div class="content">
                        <p class="d-flex align-items-center"> <!-- <a href="#">  10 Places</a> --> </p>
                        
                        
                    </div>
                </div>
                        <p class="destination-name">국내 아쿠아리움 비교, 추천 </p>
                        <p class="destination-description">귀여운 바다 친구들과의 만남 </p>
                        <br>
                        <span class="nick">융더 님의 여행</span>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_destination">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production31/d677/e8e2619c-b279-4613-bb39-90e36ef5aa18.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="통영">
                    </div>
                    <div class="content">
                        <p class="d-flex align-items-center"> <!-- <a href="#">  02 Places</a> --> </p>
                        
                    </div>
                </div>
                		<p class="destination-name">어트랙션 통영 여행 </p>
                        <p class="destination-description">스릴넘치는 여행 같이 가실?</p>
                        <br>
                        <span class="nick">삶은땅콩 님의 여행</span>
            </div>
        </div>
    </div>
</div>
<!-- 요즘 국내 여행은 여기 끝  -->


<!-- 꽉자바 가이드 시작  -->
<div class="popular_places_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section_title mb_70">
                    <h2>🎈꽉자바 가이드</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production39/d1730/af444a07-b68c-4321-b036-d2cdc630f443.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="전주">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>전통 마을! 전주</h3>
                        </a>
                        <p>멋스러운 한옥으로 가득한 전통 마을</p>
                       <span class="nick">자바 님의 여행</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production93/d1754/4bfdd418-4f95-495f-9952-612658550247.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>한국에서 즐기는 일본</h3>
                        </a>
                        <p>해외 느낌 물씬 풍기는 국내 료칸 추천</p>
                        <span class="nick">자바 님의 여행</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://test-resize-image.wishbeen.co.kr/7274b67c7c775413a49328dbaf02d18e.jpg?w=790&q=80" alt="강릉">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>템플스테이 A to Z</h3>
                        </a>
                        <p>잠시 쉬어도 괜찮아</p>
                        <span class="nick">자바 님의 여행</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_place">
                    <div class="thumb">
                        <img src="https://a.cdn-hotels.com/gdcs/production36/d1440/d2092e2c-3944-42f1-893f-a1553738aab0.jpg?impolicy=fcrop&w=1600&h=1066&q=medium" alt="제주도">
                    </div>
                    <div class="place_info">
                        <a href="#">
                            <h3>평점/후기 좋은, 제주!</h3>
                        </a>
                        <p>제주도에서 제일 유명한 것은?</p>
                        <span class="nick">자바 님의 여행</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<!-- 꽉자바 가이드 끝  -->


<%@include file="include/footer.jsp" %>

</body>
</html>
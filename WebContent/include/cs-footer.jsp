<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=IBM+Plex+Sans:ital,wght@0,400;1,300&display=swap" rel="stylesheet">

<style>
p, a, li{
	font-family: 'IBM Plex Sans', 'IBM Plex Sans KR', sans-serif !important;
}
.footer_title{

	font-family: 'IBM Plex Sans', 'IBM Plex Sans KR', sans-serif !important;

}
</style>

<footer class="footer">
	<div class="footer_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-4 col-md-6 col-lg-4 ">
					<div class="footer_widget">
						<div class="footer_logo">
							<a href="#"> <img src="<%=request.getContextPath() %>/resource/여행꽉자바로고2(투명)(크기줄임).png" alt="">
							</a>
						</div>
						<p>
							대전광역시 중구 계룡로 846 4층  <br> 403호 <br>
							<a href="#">+82 042 222 8202</a> <br> <a href="#">TripCatch403@gmail.com</a>
						</p>
					</div>
				</div>
				<div class="col-xl-2 col-md-6 col-lg-4">
					<div class="footer_widget">
						<h3 class="footer_title">여행꽉자바</h3>
						<ul class="links">
							<li><a href="<%=request.getContextPath() %>/mypage/cs">고객센터</a></li>
							<li><a href="#">회사소개</a></li>
							<li><a href="#"> </a></li>
							<li><a href="#"> </a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-lg-4">
					<div class="footer_widget">
						<h3 class="footer_title">인기 여행지</h3>
						<ul class="links double_links">
							<li><a href="#">서울특별시</a></li>
							<li><a href="#">대전광역시</a></li>
							<li><a href="#">충청남도</a></li>
							<li><a href="#">강원특별자치도</a></li>
							<li><a href="#">제주도</a></li>
							<li><a href="#">부산광역시</a></li>
							<li><a href="#">전라남도</a></li>
							<li><a href="#">경산북도</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-lg-4">
					<div class="footer_widget">
						<h3 class="footer_title">인스타그램</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copy-right_text">
		<div class="container">
			<div class="footer_border"></div>
			<div class="row">
				<div class="col-xl-12">
					<p class="copy_right text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | Catch the Travel <i
							class="fa fa-heart-o" aria-hidden="true"></i> Made by <a
							href="https://colorlib.com" target="_blank">Team 3</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Modal -->
<!-- Ã«Â©ÂÃ¬ÂÂ¸Ã­ÂÂÃ¬ÂÂ´Ã¬Â§Â ÃªÂ²ÂÃ¬ÂÂ(Ã«ÂÂÃ«Â³Â´ÃªÂ¸Â°)Ã«ÂÂÃ«Â¥Â´Ã«Â©Â´ Ã«ÂÂÃ¬ÂÂ¤Ã«ÂÂÃ«Â¶ÂÃ«Â¶Â -->
<div class="modal fade custom_search_pop" id="exampleModalCenter"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="serch_form">
				<input type="text" placeholder="Search">
				<button type="submit">search</button>
			</div>
		</div>
	</div>
</div>



<!-- 신하림 사이드바 -->


<div id="city_sidebar" class="city_sidebar">
    <!-- 특별시 -->
    <span onclick="showSubCategories('special_city')">특별시 광역시</span> <br>
    <ul id="special_city" class="sub_categories">
    	<hr>
    	
    	
    	<!-- 누르면 홈페이지로 가는게 아니라 서블릿으로 보내고 메인 리스트 출력 -->
    	<!-- ex)   ?city_name="서울특별시" -->
    	<!-- doget ?city_name -->
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=1" onclick="changeCategory('서울특별시')">서울특별시</a></li> 
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=2" onclick="changeCategory('인천광역시')">인천광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=3" onclick="changeCategory('대전광역시')">대전광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=4" onclick="changeCategory('대구광역시')">대구광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=5" onclick="changeCategory('울산광역시')">울산광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=6" onclick="changeCategory('부산광역시')">부산광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=7" onclick="changeCategory('광주광역시')">광주광역시</a></li>
        <hr>
        <li><a href="<%=request.getContextPath() %>/maincity/main.do?city_num=8" onclick="changeCategory('세종특별자치시')">세종특별자치시</a></li>
        <hr>
    </ul>

    <!-- 경기도 -->
    <span onclick="showSubCategories('gyeonggi_province')">경기도</span> <br>
	<ul id="gyeonggi_province" class="sub_categories">
    <hr>
    <li><a href="#" onclick="changeCategory('수원시')">수원시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('용인시')">용인시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('고양시')">고양시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('성남시')">성남시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('화성시')">화성시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('부천시')">부천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('남양주시')">남양주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('안산시')">안산시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('평택시')">평택시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('안양시')">안양시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('시흥시')">시흥시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('파주시')">파주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('김포시')">김포시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('의정부시')">의정부시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('광주시')">광주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('하남시')">하남시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('광명시')">광명시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('군포시')">군포시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('양주시')">양주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('오산시')">오산시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('이천시')">이천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('안성시')">안성시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('구리시')">구리시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('의왕시')">의왕시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('포천시')">포천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('여주시')">여주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('동두천시')">동두천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('과천시')">과천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('양평군')">양평군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('가평군')">가평군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('연쳔군')">연천군</a></li>
    <hr>
</ul>


    <!-- 강원특별자치도 -->
    <span onclick="showSubCategories('gangwon_province')">강원특별자치도</span> <br>
	<ul id="gangwon_province" class="sub_categories">
    <hr>
    <li><a href="#" onclick="changeCategory('춘천시')">춘천시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('원주시')">원주시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('강릉시')">강릉시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('동해시')">동해시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('태백시')">태백시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('속초시')">속초시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('삼척시')">삼척시</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('홍천군')">홍천군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('횡성군')">횡성군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('영월군')">영월군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('평창군')">평창군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('정선군')">정선군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('철원군')">철원군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('화천군')">화천군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('양구군')">양구군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('인제군')">인제군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('고성군')">고성군</a></li>
    <hr>
    <li><a href="#" onclick="changeCategory('양양군')">양양군</a></li>
    <hr>
</ul>


    <!-- 충청북도 -->
	<span onclick="showSubCategories('chungbuk_province')">충청북도</span> <br>
	<ul id="chungbuk_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('청주시')">청주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('충주시')">충주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('제천시')">제천시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('보은군')">보은군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('옥천군')">옥천군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영동군')">영동군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('증평군')">증평군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('진천군')">진천군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('괴산군')">괴산군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('음성군')">음성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('단양군')">단양군</a></li>
	    <hr>
	</ul>


   <!-- 충청남도 -->
	<span onclick="showSubCategories('chungnam_province')">충청남도</span> <br>
	<ul id="chungnam_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('천안시')">천안시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('공주시')">공주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('보령시')">보령시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('아산시')">아산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('서산시')">서산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('논산시')">논산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('계룡시')">계룡시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('당진시')">당진시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('금산군')">금산군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('부여군')">부여군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('서천군')">서천군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('청양군')">청양군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('홍성군')">홍성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('예산군')">예산군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('태안군')">태안군</a></li>
	    <hr>
	</ul>


    <!-- 전라북도특별자치도 -->
	<span onclick="showSubCategories('jeollabuk_district')">전라북도특별자치도</span> <br>
	<ul id="jeollabuk_district" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('전주시')">전주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('익산시')">익산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('군산시')">군산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('정읍시')">정읍시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('남원시')">남원시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('김제시')">김제시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('무주군')">무주군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('완주군')">완주군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('부안군')">부안군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('고창군')">고창군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('임실군')">임실군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('순창군')">순창군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('진안군')">진안군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('장수군')">장수군</a></li>
	    <hr>
	</ul>


    <!-- 전라남도 -->
    <span onclick="showSubCategories('jeonnam_province')">전라남도</span> <br>
    <ul id="jeonnam_province" class="sub_categories">
    	<hr>
        <li><a href="#" onclick="changeCategory('목포시')">목포시</a></li>
        <hr>
        <li><a href="#" onclick="changeCategory('여수시')">여수시</a></li>
        <hr>
        <!-- 나머지 지역도 동일하게 추가 -->
        
    </ul>

    <!-- 전라남도 -->
	<span onclick="showSubCategories('jeonnam_province')">전라남도</span> <br>
	<ul id="jeonnam_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('목포시')">목포시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('여수시')">여수시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('순천시')">순천시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('나주시')">나주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('광양시')">광양시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('담양군')">담양군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('곡성군')">곡성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('구례군')">구례군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('고흥군')">고흥군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('보성군')">보성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('화순군')">화순군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('장흥군')">장흥군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('강진군')">강진군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('해남군')">해남군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영암군')">영암군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('무안군')">무안군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('함평군')">함평군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영광군')">영광군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('장성군')">장성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('완도군')">완도군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('진도군')">진도군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('신안군')">신안군</a></li>
	    <hr>
	</ul>
	
	<!-- 경상북도 -->
	<span onclick="showSubCategories('gyeongbuk_province')">경상북도</span> <br>
	<ul id="gyeongbuk_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('포항시')">포항시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('경주시')">경주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('김천시')">김천시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('안동시')">안동시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('구미시')">구미시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영주시')">영주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영천시')">영천시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('상주시')">상주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('문경시')">문경시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('경산시')">경산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('의성군')">의성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('청송군')">청송군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영양군')">영양군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('영덕군')">영덕군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('청도군')">청도군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('고령군')">고령군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('성주군')">성주군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('칠곡군')">칠곡군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('예천군')">예천군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('봉화군')">봉화군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('울진군')">울진군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('울릉군')">울릉군</a></li>
	    <hr>
	</ul>

	
	<!-- 경상남도 -->
	<span onclick="showSubCategories('gyeongnam_province')">경상남도</span> <br>
	<ul id="gyeongnam_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('창원시')">창원시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('김해시')">김해시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('양산시')">양산시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('진주시')">진주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('거제시')">거제시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('통영시')">통영시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('사천시')">사천시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('밀양시')">밀양시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('함안군')">함안군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('거창군')">거창군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('창녕군')">창녕군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('고성군')">고성군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('하동군')">하동군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('합천군')">합천군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('남해군')">남해군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('함양군')">함양군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('산청군')">산청군</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('의령군')">의령군</a></li>
	    <hr>
	    <!-- 나머지 지역 도시 및 군 추가 -->
	</ul>

	
	<!-- 제주특별자치도 -->
	<span onclick="showSubCategories('jeju_province')">제주특별자치도</span> <br>
	<ul id="jeju_province" class="sub_categories">
	    <hr>
	    <li><a href="#" onclick="changeCategory('제주시')">제주시</a></li>
	    <hr>
	    <li><a href="#" onclick="changeCategory('서귀포시')">서귀포시</a></li>
	    <hr>
	</ul>
	

</div>




<div id="my_sidebar" class="my_sidebar">
	<!-- ì¬ì´ëë° ë´ì© -->
	<div class="imgnick">
	<img src="<%=request.getContextPath()%>/img/maincity/프로필사진.png" alt="프로필 사진">
	<span class="nick">닉네임</span>
	</div>
	<hr>
	<span class="plc">여행일정 1개&nbsp;&nbsp;&nbsp;여행기록 0개&nbsp;&nbsp;&nbsp;커뮤니티 0개</span>
	<hr>
	<a href="<%=request.getContextPath() %>/Logout.do">로그아웃</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/myTripPlan.do">여행일정관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/myTripLog.do">여행기록관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/myCommu.do">커뮤니티관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/memberInfo.do">계정관리</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/cs">고객센터</a><hr>
	<a href="<%=request.getContextPath() %>/mypage/memberInfo.do">서비스 탈퇴</a><hr>
</div>






<!-- link that opens popup -->
<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
<!-- JS here -->
<script src="<%=request.getContextPath() %>/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendor/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>	<!-- 로그인 옆 검색 버튼  -->
<script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/js/isotope.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/js/ajax-form.js"></script>
<script src="<%=request.getContextPath() %>/js/waypoints.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.counterup.min.js"></script>
<script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=request.getContextPath() %>/js/scrollIt.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.scrollUp.min.js"></script>
<script src="<%=request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%=request.getContextPath() %>/js/nice-select.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.slicknav.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
<script src="<%=request.getContextPath() %>/js/plugins.js"></script>
<script src="<%=request.getContextPath() %>/js/gijgo.min.js"></script>
<script src="<%=request.getContextPath() %>/js/slick.min.js"></script>


<!-- ìµíëª ìë°ì¤í¬ë¦½í¸ -->

<script src="/TripCatch/js/planScript.js"></script>
<!-- ìµíëª ìë°ì¤í¬ë¦½í¸ -->


<!--contact js-->
<script src="<%=request.getContextPath() %>/js/contact.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.ajaxchimp.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.form.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/js/mail-script.js"></script>




<!-- city 사이드바 -->
<script src="/TripCatch/js/sidebar-city.js"></script>


<%-- <script src="<%=request.getContextPath() %>/js/main.js"></script> --%>
<script>
        
        
    
    
   
    

</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        hideAllSubCategories();
    });

    function showSubCategories(categoryId) {
        // 클릭한 카테고리의 하위 카테고리 가져오기
        var selectedCategory = document.getElementById(categoryId);

        // 모든 하위 카테고리 숨기기
        var allSubCategories = document.querySelectorAll('.sub_categories');
        allSubCategories.forEach(function (subCategory) {
            subCategory.style.display = 'none';
        });

        // 클릭한 카테고리의 하위 카테고리 보이거나 숨기기
        if (selectedCategory.style.display !== 'block') {
            selectedCategory.style.display = 'block';
        } else {
            selectedCategory.style.display = 'none';
        }
    }

    function hideAllSubCategories() {
        var allSubCategories = document.querySelectorAll('.sub_categories');
        allSubCategories.forEach(function (subCategory) {
            subCategory.style.display = 'none';
        });
    }

    function changeCategory(cityName) {
        // 여기에 선택한 도시에 대한 처리를 추가하세요.
        console.log("Selected city:", cityName);
    }
</script>





    

<%@page import="landmark.vo.LandmarkVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../include/header.jsp" %>

<%

	LandmarkVO lv = (LandmarkVO)request.getAttribute("lv");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LandMarkDetail</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/landmarkdetail.css">

<style>
/* @import "reset.css"; */

</style>

<script type="text/JavaScript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrtCOAL7vo9Hz1-dknGQ3H75BIIat6n_k&libraries=places"></script>


</head>

<body>

    <!-- body 전체 ljxfRw bHbgtZ -->
    <div class="container__Container-sc-5ea7eb67-0 sc-95b296-0 ljxfRw bHbgtZ">
        
        <div class="container_title landcityheart">
            
            <!-- 장소명, 도시명 gtIYLX jShTvj OyWys -->
            <div class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj sc-322f8c59-0 OyWys">
                
                <!-- 장소명 kiOhYG fatsMo -->
                <h1 class="text__Text-sc-6cffe184-0 text__TextTitleBase-sc-6cffe184-1 kiOhYG fatsMo"><%=lv.getLandName() %></h1>
                
                <!-- 아이콘+도시명 container  ciYqIz -->
                <div class="container__Container-sc-5ea7eb67-0 area-names__AreaContainer-sc-eb5c8bb8-0 iLKpSz ciYqIz">

                    <!-- 도시명 kISMdP -->
                    <div class="text__Text-sc-6cffe184-0 kISMdP"><%=lv.getCityName() %></div>
                </div>

            </div>

            <!-- 하트, 저장하기 버튼 container iLKpSz kQbRjp -->
            <div class="container__Container-sc-5ea7eb67-0 detail-header___StyledContainer-sc-fa3fe40f-0 iLKpSz kQbRjp">

                <!-- 하트+숫자 creumU -->
                <div class="text__Text-sc-6cffe184-0 creumU">

                    <!-- 하트 hoxXFc -->
                    <div name="save" class="icon__Icon-sc-57b8e71-0 hoxXFc">
                    
                    	<span id="count_like">&nbsp<%=lv.getLandLike() %></span>
                    
                    </div>
                </div>

                <!-- 저장하기 버튼 -->
                <div class="container__Container-sc-5ea7eb67-0 button-group__ButtonGroup-sc-e7559060-0 iLKpSz iAbSBt heart-wrapper">
<!--                     <button type="button" -->
<!--                         class="sc-aXZVg button__Button-sc-4a38380c-0 actions__ActionButton-sc-5f918b12-0 kyfWrw ffGVpL clWIrv heartBtn"> -->
<!--                     </button> -->
                        <p class="heartBtn likeBtn"><i class="fa-solid fa-heart fa-lg"></i></p>&nbsp저장하기
                </div>
                
            </div>
            
        </div>

        <!-- 메인사진 container gtIYLX jShTvj cVoooL gPIRS -->
        <div height="200"
            class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj carousel-section___StyledSection-sc-4dd0c29c-0 cVoooL sc-7692635b-0 gPIRS">

            <!-- 메인사진 bfqEtz -->
            <div class="container__Container-sc-5ea7eb67-0 bfqEtz">

                <!-- 메인사진 슬라이드 eAnZlp -->
                <div class="responsive__Responsive-sc-3353f9fe-0 eAnZlp">

                <!-- 웹용 반응형 이미지 슬라이드 dTWxVi iLKpSz crQJDw cysEUw gctrMt -->
                <div class="responsive__Responsive-sc-3353f9fe-0 dTWxVi">
                    <div
                        class="container__Container-sc-5ea7eb67-0 carousel___StyledContainer-sc-a79a14b4-2 iLKpSz crQJDw">
                        <div
                            class="container__Container-sc-5ea7eb67-0 carousel__CarouselContainer-sc-60fd4ca-0 carousel___StyledCarouselContainer-sc-60fd4ca-1 cysEUw gctrMt">
                            <div>
                                <div class="eg-flick-viewport"
                                    style="position: relative; z-index: 1; overflow: hidden; min-height: 100%; width: 100%; touch-action: pan-y; user-select: none; -webkit-user-drag: none; height: 400px;">
                                    <div class="eg-flick-camera"
                                        style="width: 100%; height: 100%; will-change: transform; transform: translate3d(0px, 0px, 0px);">

                                        <!-- epwwZL -->
                                        <div class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
                                            style="position: absolute; left: 0px;">

                                            <!-- 슬라이드 이미지 출처 kDxVGP -->
                                            <div class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">출처
                                                korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
                                            </div>
                                            
                                            <!-- 슬라이드 이미지 fnXjsk -->
												<%
													for (int i = 0; i < 30; i++) {
												%>
												<div
													class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
													style="position: absolute; left: <%=i * 728%>px;">
													<div
														class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">
														출처
														korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
													</div>
													<img
														src="<%=request.getContextPath()%>/img/landmarkimg/랜드마크<%=i%>.jpg"
														class="img__Img-sc-482d8dd0-0 fnXjsk">
												</div>
												<%
													}
												%>
												<div class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
                                            style="position: absolute; left: 1456px;">
                                            <div class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">출처
                                                korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
                                            </div><img
                                                src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/c0d17b91-bb97-4911-bcc9-a91fc5b8a6e9.jpeg"
                                                class="img__Img-sc-482d8dd0-0 fnXjsk">
                                        </div>
                                        <div class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
                                            style="position: absolute; left: 2184px;">
                                            <div class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">출처
                                                korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
                                            </div><img
                                                src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/f5cde800-1289-44d0-9b09-433c360fe586.jpeg"
                                                class="img__Img-sc-482d8dd0-0 fnXjsk">
                                        </div>
                                        <div class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
                                            style="position: absolute; left: 2912px;">
                                            <div class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">출처
                                                korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
                                            </div><img
                                                src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/de5b348f-8340-4b4a-a169-3aef87d80c13.jpeg"
                                                class="img__Img-sc-482d8dd0-0 fnXjsk">
                                        </div>
                                        <div class="fixed-dimensions-frame__FixedDimensionsFrameContainer-sc-c6205e26-0 epwwZL eg-flick-panel"
                                            style="position: absolute; left: 3640px;">
                                            <div class="source-url__SourceUrlContainer-sc-e88d925e-0 kDxVGP">출처
                                                korean.visitkorea.or.kr/detail/ms_detail.do?cotid=ad0b6c37-e48d-4c64-9ed4-201c58d9ce57&amp;big_category=A02&amp;mid_category=A0202&amp;big_area=35
                                            </div>
                                            
                                            <!-- 슬라이드 마지막 메인 이미지 gsKZnh -->
                                            <img
                                                src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/95be9d15-9a89-4e57-a258-091ea0bf9c42.jpeg"
                                                class="img__Img-sc-482d8dd0-0 gsKZnh">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 슬라이드 우측 상단 이미지 개수 iWkdEu iAfeoh ffmdVD -->
                            <div class="carousel__TopRightControl-sc-60fd4ca-2 iWkdEu">
                                <div class="page-label__PageLabelContainer-sc-a75492a1-1 iAfeoh">
                                    <div class="page-label__PageLabelText-sc-a75492a1-0 ffmdVD">1 / 4</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 메인 이미지 하단 저장,일정추가,리뷰쓰기,공유하기 -->
        <div class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj">

            <!-- 설명 / hr 선 -->
            <div class="hr__HR1-sc-5e298345-0 actions___StyledHr-sc-5f918b12-2 hIeNMK hQhwxP"></div>
        </div>

        <!-- 주제목 gtIYLX jShTvj hgqDuD -->
        <div
            class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj sc-d648d54-1 hgqDuD">
            <div class="text__Text-sc-6cffe184-0 fWbsVm"><%=lv.getLandTitle() %></div>
        </div>

        <!-- 주제목, 부제목 container -->
        <div id="featured-content"
            class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj sc-63315658-0 ietXUq">


            <!-- 내용 hzYJfR -->
            <div class="text__Text-sc-6cffe184-0 hzYJfR"><%=lv.getLandCont() %>
            </div>
        </div>

        <!-- 설명 밑 hr -->
        <div class="hr__HR2-sc-5e298345-1 cPhxGn"></div>

        <!-- 기본정보, 지도, 가는방법, 이곳의 이용팁 container iOkhHi -->
        <div id="basic-info"
            class="container__Container-sc-5ea7eb67-0 section___StyledContainer-sc-72e88f6a-0 gtIYLX jShTvj sc-1eb27f9c-2 iOkhHi">

            <!-- 지도 위 '기본정보' container DBDor -->
            <div
                class="container__Container-sc-5ea7eb67-0 typography___StyledContainer-sc-29826c67-0 iLKpSz sc-1eb27f9c-0 DBDor">

                <!-- 지도 위 '기본정보' bOgakK -->
                <div color="gray" class="text__Text-sc-6cffe184-0 bOgakK">기본정보</div>
            </div>

            <!-- 지도 -->
            <div id="map-canvas" style="height: 400px;">
            	<input type="hidden" id="landAddr" value="<%=lv.getLandAddr()%>" />
            </div>
            
            
            
<!--             <div class="container__Container-sc-5ea7eb67-0 bfqEtz"> -->
<!--                 <div class="static-map__StaticMapContainer-sc-895f31a-1 fWzrVz"> -->
<!--                     <picture class="static-map__StaticMapPicture-sc-895f31a-3 eLRICW"> -->
<!--                         <source media="(min-width: 600px)" -->
<!--                             srcset="https://triple.guide/api/maps/static-map?size=700x420&amp;scale=2&amp;center=36.07675648594015%2C129.56931453890076&amp;zoom=13 2x, /api/maps/static-map?size=700x420&amp;scale=1&amp;center=36.07675648594015%2C129.56931453890076&amp;zoom=13 1x"> -->
<!--                         <img src="https://triple.guide/api/maps/static-map?size=350x210&amp;scale=2&amp;center=36.07675648594015%2C129.56931453890076&amp;zoom=12" -->
<!--                             class="static-map__StaticMapImage-sc-895f31a-2 kcjEuA" title="" style=""> -->
<!--                     </picture> -->
<!--                 </div> -->
<!--                 지도 위 마커 HtcJg -->
<!--                 <img src="https://assets.triple.guide/images/img_map_pin_sight@4x.png" -->
<!--                     class="static-map__Marker-sc-895f31a-0 HtcJg"> -->
            </div>


            <!-- 지도 밑 주소, 전화 container irJLrL lbQyRT -->
            <div class="segment__Segment-sc-e2042e2a-0 irJLrL sc-1eb27f9c-1 lbQyRT">
                <!-- 지도 밑 주소, 전화 -->
                <ul class="list__ListBase-sc-7d9d6fc8-0 iWcbtN">
                    <!-- 주소 dZqDPe -->
                    <li class="list__ListItem-sc-7d9d6fc8-1 dZqDPe">
                        <!-- 주소 줄바꿈 안되게 ckRssc -->
                        <div class="container__Container-sc-5ea7eb67-0 flex-box__FlexBox-sc-df192771-1 iLKpSz ckRssc">
                            <!-- '주소' 단어 iTfTZE eFhWnp -->
                            <div
                                class="text__Text-sc-6cffe184-0 property-item___StyledText-sc-c44be0be-0 iTfTZE eFhWnp">
                                주소</div>
                            <!-- 긴 주소 qeYGc jcBrFe -->    
                            <div
                                class="text__Text-sc-6cffe184-0 property-item___StyledText2-sc-c44be0be-1 qeYGc jcBrFe">
                               <%=lv.getLandAddr() %></div>
                        </div>
                    </li>

                    <!-- 전화 dZqDPe  -->
                    <li class="list__ListItem-sc-7d9d6fc8-1 dZqDPe">
                        <div class="container__Container-sc-5ea7eb67-0 flex-box__FlexBox-sc-df192771-1 iLKpSz ckRssc">
                            <div
                                class="text__Text-sc-6cffe184-0 property-item___StyledText-sc-c44be0be-0 iTfTZE eFhWnp">
                                전화</div>
                            <div
                                class="text__Text-sc-6cffe184-0 property-item___StyledText2-sc-c44be0be-1 qeYGc jcBrFe">
                                +8221248800</div>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- 가는방법, 이곳의 이용팁 container hKUXaU -->
<!--             <div class="container__Container-sc-5ea7eb67-0 sc-9417ce0-0 iLKpSz hKUXaU"> -->
<!--                 <ul class="list__ListBase-sc-7d9d6fc8-0 XKnGY"> -->
<!--                     가는방법 container dZqDPe -->
<!--                     <li class="list__ListItem-sc-7d9d6fc8-1 dZqDPe"> -->
<!--                         <div color="gray" class="text__Text-sc-6cffe184-0 cLAOdS">가는방법</div> -->
<!--                         <div class="text__Text-sc-6cffe184-0 dclvFp">구룡포 일본인 가옥 거리에서 차로 15분</div> -->
<!--                     </li> -->
<!--                     <li id="tips" class="list__ListItem-sc-7d9d6fc8-1 dZqDPe"> -->
<!--                         <div color="gray" class="text__Text-sc-6cffe184-0 cLAOdS">이곳의 이용팁</div> -->
<!--                         <div class="text__Text-sc-6cffe184-0 elGMvg">호미곶 한민족 해맞이 축전 매년 12월 31일 - 1월 1일</div> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
        </div>
    </div>


<script>
let isHeart = false;
let heartBtns = document.querySelectorAll(".heartBtn");

	heartBtns.forEach(function (heartBtn) {
		heartBtn.addEventListener("click", function () {
			// 클라이언트 측에서 로그인 여부 확인
	        let isLoggedIn = <%= session.getAttribute("LOGIN_USER") != null %>;

	        if (isLoggedIn) {
	            // 로그인된 경우, 하트 토글 로직 수행
	            isHeart = !isHeart;
	            updateHeartStatus(heartBtn);

	            if (isHeart) {
	                console.log("하트를 눌렀습니다.");
	            } else {
	                console.log("하트를 취소했습니다.");
	            }
	        } else {
	            // 로그인되지 않은 경우, 알림창 띄우고 로그인 페이지로 이동
	            alert("로그인이 필요합니다.");
	            window.location.href = "<%= request.getContextPath() %>/login.do";
	        }
	  });
	});

function updateHeartStatus(heartBtn) {
  // star-filled 클래스를 토글하여 하트 아이콘의 색상을 변경
  let heartIcon = heartBtn.querySelector("i");
  heartIcon.classList.toggle("fa-heart-o", isHeart);
  heartIcon.classList.toggle("fa-heart", !isHeart);

  // 하트의 색상을 변경
  heartIcon.style.color = isHeart ? "#FD4666" : "";

  // span의 색상을 변경
  let spanElement = heartBtn.nextElementSibling;
  spanElement.style.color = isHeart ? "#FD4666" : "";
};



let isLiked = false;
let likeBtns = document.querySelectorAll(".likeBtn");
//각 likeBtn 요소에 대해 이벤트를 추가
 likeBtns.forEach(function (likeBtn) {
   likeBtn.addEventListener("click", function () {
     // 상태 변경
     isLiked = !isLiked;

     // 아이콘 및 배경색 변경
     updateLikeStatus(likeBtn);

     // 좋아요 상태에 따라 다른 동작 수행
     // if (isLiked) {
     //   console.log("좋아요를 눌렀습니다.");
     // } else {
     //   console.log("좋아요를 취소했습니다.");
     // }

     // 현재 좋아요 수
     let currentCount = parseInt(document.getElementById('count_like').textContent, 10);

     // 좋아요 수 업데이트
     document.getElementById('count_like').textContent = isLiked ? (currentCount + 1).toString() : (currentCount - 1).toString();

   });
 });
 
 
// 아이콘 및 배경색 변경 함수
function updateLikeStatus(likeBtn) {
  // isLiked 값에 따라 클래스 추가 또는 제거
  likeBtn.classList.toggle("active", isLiked);
}
 
</script>
<script src="<%=request.getContextPath() %>/js/map.js"></script>
<%@include file="../../include/footer.jsp" %>
</body>
</html>
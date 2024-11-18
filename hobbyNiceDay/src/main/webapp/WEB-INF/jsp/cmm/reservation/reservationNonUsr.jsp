<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">

<!-- 템플릿-->
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>HobbyNiceDay</title>

<!-- 전자정부 프레임워크 기본 -->
<!-- <link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
	<link href="<c:url value='/'/>css/login.css" rel="stylesheet"
	type="text/css"> -->


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- 템플릿 -->
<!-- Css Styles -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/css/font-awesome.min.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/elegant-icons.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/nice-select.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/css/owl.carousel.min.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/slicknav.min.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/style.css' />"
	type="text/css">

<!-- 달력 -->
<!-- https://www.jsdelivr.com/package/npm/fullcalendar?version=6.1.15  -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<!-- google calendar api 추가  -->
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.15/index.global.min.js"></script>
	
<script type="text/javascript">
	
</script>

<style>
@media all and (min-width:640px) {
	.terms_wrap {
		padding: 30px;
	}
}

/*SIGN IN 글씨*/
.jy_page_title span {
	color: #e53637;
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-bottom: 15px;
	display: block;
}

.jy_page_title {
	text-align: left;
	margin-bottom: 40px;
	font-size: 48px;
	margin-bottom: 18px;
	color: #111111;
	font-weight: 700;
	line-height: 46px;
	margin: 0;
}

/*231026추가*/
.terms_wrap2 {
	padding: 2rem;
}
/*231026추가 끝*/

/*성별 라디오 버튼*/
.checkout__input input {
	height: 50px;
	width: 100%;
	border: 1px solid #e1e1e1;
	font-size: 14px;
	color: #b7b7b7;
	padding-left: 20px;
	margin-bottom: 20px;
}

/*input 태그 포커스 */
.checkout__input input:focus {
	border-color: #000; /* 테두리를 검정색으로 변경 */
	outline: none; /* 기본 파란색 외곽선 제거 */
}

.checkout__input input{
   color : #606060;/*input 태그 긆자 색*/
}

.fc-sunday .fc-daygrid-day-top { 
    color: #D85D5D; /* 일요일 글자 빨간색 */
}

.fc-saturday .fc-daygrid-day-top { 
    color: #267CC7; /* 토요일 글자 파란색 */
}


</style>

</head>

<body>

	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
	<c:set var="userVO" value="${sessionScope.userVO}" />
	<c:set var="isLoggedIn" value="${not empty userVO.userId}" />


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div id="offCanvasMenu">
		<jsp:include page="/WEB-INF/jsp/main/inc/commonOffcanvas.jsp" />
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<div id="header">
		<jsp:include page="/WEB-INF/jsp/main/inc/commonHeader.jsp" />
	</div>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<!-- Hero Section End -->




	<!-- Shop Details Section Begin -->
	<section class="shop-details">
	<div class="product__details__pic">
		<div class="container">
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
			<div class="row"></div>
		</div>
	</div>
	<div class="product__details__content">
		<div class="container">

			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="product__details__text">
						<h4>${classDetails.classNm}</h4>
						<!-- 클래스명 -->
						<!-- <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div> -->
						<h3>
							<fmt:formatNumber value="${classDetails.classPrice}" type="currency" currencySymbol="₩" /><!-- 클래스 가격 -->
							<!-- <span>\89,000</span> -->
						</h3> 
						<!-- 클래스 가격 -->
						<p>${classDetails.classDscrptn}</p>
						<!-- 클래스 설명 -->
						<!-- <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div> -->
						<div class="product__details__last__option">
							<h5>
								<span>클래스 정보</span>
							</h5>
							<!-- <img src="/images/img/shop-details/details-payment.png" alt=""> -->
							<ul>
								<li><span>수강기간 : </span>${classDetails.startDt} - ${classDetails.endDt}</li>
								
								<li><span>장소 : </span>${classDetails.location}</li>
								<!-- <li><span>소요시간 : </span>약 2시간</li> -->
								<li><span>소요시간 : </span>약 ${classDetails.classTimeTaken}시간</li>
								<li><span>최대 예약가능 인원 수 : </span>${classDetails.classMaxCnt}명</li>
								<li><span>최소 수강가능 연령 : </span>만
									${classDetails.classAgeMin}세</li>
								<!-- 최소 수강가능 연령 -->
							</ul>
						</div>

						<div class="product__details__option">
							<!-- 
                                <div class="product__details__option__size">
                                    <span>예약인원</span>
                                    <label for="xxl">1
                                        <input type="radio" id="xxl">
                                    </label>
                                    <label class="active" for="xl">2
                                        <input type="radio" id="xl">
                                    </label>
                                    <label for="l">3
                                        <input type="radio" id="l">
                                    </label>
                                    <label for="sm">4
                                        <input type="radio" id="sm">
                                    </label>
                                </div> -->

							<!-- 
                                <div class="product__details__option__color">
                                    <span>Color:</span>
                                    <label class="c-1" for="sp-1">
                                        <input type="radio" id="sp-1">
                                    </label>
                                    <label class="c-2" for="sp-2">
                                        <input type="radio" id="sp-2">
                                    </label>
                                    <label class="c-3" for="sp-3">
                                        <input type="radio" id="sp-3">
                                    </label>
                                    <label class="c-4" for="sp-4">
                                        <input type="radio" id="sp-4">
                                    </label>
                                    <label class="c-9" for="sp-9">
                                        <input type="radio" id="sp-9">
                                    </label>
                                </div>
                                 -->
						</div>





					</div>
				</div>
			</div>


		</div>
	</div>
	</section>
	<!-- Shop Details Section End -->




	<!-- Checkout Section Begin -->
	<section class="checkout spad" style="padding-top:0px;">
	<div class="container">

		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="jy_page_title">
						<!--section-title  -->
						<span>RESERVATION</span>
						<h2>비회원 예약 신청</h2>
						<p>달력에서 예약하고자하는 날짜를 선택한 후, 예약정보를 입력해주세요</p>
					</div>
				</div>
			</div>

			<!-- 달력추가 -->

		</div>
		
		
		 <div class="jy_margin_1" style="height:50px"></div>
		
		<form id="registerForm" name="registerForm" method="post">
		<div class="row">
			<div class="col-lg-7 ">
			<!-- 달력추가 -->
				<div id='calendar'></div>
			</div>
			
			
			
			<div class="col-lg-5 ">
				<!--  <div class="product__details__pic">-->
					<h6 class="checkout__title">
					선택날짜 : <span  id="reservationScheduleselectedDateText">달력에서 예약날짜를 선택해주세요</span></h6>
						<!-- 예약 일정 리스트 -->
						<div class="checkout__form">
								<!-- 시간대 리스트가 여기 들어갑니다 -->

								<div class="row">
									
									<div class="col-lg-12">
										
										<div class="checkout__input">
											<!-- <p>예약 시간대<span>*</span></p> -->
											<h6 class="checkout__title">예약시간대 *</h6>
											<!-- <p>(현재예약인원수 / 예약가능인원수)</p> -->
											
											<div class="product__details__option__size" id="timeOptions">
												<p>예약 날짜를 선택해주세요</p>
											</div>
										</div>
										
										</br>
										</br>
										<div class="checkout__input">
										
											<h6 class="checkout__title">예약인원수 *</h6>
											<!-- <p>예약인원수<span>*</span></p> -->
											<div class="product__details__option__size" id="reservationCountOptions">
												<p>예약 시간대를 선택해주세요</p>
											</div>
										</div>
										
										</br>
										</br>
										<h6 class="checkout__title">예약자 정보</h6>
									</div>
										
									<div class="col-lg-6">
										<div class="checkout__input">
											<h6>예약자명<span>*</span></h6>
											</br>
											<input type="text" id="reservationNm" name="reservationNm" width="80%"
											placeholder="예약자명을 입력해주세요" required>
										</div>
									</div>	
									
									<div class="col-lg-6">
										<div class="checkout__input">
											<h6>예약자 연락처<span>*</span></h6>
											</br>
											<input type="text" id="reservationPhone" name="reservationPhone" width="80%"
											placeholder="예약자 연락처를 입력해주세요" required>
										</div>
										
									</div>	
									
									<div class="col-lg-12">
										<div class="checkout__input">
											<h6>예약자 이메일<span>*</span></h6>
											</br>
											<input type="text" id="reservationEmail" name="reservationEmail" width="80%"
											placeholder="예약자 이메일을 입력해주세요" required>
										</div>
										
										<div class="checkout__input">
											<h6>예약 비밀번호<span>*</span></h6>
											</br>
											<input type="password" id="reservationPw" name="reservationPw" width="80%"
											autocomplete="new-password"	placeholder="예약조회 시 사용할 비밀번호를 입력해주세요" required>
										</div>
										
										<div class="checkout__input">
											<h6>예약 비고</h6>
											</br>
											<input type="text" id="reservationEtc" name="reservationEtc" width="80%"
											placeholder="예약 신청 시 비고사항을 입력해주세요">
										</div>
										
										
									
									</div>
														
								</div>
						</div>
				<!-- </div>-->
			</div>
			
				<!--<input type="hidden" id="userId" name="userId" value="<c:out value='${userVO.userId}'/>">  회워 -->
				<!-- 사용자 구분(일반사용자) -->
				<!-- <input type="hidden" id="classDetailId" name="classDetailId" ><!-- 클래스 시간 고유 id -->
				<input type="hidden" id="classId" name="classId" value="<c:out value='${classDetails.classId}'/>">
				<input type="hidden" id="classMaxCnt" name="classMaxCnt" value="<c:out value='${classDetails.classMaxCnt}'/>">
				<input type="hidden" id="reservationDt" name="reservationDt" readonly required /> 
				<input type="hidden" id="reservationType" name="reservationType" value="nonUser" required> <!-- 회원구분 -->
				
		</form>
			<div class="col-lg-12 " >
				</br>
				</br>
				</br>
				
			</div>
			<div class="col-lg-12 " 
				 style="display: flex; justify-content: center; gap: 10px;" >
				<button type="reset" class="primary-btn">취소</button>

				<a href="#" class="primary-btn registerBtn">예약 신청</a> 
				<a href="/" id="listBtn" class="primary-btn listBtn">클래스 목록</a>

				
			</div>
			
			
		</div>
				


	</div>
	</section>
	<!-- Checkout Section End -->



	<!-- Contact Section Begin -->

	<!-- Contact Section End -->


	<!-- Banner Section Begin -->
	<section class="banner spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 offset-lg-4">
				<div class="banner__item"></div>
			</div>

		</div>
	</div>
	</section>
	<!-- Banner Section End -->


	<!-- Footer Section Begin -->
	<div id="footer">
		<jsp:include page="/WEB-INF/jsp/main/inc/commonFooter.jsp" />
	</div>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->
	<!-- 구글 캘린더 대한민국의 공휴일 -->
	<!-- <iframe src="https://calendar.google.com/calendar/embed?src=ko.south_korea%23holiday%40group.v.calendar.google.com&ctz=Asia%2FSeoul" 
				style="border: 0" width="800" height="600" frameborder="0" scrolling="no">
		</iframe>
	 -->
	<!-- 자영 달력 추가 -->
	<!-- 참고용 : 공식문서 https://fullcalendar.io/docs/initialize-globals -->
	
	
	
	
	
	<script>
	// frullCalendaer 달력 api
	  document.addEventListener('DOMContentLoaded', function() {
		  
		  
          var calendarEl = document.getElementById('calendar');
          var selectedDate = null; // 선택된 날짜를 저장할 변수

          var holidayDates = []; // 공휴일 날짜를 저장할 배열
          var holidayLabels = {}; // 구글 캘린더에서 불러온 공휴일 날짜와 이름을 저장할 객체 (여기서 선언)

          
          // 클래스 수강 시작일자, 종료일자
          var startDt = "${classDetails.startDt}"; // Format: YYYY-MM-DD
          var endDt = "${classDetails.endDt}";     // Format: YYYY-MM-DD
          console.log("startDt : ", startDt, "endDt : ", endDt)
          
          
          
          var calendar = new FullCalendar.Calendar(calendarEl, {
        	  
        	  googleCalendarApiKey : "AIzaSyBIIqXESeaREeCJB3QABFClVC8FGok3yhs", // google api key
              initialView: 'dayGridMonth', // 월별 보기
              locale: 'ko', // 한국어 설정
              headerToolbar: {
			                  left: 'prev,next today',
			                  center: 'title',
			                  right: 'dayGridMonth'
              				},
              validRange: function(nowDate){ // 보여줄 날짜 범위 // 예약 가능한 범위 설정
		                    return {start: nowDate, //오늘부터 보여주기
		                    		end: endDt + "T23:00" // 클래스 수강 종료 날짜까지 선택되도록 시간 추가 
		              			   }
             				},
      		  firstDay: 0, // 일요일(0)을 월요일(1)을 일주일의 첫째날로 설정
              
              events: function(fetchInfo, successCallback, failureCallback) { // 월 변경 시 이벤트
		            	  	
            	  var events = []; // full calendar 공휴일 + db 휴무일 데이터 이벤트 객체를 담을 배열
            		
	            	  /**************************************************************/
	            	  
	               	  // 휴일 날짜와 설명
	                  // db에서 가져온 휴무일 데이터 classDetails.holidayInfo 값을 가져와서 파싱
	                  var holidayInfo = "${classDetails.holidayInfo}"; // 예: "2024-09-05(휴무일), 2024-09-18(휴무일)"
	                  
	                 
	                  if (holidayInfo) {
	                      var holidays = holidayInfo.split(','); // 쉼표(,)로 분리하여 배열로 만듭니다.
	
	                      // 각 휴일 정보를 파싱하여 이벤트로 변환
	                      holidays.forEach(function(holiday) {
	                    	// 공백 제거 후 괄호 기준으로 날짜와 설명을 분리
	                          var date = holiday.trim().split('(')[0]; // 날짜 부분 추출
	                          var description = holiday.trim().split('(')[1].replace(')', ''); // 설명 부분 추출
	        				  
	                       	  // 휴일 날짜를 배열에 저장
	                          holidayDates.push(date);
	                          
	                           events.push({
	                          // var holidayEvent = {
	                              title: description,  // 휴일 설명을 제목으로 설정
	                              start: date,         // 이벤트 시작일은 휴일 날짜
	                              allDay: true,         // 하루종일 이벤트로 설정
	                              color: '#D85D5D'  // 휴무일을 빨간색으로 표시
	                          //};
	                           });
	                          
	                          // 이벤트를 달력에 추가
	                          //calendar.addEvent(holidayEvent);
	                      });
	                  }
                  	
	                  
	                  
	                  /**************************************************/
	            	  // 구글 캘린더 api 에서 공휴일 데이터 가져오기
	                  fetch(`https://www.googleapis.com/calendar/v3/calendars/l9ijikc83v1ne5s61er6tava4iplm8id@import.calendar.google.com/events?key=AIzaSyBIIqXESeaREeCJB3QABFClVC8FGok3yhs`)
	                      .then(response => response.json())
	                      .then(data => {
	                          // var events = []; // full calendar 공휴일 + db 휴무일 데이터 이벤트 객체를 담을 배열
	
	                          // 구글 캘린더에서 가져온 공휴일 추가
	                          data.items.forEach(event => {
	                              var eventDate = new Date(event.start.date || event.start.dateTime).toISOString().split('T')[0];
	                              var eventTitle = event.summary || "공휴일"; // 공휴일 이벤트 제목
	                              
	                              holidayDates.push(eventDate); // 공휴일 날짜
	                              holidayLabels[eventDate] = eventTitle; // 공휴일 이름 넣는 곳
	                              
	                              // 공휴일 이벤트 넣기
                          		  events.push({
	                                  title: eventTitle,
	                                  start: eventDate,
	                                  color: '#D85D5D',
	                                  allDay: true
	                              });
                          	  });
                      	
                  
            	  		/*******************************************************************************/
		            	// 특정 월의 예약 가능 시간대 데이터 가져오기
		            
            	  		
            	  		console.log("시작일 startDate : ", fetchInfo.startStr.slice(0, 7) + '-01')
            	  		console.log("종료일 endDate : ", fetchInfo.startStr.slice(0, 7) + '-30')
            	  		
            	  		
            	  		/**************************************************************************************/
            	  		
            	  		// 월별로 예약 가능일자 가져오는 함수
            	  		$.ajax({
			                url: 'getMonthlyAvailableTimeSlots.do',
			                method: 'POST',
			                data: { 
			                    classId: $('#classId').val(),
			                    startDate: fetchInfo.startStr.slice(0, 7) + '-01',  // 달의 첫째날
			                    endDate: fetchInfo.startStr.slice(0, 7) + '-30'     // 달의 마지막날 (adjust for actual month length)
			                },
			                success: function(response) { // response : 월별 예약가능 일자 정보 (해당 월 1~말)
			                	
			                	//console.log("event - ajax getMonthlyAvailableTimeSlots.do 가져왔는지 확인 :  ", response);
			                
			                	
			                    //var events = []; // 이벤트 목록
			                    var reservationDates = new Set(); // 예약 완료된 날짜 
			                    var holidayDatesSet = new Set(holidayDates); // 휴무일과 공휴일 날짜를 Set에 저장
			                    var dateAvailability = {}; // 각 날짜의 예약 가능 여부를 추적하는 객체
			                    var reservationDoneDates = new Set();
			                    
			                    
			                    // 서버에서 받은 예약 가능 정보를 바탕으로 이벤트 생성
			                    // 반복문 시작 
			                    response.forEach(function(slot) {
			                    	
			                    	//console.log("slot : ", slot) // 시작일자~종료일자 각각 정보(예약가능인원, 전체인원, 날짜,...)
			                        
			                        
			                        // 예약 가능한 인원이 0인 경우 예약 불가로 표시
			                        if (slot.availableSeatsWithAllReservations <= 0) {
			                        	reservationDates.add(slot.reservationDt); // 예약된 날짜 추가
				                        
			                            events.push({
			                                title: '예약마감',
			                                start: slot.reservationDt,
			                                color: '#D85D5D' // 예약마감 날짜 배경색 
			                            });
			                        } 
				                     	
			                    }); // 반복문 종료
								
			                    
			                    // 선택된 월의 모든 날짜를 처리
			                    // 예약없는 날(모든 날짜 가능한날) 보여줌
			                    var currentDate = new Date(fetchInfo.start); // fetchInfo == 이벤트 전체 start == 오늘날짜인듯
			                    console.log("오늘날짜 fetchInfo.start : ", fetchInfo.start)
			                    while (currentDate <= fetchInfo.end) {
			                        var formattedDate = currentDate.toISOString().split('T')[0]; // 오늘부터 월말까지 날짜 하루하루
									// console.log("월별 하루하루 formattedDate : " , formattedDate)
									
									
					                // 주말(토, 일) 여부와 공휴일 여부 확인
					                var dayOfWeek = currentDate.getUTCDay();
					                var isWeekend = dayOfWeek === 0 || dayOfWeek === 6;
					                var isHoliday = holidayDatesSet.has(formattedDate);
					                
					               
					                // 예약 가능한 날짜가 아니고(예약마감), 휴무일, 공휴일 또는 주말이 아닌 경우에만 "예약 가능" 표시
					                if (!reservationDates.has(formattedDate) && !holidayDatesSet.has(formattedDate) && !isWeekend) {
					                    events.push({
					                        title: '예약가능',
					                        start: formattedDate,
					                        color: '#267CC7'// '#97C84F' 
					                    });
					                }
					                
					                
					                //(추가) 휴무일, 공휴일 
					                
					                if (holidayDatesSet.has(formattedDate)) {
					                    events.push({
					                        title: '예약불가',
					                        start: formattedDate,
					                        color: 'grey'// '#97C84F' 
					                    });
					                }
					                
					                
			                        // 다른 날로 이동
			                        currentDate.setDate(currentDate.getDate() + 1);
			                    }
			
			                    successCallback(events);  // 캘린더에 이벤트 데이터 전달
			                    
			                }, // success 종료
			                error: function() {
			                    alert('예약 가능 정보를 불러오는 중 문제가 발생했습니다.');
			                    
			                }
			            }); // ajax 종료
		            	
                      }) // .then(data => {
                  	
	                  .catch(error => {
	                      console.error("구글 캘린더에서 데이터를 가져오는 중 오류 발생:", error);
	                      failureCallback(error);
	                  });
			        }, // event 종료 
              dateClick: function(info) {  
            	  // 날짜 선택 관련 로직
            	// 이전 선택된 날짜의 스타일을 초기화
                  if (selectedDate) {
                      var prevCell = document.querySelector('.fc-daygrid-day[data-date="' + selectedDate + '"]');
                      if (prevCell) {
                          prevCell.style.backgroundColor = ''; // 초기화
                      }
                  }
				
              	  // 달력 선택 날짜 -> 예약정보 입력 - 예약날짜 에 넣기
                  selectedDate = info.dateStr;
              	  
              	  
               	  // 선택된 날짜 셀을 노란색으로 설정
               	  var selectedCell = document.querySelector('.fc-daygrid-day[data-date="' + selectedDate + '"]');
	                if (selectedCell) {
	                    selectedCell.style.backgroundColor = '#FDD7D7';
	                }
	             // 선택된 날짜를 표시
	              //document.getElementById('reservationScheduleselectedDateText').textContent = info.dateStr + ' 예약 일정';
	                
                  var dayOfWeek = new Date(info.date).getDay(); // 요일 가져오기 (0: 일요일, 6: 토요일)
                  
                  
                  
                  var reservationSchedulselectedDate = new Date(info.dateStr);
                  var year = reservationSchedulselectedDate.getFullYear();
              	  var month = reservationSchedulselectedDate.getMonth() + 1; // 월은 0부터 시작하므로 +1 필요
    			  var day = reservationSchedulselectedDate.getDate();
    			  var dateText = year + "년 " + month + "월 " + day + "일"; // 'nn월 nn일' 형식으로 날짜 텍스트를 설정
    			  
    			  
               	 // 휴일이 아닌 경우에만 날짜를 설정
                 // 휴일 또는 주말(Sat=6, Sun=0) 선택 방지
                  if (holidayDates.includes(selectedDate) || dayOfWeek === 0 || dayOfWeek === 6) {
                      alert('해당 날짜는 휴무일이므로 예약이 불가합니다.');
                      
                      
                   // 예약 현황 - 선택 날짜 표기 (휴무일 )
	    			  document.getElementById('reservationScheduleselectedDateText').textContent = dateText + "(휴무일)";
                      
                      
                      document.getElementById('reservationDt').value = ''; // 휴일이므로 예약 날짜 input에 값을 넣지 않음 // 선택을 취소함
                      
                   	  // 예약 시간대와 인원수 초기화
                      $('#timeOptions').empty().append("<p>예약 날짜를 선택해주세요</p>");
                      $('#reservationCountOptions').empty().append("<p>예약 시간대를 선택해주세요</p>");
                      
                      
                      return;
                  }else{
                	  document.getElementById('reservationDt').value = selectedDate;
                      // 여기서 날짜 클릭 시 수행할 동작을 추가 가능 
                      
                      // 예약 현황 - 선택 날짜 표기 (휴무일이 아닐 때에만 )
	    			  document.getElementById('reservationScheduleselectedDateText').textContent = dateText;
                      
                      // 일별 예약시간대 정보 가져오는 함수
                      loadReservationData(selectedDate, classId); // ajax 함수 호출
                      
                  } 
                  
              },
              dayCellClassNames: function(arg) {
            	  var dayOfWeek = arg.date.getUTCDay();
                  if (dayOfWeek === 6) { // 일요일 
                      return ['fc-sunday']; // 글자색 css
                  } else if (dayOfWeek === 5) { // 토요일
                      return ['fc-saturday']; // 글자색 css
                  }
              }
              
          });
          
          // 캘린더 크기 설정
          calendar.setOption('contentHeight', 600);
          
          /**************************************************************/
       	 
          
          calendar.render(); // 달력을 화면에 렌더링
      }); // fullCalendar API 함수 끝
      
      
      
      
      
	</script>







	<script>
	//페이지 로드가 완료되면
	if (window.addEventListener)
			window.addEventListener("load", userData, false);
	else if (window.attachEvent)
			window.attachEvent("onload", userData);
	else
			window.onload = userData;
	var userIdCk = false;
	function userData() {
		
		// 예약버튼 클릭 전 유효성 검사
		
		// 예약자명 입력 제한 및 길이 제한
		  $('#reservationNm').on('input', function() {
		      // 이름 정규식 (한글 or 영어 대소문자만 허용 // 공백x 특수문자x 숫자x)
		      let validChars = /^[ㄱ-ㅎ|가-힣a-zA-Z]*$/;

		      let reservationNm = $(this).val(); // 현재 입력된 이름

		      // 입력불가 문자 입력 시 삭제
		      if (!validChars.test(reservationNm)) {
		          $(this).val(reservationNm.replace(/[^가-힣a-zA-Z]/g, ''));
		          $('#reservationNmMsg').text("이름은 한글 또는 영어 대소문자만 허용됩니다. 공백,특수문자,숫자는 입력할 수 없습니다.").css("color", "red");
		      } 
		      // 글자수 10글자 제한
		      else if (reservationNm.length > 10) { 
		          $(this).val(reservationNm.substring(0, 10));
		          $('#reservationNmMsg').text("이름은 최대 10자까지 입력 가능합니다.").css("color", "red");
		      } else {
		          $('#reservationNmMsg').text(""); // 정규표현식 o -> 메시지 삭제
		      }
		  });
		
		
		// 예약자 연락처 
		
			//휴대전화 
			 $('#reservationPhone').on('input', function() {
		        let reservationPhone = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 허용
		        
		        // 글자수 11 제한
		        if (reservationPhone.length > 11) {
		            reservationPhone = reservationPhone.substring(0, 11);
		        }
		        
		        let formattedNumber;
		
		        if (reservationPhone.length <= 3) {
		            formattedNumber = reservationPhone; // 3자리 이하일 경우 그대로 표시
		        } else if (reservationPhone.length <= 7) {
		            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3); // 4~7자리일 경우 3-4 형식
		        } else if (reservationPhone.length <= 10) {
		            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3, 6) + '-' + reservationPhone.slice(6); // 10자리 형식 3-3-4
		        } else {
		            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3, 7) + '-' + reservationPhone.slice(7); // 11자리 형식 3-4-4
		        }
		
		        $(this).val(formattedNumber); // 포맷팅된 번호를 필드에 표시
		    });
			
		
		// 예약자 이메일 
			// 이메일 입력 제한: 최대 30글자, 공백 허용하지 않음
			 $('#reservationEmail').on('input', function() {
			     let email = $(this).val().replace(/\s/g, ''); // 공백 제거
			     if (email.length > 30) {
			         email = email.substring(0, 30); // 최대 30글자로 제한
			     }
			     $(this).val(email); // 수정된 값 설정
			 });
		
		
			// 비회원 예약자 비밀번호
				// 비밀번호 유효성 검증 정규식: 공백 없이 최대 15자까지 입력 가능. 영어, 숫자, 특수문자(!@#$%^*+=-)만 허용
				  const passwordRegEx = /^[A-Za-z0-9!@#$%^*+=-]{1,15}$/;
				  
				  $('#reservationPw').on('input', function() {
					    let password = $(this).val();
					    
					    // 공백 or 15글자 초과 시 삭제
					    password = password.replace(/\s/g, '').substring(0, 15);
					    $(this).val(password);
					    
					    // 정규표현식 확인
					    if (!passwordRegEx.test(password)) {
					        $('#userPasswdMsg').text("공백 없이 최대 15자까지, 영어, 숫자, 특수문자(!@#$%^*+=-)를 사용하여 입력하세요.").css("color", "red");
					    } else {
					        $('#userPasswdMsg').text(""); // 유효한 경우 메시지 지우기
					    }
					});
					
		
		/**********************************************************/
		
		// 예약 버튼 클릭 시 
		$('.registerBtn').click(function(e) {
			e.preventDefault();
			
			if ($.trim($('#reservationDt').val()) == ''){
				alert('달력에서 예약날짜를 선택해주세요');
				$('#reservationDt').focus();
				return false;
			}
			
			if(!$('input:radio[name=classDetailId]').is(":checked")){
				alert("예약 시간대를 선택해주세요.");
				$('#classDetailId').focus();
				return false;
			}
			
			if(!$('input:radio[name=reservationCnt]').is(":checked")){
				alert("예약인원수를 선택해주세요.");
				$('#reservationCnt').focus();
				return false;
			}
			
			
			if ($.trim($('#reservationNm').val()) == ''){
				alert('예약자명을 입력해주세요');
				$('#reservationNm').focus();
				return false;
			}
			
			if ($.trim($('#reservationPhone').val()) == ''){
				alert('예약자 연락처를 입력해주세요');
				$('#reservationPhone').focus();
				return false;
			}
			
			
			// 휴대폰 번호 및 지역번호 형식 체크 (01X-XXXX-XXXX 또는 지역번호-XXXX-XXXX 형식)
			// let phoneReg = /^(01[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;	// 휴대폰 번호 형식 체크 (010, 011, 016, 017, 018, 019-1234-5678 형식)

			let phoneReg = /^(01[0|1|6|7|8|9]-\d{3,4}-\d{4}|0\d{1,2}-\d{3,4}-\d{4})$/;
			if (!phoneReg.test($('#reservationPhone').val())) {
			    alert('휴대폰 번호 또는 일반 전화번호를 올바른 형식으로 입력해주세요. (ex. 010-0000-0000)');
			    $('#reservationPhone').focus();
			    return false;
			}
			
			
			if ($.trim($('#reservationEmail').val()) == '' ){
				alert('예약자 이메일을 입력해주세요.');
				$('#reservationEmail').focus();
				return false;
			}
			// 이메일 형식 체크 (ex. exaple@naver.com)
				/* 
				^[A-Z0-9._%+-]+: 이메일의 첫 부분은 영문자, 숫자, 특수문자(._%+-)를 포함할 수 있습니다.
				@[A-Z0-9.-]+: @ 뒤에는 도메인 부분이 오며, 영문자, 숫자, 점(.), 하이픈(-)이 허용됩니다.
				\.[A-Z]{2,}$: 도메인 끝부분이 최소 2자 이상의 문자로 끝나야 함을 의미합니다. (예: .com, .org, .co.kr)
			*/
			let emailReg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
			
			if (!emailReg.test($('#reservationEmail').val())) {
			    alert('이메일 형식을 확인해 주세요.(ex. exaple@naver.com)');
			    $('#reservationEmail').focus();
			    return false;
			}
			
			
			
			if ($.trim($('#reservationPw').val()) == ''){
				alert('비밀번호를 입력해주세요');
				$('#reservationPw').focus();
				return false;
			}
			
			// 비밀번호 형식 체크 (영문, 숫자, 특수문자 포함 8~15자)
			let reg = /^[A-Za-z0-9!@#$%^*+=-]{1,15}$/;
			if (!reg.test($('#reservationPw').val())) {
			    alert('비밀번호는 공백 없이 최대 15자까지, 영어, 숫자, 특수문자(!@#$%^*+=-)를 사용하여 입력하세요.');
			    $('#reservationPw').focus();
			    return false;
			}
			
			
			
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			
			
			//if (confirm("예약을 하시겠습니까?")) {
				var form = $('#registerForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'reservationUsrInsert.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(response){
						console.log("예약 응답 result:", response);
		                
						try{
			                // JSON 파싱
			                //var response = JSON.parse(result);
							//console.log("예약 response:", response);
	
			                if (response.error == 'N') {
			                    alert("예약이 신청되었습니다. 관리자 접수완료 후 예약이 확정됩니다.");
			                    location.href = '/';
			                } else if (response.error == 'Y') {
			                    alert('예약 신청 실패: ' + response.errorMsg);
			                    location.href = '/reservationUsrForm.do?classId=' + response.classId; // classId 추가
			                }
							
						} catch(e) {
							console.error("Unexpected response format. It is not valid JSON.", result);
					        alert("서버에서 잘못된 응답을 받았습니다.");
					        //location.href = '/reservationUsrForm.do?classId=' + response.classId; // classId 추가
						}
					}
					,
					error: function() {
		                alert("예약 중 오류가 발생했습니다.");
		                //location.href = '/reservationUsrForm.do?classId=' + response.classId; // classId 추가
		            }
				});
			// } // if문
			
			
			
		})// 예약신청 버튼 클릭 끝
	};// 전체 불러오기 끝
		
	// 유효성 검사 함수
	function requiredEmpty() {
		var empty = false;
		$("*[required]").each(
				function() {
					if (empty)
						return;
					var input = $(this), value = input.val();
					if (empty = !value) {
						var label = $(
								"label[for='" + input.attr("id") + "']")
								.html();
						if (label)
							alert(label.replace("<br>", "")
									+ "을(를) 입력하십시오.");
						else
							alert("필수값이 입력되지 않았습니다.");
						input.focus();
					}

				});
		return empty;
	}
	
	
	// 일별 선택된 날짜의 예약정보 가져오는 함수
	function loadReservationData(selectedDate, classId) {
       
          // AJAX 요청을 통해 선택된 날짜의 예약 가능한 시간대 정보를 가져옵니다.
          $.ajax({
              url: 'getDayAvailableTimeSlots.do',
              method: 'POST',
              data: { reservationDt: selectedDate,
              	    classId : $('#classId').val()
              	   },
              success: function(response) {
              	
            	  
            	console.log("response :", response )
              	
                  $('#timeOptions').empty();
                  
                  // 새로운 데이터로 리스트 채우기
                  response.forEach(function(slot) { 
                	  console.log("slot : ", slot)
                	  console.log("slot.classMaxCnt : ", slot.classMaxCnt)
                	  
                      
                      // 예약시간대에 선택한 날짜에 해당하는 예약시간대 라디오버튼으로 만들어서 넣기 
                      var label = $('<label>', {
                    'for': 'classDetailId' + slot.classDetailId,
                    'text': slot.timeRange, // Display time range text
                    'class': 'time-slot-label' // Optional: add a class for styling
		                });
		
		                var input = $('<input>', {
		                    'type': 'radio',
		                    'name': 'classDetailId', // Ensure all options have the same name
		                    'id': 'classDetailId' + slot.classDetailId,
		                    'value': slot.classDetailId, // Value to be sent on form submission
		                    'required': true // Make selection required
		                });
		
		                label.prepend(input); //label 앞에  input에 추가
		
		                $('#timeOptions').append(label);//  #timeOptions div에 라벨 추가
		                
		             	// 선택 : 현재 예약정보, 최대인원수를 각 라벨에추가
		                var infoText = ' (예약 : ' + slot.sumAllreservation +'명 / 최대 : ' + slot.classMaxCnt + '명 /  예약가능 : ' + slot.availableSeatsWithAllReservations + '명)';
		                label.append(infoText);
                      	
		                
		             
		                /******************************************/
		                
		                // 선택 날짜, 선택한 예약시간대 별 예약가능한 인원수까지 라디오버튼 생성
		             	input.on('change', function() {
		                	
		                	$('#timeOptions label').removeClass('active');

		    	            // active 클래스를 선택된 라벨에 추가
		    	            $(this).closest('label').addClass('active');
		    	            
		                    generateReservationCountOptions(slot.availableSeatsWithAllReservations);
		                });
		
                  });
              },
              error: function(xhr, status, error) {
                  console.error("Error fetching available time slots: ", error);
                  alert("시간 데이터를 불러오는 중 문제가 발생했습니다.");
              }
              
              });
          
       
    }
	
	
	// 예약인원수 표출 : 선택 날짜, 선택 예약시간대별 가능한 예약인원수까지 예약인원수 표출
	function generateReservationCountOptions(maxAvailableSeats) {
	    $('#reservationCountOptions').empty(); // 이전 예약인원수 옵션 초기화
	
	    for (var i = 1; i <= maxAvailableSeats; i++) {
	        var label = $('<label>', {
	            'for': 'person' + i
	        }).text(i + '명');
	
	        var input = $('<input>', {
	            'type': 'radio',
	            'name': 'reservationCnt',
	            'id': 'person' + i,
	            'value': i,
	            'required': true
	        });
	
	        label.prepend(input);
	        $('#reservationCountOptions').append(label);
	        
	        
			// 예약인원수 선택 시 css 적용되도록 수정
	        input.on('change', function() {
	            $('#reservationCountOptions label').removeClass('active'); // active 클래스 다 지우기

	            $(this).closest('label').addClass('active'); // 선택된 라벨에 active 클래스 부여
	        });
	        
	        
	    }
	}
	</script>


	<!-- Js Plugins -->
	<!--<jsp:include page="/WEB-INF/jsp/main/inc/commonJsPlugins.jsp" />-->
	<script src="<c:url value='/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/js/jquery.nicescroll.min.js' />"></script>
	<script src="<c:url value='/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/js/jquery.countdown.min.js' />"></script>
	<script src="<c:url value='/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	<!--공통 컴포넌트 불러오기-->

</body>
</html>

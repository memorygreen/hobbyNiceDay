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

/*241025 추가 예약 시간대 활성화 시 css*/
.product__details__option__size label.active {
	background: #111111;
	color: #ffffff;
	border-color: #111111;
}



/*241030 추가 달력 주말 배경 연한 빨간색*/
/*
.fc-weekend { 
        background-color: rgba(255, 0, 0, 0.1); /* 주말을 연한 빨간색으로 
    }
  */  
.fc-sunday .fc-daygrid-day-top { 
    color: red; /* 일요일 글자 빨간색 */
}

.fc-saturday .fc-daygrid-day-top { 
    color: blue; /* 토요일 글자 파란색 */
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
	<section class="checkout spad">
	<div class="container">

		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="jy_page_title">
						<!--section-title  -->
						<span>RESERVATION</span>
						<h2>예약 등록(비회원)</h2>
						<p>예약 정보를 입력해주세요</p>
					</div>
				</div>
			</div>

			<!-- 달력추가 -->

		</div>

		<div class="row">
			<div class="col-lg-8 ">
			<!-- 달력추가 -->
				<div id='calendar'></div>
			</div>

			<div class="col-lg-4 ">
				<div class="product__details__pic">
					<h6 class="checkout__title"><span  id="reservationScheduleselectedDateText"></span> 예약 일정 헌황</h6>
						<!-- 예약 일정 리스트 -->
						<div class="checkout__form">
								<!-- 시간대 리스트가 여기 들어갑니다 -->

								<div class="row">
									
									<div class="col-lg-12">
										<div class="checkout__input">
											<p>
												예약 시간대 (현재예약인원수 / 예약가능인원수)
											</p>
											<!-- <input type="time" id="reservationTime" name="reservationTime" required /> -->
											<!--<div id="timeOptions">  -->
											<div class="product__details__option__size" id="reservationScheduletimeOptions">
												<!-- <label for="time1">${classDetails.timeSets}
					                                <input type="radio" name="reservationTime" id="time1" required>
					                            </label>
					                             -->
					                             
					                             <ul> 
					                             	<li> 
					                             		<span>달력에서 날짜를 선택해주세요</span>
					                             		<span class="reservationSchedule timeRange"></span>
														<span class="reservationSchedule sumAllreservation"></span>
														<span class="reservationSchedule classMaxCnt"></span>
													</li>
					                             	
					                             </ul>
											</div>
	
										</div>
									</div>
														
								</div>
								<div class="jy_margin_1" style="height: 200px"></div> 
						</div>
				</div>
			</div>
		</div>
		

		<!-- <div class="jy_margin_1" style="height:50px"></div> -->
		<!--  예약정보 입력 -->
		<div class="checkout__form">

			<form id="registerForm" name="registerForm" method="post">
				<input type="hidden" id="userId" name="userId"
					value="<c:out value='${userVO.userId}'/>">
				<!-- 사용자 구분(일반사용자) -->
				<!-- <input type="hidden" id="classDetailId" name="classDetailId" ><!-- 클래스 시간 고유 id -->
				<input type="hidden" id="classId" name="classId"
					value="<c:out value='${classDetails.classId}'/>">

				<div class="jy_margin_1" style="height: 50px"></div>

				<!-- 회원가입 폼 시작 -->
				<h6 class="checkout__title">예약정보 입력</h6>
				<div class="row">

					<div class="col-lg-6">
						<div class="checkout__input">
							<p>
								예약자명<span>*</span>
							</p>
							<input type="text" id="reservationNm" name="reservationNm"
								value="<c:out value='${userVO.userName}'/>" required />
						</div>
					</div>

					<div class="col-lg-6">
						<div class="checkout__input">
							<p>
								예약날짜 <span>*</span>
							</p>
							<input type="date" id="reservationDt" name="reservationDt"
								readonly required /> <span>위의 달력에서 원하는 예약 날짜를 선택해주세요.</span>
						</div>
					</div>

					<div class="col-lg-6">
						
						
						<div class="checkout__input">
							<p>
								예약인원수<span>*</span>
							</p>
							<div class="product__details__option__size">
								<c:forEach var="i" begin="1" end="${classDetails.classMaxCnt}">
									<label for="person${i}"> ${i}명 <input type="radio"
										name="reservationCnt" id="person${i}" value="${i}"
										${i == 1 ? 'required' : ''}>
									</label>
								</c:forEach>
							</div>
							<!-- <input type="number" id="reservationCnt" name="reservationCnt" required /> -->
							<!-- 
							<div class="product__details__option__size" >
	                            <label for="xxl">1
	                                <input type="radio" name="reservationCnt" id="xxl" required>
	                            </label>
	                            <label class="active" for="xl">2
	                                <input type="radio" name="reservationCnt" id="xl">
	                            </label>
	                            <label for="l">3
	                                <input type="radio" name="reservationCnt" id="l">
	                            </label>
	                            <label for="sm">4
	                                <input type="radio" name="reservationCnt" id="sm">
	                            </label>
	                        </div> -->


						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout__input">
							<p>
								예약 시간대<span>*</span>
							</p>
							<!-- <input type="time" id="reservationTime" name="reservationTime" required /> -->
							<!--<div id="timeOptions">  -->
							<div class="product__details__option__size" id="timeOptions">
								<!-- <label for="time1">${classDetails.timeSets}
	                                <input type="radio" name="reservationTime" id="time1" required>
	                            </label>
	                             -->
							</div>


						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="checkout__input">
							<p>
								휴대전화<span>*</span>
							</p>
							<input type="text" id="reservationPhone" name="reservationPhone"
								value="<c:out value='${userVO.mbtlnum}'/>" required>
							<p>휴대전화 번호를 '-'까지 입력해주세요.</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout__input">
							<p>
								이메일<span>*</span>
							</p>
							<input type="text" id="reservationEmail" name="reservationEmail"
								value="<c:out value='${userVO.email}'/>" required>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="checkout__input">
							<p>비고</p>
							<input type="text" id="reservationEtc" name="reservationEtc">
						</div>
					</div>
				</div>
		</div>
		<!-- checkout Form 끝 -->

		</form>

		<!-- <input type="submit" value="회원가입" class="primary-btn" /> -->
		<button type="reset" class="primary-btn">취소</button>

		<a href="#" class="primary-btn registerBtn">예약</a> <a href="/"
			id="listBtn" class="primary-btn listBtn">목록</a>


		<!-- 회원가입 폼 끝-->


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


	<!-- 자영 달력 추가 -->
	<!-- 참고용 : 공식문서 https://fullcalendar.io/docs/initialize-globals -->
	<script>
	
	  document.addEventListener('DOMContentLoaded', function() {
		  
		  
          var calendarEl = document.getElementById('calendar');
          
          // Retrieve start and end dates from JSP variables
          var startDt = "${classDetails.startDt}"; // Format: YYYY-MM-DD
          var endDt = "${classDetails.endDt}";     // Format: YYYY-MM-DD
          console.log("startDt : ", startDt, "endDt : ", endDt)
          
          var calendar = new FullCalendar.Calendar(calendarEl, {
              initialView: 'dayGridMonth',
              //events: '/getEvents.do',  // 스프링 컨트롤러에서 이벤트를 불러오는 URL 매핑
              locale: 'ko', // 한국어 설정
              headerToolbar: {
			                  left: 'prev,next today',
			                  center: 'title',
			                  right: 'dayGridMonth'
              				},
              validRange: function(nowDate){ // 보여줄 날짜 범위
		                    return {start: nowDate, //startDt,//
		                    		end: endDt + "T23:00" // 종료 전날짜까지만 선택돼서 시간 추가
		              			   }
             				},
      		  firstDay: 0, // 일요일(0)을 월요일(1)을 일주일의 첫째날로 설정
              // weekends: false, // 주말 비활성화
              events: [], // 이곳에 추후 이벤트(휴일)를 추가할 것입니다.
           	  // 날짜 클릭 이벤트 추가
              dateClick: function(info) { // 날짜 선택 관련 로직
                  
              	  
					
              	  // 달력 선택 날짜 -> 예약정보 입력 - 예약날짜 에 넣기
                  var selectedDate = info.dateStr;
                  var dayOfWeek = new Date(info.date).getDay(); // 요일 가져오기 (0: 일요일, 6: 토요일)
                  
               	 // 휴일이 아닌 경우에만 날짜를 설정
                 // 휴일 또는 주말(Sat=6, Sun=0) 선택 방지
                  if (holidayDates.includes(selectedDate) || dayOfWeek === 0 || dayOfWeek === 6) {
                      alert('해당 날짜는 휴무일이므로 선택이 불가합니다.');
                      document.getElementById('reservationDt').value = ''; // 휴일이므로 예약 날짜 input에 값을 넣지 않음 // 선택을 취소합니다.
                      return;
                  }else{
                	  document.getElementById('reservationDt').value = selectedDate;
                      alert( '예약 날짜가 ' + info.dateStr + '로 선택되었습니다.');// 선택한 날짜가 휴일이면 선택을 막고 알림을 띄웁니다.
                      
                      // 여기서 날짜 클릭 시 수행할 동작을 추가할 수 있습니다. 
                     	
                      
                      // 예약 현황 - 선택 날짜 표기 (휴무일이 아닐 때에만 )
	                  var reservationSchedulselectedDate = new Date(info.dateStr);
	              	  var month = reservationSchedulselectedDate.getMonth() + 1; // 월은 0부터 시작하므로 +1 필요
	    			  var day = reservationSchedulselectedDate.getDate();
	    			  var dateText = month + "월 " + day + "일"; // 'nn월 nn일' 형식으로 날짜 텍스트를 설정
	    			  document.getElementById('reservationScheduleselectedDateText').textContent = dateText;
                      
                      loadReservationData(selectedDate, classId); // ajax 함수 호출
                      
                  } 
                  
              },
              eventClick: function(info) {
                  alert('이벤트: ' + info.event.title);
                  // 여기서 예약 가능한 시간 등을 추가로 표시할 수 있음
              },
              dayCellClassNames: function(arg) {
            	  var dayOfWeek = arg.date.getUTCDay();
                  if (dayOfWeek === 6) { // 일요일
                      return ['fc-sunday'];
                  } else if (dayOfWeek === 5) { // 토요일
                      return ['fc-saturday'];
                  }
              }
              
          });
          
          
       	  // 휴일 날짜와 설명
          // classDetails.holidayInfo 값을 가져와서 파싱합니다.
          var holidayInfo = "${classDetails.holidayInfo}"; // 예: "2024-09-05(휴무일), 2024-09-18(휴무일)"
          var holidayDates = []; // 나중 추가
          
          if (holidayInfo) {
              var holidays = holidayInfo.split(','); // 쉼표(,)로 분리하여 배열로 만듭니다.

              // 각 휴일 정보를 파싱하여 이벤트로 변환
              holidays.forEach(function(holiday) {
            	// 공백 제거 후 괄호 기준으로 날짜와 설명을 분리
                  var date = holiday.trim().split('(')[0]; // 날짜 부분 추출
                  var description = holiday.trim().split('(')[1].replace(')', ''); // 설명 부분 추출
				  
               	  // 휴일 날짜를 배열에 저장
                  holidayDates.push(date);
                  
                  // 이벤트 객체 생성
                  var holidayEvent = {
                      title: description,  // 휴일 설명을 제목으로 설정
                      start: date,         // 이벤트 시작일은 휴일 날짜
                      allDay: true,         // 하루종일 이벤트로 설정
                      color: 'red'  // 휴일을 빨간색으로 표시
                  };

                  // 이벤트를 달력에 추가
                  calendar.addEvent(holidayEvent);
              });
          }
          
          calendar.render(); // 달력 끝!
      });
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
		
		/**************************************************/
		// 예약정보 입력 - 예약시간대 추가
		// 예시: "3: 14:00-16:00, 4: 16:00-18:00, 5: 18:00-20:00"
	    var timeSets = "${classDetails.timeSets}"; 

	    // 쉼표로 분리하여 배열로 만듭니다.
	    var timeSlots = timeSets.split(',');

	    // 각 시간대 쌍을 처리하여 라디오 버튼을 생성합니다.
	    $.each(timeSlots, function(index, slot) {
	        // 공백 제거 후 세미콜론(;)으로 class_detail_id와 시간대 분리
	        var details = $.trim(slot).split(';');
	        var classDetailId = $.trim(details[0]); // class_detail_id 부분
	        var timeRange = $.trim(details[1]); // 시간대 부분

	        // label과 input 태그를 생성
	        var label = $('<label>', {
	            'for': 'classDetailId' + classDetailId,
	            'text': timeRange, // 시간대 텍스트 추가
	            'class': '' // Custom CSS class (optional)
	        });

	        var input = $('<input>', {
	            'type': 'radio',
	            'name': 'classDetailId',// 'reservationTime',
	            'id': 'classDetailId' + classDetailId,
	            'value': classDetailId, // class_detail_id를 value로 설정
	            'required': true // 필수 입력 속성 추가
	        });

	        // label에 input을 추가
	        label.prepend(input);

	        // 생성된 label을 div에 추가
	        $('#timeOptions').append(label);
	        
	        
	        // 얘약 일정 현황
	        // 예약 시간대 넣기
			
	        /*
	        <span class="reservationSchedule timeRange">10:00-14:00</span>
			<span class="reservationSchedule sumAllreservation"> </span>명/
			<span class="reservationSchedule classMaxCnt"> </span>	명
	        
	        */
	        
	        var span = $('<span>', {
	            'type': 'span',
	            'name': 'classDetailId',// 'reservationTime',
	            'id': 'classDetailId' + classDetailId,
	            'value': classDetailId, // class_detail_id를 value로 설정
	            'text': timeRange,
	            'class' : 'timeRange'
	            
	        });

	        
	        
        });
    	
    	
		// 예약정보 입력 - 예약시간대 선택 시
		// 라디오 버튼이 선택되었을 때 class를 변경하는 함수
		$('input[name="classDetailId"]').change(function() {
		    // 모든 label에서 action 클래스를 제거
		    $('label').removeClass('action');
		    
		    // 선택된 라디오 버튼에 해당하는 label에 action 클래스 추가
		    $(this).closest('label').addClass('action');
		});
		
    	/***************************************************/
		
		// 예약 버튼 클릭 시 
		$('.registerBtn').click(function(e) {
			e.preventDefault();
			
			
			if ($.trim($('#reservationNm').val()) == ''){
				alert('예약자명을 입력해주세요');
				$('#reservationNm').focus();
				return false;
			}
			
			if(!$('input:radio[name=reservationCnt]').is(":checked")){
				alert("예약인원수를 선택해주세요.");
				$('#reservationCnt').focus();
				return false;
			}
			
			if ($.trim($('#reservationDt').val()) == ''){
				alert('예약날짜를 입력해주세요');
				$('#reservationDt').focus();
				return false;
			}
			
			if(!$('input:radio[name=classDetailId]').is(":checked")){
				alert("예약 시간대를 선택해주세요.");
				$('#classDetailId').focus();
				return false;
			}
			
			if ($.trim($('#reservationPhone').val()) == ''){
				alert('휴대전화 번호를 입력해주세요');
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
				alert('이메일을 입력해주세요.');
				$('#reservationEmail').focus();
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
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			
			
			if (confirm("예약을 하시겠습니까?")) {
				var form = $('#registerForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'reservationUsrInsert.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(result){
						console.log("예약 응답 result:", result);
		                
						try{
			                // JSON 파싱
			                var response = JSON.parse(result);
							console.log("예약 response:", response);
	
			                if (response.error == 'N') {
			                    alert("예약이 등록되었습니다. 관리자 승인 후 예약이 확정됩니다.");
			                    location.href = '/myReservationList.do';
			                } else if (response.error == 'Y') {
			                    alert('예약 실패: ' + response.errorMsg);
			                    location.href = '/reservationUsrForm.do';
			                }
							
						} catch(e) {
							console.error("Unexpected response format. It is not valid JSON.", result);
					        alert("서버에서 잘못된 응답을 받았습니다.");
						}
					}
					/*,
					error: function() {
		                alert("예약 중 오류가 발생했습니다.");
		            }*/
				});
			}
			
			
			
		})// 회원가입 버튼 클릭 끝
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
	
	
	// 선택된 날짜의 예약정보 가져오는 함수
	function loadReservationData(selectedDate, classId) {
       
          // AJAX 요청을 통해 선택된 날짜의 예약 가능한 시간대 정보를 가져옵니다.
          $.ajax({
              url: 'getAvailableTimeSlots.do',
              method: 'POST',
              data: { reservationDt: selectedDate,
              	    classId : $('#classId').val()
              	   },
              success: function(response) {
              	
            	  
            	  /*console.log("response :", response )
              	
              	console.log("response[0] :", response[0] )
              	console.log("response[0].timeRange :", response[0].timeRange )
              	console.log("response[0].sumAllreservation 현재 예약 인원(모든 예약 고려):", response[0].sumAllreservation )
              	console.log("response[0].availableSeatsWithAllReservations 현재 가능 (모든 예약 고려):", response[0].availableSeatsWithAllReservations )
              	console.log("response[0].classMaxCnt (최대 수강인원) :", response[0].classMaxCnt )
              	
              	console.log("response[1] :", response[1] )
              	console.log("response[1].timeRange :", response[1].timeRange )
              	console.log("response[1].sumAllreservation 현재 예약 인원(모든 예약 고려):", response[1].sumAllreservation )
              	console.log("response[1].availableSeatsWithAllReservations 현재 가능 (모든 예약 고려):", response[1].availableSeatsWithAllReservations )
              	console.log("response[1].classMaxCnt (최대 수강인원) :", response[1].classMaxCnt )
              	*/
              	
              	

            	  var timeSlotList = $('.product__details__option__size ul');
                  timeSlotList.empty();

                  // Populate the list with new data
                  response.forEach(function(slot) {
                      var li = $('<li>');
                      var timeRangeSpan = $('<span>', {
                          class: 'reservationSchedule timeRange',
                          text: slot.timeRange // e.g., "10:00-14:00"
                      });
                      var sumAllreservationSpan = $('<span>', {
                          class: 'reservationSchedule sumAllreservation',
                          text: slot.sumAllreservation // Current reserved count
                      });
                      var classMaxCntSpan = $('<span>', {
                          class: 'reservationSchedule classMaxCnt',
                          text: slot.classMaxCnt // Max capacity
                      });

                      // Build the li structure: "10:00-14:00 3명 / 10명"
                      li.append(timeRangeSpan)
                        .append(' ')
                        .append(sumAllreservationSpan)
                        .append('명 / ')
                        .append(classMaxCntSpan)
                        .append('명');

                      // Append the li to the ul
                      timeSlotList.append(li);
                  });
              },
              error: function(xhr, status, error) {
                  console.error("Error fetching available time slots: ", error);
                  alert("시간 데이터를 불러오는 중 문제가 발생했습니다.");
              }
              
              });
          
       
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

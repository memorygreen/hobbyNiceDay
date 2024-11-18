<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>

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
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

<script type="text/javascript">
	
</script>


</head>

<body>
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<!--
	<c:set var="classDetails" value="${classDetails}" />
	-->
	
	<!-- 현재 날짜를 가져와 'yyyy-MM-dd' 형식으로 저장 -->
	<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd" var="todayStr" />
	
	<!-- 오늘 날짜를 Date 형식으로 파싱 -->
	<fmt:parseDate value="${todayStr}" pattern="yyyy-MM-dd" var="currentDate" />
	
	<!-- 클래스 종료일을 Date 형식으로 파싱 -->
	<fmt:parseDate value="${classDetails.endDt}" pattern="yyyy-MM-dd" var="classEndDate" />

		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		                             
		                             
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


	
    <!-- Shop Details Section Begin -->
    <section class="shop-details">
    
    
    <!--  사진 부분  -->
           		 
        <div class="product__details__pic">
            
            <div class="container">
				
				<!-- 
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="./index.html">메인</a>
                            <a href="./shop.html">클래스 목록</a>
                            <span>클래스 상세보기 </span>
                        </div>
                    </div>
                </div>
				 -->             
				 
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                    <!-- 원래 사진 목록 있던 곳  
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg='/images/classes/img_class_cookie2.jpg' alt="첫번째 이미지">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg='/images/classes/img_class_cookie3.jpg' alt="두번째 이미지">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="/images/img/shop-details/thumb-3333333333333.png">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <div class="product__thumb__pic set-bg" data-setbg="/images/img/shop-details/thumb-444444444444.png">
                                        <i class="fa fa-play"></i>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        -->
                    </div>
                    
                    <!-- 클래스 상세보기 이미지  -->
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <!-- <img src='/images/classes/img_class_cookie2.jpg' alt="대표 이미지">
                                     -->
                                    <img src="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${classDetails.imgNm}" />" alt="Class Leader Image" style="width: 100%; height: 100%; object-fit: cover;"> 
                                   
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        
        <div class="product__details__content">
            <div class="container">
            
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${classDetails.classNm}</h4> <!-- 클래스명 -->
                            
                            <h3>
								<fmt:formatNumber value="${classDetails.classPrice}" type="currency" currencySymbol="₩" /><!-- 클래스 가격 -->
								<!-- <span>\89,000</span> -->
							</h3> 
                            <p>${classDetails.classDscrptn}</p><!-- 클래스 설명 -->
                            
                            <!-- <p>장소 : ${classDetails.location}</p> -->
                            <!-- 
                            <div class="product__details__option">
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
                                </div>
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
                            </div>
                            
                             -->
                            <div class="product__details__cart__option">
                              
	                        	
	                        	<!-- 클래스 종료일과 현재 날짜 비교 -->
								<c:choose>
								<%-- 클래스 종료일이 오늘 이후이고, 로그인 상태인 경우 --%>
    								<c:when test="${classEndDate.compareTo(currentDate) >= 0 && isLoggedIn}">
								        <a href="/reservationUsrForm.do?classId=${classDetails.classId}" class="primary-btn">회원 예약하기</a>
								    </c:when>
								    <%-- 클래스 종료일이 오늘 이후이고, 비로그인 상태인 경우 --%>
    								<c:when test="${classEndDate.compareTo(currentDate) >= 0 && !isLoggedIn}">
								        <a href="/setUrlLoginForm.do?classId=${classDetails.classId}&returnUrl=${pageContext.request.requestURL}" class="primary-btn" onclick="return confirmReservation()">회원 예약하기</a>
								        <a href="/reservationNonUsrForm.do?classId=${classDetails.classId}" class="primary-btn">비회원 예약하기</a>
								    </c:when>
								    
								    <%-- 클래스 종료일이 오늘 이전인 경우 안됨(클래스 등록시에 오늘날짜 이후로만 등록하게 막아야할듯)--%>
								    <c:otherwise>
								        <span>클래스 수강 기간이 종료되었습니다.</span>
								    </c:otherwise>
								</c:choose>
								
							   
                            </div>
                            
                            
                            <div class="product__details__last__option">
                                
                                <!-- 
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="/images/img/shop-details/details-payment.png" alt="">
                                 -->
                                <ul>
                                	<li><span>장소 : </span>${classDetails.location}</li>
                                    <li><span>소요시간 : </span>약 ${classDetails.classTimeTaken}시간</li>
                                    <li><span>최대 예약가능 인원 수 : </span>${classDetails.classMaxCnt}명</li>
                                    <li><span>최소 수강가능 연령 : </span>만 ${classDetails.classAgeMin}세</li> <!-- 최소 수강가능 연령 -->
                                </ul>
                            </div>
                            
                            
                            <!-- 달력추가 -->
							<!-- <div id='calendar'></div> -->
                            
                        </div>
                        
                        
                        
                        <!-- 클래스 목록  -->
                        
                        <div class="checkout__input" style="text-align: center;">
                        
                        <div class="jy_margin_1" style="height:80px"></div>
		
							<a href="/classAllList/all" id="classListBtn"  style="background:#7c7c7c;" class="primary-btn listBtn">목록</a>
							
						</div>
                    </div>
                </div>
                
                
                
                
                <div class="row">
                    <div class="col-lg-12">
                    	</br>
                    	</br>
                    	</br>
                    </div>
        		</div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->


	
	
    <!-- Related Section Begin -->
    <!-- 
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg='/images/classes/img_class_cookie2.jpg'>
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="/images/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="/images/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="/images/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="/images/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="/images/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="/images/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$67.24</h5>
                            <div class="product__color__select">
                                <label for="pc-4">
                                    <input type="radio" id="pc-4">
                                </label>
                                <label class="active black" for="pc-5">
                                    <input type="radio" id="pc-5">
                                </label>
                                <label class="grey" for="pc-6">
                                    <input type="radio" id="pc-6">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="/images/img/product/product-3.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="/images/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="/images/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="/images/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Multi-pocket Chest Bag</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$43.48</h5>
                            <div class="product__color__select">
                                <label for="pc-7">
                                    <input type="radio" id="pc-7">
                                </label>
                                <label class="active black" for="pc-8">
                                    <input type="radio" id="pc-8">
                                </label>
                                <label class="grey" for="pc-9">
                                    <input type="radio" id="pc-9">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="/images/img/product/product-4.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="/images/img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="/images/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="/images/img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Diagonal Textured Cap</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>$60.9</h5>
                            <div class="product__color__select">
                                <label for="pc-10">
                                    <input type="radio" id="pc-10">
                                </label>
                                <label class="active black" for="pc-11">
                                    <input type="radio" id="pc-11">
                                </label>
                                <label class="grey" for="pc-12">
                                    <input type="radio" id="pc-12">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Related Section End -->
    
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

	<script>
	//페이지 로드가 완료되면
	if (window.addEventListener)
			window.addEventListener("load", userData, false);
	else if (window.attachEvent)
			window.attachEvent("onload", userData);
	else
			window.onload = userData;
	function userData() {
	
		/*
		document.addEventListener('DOMContentLoaded', function() {
			  var calendarEl = document.getElementById('calendar');
			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    initialView: 'dayGridMonth',
			    events: function(fetchInfo, successCallback, failureCallback) {
			      // AJAX 호출로 예약 가능한 날짜와 정보를 불러옵니다.
			      $.ajax({
			        url: '/class/getAvailableDates',
			        type: 'GET',
			        data: {
			          start: fetchInfo.startStr,
			          end: fetchInfo.endStr
			        },
			        success: function(response) {
			          // FullCalendar에서 필요한 형식으로 변환하여 콜백함수에 전달
			          var events = response.map(function(item) {
			            return {
			              title: item.status === '가능' ? '예약 가능' : '마감',
			              start: item.availableDate,
			              color: item.status === '마감' ? 'red' : 'green',
			              extendedProps: {
			                availableTime: item.availableTime
			              }
			            };
			          });
			          successCallback(events);
			        },
			        error: function() {
			          failureCallback();
			        }
			      });
			    },
			    eventClick: function(info) {
			      // 특정 일정을 클릭했을 때 예약 가능한 시간대를 표시하는 등 처리
			      alert('예약 가능한 시간: ' + info.event.extendedProps.availableTime);
			    }
			  });
			  calendar.render();
			});
		*/
		
		// 예시 코드 
		/*
		var calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView : 'dayGridMonth',
		    events: [
		        {
		            title: '일정명입니다.',
		            start: '2024-06-19T09:00:00',
		            end: '2024-06-19T12:50:00',
		            startStr: 'Start 텍스트',	// 일정 bar에 출력이 되지는 않음
		            endStr: 'End 텍스트',		// 일정 bar에 출력이 되지는 않음
		            classNames:['custom-className1','custom-className2'],
		            editable: false,
		            display: 'block',	// 직사각형 bar가 나타난다.
		            overlap: false,
		            backgroundColor: 'red',
		            borderColor: 'blue',
		            textColor: 'white'
		        }
		    ]
		});*/
		
	}
	</script>
	
	
	<!-- 자영 달력 추가 -->
	<!-- 참고용 : 공식문서 https://fullcalendar.io/docs/initialize-globals -->
	<script>
	/**/
	
	// 예약하기 버튼 클릭 시 
	function confirmReservation() {
        // Display alert and proceed if user clicks "OK"
        return alert('로그인 후 예약하실 수 있습니다.');
    }
	  document.addEventListener('DOMContentLoaded', function() {
          var calendarEl = document.getElementById('calendar');
          var calendar = new FullCalendar.Calendar(calendarEl, {
              initialView: 'dayGridMonth',
              events: '/getEvents.do',  // 스프링 컨트롤러에서 이벤트를 불러오는 URL 매핑
              locale: 'ko', // 한국어 설정
              headerToolbar: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'dayGridMonth'
              },
           	// 날짜 클릭 이벤트 추가
              dateClick: function(info) {
                  alert('선택된 날짜: ' + info.dateStr); // 여기서 날짜 클릭 시 수행할 동작을 추가할 수 있습니다.
              },
              eventClick: function(info) {
                  alert('이벤트: ' + info.event.title);
                  // 여기서 예약 가능한 시간 등을 추가로 표시할 수 있음
              }
          });
          calendar.render();
      });
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

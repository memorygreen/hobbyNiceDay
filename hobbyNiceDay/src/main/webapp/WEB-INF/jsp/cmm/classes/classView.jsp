<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
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
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src='/images/classes/img_class_cookie2.jpg' alt="대표 이미지">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src='/images/classes/img_class_cookie3.jpg' alt="대표이미지 2">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/images/img/shop-details/product-big3333.png" alt="">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/images/img/shop-details/product-big-444444.png" alt="">
                                    <a href="https://www.youtube.com/watch?v=8PJ3_p7VqHw&list=RD8PJ3_p7VqHw&start_radio=1" class="video-popup"><i class="fa fa-play"></i></a>
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
                            <h4>쿠키 만들기 클래스</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3>39,000<span>\89,000</span></h3>
                            <p>달콤한 쿠키를 직접만들 수 있는 클래스 입니다. 재료와 도구 모두 구비되어 있으며 재료비도 포함되어있습니다. </p>
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
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                         <input type="text" value="1">
                                    </div>
                                </div>
                                <a href="#" class="primary-btn">예약하기</a>
                                <a href="#" class="primary-btn">비회원 예약하기</a>
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#"><i class="fa fa-heart"></i> add to wishlist</a>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div>
                            <div class="product__details__last__option">
                                
                                <!-- 
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="/images/img/shop-details/details-payment.png" alt="">
                                 -->
                                <ul>
                                    <li><span>소요시간 : </span>2시간</li>
                                    <li><span>최대 예약가능 인원 수 : </span>4명</li>
                                    <li><span>최소 수강가능 연령 : </span>만 7세</li>
                                </ul>
                            </div>
                            
                            
                            <!-- 달력추가 -->
							<div id='calendar'></div>
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                    Previews(5)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Additional
                                    information</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">123</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>123</p>
                                            <p>123</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>123</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>123</p>
                                            <p>123</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>123</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">123</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>123</p>
                                            <p>123</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>123</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->


	
	
    <!-- Related Section Begin -->
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
    </section>
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
	var userIdCk = false;
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
	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth',
	      events: '/getEvents.do'  // 스프링 컨트롤러에서 이벤트를 불러오는 URL 매핑
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

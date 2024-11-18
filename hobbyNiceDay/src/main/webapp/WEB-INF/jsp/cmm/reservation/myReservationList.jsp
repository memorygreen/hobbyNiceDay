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


<script type="text/javascript">
	
</script>

<style>

/*약관동의*/
.terms_wrap {
	height: 230px;
	overflow: auto;
	border: 1px solid #eaebed;
	padding: 30px 15px;
	margin-bottom: 15px;
}

.terms_wrap h5 {
	font-size: 18px;
}

.terms_wrap h6 {
	font-size: 16px;
	line-height: 1.3;
}
/*약관동의 체크박스*/
.terms_agree {
	text-align: center;
	padding: 20px 10px;
	margin-top: 20px;
	border-top: 1px solid #eaebed;
	border-bottom: 1px solid #eaebed;
	background: #f1f7ff;
}

.terms_agree .title {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	margin-top: -6px;
	font-weight: 400;
	font-size: 15px;
	line-height: 1.3;
}

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

</style>

</head>

<body>

	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
	
	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<!-- <c:out value="${userVO.userId}"></c:out> -->
	
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

	<!-- Checkout Section Begin -->
	
	<!-- Checkout Section End -->

	 <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-6 col-md-6">
					<div class="contact__text">
						<div class="jy_page_title">
							<!--section-title  -->
							<span id="spanReservaionListTitle">Reservation List</span>
							<h2>예약관리</h2>
							<p>예약을 조회하고 관리하는 페이지입니다.</p>
						</div>
					</div>
					<div class="jy_margin_1" style="height:50px"></div>
				</div>
				
            	<!-- 
            	<div class="col-lg-3">
                    <div class="cart__discount">
                        <h6>Discount codes</h6>
                        <form action="#">
                            <input type="text" placeholder="Coupon code">
                            <button type="submit">Apply</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>$ 169.50</span></li>
                            <li>Total <span>$ 169.50</span></li>
                        </ul>
                        <a href="#" class="primary-btn">Proceed to checkout</a>
                    </div>
                </div>
                 -->
                <div class="col-lg-12">
                
				
				
				
                <div class="shopping__cart__table ">
                        <table class="filteringList " >
                            <thead>
                                
                                
                                <!--
                                <tr>
                                
                                
                                	<th>
                                		<p></p>
                                	</th>
                                	<th></th>
                                	<th></th>
                                	<th>
						                <!-- 예약 상태 필터링 
						                <label for="reservationStatusFilter">예약 상태</label>
					                </th>
					                <th>
										<select id="reservationStatusFilter">
										    <option value="all">전체</option>
										    <option value="stay">예약대기</option>
										    <option value="approved">접수완료</option>
										    <option value="cancel">예약취소</option>
										    <option value="reject">접수취소</option>
										    <option value="done">수강완료</option>
										</select>
										
					                </th>
					                
						               <!-- 정렬 기준 필터링 -->
										<!--  
					                <th>
										<label for="sortOrder">정렬기준</label>
									</th>
									<th>
										<select id="sortOrder">
										    <option value="reservationDtDesc">예약일시 내림차순</option>
										    <option value="reservationDtAsc">예약일시 오름차순</option>
										    <option value="classNmAsc">클래스명 내림차순</option>
										    <option value="classNmDesc">클래스명 오름차순</option>
										    
										</select>
									</th>
										
									
									<th>
										<!-- 필터 적용 버튼 
										<button id="applyFilters" class="btn waves-effect waves-light btn-success ">필터 적용</button>
										<!-- <a href="/myReservationCancel.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) 
                    						+ '"  class="btn waves-effect waves-light btn-success ">필터 적용</a>
                    						 
									</th>
									
                
                                </tr>-->
                            </thead>
                            
                            <tbody>
                            	<!-- 예약 목록 데이터가 이곳에 삽입 -->
                            </tbody>
                        </table>
                    </div>
                
                
                
                
                
                
                
                
                
                
                    <div class="shopping__cart__table ">
                        <table class="reservationList "  id="reservationTable">
                            <thead>
                                <tr>
                                	<th>순번</th>
                                    <!-- <th>예약번호</th> -->
                                    <th>예약자명</th>
                                    
                                    <th>클래스명</th>
                                    <th>예약일시</th>
                                    <th>예약시간대</th>
                                    <th>예약인원수</th>
                                    <th>예약상태</th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            	<!-- 예약 목록 데이터가 이곳에 삽입 -->
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="product__details__text">
                    	<!-- 페이지 네비게이션 영역 -->
                    	<div class="product__details__option">
						    <!-- <div class="pagination" class="product__details__option__size"  id="pagination">
						        
						    </div>
						        <!-- JavaScript로 생성될 페이지 네비게이션 버튼 -->
				        </div>
				        
				    </div>
                    
					
					
				
                </div>
                
            </div><!-- row 끝 -->
            
            
            
             <div class="row">
                        <a href="/" id="listBtn" class="primary-btn listBtn">메인화면</a>
                        
                        <div class="col-lg-12">
                            <div class="product__pagination"  id="pagination">
                                <!-- 
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                                 -->
                            </div>
                        </div>
                        
                        
                        
                    </div>
            
            
        </div>
    </section>
    <!-- Shopping Cart Section End -->

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

	<!-- Categories Section Begin -->
	<!-- Categories Section End -->

	<!-- Instagram Section Begin -->
	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->
	<!-- Latest Blog Section End -->

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

	
	
	<script type="text/javascript">
	
	
  //페이지 로드가 완료되면
    if (window.addEventListener) window.addEventListener("load", reservationList, false);
	else if (window.attachEvent) window.attachEvent("onload", reservationList);
	else window.onload = reservationList;
	function reservationList() {
		
		console.log("로드 확인용 ")
		
		// 초기 기본값: reservationDtDesc으로 내림차순 정렬
	    const defaultSortOrder = 'reservationDtDesc';
	    const defaultReservationStatus = 'all';

		// 필터링 값 넘기기 
		const reservationStatus = $('#reservationStatusFilter').val();
        const sortOrder = $('#sortOrder').val();

        
        
        // 첫 번째 페이지에 기본 정렬로 로드
        // 페이지 로드 시 기본 데이터를 가져옵니다.
  		loadReservationList(1, defaultReservationStatus, defaultSortOrder);


   	    // 필터링 버튼 클릭 시 선택한 값에 따라 데이터를 필터링
   	    $('#applyFilters').click(function() {
   	    	
   	        const selectedStatus = $('#reservationStatusFilter').val();
   	        const selectedSortOrder = $('#sortOrder').val();
   	        loadReservationList(1, selectedStatus, selectedSortOrder); // 필터링 조건 적용
   	    });
     
	} 

  
  /***********************************/
 	// 예약 목록을 가져오는 함수
	// 페이지 로드 시 첫 번째 페이지의 데이터를 불러옴
	function loadReservationList(page, reservationStatus, sortOrder) {
	    console.log("2. 데이터 로드 - 예약 상태:", reservationStatus, ", 정렬:", sortOrder); // 디버깅 로그
	    
	    var pageSize=10; // 한 페이지당 보여줄 데이터 개수
	    

	    // 상태에 따른 URL 설정
	    let url;
	    if (reservationStatus === 'stay') {
	        url = '/myReservationStayList.do';
	    } else {
	        url = '/getMyReservationList.do';
	    }

	    

	    // url에 따른 AJAX 요청
	    $.post(url, { page: page
	    			, reservationStatus: reservationStatus
	    			, pageSize: pageSize}, function(data) {
	    				
	        if (data.error === 'N') {
	        	// 해당페이지의 데이터 가져오기 함수 호출
	            renderReservationList(data.dataMap.dataMap, data.dataMap.statusMap, page, pageSize);
	        	
	        	// 페이지네이션 생성 함수 호출
	            createPagination(data.dataMap.totalPages, page);
	        	
	        } else {
	            alert(data.errorMsg);
	        }
	    });
	    
	    
	    // jQuery를 사용하여 테이블 헤더로 스크롤
	    $('html, body').animate({
	        scrollTop: $('#spanReservaionListTitle').offset().top
	    }, 500); // 500ms 동안 부드럽게 스크롤
	}
	
  
  
  
  	/******************************/

	  //예약 목록 렌더링 함수
	  function renderReservationList(listData, statusMap, page, pageSize) {
		var html = '';
	  
		
		// 예약 목록을 테이블에 렌더링
	 	$.each(listData, function(index, values) {
	  	
	  	// 순번 계산: 
	      var sequence = (page - 1) * pageSize + index + 1; // (현재 페이지 - 1) * 페이지 크기 + index + 1
		console.log("values.reservationType", values.reservationType)

	      html+= '<tr>';
	      html+= '    <td>' + sequence + '</td>'; // 계산된 순번을 사용
	      html+= '    <td><a href="usrReservationDetail.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '"style="text-decoration: underline;">' + $.trim(values.reservationNm) + '</a></td>'; // 예약자명
	      // html+= '    <td>' + $.trim(values.reservationNm) + '</td>'; // 예약자명
	      // html+= '    <td>' + $.trim(values.classNm) + '(' + $.trim(values.classId) + ')</td>'; // 클래스명
	      html+= '    <td>' + $.trim(values.classNm) +'</td>'; // 클래스명
	      
	      html+= '    <td>' + $.trim(values.reservationDt) + '</td>'; // 예약일자
	      html+= '    <td>' + $.trim(values.timeStart) + '-' + $.trim(values.timeEnd) + '</td>'; // 예약시간대 
	      html+= '    <td>' + $.trim(values.reservationCnt) + '명</td>'; // 예약인원수
	      //html+= '    <td>' + $.trim(values.userId) + '</td>'; // 사용자 ID (비회원인 경우 null)
	      //html+= '    <td>' + $.trim(values.reservationPhone) + '</td>'; // 예약자 연락처
	      //html+= '    <td>' + $.trim(values.reservationEmail) + '</td>'; // 예약자 이메일	            
	   
	      // 예약상태를 statusMap을 이용하여 한글로 변환
	      var statusKorean = statusMap[values.reservationStatus] || values.reservationStatus; // 한글 변환된 상태가 없을 경우, 기본값 사용
	      html += '    <td>' + $.trim(statusKorean) + '</td>';
		  
	      
	      // reservationType이 누락된 경우 기본 값 설정
	        var reservationType = values.reservationType ? $.trim(values.reservationType) : 'user';

	        
		  if (values.reservationStatus === 'stay') {
	      	// 예약취소 버튼
	        
	        
			  html += '<td><a href="/myReservationCancel.do?reservationId=' + encodeURIComponent($.trim(values.reservationId))
	              + '&reservationType=' + encodeURIComponent(reservationType)
	              + '" class="btn waves-effect waves-light btn-danger">예약취소</a></td>';
      
	      }if (values.reservationStatus === 'done') {
		      	// 수료증발급 버튼
		      	
		        //html += '    <td><a href="/myReservationDone.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '"  class="btn waves-effect waves-light btn-success ">수료증발급</a></td>';

  				html += '    <td><a href="#" onclick="openPop()"  target="_blank" class="btn waves-effect waves-light btn-success ">수료증발급</button></td>';
  				
  					
  				
  				
  						
		      }  
		  else if (values.reservationStatus === 'approved') { // 접수완료
	      	html += '' // 나중에 확인 필요                     
	      } else if (values.reservationStatus === 'reject') { // 접수취소
	          // 접수취소 버튼 
	      	html += '' // 나중에 확인 필요
	      }else{ // 예약 취소 cancle
	      	html += '' 
	      }

	      html+= '</tr>';
	  });
	  
	 // 테이블 업데이트
	  // 기존 데이터 초기화 후 새로운 데이터를 삽입
	   $('.reservationList tbody').html(html);
	  
	  }
	  

	  function openPop(){
		  var popup = window.open('/myReservationDone.do' , '수료증발급', 'width=700px,height=1000px, scrollbars=yes')
		  
		  // var popup = window.open('/myReservationDone.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)))
		  // var popup = window.open('http://www.naver.com'  , '네이버팝업', 'width=700px,height=800px, scrollbars=yes');
		  }
	  
	  
	/*****************/
	  
  	// 페이지네이션 생성 함수
  	function createPagination(totalPages, currentPage) {
  	let paginationHtml = '';
	
    
		 // 페이지 번호 생성
	    for (let i = 1; i <= totalPages; i++) {
	        // 현재 페이지에 active 클래스 추가
	        if (i === currentPage) {
	        	console.log(i + "번 만들기(현재 선택된 번호)")
	            paginationHtml += '<a href="javascript:loadReservationList(' + i + ')" class="active">' + i + '</a> ';
	        } else {

	        	console.log(i + "번 만들기")
	            paginationHtml += '<a href="javascript:loadReservationList(' + i + ')">' + i + '</a> ';
	        }
	    }
	
	    $('#pagination').html(paginationHtml);
	
	    
		 // 페이지 번호 클릭 시 'active' 클래스 업데이트
	    $('#pagination a').off('click').on('click', function () {
	        const selectedPage = parseInt($(this).data('page'));
	        loadReservationList(selectedPage);
	        
	        // 'active' 클래스 업데이트
	        $('#pagination a').removeClass('active');
	        $(this).addClass('active');
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

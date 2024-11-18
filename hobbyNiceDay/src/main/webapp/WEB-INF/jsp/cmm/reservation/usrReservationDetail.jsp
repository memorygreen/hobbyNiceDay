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

<style>



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




/*input 태그 포커스 */
.checkout__input input:focus {
    border-color: #000; /* 테두리를 검정색으로 변경 */
    outline: none; /* 기본 파란색 외곽선 제거 */

}

.checkout__input input{
   color : #606060;/*input 태그 긆자 색*/
}

</style>

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

	<!-- Hero Section Begin -->
	<!-- Hero Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
	<div class="container">
	
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="jy_page_title">
						<!--section-title  -->
						<span>RESERVATION INFO</span>
						<h2>예약정보 </h2>
						<!--  <p>회원정보를 입력해주세요</p>-->
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="jy_margin_1" style="height:70px"></div>
		
		<div class="checkout__form">

			<form id="searchForm" name="searchForm" method="post" >
				<input type="hidden" id="userSe" name="userSe" value="user"><!-- 사용자 구분(일반사용자) -->
				<input type="hidden" id="reservationType" name="reservationType" value="${reservationDetails.reservationType}" ><!-- 사용자 구분(일반사용자) -->
				
				
				<!-- 회원가입 폼 시작 -->
				<div class="row">
					<div class="col-lg-12 loginFormColClass" style="padding-right:300px;padding-left:300px;" >
					 <h6 class="checkout__title">예약정보</h6>
					
						<table style="width: 100%; " class="reservaionInfoTable" class="reservaionInfoTable"> <!-- border: 1px solid #000; border-collapse: collapse; -->
						
							<tr>
								<td>
									<div class="checkout__input">
										<p>클래스명<span>*</span></p>
										<input type="text" id="classNm" name="classNm" required 
										 readonly value="${reservationDetails.classNm}" />
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약일자<span>*</span></p>
										

										<input type="date" id="reservationDt" name="reservationDt" required 
										readonly value="${formattedReservationDt}" /> 
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약시간<span>*</span></p>
										<input type="text" id="reservationDt" name="reservationDt" required 
										readonly value="${reservationDetails.timeStart} - ${reservationDetails.timeEnd}"/> 
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약 인원수<span>*</span></p>
										<input type="int" id="reservationCnt" name="reservationCnt" required 
										readonly value="${reservationDetails.reservationCnt}" /> 
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약자명<span>*</span></p>
										<input type="text" id="reservationNm" name="reservationNm" required 
										readonly placeholder="예약자명을 입력해주세요" value="${reservationDetails.reservationNm}"/> 
										
									</div>
								</td>
							</tr>
							
							
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약자 연락처<span>*</span></p>
										<input type="text" id="reservationPhone" name="reservationPhone" required  
										readonly  value="${reservationDetails.reservationPhone}" />
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약자 이메일<span>*</span></p>
										<input type="text" id="reservationEmail" name="reservationEmail" required 
										 readonly value="${reservationDetails.reservationEmail}" />
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약상태<span>*</span></p>
										<input type="text" id="reservationStatus" name="reservationStatus" required 
										 readonly value="${reservationDetails.reservationStatus}" />
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약 비고사항</p>
										<input type="text" id="reservationEtc" name="reservationEtc" required  
										 readonly value="${reservationDetails.reservationEtc}" />
									</div>
								</td>
							</tr>
							
							
							<tr>
								<td style="text-align: right;">
									<div class="checkout__input">
										 <!-- 예약 대기 상태일 때만 예약 취소 버튼 표시 -->
            							 <c:if test="${reservationDetails.reservationStatus == '예약대기'}">
											 <a href="/myReservationCancel.do?reservationId=${reservationDetails.reservationId}&reservationType=${reservationDetails.reservationType}" 
											 class="btn waves-effect waves-light btn-danger ">예약취소</a>
									     </c:if>
									     
									     
									     <c:if test="${reservationDetails.reservationStatus == '수강완료'}">	 
											 <a a href="#" onclick="openPop()"  
											 class="btn waves-effect waves-light btn-success">수료증발급</a>
										 </c:if>
										 
										 
									</div>
								</td>
							</tr>
							<!-- 
							
							<tr>
								<td >
									<a href="#" class="primary-btn searchBtn" style="padding: 14px 30px; width: 100%; text-align: center; ">검색</a>
									
								</td>
							</tr>
							 -->
							
							
							
							
							<tbody>
                            	<!-- 예약 상태에 따른 버튼 활성화 -->
                            </tbody>
                            
						</table>
						
					</div>
					
					
					
					<div class="col-lg-12">
						<div class="checkout__input" style="text-align: center;">
							<a href="/" id="listBtn" class="primary-btn listBtn" >메인화면</a>
							
						</div>
					</div>
				</div>
				
				</div>


		</div>
		<!-- checkout Form 끝 -->

		</form>
		
   		
		<!-- 로그인 폼 끝-->


	</div>
	</section>
	<!-- Checkout Section End -->

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
		
		
		
		
	};// 전체 불러오기 끝
		
	function openPop(){
		  var popup = window.open('/myReservationDone.do' , '수료증발급', 'width=700px,height=1000px, scrollbars=yes')
		  
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

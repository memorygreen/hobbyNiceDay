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
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

	<!-- 템플릿 -->
	<!-- Css Styles -->
	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/elegant-icons.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/nice-select.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/slicknav.min.css' />" type="text/css">
	<link rel="stylesheet" href="<c:url value='/css/style.css' />" type="text/css">

	
	
<script type="text/javascript">

</script>
</head>

<body>
	<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
	
	<!--  일반 회원 관리자 페이지 접속 시 에러메시지  -->
	<c:if test="${not empty errorMsg}">
	   <script>
	       alert("${errorMsg}"); // 에러 메시지를 alert로 표시
	   </script>
	</c:if>
	
	
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
	<section class="hero">
	<div class="hero__slider owl-carousel">
	
	<!-- 
		<div class="hero__items set-bg">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-7 col-md-8">
						<div class="hero__text">
							<h6>HOT</h6>
							<h2>가죽지갑 만들기</h2>
							<p>내손길이 닿아 더욱 소중한 나만의 가죽지갑 만들기</p>
							<a href="/classView.do" class="primary-btn">예약하기</span></a>
							
						</div>
					</div>
					<div class="col-xl-7 col-lg-5 col-md-4">
						<img src="<c:url value='/images/classes/img_class_leader.jpg' />" alt="Class Leader Image" style="width: 100%; height: 100%; object-fit: cover;">
					</div>
				</div>
			</div>
		</div> 
	-->
		
		
		<c:forEach var="classObj" items="${classList}">	
			<div class="hero__items set-bg" >
				<div class="container">
					<div class="row">
						<div class="col-xl-5 col-lg-7 col-md-8">
							<div class="hero__text">
								<h6>HOT</h6>
								<h2>${classObj.classNm}</h2>
								<p>${classObj.classDscrptn}</p>
								<!-- <a href="/classView.do" class="primary-btn">예약하기</a> -->
		                        <a href="/classView.do?classId=${classObj.classId}" class="primary-btn">예약하기</span></a> <!-- /classView.do -->
								
								<!-- <div class="hero__social">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a>
								</div> -->
							</div>
						</div>
						<div class="col-xl-7 col-lg-5 col-md-4">
							<!-- <img src="<c:url value='/images/classes/img_class_cookie2.jpg' />" alt="Class Leader Image" style="width: 100%; height: 100%; object-fit: cover;"> -->
							<img src="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${classObj.imgNm}" />" alt="Class Leader Image" style="width: 100%; height: 100%; object-fit: cover;">
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</section>
	<!-- Hero Section End -->
	
	
	<!-- Latest Blog Section Begin -->
	<section class="latest spad">
	<div class="container">
		
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<span>One Day Class</span>
					<h2>모집중인 클래스</h2>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<!--  반복되는 코드로  -->
			<c:forEach var="classObj" items="${classList}">
	            <div class="col-lg-4 col-md-6 col-sm-6">
	                <div class="blog__item">
	                
	                    
	                    <div class="blog__item__pic set-bg" 
	                    	 data-setbg="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${classObj.imgNm}" />" 
	                    	 alt="${classObj.imgNm}"></div> 
	                
	                   		<!-- 결국 이 2개가 같아야함 -->
	                   		<!-- 
	                   		<img src="<c:url value='/resources/uploadImg/${image.imgNm}' />" alt="${image.imgNm}" >
	                   		-->
	                   		<!-- ㄴ> 이건 앞에 /를 안써서 안 된거였음 -->
	                   		
	                   		
	                   		<!-- 
	                   		<img src="<c:url value='/resources/uploadImg/864821d2-ddbb-4638-b189-11f6fa25c350_gosim1.png' />" alt=""> 
	                   		-->
	                   		<!-- ㄴ>얘도 아래랑 같다! -->

							<!-- 	                   		 
	                   		<img src="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${image.imgNm}" />" alt="${image.imgNm}" > 
	                   		-->
	                   		
	                   		<!-- ㄴ> 최종 이게 찐으로 되는거!!!!! -->
	                 	
	                    <div class="blog__item__text">
	                        <span>
	                            <img src="<c:url value='/images/img/icon/calendar.png' />" alt=""> 
	                            ${classObj.startDt} - ${classObj.endDt}
	                        </span>
	                        <h5>${classObj.classNm}</h5>
	                        <a href="/classView.do?classId=${classObj.classId}">지금바로 예약하기</a> <!-- /classView.do -->
	                    </div>
	                </div>
	            </div>
            </c:forEach>
            
			<div class="col-lg-10">
			</div>
			
			<div class="col-lg-2">
				<div class="product__details__text">
					<div class="product__details__btns__option">
						<a href="classAllList/all">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
							  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
							</svg> 더보기
						</a>
			        </div>
				</div>
			</div>
			
			
		</div>
	</div>
	</section>
	<!-- Latest Blog Section End -->
	
	
	<!-- Banner Section Begin -->
	<section class="banner spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 offset-lg-4">
				<div class="banner__item">
					<div class="banner__item__pic">
						 
						 <img src="<c:url value='/images/img/banner/main_ceramic.png' />" alt="">
						 
					</div>
					<div class="banner__item__text">
						<h2>공예</h2>
						<a href="/classAllList/crafts">둘러보기</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-5">
				<div class="banner__item banner__item--middle">
					<div class="banner__item__pic">
						
						 <img src="<c:url value='/images/img/banner/main_baking.png' />"  alt="">
						 
					</div>
					<div class="banner__item__text">
						<h2>요리&베이킹</h2>
						<a href="/classAllList/cooking_baking">둘러보기</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-7">
				<div class="banner__item banner__item--last">
					<div class="banner__item__pic">
						<img src="<c:url value='/images/img/banner/main_art.png' />" alt="">
					</div>
					<div class="banner__item__text">
						<h2>미술</h2>
						<a href="/classAllList/art">둘러보기</a>
					</div>
				</div>
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

	<!-- Js Plugins -->
	<jsp:include page="/WEB-INF/jsp/main/inc/commonJsPlugins.jsp" />
	
	
	<script type="text/javascript">
  //페이지 로드가 완료되면
    if (window.addEventListener) window.addEventListener("load", userList, false);
	else if (window.attachEvent) window.attachEvent("onload", userList);
	else window.onload = userList;
	function userList() {
		
		console.log("로드 확인용 ")
    
	} 
    

	</script>
	
	
	<!--공통 컴포넌트 불러오기-->
	
</body>
</html>

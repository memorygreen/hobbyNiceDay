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
	                    
	                 <!--<c:forEach var="image" items="${images}">-->
	                    
	                    
	                    
	                    <!-- 
	                    <div class="blog__item__pic"> 
	                    -->
	                   		
	                   		<!-- 결국 이 2개가 같아야함 -->
	                   		<!-- 
	                   		<img src="<c:url value='/resources/uploadImg/${image.imgNm}' />" alt="${image.imgNm}" >
	                   		-->
	                   		<!-- ㄴ> 미친 이건 앞에 /를 안써서 안 된거였음 -->
	                   		<!-- 
	                   		<img src="<c:url value='/resources/uploadImg/864821d2-ddbb-4638-b189-11f6fa25c350_gosim1.png' />" alt=""> 
	                   		-->
	                   		<!-- ㄴ>얘도 아래랑 같다! -->

							<!-- 	                   		 
	                   		<img src="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${image.imgNm}" />" alt="${image.imgNm}" > 
	                   		-->
	                   		
	                   		<!-- ㄴ> 최종 이게 찐으로 되는거!!!!! -->
	                   	<!-- 
	                   	</div>
	                     --> 
	                    
                      <!--</c:forEach>-->
	                   	
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
            
			<!-- 예시1 -->
			<!-- 
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic set-bg"
						data-setbg="<c:url value='/images/classes/img_class_cookie3.jpg' />"></div>
					<div class="blog__item__text">
						<span><img src="<c:url value='/images/img/icon/calendar.png' />"  alt=""> 16
							February 2020</span>
						<h5>바리스타 원데이 클래스</h5>
						<a href="/classView.do">지금바로 예약하기</a>
					</div>
				</div>
			</div> -->
			
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
						<a href="#">Shop now</a>
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
						<a href="#">Shop now</a>
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
						<a href="#">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Banner Section End -->

	<!-- Product Section Begin -->
	
	<!-- 쇼핑몰 리스트
	<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="filter__controls">
					<li class="active" data-filter="*">Best Sellers</li>
					<li data-filter=".new-arrivals">New Arrivals</li>
					<li data-filter=".hot-sales">Hot Sales</li>
				</ul>
			</div>
		</div>
		<div class="row product__filter">
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-1.jpg'/>">
						<span class="label">New</span>
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />" alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />" alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Piqué Biker Jacket</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$67.24</h5>
						<div class="product__color__select">
							<label for="pc-1"> <input type="radio" id="pc-1">
							</label> <label class="active black" for="pc-2"> <input
								type="radio" id="pc-2">
							</label> <label class="grey" for="pc-3"> <input type="radio"
								id="pc-3">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-2.jpg' />">
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />"  alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Piqué Biker Jacket</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$67.24</h5>
						<div class="product__color__select">
							<label for="pc-4"> <input type="radio" id="pc-4">
							</label> <label class="active black" for="pc-5"> <input
								type="radio" id="pc-5">
							</label> <label class="grey" for="pc-6"> <input type="radio"
								id="pc-6">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
				<div class="product__item sale">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-3.jpg' />">
						<span class="label">Sale</span>
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />" alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Multi-pocket Chest Bag</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$43.48</h5>
						<div class="product__color__select">
							<label for="pc-7"> <input type="radio" id="pc-7">
							</label> <label class="active black" for="pc-8"> <input
								type="radio" id="pc-8">
							</label> <label class="grey" for="pc-9"> <input type="radio"
								id="pc-9">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-4.jpg' />">
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />"  alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Diagonal Textured Cap</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$60.9</h5>
						<div class="product__color__select">
							<label for="pc-10"> <input type="radio" id="pc-10">
							</label> <label class="active black" for="pc-11"> <input
								type="radio" id="pc-11">
							</label> <label class="grey" for="pc-12"> <input type="radio"
								id="pc-12">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-5.jpg' />">
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />"  alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Lether Backpack</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$31.37</h5>
						<div class="product__color__select">
							<label for="pc-13"> <input type="radio" id="pc-13">
							</label> <label class="active black" for="pc-14"> <input
								type="radio" id="pc-14">
							</label> <label class="grey" for="pc-15"> <input type="radio"
								id="pc-15">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
				<div class="product__item sale">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-6.jpg' />">
						<span class="label">Sale</span>
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />"  alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Ankle Boots</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$98.49</h5>
						<div class="product__color__select">
							<label for="pc-16"> <input type="radio" id="pc-16">
							</label> <label class="active black" for="pc-17"> <input
								type="radio" id="pc-17">
							</label> <label class="grey" for="pc-18"> <input type="radio"
								id="pc-18">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-7.jpg' />">
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />"  alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />" alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>T-shirt Contrast Pocket</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$49.66</h5>
						<div class="product__color__select">
							<label for="pc-19"> <input type="radio" id="pc-19">
							</label> <label class="active black" for="pc-20"> <input
								type="radio" id="pc-20">
							</label> <label class="grey" for="pc-21"> <input type="radio"
								id="pc-21">
							</label>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="<c:url value='/images/img/product/product-8.jpg' />">
						<ul class="product__hover">
							<li><a href="#"><img src="<c:url value='/images/img/icon/heart.png' />"  alt=""></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/compare.png' />" alt="">
									<span>Compare</span></a></li>
							<li><a href="#"><img src="<c:url value='/images/img/icon/search.png' />"  alt=""></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>Basic Flowing Scarf</h6>
						<a href="#" class="add-cart">+ Add To Cart</a>
						<div class="rating">
							<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
								class="fa fa-star-o"></i>
						</div>
						<h5>$26.28</h5>
						<div class="product__color__select">
							<label for="pc-22"> <input type="radio" id="pc-22">
							</label> <label class="active black" for="pc-23"> <input
								type="radio" id="pc-23">
							</label> <label class="grey" for="pc-24"> <input type="radio"
								id="pc-24">
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section> -->
	<!-- Product Section End -->

	

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
		
		dataList()
		
		console.log("로드 확인용 ")
    
    
    	// 등록 버튼 클릭 시 회원 등록 페이지로 이동
        $("#btnRegister").click(function() {
            window.location.href = '<c:url value="/adminUserInsertForm.do" />';
        });
    	
   		// 수정 버튼 클릭 시 사용자 ID를 가져와서 페이지로 이동
        $("#btnUpdate").click(function() {
            var userId = $(this).closest("tr").find(".userId").text();
            console.log("userId : ", userId)
            if(userId){
            	 console.log("userId 존재")
            	window.location.href = '<c:url value="/adminUserInsertForm.do" />?userId=' + userId;
            }else{
            	console.log("userId 존재xxx")
            	window.location.href = '<c:url value="/adminUserInsertForm.do" />';
            }
        });        
     
	} 
    
  //리스트 데이터
  
  function dataList() {
	console.log("data List들어오는지 확인")
	
	/*
	$.post('/getAdminUserList.do', function(data) {  // 괄호 수정
		console.log("post 요청 들어오는지 확인")
	    if ($.trim(data.error) == 'N') {
	    	console.log("data : " , data);  // cosole -> console 오타 수정
	        var dataMap = data.dataMap.dataMap.dataMap;
	    	console.log("dataMap : " , dataMap);  // cosole -> console 오타 수정
	        
	    	// dataMap에서 dataMap 배열을 가져옴
			var listData = data.dataMap.dataMap;  // 이 부분이 핵심
			console.log("listData: ", listData);
			
	    	var html = '';
	        var positionNm = '';
	        
	        $.each(listData, function(key, values) {
	            html+= '<tr>';
	            //html+= '    <td>' + ((data.totalCnt - (data.page - 1 ) * data.recordCnt) - key) + '</td>';
	            html+= '    <td></td>';
	            html += '    <td><a href="#" style="text-decoration: underline;">' + $.trim(values.userId) + '</a></td>';
	            html+= '    <td>' + $.trim(values.userName) + '</td>';
	            html+= '    <td>' + $.trim(values.sex) + '</td>';
	            html+= '    <td>' + formatDate($.trim(values.brthdy)) + '</td>';
	            //html+= '    <td>' + $.trim(values.ageSe) + '</td>'; 
	            html+= '    <td>'+ calculateAge(formatDate($.trim(values.brthdy))) +'</td>';// 나이
	            html+= '    <td>' + $.trim(values.email) + '</td>';
	            html+= '    <td>' + $.trim(values.mbtlnum) + '</td>';
	            html+= '    <td>' + $.trim(values.userSe) + '</td>';
	            html+= '    <td>' + $.trim(values.loginCnt) + '</td>';
	            html+= '    <td>' + $.trim(values.lastLoginDt) + '</td>';
	            html+= '    <td>' + $.trim(values.loginErrCnt) + '</td>';
	            html+= '    <td>' + $.trim(values.loginRestricted) + '</td>';
	            html+= '    <td>' + $.trim(values.lastLoginDt) + '</td>';
	            html+= '    <td>' + $.trim(values.updtDt) + '</td>';
	        });
	        
	        //if (data.list.length == 0){ 
	        //    html+= '<tr><td colspan="9" class="nodata">데이터가 존재하지 않습니다.</td></tr>';
	        //}
	        
	        $('.userList tbody').append(html);
	        $('.totalCnt').text(numberWithCommas(data.totalCnt));
	        
	        // 페이징을 만든다
	        //paging('.paging', data.page, data.pageCnt, data.totalCnt);
	    }
	    
	    // $('.userList tbody').children('tr.loading').remove('');
	});
  */
  }

	</script>
	
	
	<!--공통 컴포넌트 불러오기-->
	
</body>
</html>

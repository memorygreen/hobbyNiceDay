<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header">

	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<c:set var="isUser" value="${not empty userVO and userVO.userSe == 'user'}" />
	

    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        </br>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                        
                        <c:choose>
	                        <c:when test="${isLoggedIn}">
	                            <!-- 로그인 상태일 때 -->
	                            <a style="color:white; font-family:'Nunito Sans', sans-serif;"><c:out value= "${userVO.userName}"/>님 환영합니다.</span>
	                            <a href="/logout.do">로그아웃</a> <!-- 로그아웃 링크 추가 -->
	                        </c:when>
                         	<c:otherwise>
                                <!-- 비로그인 상태일 때 -->
	                            <a href="<c:url value='/joinForm.do'/>">회원가입</a>
	                            
	                            <a href="<c:url value='/loginForm.do'/>">로그인</a>
	                            <!-- &returnUrl=${pageContext.request.requestURL}" -->
                            </c:otherwise>
                        </c:choose>
                        
                        
                        
                        
                        <a href="/adminReservationStat.do" target='_blank'  onclick="return checkAdminAccess();">관리자 페이지</a> <!-- userSe가 admin 이거나  -->
                        </div>
                        <!-- 
                        <div class="header__top__hover">
                            <span>관리자 <i class="arrow_carrot-down"></i></span>
                            <ul>
                                <li>USD</li>
                                <li>EUR</li>
                                <li>USD</li>
                            </ul>
                             
                        </div>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <!-- 
                     <a href="<c:url value='/cmm/main/mainPage.do'/>">
                     -->
                    
                    <a href="<c:url value='/'/>">
                    	<img src="<c:url value='/images/img/logo_hobby_nice_day.png' />" alt="">
                    </a>
                    
                    
                </div>
            </div>
            
            
        
            
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li>
                        <!-- 
                         <a href="<c:url value='/cmm/main/mainPage.do'/>">
                         -->
                         <a href="<c:url value='/'/>">
                         
                        Main</a>
                        </li>
                        <!-- <li class="active"><a href="./shop.html">Shop</a></li> -->
                        
                        
                        <li><a href="#">Class</a>
                        	<ul class="dropdown">
		                                <li><a href="/classAllList/all">클래스 목록</a></li>
		                                <!-- 
		                                <li><a href="/">클래스 신청하기</a></li>
		                                <li><a href="./shopping-cart.html">리뷰관리</a></li>
		                                <li><a href="./checkout.html">클래스수강이력</a></li> -->
		                                <!-- <li><a href="./blog-details.html">Blog Details</a></li> -->
		                            </ul>
                        </li>
                        
                        
                        <c:choose>
    						<c:when test="${isLoggedIn}">
		                        <li><a href="#">MyPage</a>
		                            <ul class="dropdown">
		                                <li><a href="/updateUsrForm.do">회원정보수정</a></li>
		                                <li><a href="/myReservationList.do">예약관리</a></li>
		                                <!-- <li><a href="./shopping-cart.html">리뷰관리</a></li>
		                                <li><a href="./checkout.html">클래스수강이력</a></li> -->
		                                <!-- <li><a href="./blog-details.html">Blog Details</a></li> -->
		                                
		                            </ul>
		                        </li>
                        	</c:when>
                        	
	                        <c:otherwise>
	                        	<li><a href="#">Reservation</a>
		                            <ul class="dropdown">
		                                <li><a href="/nonUsrReservationSearchForm.do">예약 확인</a></li>
		                                <!-- <li><a href="./shopping-cart.html">리뷰관리</a></li>
		                                <li><a href="./checkout.html">클래스수강이력</a></li> -->
		                                <!-- <li><a href="./blog-details.html">Blog Details</a></li> -->
		                            </ul>
		                        </li>
	                        </c:otherwise>
                        </c:choose>
                        
                        <!-- 
                        <li><a href="/imgTest.do">test img</a></li> -->
                        <!-- 
                        <li><a href="./contact.html">Contacts</a></li> -->
                    </ul>
                </nav>
            </div>
            <!-- 
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                    <a href="#"><img src="<c:url value='/images/img/icon/heart.png' />" alt=""></a>
                    <a href="#"><img src="<c:url value='/images/img/icon/cart.png' />" alt=""> <span>0</span></a>
                    <div class="price">$0.00</div>
                </div>
            </div> -->
        </div>
        <div class="canvas__open">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
		</svg>
        
        </div>
    </div>
    
    <script type="text/javascript">
	    function checkAdminAccess() {
	        
	        var isLoggedIn = "${isLoggedIn}"; // 로그인 여부 확인
	        var userSe = "${userVO.userSe}"; // 사용자 유형 (admin 또는 user)
	        
	     	// 로그인하지 않은 경우
	        if (isLoggedIn == "false") {
	            alert("로그인이 필요합니다.");
	            window.location.href = "/adminLogin.do";
	            return false;
	        }

	        // 로그인은 했으나 관리자가 아닌 경우
	        if (userSe !== "admin") {
	            alert("관리자 권한이 필요합니다.");
	            return false;
	        }

	        // 관리자일 경우 접근 허용
	        return true;
	        
	    }
	</script>

</header>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                            <a href="<c:url value='/joinForm.do'/>">SIGN IN</a>
                             
                            
                            <a href="<c:url value='/loginForm.do'/>">LOGIN</a>
                            <a href="/adminMain.do">ADMIN</a>
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
                    <a href="<c:url value='/cmm/main/mainPage.do'/>"><img src="<c:url value='/images/img/logo_hobby_nice_day.png' />" alt=""></a>
                    
                    
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="<c:url value='/cmm/main/mainPage.do'/>">Home</a></li>
                        <!-- <li class="active"><a href="./shop.html">Shop</a></li> -->
                        <li><a href="#">MyPage</a>
                            <ul class="dropdown">
                                <li><a href="./about.html">회원정보수정</a></li>
                                <li><a href="./shop-details.html">예약관리</a></li>
                                <li><a href="./shopping-cart.html">리뷰관리</a></li>
                                <li><a href="./checkout.html">클래스수강이력</a></li>
                                <!-- <li><a href="./blog-details.html">Blog Details</a></li> -->
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contacts</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                    <a href="#"><img src="<c:url value='/images/img/icon/heart.png' />" alt=""></a>
                    <a href="#"><img src="<c:url value='/images/img/icon/cart.png' />" alt=""> <span>0</span></a>
                    <div class="price">$0.00</div>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
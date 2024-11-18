<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<c:set var="isUser" value="${not empty userVO and userVO.userSe == 'user'}" />
	
	
<div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
            
            
            	<c:choose>
	                <c:when test="${isLoggedIn}">
	                    <!-- 로그인 상태일 때 -->
	                    <a font-family:'Nunito Sans', sans-serif;">
	                    <c:out value= "${userVO.userName}"/>님 환영합니다.</span>
	                    <a href="/logout.do">로그아웃</a> <!-- 로그아웃 링크 추가 -->
	                </c:when>
	                	<c:otherwise>
	                       <!-- 비로그인 상태일 때 -->
	                    <a href="<c:url value='/joinForm.do'/>">회원가입</a>
	                    
	                    <a href="<c:url value='/loginForm.do'/>">로그인</a>
	                    <!-- &returnUrl=${pageContext.request.requestURL}" -->
	                   </c:otherwise>
	               </c:choose>
	   
            
            </div>
            
            
            <%-- 
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
            --%>
        </div>
        
        <%--
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="/images/img/icon/search.png" alt=""></a>
            <a href="#"><img src="/images/img/icon/heart.png" alt=""></a>
            <a href="#"><img src="/images/img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
         --%>
        <div id="mobile-menu-wrap"></div>
        
    </div>
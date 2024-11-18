<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	


<nav class="navbar header-navbar pcoded-header" style="background-color:#f4f4f5;">
    <div class="navbar-wrapper">
        <div class="navbar-logo" >
            <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                <i class="ti-menu"></i>
            </a>
            <div class="mobile-search waves-effect waves-light">
                <div class="header-search">
                    <div class="main-search morphsearch-search">
                        <div class="input-group">
                            <span class="input-group-prepend search-close"><i class="ti-close input-group-text"></i></span>
                            <input type="text" class="form-control" placeholder="Enter Keyword">
                            <span class="input-group-append search-btn"><i class="ti-search input-group-text"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <!--  조건 타야함 -->
            <a href="/adminReservationStat.do">
              <img class="img-fluid" src="images/img/logo_hobby_nice_day.png" alt="Theme-Logo" />
                
            </a>
            <a class="mobile-options waves-effect waves-light">
                <i class="ti-more"></i>
            </a>
        </div>
        
        
        <div class="navbar-container container-fluid">
            <ul class="nav-left">
                <li>
                    <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                </li>
                <li>
                    <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                        <i class="ti-fullscreen"></i>
                    </a>
                </li>
            </ul>
            
            <ul class="nav-right">
            	<!-- 
                <li class="header-notification">
                    <a href="#!" class="waves-effect waves-light">
                        <i class="ti-bell"></i>
                        <span class="badge bg-c-red"></span>
                    </a>
                    <ul class="show-notification">
                        <li>
                            <h6>Notifications</h6>
                            <label class="label label-danger">New</label>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="images/admin/images/avatar-2.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">관리자</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="images/admin/images/avatar-4.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">Joseph William</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                        <li class="waves-effect waves-light">
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="images/admin/images/avatar-3.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">Sara Soudein</h5>
                                    <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                    <span class="notification-time">30 minutes ago</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                -->
                
           
                
                <li class="user-profile header-notification">
                    <a href="#!" class="waves-effect waves-light"  style="color:#365180;">
                        <img src="images/img/user_profile_blue2.png" class="img-radius" alt="User-Profile-Image">
                        <span><c:out value= "${userVO.userName}"/></span>
                        
                    </a>
                    <ul class="show-notification profile-notification">
                        <li class="waves-effect waves-light">
                            <!-- 
                             <a href="/cmm/main/mainPage.do">
                             -->
                             <a href="/">
                             
                                사용자 페이지 이동
                            </a>
                        </li>
                       
                     
                        <li class="waves-effect waves-light">
                        
                       	    <c:choose>
						    	<c:when test="${isLoggedIn}">
						    		<!-- 로그인 상태일 때 -->
						    		<a href="/logout.do">
		                                </i> 로그아웃
		                            </a>
					        	</c:when>
					          	<c:otherwise>
					                 <!-- 비로그인 상태일 때 -->
					                 <a href="/adminLogin.do">
		                                로그인
		                            </a>
					            </c:otherwise>
	                        </c:choose>
                
                        
                            
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
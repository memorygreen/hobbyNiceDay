<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<c:set var="isAdmin" value="${userVO.userSe == 'admin'}" />
	

<nav class="pcoded-navbar">
    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
    <div class="pcoded-inner-navbar main-menu">
        <div class="">
            <div class="main-menu-header" style="background-color:#20263b;">
                <c:choose>
	                <c:when  test="${isLoggedIn}">
		                <img class="img-80 img-radius" src="images/img/user_profile_blue2.png" alt="User-Profile-Image">
		                <div class="user-details">
		                    <span id="more-details" >
		                    <!-- 만약 세션에 이름이 있다면  이름 표출-->
		                     
		                    	<c:out value= "${userVO.userName}"/></span>
	               	</c:when >
	               	<c:otherwise>
                		<img class="img-80 img-radius" src="images/img/user_profile_blue2.png" alt="User-Profile-Image">
						<div class="user-details">
							</br>
					</c:otherwise> 
               	</c:choose>
                   	
                </div>
            </div>
            
        </div>
        
        
        
        <!--  사이드바 메뉴 목록 -->
        
        	
		<!-- 관리자만 메뉴가 보이도록 설정 -->
		<c:if test="${isAdmin}">	
        
        <!-- 
        <div class="pcoded-navigation-label" style="color:#365180;">Navigation</div>
        
        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="/adminMain.do" class="waves-effect waves-dark">
                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                    <span class="pcoded-mtext">대시보드</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
        </ul>
         -->
        
        
        <div class="pcoded-navigation-label" style="color:#365180;">Management</div>
        <ul class="pcoded-item pcoded-left-item">
            <li class=""> <!--íì±í í ë active-->
                <a href="/adminUserList.do" class="waves-effect waves-dark">
                    <span class="pcoded-micon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
					</svg>
                    <b>B</b></span>
                    <span class="pcoded-mtext">회원</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>

            

            <li class=""> <!-- active 넣으면 활성화됨 -->
                <a href="/adminClassList.do" class="waves-effect waves-dark">
                    <span class="pcoded-micon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-easel2" viewBox="0 0 16 16">
					  		<path fill-rule="evenodd" d="M8 0a.5.5 0 0 1 .447.276L8.81 1h4.69A1.5 1.5 0 0 1 15 2.5V11h.5a.5.5 0 0 1 0 1h-2.86l.845 3.379a.5.5 0 0 1-.97.242L12.11 14H3.89l-.405 1.621a.5.5 0 0 1-.97-.242L3.36 12H.5a.5.5 0 0 1 0-1H1V2.5A1.5 1.5 0 0 1 2.5 1h4.691l.362-.724A.5.5 0 0 1 8 0M2 11h12V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5zm9.61 1H4.39l-.25 1h7.72z"/>
					</svg><b>B</b></span>
                    <span class="pcoded-mtext">클래스</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            
	            <ul class="pcoded-item pcoded-left-item">
		            <li class="pcoded-hasmenu ">
		                <a href="javascript:void(0)" class="waves-effect waves-dark">
		                    <span class="pcoded-micon">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-check" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
								  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
							</svg>
		                    <b>A</b></span>
		                    <span class="pcoded-mtext">예약</span>
		                </a>
		                <ul class="pcoded-submenu">
		                	<li class="">
		                        <a href="/adminReservationStat.do" class="waves-effect waves-dark">
		                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		                            <span class="pcoded-mtext">예약현황</span>
		                            <span class="pcoded-mcaret"></span>
		                        </a>
		                    </li>
		                    <li class="">
		                        <a href="/adminReservationList.do" class="waves-effect waves-dark">
		                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		                            <span class="pcoded-mtext">예약목록</span>
		                            <span class="pcoded-mcaret"></span>
		                        </a>
		                    </li>
		                    
		                </ul>
		            </li>
		        </ul>
            

        </ul>
        </c:if>
        <!--  사이드바 메뉴 목록 종료 -->
       
        
    </div>
</nav>
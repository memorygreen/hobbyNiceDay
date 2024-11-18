<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- JSTL을 사용하여 세션에서 userId 확인 -->
    <c:set var="userVO" value="${sessionScope.userVO}" />
    <c:set var="isLoggedIn" value="${not empty userVO.userId}" />
	<c:set var="isUser" value="${not empty userVO and userVO.userSe == 'user'}" />
	

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="/">
                        <!-- 
                        <img src="<c:url value='/images/img/footer-logo.png' />" alt="">
                         -->
                        <img src="<c:url value='/images/img/logo_hobby_nice_day.png' />" alt="">
                        
                        </a>
                    </div>
                    
                    <!-- 
                     <p>The customer is at the heart of our unique business model, which includes design.</p>
                     -->
                     <!-- 
                    <a href="#">
                    	<img src="<c:url value='/images/img/payment.png' />" alt=""></a>
                      -->
                </div>
            </div>
            
            
            
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Class</h6>
                    <ul>
                        <li><a href="/classAllList/all">All Class List</a></li>
                        <!-- 
                         <li><a href="#">Trending Shoes</a></li>
                        <li><a href="#">Accessories</a></li>
                        <li><a href="#">Sale</a></li>
                         -->
                    </ul>
                </div>
            </div>
            
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>RESERVATION</h6>
                    
                     <c:choose>
	                        <c:when test="${isLoggedIn}">
	                            <!-- 로그인 상태일 때 -->
	                            
	                            <ul>
			                        <li><a href="/myReservationList.do">My Reservation List</a></li>
			                    </ul>
	                        </c:when>
                         	<c:otherwise>
                                <!-- 비로그인 상태일 때 -->
	                            <ul>
			                        <li><a href="/nonUsrReservationSearchForm.do">Reservation Seaerch</a></li>
			                    </ul>
                            </c:otherwise>
                        </c:choose>
                        
                        
                    
                </div>
            </div>
            
            <!-- 
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>NewLetter</h6>
                    <div class="footer__newslatter">
                        <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                        <form action="#">
                            <input type="text" placeholder="Your email">
                            <button type="submit"><span class="icon_mail_alt"></span></button>
                        </form>
                    </div>
                </div>
            </div>
             -->
        </div>
        
        <%--
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p>Copyright ©
                        <script>
                            document.write(new Date().getFullYear());
                        </script>2020
                        All rights reserved | This template is made with
						by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
         --%>
    </div>
</footer>
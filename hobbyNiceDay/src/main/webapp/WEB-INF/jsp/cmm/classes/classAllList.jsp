<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 여기부터 클래스 전체 리스트  -->
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>클래스 목록</h4>
	                            
	                        <div class="breadcrumb__links">
	                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->











    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                    
                    	<!-- 검색창 -->
                        <div class="shop__sidebar__search">
                        
                        <!-- 검색폼 시작 -->
                            <form action="/classAllList/${category}" method="get">
                                <input type="text" id="searchInput" name="searchInput"  value="${searchInput}" placeholder="클래스명을 입력하세요">
                                <button type="submit">
                                	<span >
                                		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
										</svg>
                                	
                                	</span>
                                
                                
                                
                                </button>
                            </form>
                            <!--  검색폼 종료 -->
                        </div>
                        
                        
                        <!-- 조회 조건 -->
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <!-- 
                                         <a data-toggle="collapse" data-target="#collapseOne">클래스 분류</a>
                                         -->
                                        <span><strong>클래스 분류</strong></span>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
												    <li>
													    <a href="/classAllList/all?page=1&pageSize=${pageSize}" 
													       style="${category == 'all' ? 'color:black; font-weight:bold;' : ''}">
													        전체
													    </a>
													</li>
													<li>
													    <a href="/classAllList/art?page=1&pageSize=${pageSize}" 
													       style="${category == 'art' ? 'color:black; font-weight:bold;' : ''}">
													        미술
													    </a>
													</li>
													<li>
													    <a href="/classAllList/crafts?page=1&pageSize=${pageSize}" 
													       style="${category == 'crafts' ? 'color:black; font-weight:bold;' : ''}">
													        공예
													    </a>
													</li>
													<li>
													    <a href="/classAllList/cooking_baking?page=1&pageSize=${pageSize}" 
													       style="${category == 'cooking_baking' ? 'color:black; font-weight:bold;' : ''}">
													        요리&베이킹
													    </a>
													</li>
											    </ul>
                                                    
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                        
                        
                        
                    </div>
                </div>
                
                
                <div class="col-lg-9">
                
                	<!-- 결과, 정렬기준 -->
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>검색결과 <strong> ${totalClassCount}개</strong></p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>정렬 기준 :     </p>
                                    
                                    <%-- 
                                    <select>
                                        <option value="">마감임박순</option>
                                        <option value="">모집중</option>
                                        <option value="">모집마감</option>
                                        <option value="">저가격순</option>
                                        <option value="">클래스명 오름차순</option>
                                    </select>
                                    --%>
                                    
                                    <select id="sortOption" onchange="changeSortOrder()">
                                    	<option value="regDtDesc" ${sort == 'regDtDesc' ? 'selected' : ''}>최신순</option>
								        <option value="closeSoon" ${sort == 'closeSoon' ? 'selected' : ''}>마감임박순</option>
								        <option value="recruiting" ${sort == 'recruiting' ? 'selected' : ''}>모집중</option>
								        <option value="closed" ${sort == 'closed' ? 'selected' : ''}>모집마감</option>
								        <option value="lowPrice" ${sort == 'lowPrice' ? 'selected' : ''}>저가격순</option>
								        <!-- 
								         <option value="highPrice" ${sort == 'highPrice' ? 'selected' : ''}>고가격순</option>
								         -->
								        <option value="nameAsc" ${sort == 'nameAsc' ? 'selected' : ''}>클래스명 오름차순</option>
								        <!-- 
								         <option value="nameDesc" ${sort == 'nameDesc' ? 'selected' : ''}>클래스명 내림차순</option>
								         -->
						    		</select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 상품 목록 나오는 곳  -->
                    <div class="row">
                    
                              
                    
                    <c:forEach var="classObj" items="${classList}">	
                    	<!-- 제품1개 시작 -->
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item sale">
                                <div class="product__item__pic set-bg" data-setbg="<c:url value="${pageContext.request.contextPath}/resources/uploadImg/${classObj.imgNm}" />">
                                
                                <c:choose>
			                        <c:when test="${classObj.endDt < currentDate}">
			                            <span class="label">모집마감</span>
                                
			                        </c:when>
		                         	<c:otherwise>
		                                <span class="label">모집중</span>
		                            </c:otherwise>
		                        </c:choose>
                                
                                
                                    
                                </div>
                                <div class="product__item__text">
                                    <h6>${classObj.startDt} ~ ${classObj.endDt}</h6> <!-- 수강기간 -->
                                    <h5>${classObj.classNm}</h5> <!-- 클래스명  -->
                                    
                                    <h6><a href="/classView.do?classId=${classObj.classId}">${classObj.classNm}</a></h6> <!-- 클래스명  -->
                                    <a href="/classView.do?classId=${classObj.classId}&returnUrl=${pageContext.request.requestURL}" class="add-cart">클래스 상세보기</a>
                                    
                                    <h6>
                                    	<fmt:formatNumber value="${classObj.classPrice}" type="currency" currencySymbol="₩" /><!-- 클래스 가격 -->
                                    </h6>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <!-- 제품1개 끝 -->
                    </c:forEach>
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                       
                    </div>
                    
                    <!-- 페이징 -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                                <!-- 
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                             -->
                            
                            
                            <c:forEach var="i" begin="1" end="${totalPages}">
						        <c:choose>
						            <c:when test="${i == currentPage}">
						                <!-- 현재 페이지에 active 클래스 추가 -->
						                
						                <!-- 
						                 <a href="javascript:goToPage(${i});" class="active">${i}</a>
						                 -->
						                <a href="javascript:void(0);" onclick="goToPage(${i});" class="active">${i}</a>
						                
						                
						                
						                 <!-- 현재 페이지에는 active 클래스 추가 
						                 
                						<a href="/classAllList.do/${category}?page=${i}&pageSize=${pageSize}" class="active">${i}</a>
						                 -->
						                 
						            </c:when>
						            <c:otherwise>
						                <!-- 
						                 <a href="javascript:goToPage(${i});">${i}</a>
						                 -->
						                 
						                 <!-- 페이지 이동 시 goToPage() 함수 호출 -->
                						<a href="javascript:void(0);" onclick="goToPage(${i});">${i}</a>
                						
                						<!-- 
						                <a href="/classAllList.do/${category}?page=${i}&pageSize=${pageSize}">${i}</a>
                						 -->
						                
						            </c:otherwise>
						        </c:choose>
						    </c:forEach>
						    
						    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
	

	
	

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
  	
	// 페이징 함수
	function goToPage(page) {
	    // 현재 페이지 번호와 페이지 크기를	 URL에 포함하여 요청
	      const pageSize = ${pageSize}; // 한 페이지당 보여줄 클래스의 개수
	      const category = '${category}'; // 클래스 카테고리
	      const searchInput = '${searchInput}'; // 검색할 검색어
	      const sortOption = $('#sortOption').val(); // 선택된 정렬 기준

		  
		  
	      // 검색어가 존재하면 URL에 포함하여 페이지 이동
	      let url = '/classAllList/' + category + '?page=' + page + '&pageSize=' + pageSize;
		  
	      
	      
	      
	   	  // 검색어와 정렬 기준을 URL에 포함
	      if (searchInput && searchInput.trim() !== '') {
	          url += '&searchInput=' + encodeURIComponent(searchInput);
	      }
	   	  
	      if (sortOption) {
	          url += '&sort=' + sortOption;
	      }
	   	  

	      location.href = url;
	}
	  
	/*****************/
	// 정렬함수
	function changeSortOrder() {
		
		
		goToPage(1); // 정렬 변경 시 첫 페이지로 이동
		
		
		// goToPage 함수로 적어서 주석처리함
		
		// console.log("정렬 함수 탔는 지 확인 ")
	    // const sortOption = $('#sortOption').val(); //선택된 정렬 기준 
	    // const pageSize = ${pageSize}; // 페이지당 항목 수
	    // const category = '${category}'; // 현재 카테고리
	    // const searchInput = '${searchInput}'; // 검색어

	    // 기본 URL 구성
	    // let url = '/classAllList/' + category + '?page=1&pageSize=' + pageSize;
	
	    // 검색어가 있는 경우 URL에 추가
	    // if (searchInput && searchInput.trim() !== '') {
		// 	        url += '&searchInput=' + encodeURIComponent(searchInput);
	    // }
	
	    // 정렬 옵션이 선택된 경우 URL에 추가
	    // if (sortOption) {
		// 	 	console.log("정렬 옵션 선택 경우 url 추가 :  ", sortOption)
	    //     url += '&sort=' + sortOption;
	    // 	console.log("정렬 옵션 선택 경우 url:  ", url)
	    // }
	
	    // 페이지 이동
	    // location.href = url;
	}

	</script>
	
	
	<!--공통 컴포넌트 불러오기-->
	
</body>
</html>

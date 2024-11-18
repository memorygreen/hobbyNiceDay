<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="content-language" content="ko">
	
	<!-- 템플릿-->
	<title>HobbyNiceDay management</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="<c:url value='/images/admin/images/favicon.ico' />" type="image/x-icon">
    
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="<c:url value='/pages/admin/pages/waves/css/waves.min.css' />" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/css/bootstrap/css/bootstrap.min.css' />">
    <!-- waves.css -->
    <link rel="stylesheet" href="<c:url value='/pages/admin/pages/waves/css/waves.min.css' />" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/images/admin/icon/themify-icons/themify-icons.css' />">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/css/font-awesome.min.css' />">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/images/admin/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/css/style.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/css/jquery.mCustomScrollbar.css' />">
    
    <style>
    /*자영 추가 : 회원동록 시 flex 되도록*/
    .input-group-wrapper {
	   display: flex;
	   flex-wrap: wrap; /* 입력란이 2개씩 배치되도록 설정 */
	   justify-content: space-between; /* 입력란 사이에 공간을 확보 */
	}	
	.input-group {
	    flex-basis: 48%; /* 입력란이 화면의 48% 너비를 차지하도록 설정 */
	    margin-bottom: 20px; /* 입력란들 사이에 간격을 추가 */
	}
	
	/* 동일한 너비를 강제로 적용 (최대값 기준) */
.input-group input, .input-group select, .input-group label {
    width: 100%; /* input, select, label을 동일하게 맞춤 */
    box-sizing: border-box; /* padding과 border를 포함한 너비 계산 */
}

	
	
	/*성별 라디오 버튼 커스텀 */
	/* 버튼 스타일 라디오 */
	.gender-buttons {
    display: flex;
    gap: 10px; /* 버튼 사이 간격 조절 */
    align-items: center; /* 수직 정렬 */
    height: 100%; /* 부모 컨테이너 높이에 맞추기 */
	}
	
	.btn-radio {
	    /*margin-right: 5px;*/
	}
	
	.btn-radio input[type="radio"] {
	    display: none; /* 기본 라디오 버튼 숨기기 */
	}
	
	.btn-radio label {
	    padding: 10px 20px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	.btn-radio input[type="radio"]:checked + label {
	    //background-color: #007bff;
	    color: black; /*폰트 색상 */
	    border: 1px solid black; /* 선택 시 검정 테두리 추가 */
	    
	}
	
	
	/*id 중복확인 버튼 */
	.button-list .btn {
    margin-bottom: 0px;
    margin-right: 0px;
	}

	/* 라벨 색상 변경 */
	.input-group-append .input-group-text, .input-group-prepend .input-group-text {
	    background-color: #32589d;
	    border-color: rgba(0, 0, 0, 0.15);
	    color: #fff;
	}
    </style>
</head>

<body>
    <!-- Pre-loader start -->
    <div class="pre_loader_start">
    	<jsp:include page="/WEB-INF/jsp/main/inc/adminPreLoader.jsp" />
    </div>
    <!-- Pre-loader end -->
    
     
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
        
            <!--header 상단 네비게이션 바-->
            <div id="header_nav">
            	<jsp:include page="/WEB-INF/jsp/main/inc/adminHeaderNav.jsp" />
            </div>
            <!--header 상단 네비게이션 바 end-->


            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">

                    <!-- side bar (nav)-->
                    <div id="side_bar_menu">
                    	<jsp:include page="/WEB-INF/jsp/main/inc/adminSideBarMenu.jsp" />
                    </div>
                    <!--side bar end -->

                    <div class="pcoded-content">
                        <!-- Page-header start -->
                        <div class="page-header" style="background-color:#20263b;"> <!-- 페이지 헤더 배경색상 -->
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="page-header-title">
                                            <h5 class="m-b-10">예약 정보 조회 페이지</h5>
                                            <p class="m-b-0">등록된 예약정보를 조회하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="index.html"> </a>
                                            </li>
                                            <li><a href="/adminReservationList.do">예약 관리 > </a>
                                            </li>
                                            <li ><a href="/adminReservationInfo.do?reservationId=${reservationInfo.reservationId}" + >예약 조회</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Page-header end -->
                        
                        
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                    	<div class="row">
                                    		<!-- 표에 작성해보기  -->
                                    		<div class="col-sm-12">
	                                    	<div class="card">
	                                            <div class="card-header">
	                                                <h5>예약 정보조회</h5>
	                                                <span>예약 정보조회 페이지입니다. <code>TB_RESERVATION</code></span>
	                                       		    
	                                            </div>
	                                            
	                                            <form id="joinForm" name="joinForm" method="post">
	                                            
	                                            <div class="card-block table-border-style">
	                                                <div class="table-responsive">
	                                                    
	                                                    <table class="table table-hover">
	                                                        <thead>
	                                                            <tr>
	                                                            	<th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="reservationId">
				                                                            	예약고유ID
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="reservationId" name="reservationId" class="form-control"  data-toggle="tooltip" readonly value="${reservationInfo.reservationId}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationNm">
			                                                            	예약자명
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="reservationNm" name="reservationNm" class="form-control" data-toggle="tooltip"  readonly value="${reservationInfo.reservationNm}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationType">
			                                                            	 회원/비회원구분
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="reservationType" name="reservationType"  class="form-control" data-toggle="tooltip" disabled value="${reservationInfo.reservationType}">
			                                                            	<option value="user">회원</option>
			                                                            	<option value="nonUser">비회원</option>
			                                                            </select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="userId">
				                                                            	예약자ID(회원)
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="userId" name="userId" class="form-control"  data-toggle="tooltip" readonly value="${reservationInfo.userId}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                            	<th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="classNm">
				                                                            	클래스명
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="classNm" name="classNm" class="form-control"  data-toggle="tooltip" readonly value="${reservationInfo.classNm}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationCnt">
			                                                            	 예약인원수
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="reservationCnt" name="reservationCnt" class="form-control" data-toggle="tooltip"  readonly value="${reservationInfo.reservationCnt}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                            	<th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationDt">
			                                                            	클래스 날짜
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="reservationDt" name="reservationDt" class="form-control" data-toggle="tooltip"  readonly 
			                                                           			value="<fmt:formatDate value="${reservationInfo.reservationDt}" pattern="yyyy-MM-dd"/>"> 
			                                                           	
	                                                                </th>
	                                                                
	                                                            	<th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="timeStart">
				                                                            	예약 시간
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="timeStart" name="timeStart" class="form-control"  data-toggle="tooltip" readonly value="${reservationInfo.timeStart}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                               
	                                                                
	                                                            </tr>
	                                                            
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationPhone">
			                                                            	연락처
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="reservationPhone" name="reservationPhone" class="form-control" data-toggle="tooltip" readonly value="${reservationInfo.reservationPhone}">
			                                                        </th>
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationEmail">
			                                                            	이메일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="reservationEmail" name="reservationEmail" class="form-control" data-toggle="tooltip" readonly value="${reservationInfo.reservationEmail}">
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationStatus">
			                                                            	예약상태
			                                                           	</label>
			                                                           	</span>
			                                                            <select id="reservationStatus" name="reservationStatus"  class="form-control" data-toggle="tooltip" disabled>
			                                                            	    <option value="stay" ${reservationInfo.reservationStatus == 'stay' ? 'selected' : ''}>예약대기</option>
																			    <option value="approved" ${reservationInfo.reservationStatus == 'approved' ? 'selected' : ''}>접수완료</option>
																			    <option value="cancel" ${reservationInfo.reservationStatus == 'cancel' ? 'selected' : ''}>예약취소</option>
																			    <option value="reject" ${reservationInfo.reservationStatus == 'reject' ? 'selected' : ''}>접수취소</option>
	    																	    <option value="done" ${reservationInfo.reservationStatus == 'done' ? 'selected' : ''}>수강완료</option>
																			    

			                                                            </select>
		                                                        	</th>
	                                                                
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationEtc">
			                                                            	예약 비고
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="reservationEtc" name="reservationEtc" class="form-control" data-toggle="tooltip" readonly value="${reservationInfo.reservationEtc}">
			                                                        </th>
	                                                            </tr>
	                                                        	
	                                                        	
	                                                        	<tr>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="regDt">
			                                                            	예약 등록일자
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="regDt" name="regDt" class="form-control" data-toggle="tooltip" readonly 
			                                                            value="<fmt:formatDate value="${reservationInfo.regDt}" pattern="yyyy-MM-dd HH:MM:SS"/>"> 
			                                                           
			                                                            
			                                                           	
			                                                        </th>
	                                                                
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="confmDt">
			                                                            	접수완료 일자
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="confmDt" name="confmDt" class="form-control" data-toggle="tooltip" readonly 
			                                                            		value="<fmt:formatDate value="${reservationInfo.confmDt}" pattern="yyyy-MM-dd HH:MM:SS"/>"> 
			                                                           
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                        	<tr>
		                                                        	<td colspan="3">
		                                                        		<div style="text-align: center; margin-top: 10px;">
			                                                        		<!-- 수정 -->
		                                                        			<a href="/adminReservationUpdateForm.do?reservationId=${reservationInfo.reservationId}" id="updateBtn" 
		                                                        			class="btn waves-effect  waves-light m-r-20" style=background-color:#32589d;color:white;margin-right:20px;" 
			                                                        				data-toggle="tooltip" data-placement="right">수정</a>
		                                                        			
					                                                        <!-- 목록 -->
					                                                        <a href="/adminReservationList.do" id="ListBtn" class="btn waves-effect waves-light"
					                                                        style="background-color:#d8b95d;color:white;border-color:#d8b95d;margin-right:20px;" >예약 목록</a>
					                                                        
		                                                        		</div>
	                                                        			 
		                                                        	</td>
	                                                        	</tr>    	
	                                                            	                                                           
	                                                        </thead>
	                                                        
	                                                    </table>
	                                                </div>
	                                            </div>
	                                        </div>
                                    	</div>
                                    	</form>
                                       	
                                       	<!-- 툴팁 끝 -->
                                        
                                       
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                            </div>
                            <!-- Main-body end -->

                            <div id="styleSelector">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    
    
    
    <!-- Required Jquery -->
    <script type="text/javascript" src="js/admin/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="js/admin/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="js/admin/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="js/admin/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="pages/admin/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="js/admin/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- Custom js -->
    <script src="js/admin/js/pcoded.min.js"></script>
    <script src="js/admin/js/vertical/vertical-layout.min.js"></script>
    <script src="js/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="js/admin/js/script.js"></script>
	
	
	
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
		

		
	</script>
    
</body>



</html>

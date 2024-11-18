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
                                            <h5 class="m-b-10">예약 정보 수정 페이지</h5>
                                            <p class="m-b-0">등록된 예약정보를 수정하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="/adminReservationList.do"></a>
                                            </li>
                                            <li ><a href="/adminReservationList.do">예약 관리 > </a>
                                            </li>
                                            <li ><a href="/adminReservationUpdateForm.do?reservationId=${reservationInfo.reservationId}">예약 수정</a>
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
	                                                <h5>예약 정보 수정</h5>
	                                                <span>예약 정보 수정 페이지입니다. <code>TB_RESERVATION</code></span>
	                                       		    
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
				                                                            	 * 예약고유ID
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="reservationId" name="reservationId" class="form-control"  data-toggle="tooltip"  readonly value="${reservationInfo.reservationId}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationNm">
			                                                            	* 예약자명
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="reservationNm" name="reservationNm" class="form-control" data-toggle="tooltip"  value="${reservationInfo.reservationNm}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationType">
			                                                            	 * 회원/비회원구분
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
				                                                            	* 클래스명
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
			                                                           	<input type="text" id="reservationCnt" name="reservationCnt" class="form-control" data-toggle="tooltip" readonly  value="${reservationInfo.reservationCnt}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                            	<th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationDt">
			                                                            	* 클래스 날짜
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="reservationDt" name="reservationDt" class="form-control" data-toggle="tooltip"   
			                                                           			readonly value="<fmt:formatDate value="${reservationInfo.reservationDt}" pattern="yyyy-MM-dd"/>"> 
			                                                           	
	                                                                </th>
	                                                                
	                                                            	<th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="timeStart">
				                                                            	* 예약 시간
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="timeStart" name="timeStart" class="form-control"  data-toggle="tooltip" readonly value="${reservationInfo.timeStart}">
			                                                            
			                                                            
	                                                                </th>
	                                                               
	                                                                
	                                                            </tr>
	                                                            
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationPhone">
			                                                            	 * 연락처
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="reservationPhone" name="reservationPhone" class="form-control" data-toggle="tooltip" required  value="${reservationInfo.reservationPhone}">
			                                                        </th>
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationEmail">
			                                                            	* 이메일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="reservationEmail" name="reservationEmail" class="form-control" data-toggle="tooltip"  required value="${reservationInfo.reservationEmail}">
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="reservationStatus">
			                                                            	* 예약상태
			                                                           	</label>
			                                                           	</span>
			                                                            <select id="reservationStatus" name="reservationStatus"  class="form-control" data-toggle="tooltip"  required>
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
			                                                            <input type="text" id="reservationEtc" name="reservationEtc" class="form-control" data-toggle="tooltip" value="${reservationInfo.reservationEtc}">
			                                                        </th>
	                                                            </tr>
	                                                        	
	                                                        	
	                                                        	<tr>
		                                                        	<td colspan="3">
		                                                        		<div style="text-align: center; margin-top: 10px;">
			                                                        		<!-- 수정 -->
		                                                        			<a href="/adminReservationUpdate.do?reservationId=${reservationInfo.reservationId}" id="updateBtn" 
		                                                        			class="btn waves-effect  waves-light m-r-20" style=background-color:#32589d;color:white;margin-right:20px;" 
			                                                        				data-toggle="tooltip" data-placement="right">수정</a>
		                                                        			
					                                                        <!-- 목록 -->
					                                                        <a href="/adminReservationList.do" id="ListBtn" class="btn waves-effect waves-light"
					                                                        style="background-color:#d8b95d;color:white;border-color:#d8b95d;margin-right:20px;" >예약 목록</a>
					                                                        
					                                                        <!-- 삭제 
					                                                        <a href="/adminReservationDelete.do?reservationId=${reservationInfo.reservationId}" id="" class="btn waves-effect waves-light m-r-20" 
					                                                        style="background-color:#D85D5D;color:white;border-color:#D85D5D;margin-right:20px;" data-toggle="tooltip" data-placement="right">삭제</a>
					                                                        -->
					                                                        
					                                                        <a href="#" id="deleteBtn" class="btn waves-effect waves-light m-r-20" 
					                                                        	style="background-color:#D85D5D;color:white;border-color:#D85D5D;margin-right:20px;" data-toggle="tooltip" data-placement="right">
					                                                        	삭제
					                                                        </a>
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


	<!--  회원가입 폼 붙이기 -->
	


    
    
    
    
    
    
    
    
    
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
		
		
		// 이름 입력 제한 및 길이 제한
		  $('#reservationNm').on('input', function() {
		      // 이름 정규식 (한글 or 영어 대소문자만 허용 // 공백x 특수문자x 숫자x)
		      let validChars = /^[ㄱ-ㅎ|가-힣a-zA-Z]*$/;

		      let userName = $(this).val(); // 현재 입력된 이름

		      // 입력불가 문자 입력 시 삭제
		      if (!validChars.test(userName)) {
		          $(this).val(userName.replace(/[^가-힣a-zA-Z]/g, ''));
		          $('#reservationNmMsg').text("이름은 한글 또는 영어 대소문자만 허용됩니다. 공백,특수문자,숫자는 입력할 수 없습니다.").css("color", "#D85D5D");
		      } 
		      // 글자수 10글자 제한
		      else if (userName.length > 10) { 
		          $(this).val(userName.substring(0, 10));
		          $('#reservationNmMsg').text("이름은 최대 10자까지 입력 가능합니다.").css("color", "#D85D5D");
		      } else {
		          $('#reservationNmMsg').text(""); // 정규표현식 o -> 메시지 삭제
		      }
		  });
		

		//휴대전화 
		 $('#reservationPhone').on('input', function() {
	        let phoneNumber = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 허용
	        
	        // 글자수 11 제한
	        if (phoneNumber.length > 11) {
	            phoneNumber = phoneNumber.substring(0, 11);
	        }
	        
	        let formattedNumber;
	
	        if (phoneNumber.length <= 3) {
	            formattedNumber = phoneNumber; // 3자리 이하일 경우 그대로 표시
	        } else if (phoneNumber.length <= 7) {
	            formattedNumber = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3); // 4~7자리일 경우 3-4 형식
	        } else if (phoneNumber.length <= 10) {
	            formattedNumber = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3, 6) + '-' + phoneNumber.slice(6); // 10자리 형식 3-3-4
	        } else {
	            formattedNumber = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3, 7) + '-' + phoneNumber.slice(7); // 11자리 형식 3-4-4
	        }
	
	        $(this).val(formattedNumber); // 포맷팅된 번호를 필드에 표시
	    });
		
		
		// 이메일 입력 제한: 최대 30글자, 공백 허용하지 않음
		 $('#reservationEmail').on('input', function() {
		     let email = $(this).val().replace(/\s/g, ''); // 공백 제거
		     if (email.length > 30) {
		         email = email.substring(0, 30); // 최대 30글자로 제한
		     }
		     $(this).val(email); // 수정된 값 설정
		 });
		
		/**************************************************/
		
		// 수정 버튼 클릭 시 
		$('#updateBtn').click(function(e) {
			console.log("수정 클릭 버튼 들어왔는지 확인 ")
			e.preventDefault();
			
			if ($.trim($('#reservationNm').val()) == ''){
				alert('예약자명을 입력해주세요');
				$('#reservationNm').focus();
				return false;
			}
			
			
			
			
			
			if ($.trim($('#reservationPhone').val()) == ''){
				alert('연락처를 입력해주세요');
				$('#reservationPhone').focus();
				return false;
			}
			
			// 휴대폰 번호 및 지역번호 형식 체크 (01X-XXXX-XXXX 또는 지역번호-XXXX-XXXX 형식)
			// let phoneReg = /^(01[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;	// 휴대폰 번호 형식 체크 (010, 011, 016, 017, 018, 019-1234-5678 형식)

			let phoneReg = /^(01[0|1|6|7|8|9]-\d{3,4}-\d{4}|0\d{1,2}-\d{3,4}-\d{4})$/;
			if (!phoneReg.test($('#reservationPhone').val())) {
			    alert('휴대폰 번호 또는 일반 전화번호를 올바른 형식으로 입력해주세요. (ex. 010-0000-0000)');
			    $('#reservationPhone').focus();
			    return false;
			}
			

			if ($.trim($('#reservationEmail').val()) == '' ){
				alert('이메일을 입력해주세요.');
				$('#reservationEmail').focus();
			}
			// 이메일 형식 체크 (ex. exaple@naver.com)
				/* 
				^[A-Z0-9._%+-]+: 이메일의 첫 부분은 영문자, 숫자, 특수문자(._%+-)를 포함할 수 있습니다.
				@[A-Z0-9.-]+: @ 뒤에는 도메인 부분이 오며, 영문자, 숫자, 점(.), 하이픈(-)이 허용됩니다.
				\.[A-Z]{2,}$: 도메인 끝부분이 최소 2자 이상의 문자로 끝나야 함을 의미합니다. (예: .com, .org, .co.kr)
			*/
			let emailReg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
			if (!emailReg.test($('#reservationEmail').val())) {
			    alert('이메일 형식을 확인해 주세요.(ex. exaple@naver.com)');
			    $('#reservationEmail').focus();
			    return false;
			}
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			
			
			if (confirm("예약정보를 수정 하시겠습니까?")) {
				var form = $('#joinForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'updateReservationInfo.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(result){
						console.log("예약 수정 응답 result:", result);
		                
		                // JSON 파싱
		                var response = JSON.parse(result);
						console.log("예약 수정 response:", response);

		                if (response.error == 'N') {
		                    alert("예약 수정되었습니다.");
		                    location.href = '/adminReservationList.do';
		                } else if (response.error == 'Y') {
		                    alert('예약 수정 실패: ' + response.errorMsg);
		                    location.href = '//adminReservationInfo.do';
		                }
					},
					error: function() {
		                alert("예약 수정 중 오류가 발생했습니다.");
		            }
				});
			}
			
			
			
		})// 수정 버튼 클릭 끝
		
		
		
		
		
		
		/******************************************************************/
		// 삭제 버튼 클릭
	    $('#deleteBtn').click(function (e) {
	    	console.log("삭제 버튼 클릭")
	    	e.preventDefault(); // 기본 링크 동작 방지
	    	
	    	const reservationId= '${reservationInfo.reservationId}'
	    	// const classId = '${classDetails.classId}'; // 클래스 ID 가져오기
	    	console.log("삭제 버튼 클릭 reservationId : ", reservationId)
	    	
	        if (confirm('해당 예약을 삭제하시겠습니까?')) {
	        	
	            $.ajax({
	                type: 'POST',
	                url: '/adminDeleterReservation.do',
	                data: { reservationId: reservationId },
	                success: function (response) {
	                    console.log("삭제 응답 데이터: ", response); // 응답 데이터를 로그에 출력
	                    
	                        if (response.error === "N") {
	                            alert(response.message);
	                            location.href = '/adminReservationList.do'; // 목록 페이지로 이동
	                        } else if (response.error === "Y") {
	                            alert('예약 삭제 실패: ' + response.errorMsg); // 실패 시 오류 메시지 표시
	                        }
                    },
	                error: function (xhr) {
	                    console.error("AJAX 요청 실패: ", xhr);
	                    alert('예약 삭제 중 오류가 발생했습니다: ' + xhr.responseText);
	                }
	            });
	        }
	    });
		
	};// 전체 불러오기 끝
		
	// 유효성 검사 함수
	function requiredEmpty() {
		var empty = false;
		$("*[required]").each(
				function() {
					if (empty)
						return;
					var input = $(this), value = input.val();
					if (empty = !value) {
						var label = $(
								"label[for='" + input.attr("id") + "']")
								.html();
						if (label)
							alert(label.replace("<br>", "")
									+ "을(를) 입력하십시오.");
						else
							alert("필수값이 입력되지 않았습니다.");
						input.focus();
					}

				});
		return empty;
	}

		
	</script>
    
</body>



</html>

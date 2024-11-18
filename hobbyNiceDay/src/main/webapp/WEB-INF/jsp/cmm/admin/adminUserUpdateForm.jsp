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
	    /*background-color: #007bff;*/
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
	
	/*회원구분 왜 안되지*/
	.form-control:disabled {
		/*color:#495057;*/	
		opacity :1;
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
                                            <h5 class="m-b-10">회원 정보 수정 페이지</h5>
                                            <p class="m-b-0">등록된 회원 정보를 수정하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="/adminUserList.do"> </a>
                                            </li>
                                            <li ><a href="/adminUserList.do">회원 관리 > </a>
                                            </li>
                                            <li ><a href="/adminUserUpdateForm.do?userId=${userInfo.userId}">회원 수정</a>
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
	                                                <h5>회원 수정</h5>
	                                                <span>회원 수정 페이지입니다. <code>TB_USER</code></span>
	                                       		    
	                                            </div>
	                                            
	                                            <form id="insertForm" name="insertForm" method="post">
	                                            
	                                            <div class="card-block table-border-style">
	                                                <div class="table-responsive">
	                                                    
	                                                    <table class="table table-hover">
	                                                        <thead>
	                                                            <tr>
	                                                                <th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="userId">
				                                                            	아이디
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="userId" name="userId" class="form-control"  data-toggle="tooltip" readonly value="${userInfo.userId}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userName">
			                                                            	이름
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="userName" name="userName" class="form-control" data-toggle="tooltip"  value="${userInfo.userName}">
	                                                                </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userSe">
			                                                            	회원구분
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="userSe" name="userSe"  class="form-control" data-toggle="tooltip"  value="${userInfo.userSe}">
			                                                            	<option value="user" <c:if test="${userInfo.userSe == 'user'}">selected</c:if>>사용자</option>
    																		<option value="admin" <c:if test="${userInfo.userSe == 'admin'}">selected</c:if>>관리자</option>
			                                                            </select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="brthdy">
			                                                            	생년월일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="date" id="brthdy" name="brthdy" class="form-control" data-toggle="tooltip"   value="${fn:substring(userInfo.brthdy, 0, 10)}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="mbtlnum">
			                                                            	휴대전화
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="mbtlnum" name="mbtlnum" class="form-control" data-toggle="tooltip"  value="${userInfo.mbtlnum}">
			                                                        </th>
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="email">
			                                                            	이메일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="email" name="email" class="form-control" data-toggle="tooltip"  value="${userInfo.email}">
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="sex">
			                                                            	성별
			                                                           	</label>
			                                                           	</span>
			                                                            <div class="gender-buttons">
																	    <!-- 성별 선택 -->
																	    <div class="input-group btn-radio">
																	        <input type="radio" id="male" name="sex" value="M"  
																					    <c:if test="${userInfo.sex == 'M'}">checked="checked"</c:if> >
																	        <label for="male">남성</label>
																	    </div>
																		    <div class="input-group btn-radio">
																		        <input type="radio" id="female" name="sex" value="F"   
																		        		<c:if test="${userInfo.sex == 'F'}">checked="checked"</c:if> >
																		        <label for="female">여성</label>
																		    </div>
																	 	</div>
		                                                        	</th>
	                                                                <th  colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="snsProvider">
			                                                            	SNS 로그인 회원 구분
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="snsProvider" name="snsProvider"  class="form-control" data-toggle="tooltip" disabled value="${userInfo.snsProvider}">
			                                                            	<option value="">일반회원</option>
			                                                            	<option value="K">카카오 로그인회원</option>
			                                                            	<option value="N">네이버 로그인회원</option>
			                                                            </select>
			                                                            
			                                                            <br/>
			                                                                                                             
	                                                                </th>
	                                                            </tr>
	                                                        	
	                                                        	<tr>
		                                                        	<td colspan="3">
		                                                        		<div style="text-align: center; margin-top: 10px;">
			                                                        		<!-- 수정 -->
		                                                        			<a href="/adminUserUpdateForm.do?userId=${userInfo.userId}" id="updateBtn" 
		                                                        			class="btn waves-effect  waves-light m-r-20" style=background-color:#32589d;color:white;margin-right:20px;" 
			                                                        				data-toggle="tooltip" data-placement="right">수정</a>
		                                                        			
					                                                        <!-- 목록 -->
					                                                        <a href="/adminUserList.do" id="ListBtn" class="btn waves-effect waves-light"
					                                                        style="background-color:#d8b95d;color:white;border-color:#d8b95d;margin-right:20px;" >회원 목록</a>
					                                                        
					                                                        <!-- 삭제 -->
					                                                        <a href="/adminUserDelete.do" id="deleteBtn" class="btn waves-effect waves-light m-r-20" 
					                                                        style="background-color:#D85D5D;color:white;border-color:#D85D5D;margin-right:20px;" data-toggle="tooltip" data-placement="right">삭제</a>
		                                                        		</div>
	                                                        			 
		                                                        	</td>



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
	                                        
                                        <!-- Basic table card start -->
                                        <!-- Basic table card end -->
                                        
                                        <!-- Inverse table card start -->
                                        <!-- Inverse table card end -->
                                        
                                        
                                        <!-- Hover table card start -->
                                        
                                        <!-- Hover table card end -->
                                        
                                       
                                        
                                       
                                        <!-- Contextual classes table starts -->
                                        <!-- Contextual classes table ends -->
                                        
                                        <!-- Background Utilities table start -->
                                        <!-- Background Utilities table end -->
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
	












    <!-- Warning Section Starts -->
    
    <!-- Warning Section Ends -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
		  $('#userName').on('input', function() {
		      // 이름 정규식 (한글 or 영어 대소문자만 허용 // 공백x 특수문자x 숫자x)
		      let validChars = /^[ㄱ-ㅎ|가-힣a-zA-Z]*$/;

		      let userName = $(this).val(); // 현재 입력된 이름

		      // 입력불가 문자 입력 시 삭제
		      if (!validChars.test(userName)) {
		          $(this).val(userName.replace(/[^가-힣a-zA-Z]/g, ''));
		          $('#userNameMsg').text("이름은 한글 또는 영어 대소문자만 허용됩니다. 공백,특수문자,숫자는 입력할 수 없습니다.").css("color", "#D85D5D");
		      } 
		      // 글자수 10글자 제한
		      else if (userName.length > 10) { 
		          $(this).val(userName.substring(0, 10));
		          $('#userNameMsg').text("이름은 최대 10자까지 입력 가능합니다.").css("color", "#D85D5D");
		      } else {
		          $('#userNameMsg').text(""); // 정규표현식 o -> 메시지 삭제
		      }
		  });
		
		
		
			
			//휴대전화 
			 $('#mbtlnum').on('input', function() {
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
			 $('#email').on('input', function() {
			     let email = $(this).val().replace(/\s/g, ''); // 공백 제거
			     if (email.length > 30) {
			         email = email.substring(0, 30); // 최대 30글자로 제한
			     }
			     $(this).val(email); // 수정된 값 설정
			 });
			
			
		/************************************************************************/
		
		// 수정버튼 클릭 시
	    $('#updateBtn').click(function(e) {
	        e.preventDefault(); // 폼의 기본 제출 기능 방지

	        const userId = '${userInfo.userId}';
	        
	        
	        // 유효성 검사
	        
			if ($.trim($('#userName').val()) == ''){
				alert('이름을 입력해주세요');
				$('#userName').focus();
				return false;
			}
			
			// userSe 필수 체크
		    if ($.trim($('#userSe').val()) === '') {
		        alert('회원 구분을 선택해주세요.');
		        $('#userSe').focus();
		        return false;
		    }
			
			if(!$('input:radio[name="sex"]').is(":checked")){
				alert("성별을 선택해주세요.");
				$('#male').focus();
			    $('#male').css("outline", "2px solid #e53637");  // 포커스가 된 라디오 버튼을 시각적으로 표시

				return false;
			}
			
			
			
			if ($.trim($('#brthdy').val()) == ''){
				alert('생년월일을 입력해주세요');
				$('#brthdy').focus();
				return false;
			}
			
			if ($.trim($('#mbtlnum').val()) == ''){
				alert('휴대전화 번호를 입력해주세요');
				$('#mbtlnum').focus();
				return false;
			}
			
			let phoneReg = /^(01[0|1|6|7|8|9]-\d{3,4}-\d{4}|0\d{1,2}-\d{3,4}-\d{4})$/;
			if (!phoneReg.test($('#mbtlnum').val())) {
			    alert('휴대폰 번호 또는 일반 전화번호를 올바른 형식으로 입력해주세요. (ex. 010-0000-0000)');
			    $('#mbtlnum').focus();
			    return false;
			}
			
			
			if ($.trim($('#email').val()) == '' ){
				alert('이메일을 입력해주세요.');
				$('#email').focus();
				return false;
			}
			
			let emailReg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
			if ( $.trim($('#email').val()) != '' && !emailReg.test($('#email').val())) {
			    alert('이메일 형식을 확인해 주세요.(ex. exaple@naver.com)');
			    $('#email').focus();
			    return false;
			}
			
			
			// 유효성 검사 - 미입력
			
	        if (requiredEmpty()) {
	            return false ;
	        }
			
	        
	     // form 데이터를 자동으로 수집
	     if (confirm("회원정보를 수정하시겠습니까?")) {
				var form = $('#insertForm')[0];
				var formData = new FormData(form);
		        // const formData = $('#insertForm').serialize();
					
		        console.log("전송할 formData : " + formData)
		        
		        
		        // 클래스 수정 요청 (휴무일 제외)
		        $.ajax({
		            type: 'POST',
		            url: '/adminUserUpdate.do?classId=' + userId,
		            processData: false,
					contentType: false,
		            data: formData,
		            success: function(response) {
		           
		            	console.log("응답 데이터: ", response);
		            	
		            	if (response.error === "N") {
		                    alert(response.message);
		                    location.href = '/adminUserInfo.do?userId=' + userId;
		                } else if (response.error == 'Y') {
		                	 alert('클래스 수정 실패 : ' + response.errorMsg);
			                    location.href = '/adminUserUpdate.do?userId=' + userId;
		                    // alert('오류: ' + response.message);
		                }
		            },
		            error: function(xhr) {
		            	 const errorResponse = JSON.parse(xhr.responseText);
		                 alert('수정 중 오류 발생: ' + errorResponse.errorMsg);
		                 //alert('클래스 정보 수정 중 오류가 발생했습니다: ' + xhr.responseText);
		            }
		        });
	     	}
	    });
		
		
		/******************************************************************/
		// 삭제 버튼 클릭
	    $('#deleteBtn').click(function (e) {
	    	console.log("삭제 버튼 클릭")
	    	e.preventDefault(); // 기본 링크 동작 방지
	    	
	    	const userId = '${userInfo.userId}';
	    	console.log("삭제 버튼 클릭 classId : ", userId)
	    	
	        if (confirm('해당 회원을 삭제하시겠습니까?')) {
	        	
	            $.ajax({
	                type: 'POST',
	                url: '/adminUserDelete.do',
	                data: { userId: userId },
	                success: function (response) {
	                    console.log("삭제 응답 데이터: ", response); // 응답 데이터를 로그에 출력
	                    
	                        if (response.error === "N") {
	                        	console.log("삭제 성공 : ", response.message)
	                        	
	                            alert(response.message);
	                            location.href = '/adminUserList.do'; // 목록 페이지로 이동
	                        } else if (response.error === "Y") {
	                        	console.log("삭제 실패 : ", response.errorMsg)
	                        	
	                            alert('회원 삭제 실패: ' + response.errorMsg); // 실패 시 오류 메시지 표시
	                        }
                    },
	                error: function (xhr) {
	                    console.error("AJAX 요청 실패: ", xhr);
	                    alert('회원 삭제 중 오류가 발생했습니다: ' + xhr.responseText);
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

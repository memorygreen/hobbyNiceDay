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
                                            <h5 class="m-b-10">회원 등록 페이지</h5>
                                            <p class="m-b-0">새로운 회원을 등록하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="/adminUserList.do"> </a>
                                            </li>
                                            <li ><a href="/adminUserList.do">회원 관리 > </a>
                                            </li>
                                            <li ><a href="/adminUserInserForm.do">회원 등록</a>
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
	                                                <h5>회원 등록</h5>
	                                                <span>회원 등록 페이지입니다. <code>TB_USER</code></span>
	                                       		    
	                                            </div>
	                                            
	                                            <form id="joinForm" name="joinForm" method="post">
	                                            
	                                            <div class="card-block table-border-style">
	                                                <div class="table-responsive">
	                                                    
	                                                    <table class="table table-hover">
	                                                        <thead>
	                                                            <tr>
	                                                                <th>
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="userId">
				                                                            	아이디
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="userId" name="userId" class="form-control" placeholder="id를 입력해주세요" title="id를 입력해주세요"  data-toggle="tooltip" autocomplete="new-password" required>
			                                                            <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span>
	                                                                </th>
	                                                                <th width="10%">
	                                                                    <button id="userIdCk"  class="btn btn-inverse waves-effect waves-light" style="background-color:#32589d;color:white;">ID 중복확인</button>
	                                                                    </br>
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userName">
			                                                            	이름
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="userName" name="userName" class="form-control" placeholder="이름을 입력해주세요" title="이름을 입력해주세요"  data-toggle="tooltip"  autocomplete="new-password" required>
			                                                           	
			                                                            <p id="userNameMsg"> </p>
			                                                           	
			                                                           	
	                                                                </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%"> <!-- 비밀번호 -->
	                                                                    <span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="passwd">
			                                                            	비밀번호
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호를 입력해주세요" title="비밀번호를 입력해주세요"  data-toggle="tooltip" autocomplete="new-password" required>
	                                                        			<span id="userPasswdMsg">비밀번호는 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.<span>
	                                                        			
	                                                                </th>
	                                                                <th colspan="2" width="50%">
		     															<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="passwdCk">
			                                                            	비밀번호 확인
			                                                           	</label>
			                                                           	</span>
	                                                            		<input type="password" id="passwdCk" name="passwdCk" class="form-control" placeholder="비밀번호를 확인해주세요" title="비밀번호를 확인해주세요" data-toggle="tooltip" required>
	                                                            		<span id="userPasswdCkMsg"><span>                                                      
	                                                                </th>
	                                                            </tr>
	                                                        
	                                                            <tr>
	                                                                
																	
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userSe">
			                                                            	회원구분
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="userSe" name="userSe"  class="form-control" placeholder="회원구분을 선택해주세요" title="회원구분을 선택해주세요"  data-toggle="tooltip" required>
			                                                            
			                                                            	<option value="user">사용자</option>
			                                                            	<option value="admin">관리자</option>
			                                                            </select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="brthdy">
			                                                            	생년월일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="date" id="brthdy" name="brthdy" class="form-control" placeholder="생년월일을 입력해주세요" title="생년월일을 입력해주세요" data-toggle="tooltip" required>
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="mbtlnum">
			                                                            	휴대전화
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="mbtlnum" name="mbtlnum" class="form-control" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요" data-toggle="tooltip" required>
			                                                        </th>
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="email">
			                                                            	이메일
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요" data-toggle="tooltip" required>
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
																		        <input type="radio" id="male" name="sex" value="M" required>
																		        <label for="male">남성</label>
																		    </div>
																		    
																		    <div class="input-group btn-radio">
																		        <input type="radio" id="female" name="sex" value="F" required>
																		        <label for="female">여성</label>
																		    </div>
																	 	</div>
		                                                        	</th>
	                                                                <th></th>
	                                                                <th></th>
	                                                            </tr>
	                                                        	
	                                                        	  
	                                                        	<tr>
		                                                        	<td colspan="5">
			                                                        		
			                                                        		<div style="text-align: center; margin-top: 10px;">
				                                                        		<!-- 수정 -->
			                                                        			<button type="button" id="insertBtn" class="btn waves-effect  waves-light m-r-20" style=background-color:#32589d;color:white;margin-right:20px;" 
				                                                        				data-toggle="tooltip" data-placement="right">등록</button>
			                                                        			
						                                                        <!-- 목록 -->
						                                                        <a href="/adminUserList.do" id="ListBtn" class="btn waves-effect waves-light"
						                                                        style="background-color:#d8b95d;color:white;border-color:#d8b95d;margin-right:20px;" >회원 목록</a>
						                                                        
						                                                       
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
		
		
		
		
		//id 입력제한
		$('#userId').on('input', function() {
        // id 정규표현식 : 영어 대소문자, 숫자만 허용
        let validChars = /^[A-Za-z0-9]*$/;
        
        // 현재입력된 id
        let userId = $(this).val();
        
        // 제한된 문자 입력 or 15글자 초과 -> 수정
        if (!validChars.test(userId) || userId.length > 15) {
            // 불필요한 문자 제거, 15글자 초과시 15글자로 제한
            $(this).val(userId.replace(/[^A-Za-z0-9]/g, '').substring(0, 15));
            
            // 15글자 이상 -> 메시지 
            $('#userIdMsg').text("ID는 영어 대소문자와 숫자만 허용하며 최대 15글자까지 입력 가능합니다.").css("color", "#D85D5D");
        } else {
            $('#userIdMsg').text(""); // 조건만족 시 메시지 제거
        }
    });
		
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
		
		
		
		// 비밀번호 유효성 검증 정규식: 공백 제외, 영문자, 숫자, 특수문자 포함 8~15자
		  // const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*+=-])\S{8,15}$/;
		  const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])[A-Za-z0-9!@#$%^*+=-]{8,15}$/;

		  $('#passwd').on('input', function() {
			    let password = $(this).val();
			    
			    // 공백 or 15글자 초과 시 삭제
			    password = password.replace(/\s/g, '').substring(0, 15);
			    $(this).val(password);
			    
			    // 정규표현식 확인
			    if (!passwordRegEx.test(password)) {
			        $('#userPasswdMsg').text("비밀번호는 공백 없이 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.").css("color", "#D85D5D");
			    } else {
			        $('#userPasswdMsg').text(""); // 메시지 삭제
			    }
			});

			$('#passwdCk').on('input', function() {
			    let confirmPassword = $(this).val();
			    
			    // 공백 or 15글자 초과 시 제거
			    confirmPassword = confirmPassword.replace(/\s/g, '').substring(0, 15);
			    $(this).val(confirmPassword);
			    
			    // 비밀번호 일치 확인
			    if (confirmPassword !== $('#passwd').val()) {
			        $('#userPasswdCkMsg').text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.").css("color", "#D85D5D");
			    } else {
			        $('#userPasswdCkMsg').text(""); // 메시지 삭제
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
		
		
		
		
		
		
		
		
		
		
		// 사용자ID 중복체크
		$('#userIdCk').click(
				function(e) {
					e.preventDefault(); // 링크 기본 동작 막기
					
					var userId = $('#userId').val(); // 입력된 ID 값 가져오기

					if (userId === "") {
						alert("ID를 입력하세요."); // 자영 : 이미 필수체크인데?
						return;
					}

					// AJAX를 이용해 서버로 ID 중복 확인 요청 보내기
					
					$.ajax({
			            url: '<c:url value="/joinIdCheck.do"/>', // 서버에서 처리할 URL
			            type: 'POST',
			            data: { userId: userId }, // 입력된 ID 전달
			            success: function(response) {
			            	console.log("성공 시 response",response)
			            	console.log("성공 시 response",response.exist)
			                if (response.exist == true) {
			                    $('#userIdMsg').text("이미 사용 중인 ID입니다.").css("color", "red");
			                } else {
			                	userIdCk = true;
			                    $('#userIdMsg').text("사용 가능한 ID입니다.").css("color", "green");
			                }
			            },
			            error: function() {
			                alert("ID 중복 확인 중 오류가 발생했습니다.");
			            }
			        });
				});
		
		// 회원등록 버튼 클릭 시 
		$('#insertBtn').click(function(e) {
			console.log("회원등록 버튼 들어왔는지 확인 ")
			e.preventDefault();

			
			if (!userIdCk) {
				alert('아이디 중복확인을 해주세요.');
				$('#userId').focus();
				return false;
			}
			
			
			if ($.trim($('#userName').val()) == ''){
				alert('이름을 입력해주세요');
				$('#userName').focus();
				return false;
			}
			
			if ($.trim($('#passwd').val()) == ''){
				alert('비밀번호를 입력해주세요');
				$('#passwd').focus();
				return false;
			}else if($('#passwd').val() != $('#passwdCk').val()){
				alert('비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요');
				$('#passwdCk').focus();
				return false;
			}
			
			// 비밀번호 형식 체크 (영문, 숫자, 특수문자 포함 8~15자)
			let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			if (!reg.test($('#passwd').val())) {
			    alert('비밀번호는 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.');
			    $('#passwd').focus();
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
			
			// 휴대폰 번호 및 지역번호 형식 체크 (01X-XXXX-XXXX 또는 지역번호-XXXX-XXXX 형식)
			// let phoneReg = /^(01[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;	// 휴대폰 번호 형식 체크 (010, 011, 016, 017, 018, 019-1234-5678 형식)

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
			// 이메일 형식 체크 (ex. exaple@naver.com)
				/* 
				^[A-Z0-9._%+-]+: 이메일의 첫 부분은 영문자, 숫자, 특수문자(._%+-)를 포함할 수 있습니다.
				@[A-Z0-9.-]+: @ 뒤에는 도메인 부분이 오며, 영문자, 숫자, 점(.), 하이픈(-)이 허용됩니다.
				\.[A-Z]{2,}$: 도메인 끝부분이 최소 2자 이상의 문자로 끝나야 함을 의미합니다. (예: .com, .org, .co.kr)
			*/
			let emailReg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
			if ( $.trim($('#email').val()) != '' && !emailReg.test($('#email').val())) {
			    alert('이메일 형식을 확인해 주세요.(ex. exaple@naver.com)');
			    $('#email').focus();
			    return false;
			}
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			if (confirm("회원 등록을 하시겠습니까?")) {
				var form = $('#joinForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'joinUser.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(response){
						//console.log("회원등록 응답 result:", result);
		                
		                // JSON 파싱
		                //var response = JSON.parse(result);
						//console.log("회원등록 response:", response);

		                if (response.error == 'N') {
		                    alert("회원 등록이 완료되었습니다.");
		                    location.href = '/loginForm.do';
		                } else if (response.error == 'Y') {
		                    alert('회원등록 실패: ' + response.errorMsg);
		                    location.href = '/joinForm.do';
		                }
					},
					error: function() {
		                alert("회원가입 중 오류가 발생했습니다.");
		            }
				});
			}
			
			
			
		})// 회원등록 버튼 클릭 끝
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

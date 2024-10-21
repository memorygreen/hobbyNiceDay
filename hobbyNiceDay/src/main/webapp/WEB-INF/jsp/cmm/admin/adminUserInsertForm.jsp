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
	    background-color: #007bff;
	    color: white;
	}
	
	
	/*id 중복확인 버튼 */
	.button-list .btn {
    margin-bottom: 0px;
    margin-right: 0px;
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
                        <div class="page-header">
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
                                                <a href="index.html"> <i class="fa fa-home"></i> </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">회원 관리 > </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">회원 등록</a>
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
                                    
                                    
                                    	<!-- 툴팁 시작 -->
                                    	<div class="row">
                                            <div class="col-sm-6">
                                                <!-- Tooltip on button card start -->
                                                <div class="card button-page o-visible">
                                                    <div class="card-header">
                                                        <h5>Tooltip</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <ul>
                                                            <li>
                                                                <button type="button" class="btn btn-default waves-effect" data-toggle="tooltip" data-placement="top" title="tooltip on top">Top
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button type="button" class="btn btn-primary waves-effect waves-light" data-toggle="tooltip" data-placement="left" title="tooltip on left">Left
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button type="button" class="btn btn-success waves-effect waves-light" data-toggle="tooltip" data-placement="right" title="tooltip on right">right
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button type="button" class="btn btn-warning waves-effect waves-light" data-toggle="tooltip" data-placement="bottom" title="tooltip on bottom">bottom
                                                                </button>
                                                            </li>
                                                            <li>
                                                                <button type="button" class="btn btn-info waves-effect waves-light" data-toggle="tooltip" data-html="true" title="<em>Tooltip</em> <u>with</u> <b>HTML</b>">Html Tooltip
                                                                </button>
                                                            </li>
                                                        </ul>
                                                        
                                                        
                                                        <!-- notifiacation 추가 -->
                                                        <div class="row">
	                                                        <div class="col-sm-12">
		                                                        <ul class="notifications">
			                                                       	<li>
			                                                            <button class="btn btn-primary waves-effect" data-type="inverse" data-from="top" data-align="center" data-icon="fa fa-comments">Top Center</button>
			                                                        </li>
		                                                        </ul>
	                                                        </div>
                                                   
	                                                    </div>
	                                                    <!-- notifiacation 추가 끝 -->
	                                                    
                                                    </div>
                                                </div>
                                                <!-- Tooltip on button card end -->
                                            </div>
                                            
                                            
                                            <div class="col-sm-6">
                                                <!-- Tooltip on popover card start -->
                                                <div class="card o-visible">
                                                    <div class="card-header">
                                                        <h5>Popover</h5>
                                                    </div>
                                                    <div class="card-block tooltip-pop button-list">
                                                        <button type="button" class="btn btn-default waves-effect" data-toggle="popover" data-placement="top" title="" data-content="top by popover" data-original-title="tooltip on top">Top
                                                        </button>
                                                        <button type="button" class="btn btn-primary waves-effect waves-light" data-toggle="popover" data-placement="left" title="tooltip on left" data-content="left by popover">Left
                                                        </button>
                                                        <button type="button" class="btn btn-success waves-effect waves-light" data-toggle="popover" data-placement="right" title="tooltip on right" data-content="right by popover">right
                                                        </button>
                                                        <button type="button" class="btn btn-warning waves-effect waves-light" data-toggle="popover" data-placement="bottom" title="tooltip on bottom" data-content="bottom by popover">bottom
                                                        </button>
                                                        <button type="button" class="btn btn-info waves-effect waves-light" data-toggle="popover" data-html="true" data-placement="top" title="<em>Tooltip</em> <u>with</u> <b>HTML</b>"
                                                            data-content="tooltip by HTML">Html Tooltip
                                                        </button>
                                                    </div>
                                                </div>
                                                <!-- Tooltip on popover card end -->
                                            </div>
                                            
                                            <div class="col-sm-12 ">
                                                <!-- Tooltips on textbox card start -->
                                                <div class="card o-visible">
                                                    <div class="card-header">
                                                        <h5>회원 등록</h5>
                                                    </div>
                                                    
                                                    <form id="joinForm" name="joinForm" method="post">
                                                    
                                                    <div class="card-block tooltip-icon button-list">
                                                    
	                                                    <div class="input-group-wrapper"> <!-- 자영 추가 -->
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
		                                                            <label class="input-group-text" for="userId">
		                                                            	<i class="icofont icofont-user-alt-3">  아이디</i>
		                                                            </label>
	                                                            </span>
	                                                            <input type="text" id="userId" name="userId" class="form-control" placeholder="id를 입력해주세요" title="id를 입력해주세요"  data-toggle="tooltip" required>
	                                                            
																<!-- <a href="#" id="userIdCk" class="primary-btn" />ID중복확인</a> --> 
																<button id="userIdCk"  class="btn btn-inverse waves-effect waves-light">ID 중복확인</button>
																<br/>
	                                                            <span id="userIdMsg"></span><!-- 중복 체크 결과를 표시할 영역 -->
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="userName">
	                                                            	<i class="icofont icofont-ui-email">  이름</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="userName" name="userName" class="form-control" placeholder="이름을 입력해주세요" title="이름을 입력해주세요"  data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="userSe">
	                                                            	<i class="icofont icofont-ui-email">  회원구분</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="userSe" name="userSe" class="form-control" placeholder="회원구분을 선택해주세요" title="회원구분을 선택해주세요"  data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="passwd">
	                                                            	<i class="icofont icofont-ui-email">  비밀번호</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="passwd" name="passwd" class="form-control" placeholder="비밀번호를 입력해주세요" title="비밀번호를 입력해주세요"  data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="passwdCk">
	                                                            	<i class="icofont icofont-ui-email">  비밀번호</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="passwdCk" name="passwdCk" class="form-control" placeholder="비밀번호를 확인해주세요" title="비밀번호를 확인해주세요" data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                       
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="brthdy">
	                                                            	<i class="icofont icofont-ui-email">  생년월일</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="date" id="brthdy" name="brthdy" class="form-control" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요" data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                         <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="mbtlnum">
	                                                            	<i class="icofont icofont-ui-email">  휴대전화</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="mbtlnum" name="mbtlnum" class="form-control" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요" data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="email">
	                                                            	<i class="icofont icofont-ui-email">  이메일</i>
	                                                           	</label>
	                                                           	</span>
	                                                            <input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" title="이메일을 입력해주세요" data-toggle="tooltip" required>
	                                                        </div>
	                                                        
	                                                        <div class="input-group">
	                                                            <span class="input-group-prepend" id="name">
	                                                            <label class="input-group-text" for="sex">
	                                                            	<i class="icofont icofont-ui-email">  성별</i>
	                                                           	</label>
	                                                           	</span>
	                                                            
	                                                            <!-- 
	                                                            <input type="radio" id="sex"  name="sex"  value="여성" class="form-control" placeholder="성별을 입력해주세요" title="성별을 입력해주세요"  data-toggle="tooltip" required>
	                                                        	 -->
	                                                        	<!--
	                                                        	<input type="radio" id="sex"  name="sex"  value="남성" class="form-control" placeholder="성별을 입력해주세요" title="성별을 입력해주세요"  data-toggle="tooltip" required>
	                                                        	 -->
	                                                        	
	                                                        	<div class="gender-buttons">
																    <!-- 성별 선택 -->
																    <div class="input-group btn-radio">
																        <input type="radio" id="male" name="sex" value="남성" required>
																        <label for="male">남성</label>
																    </div>
																    <div class="input-group btn-radio">
																        <input type="radio" id="female" name="sex" value="여성" required>
																        <label for="female">여성</label>
																    </div>
																 </div>
																 
																
																<!-- 
	                                                        	<button type="button" class="btn btn-default waves-effect" data-toggle="popover" data-placement="top" title="" data-content="top by popover" 
	                                                        		data-original-title="tooltip on top">Top
                                                        		</button>
	                                                        	 -->
	                                                        </div>
	                                                        <!-- 전송버튼 -->
	                                                        <!-- <button type="button" class="btn btn-primary waves-effect waves-light m-r-20" data-toggle="tooltip" data-placement="right" title="submit">Submit
	                                                        </button>
	                                                        -->  
	                                               		 	<!-- Tooltips on textbox card end -->
	                                            		</div>
	                                            	</div> <!-- 자영 추가 -->
	                                            	
	                                            	
                                        		</div>
	                                        </div>
	                                        
	                                        
	                                        <div class="col-sm-12">
                                                <!-- Tooltips on textbox card start -->
                                                <div class="card o-visible">
                                                    
                                                    <div class="card-block tooltip-icon button-list">
                                                        <!-- 전송버튼 -->
                                                        <button type="button" id="joinBtn" class="btn btn-primary waves-effect waves-light m-r-20" data-toggle="tooltip" data-placement="right">등록</button>
                                                           
                                            		</div>
                                        		</div>
                                            	<!-- Tooltips on textbox card end -->
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

    <!-- Warning Section Starts -->
    
    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="js/admin/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="js/admin/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="js/admin/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="js/admin/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="assets/pages/waves/js/waves.min.js"></script>
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
		
		// id 중복 확인
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
		
		// 회원가입 버튼 클릭 시 
		$('.joinBtn').click(function(e) {
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
				alert('비밀번호를 다시 확인해주세요!');
				$('#passwdCk').focus();
				return false;
			}
			
			if(!$('input:radio[name=sex]').is(":checked")){
				alert("성별을 선택해주세요.");
				$('#sex').focus();
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
			
			if ($.trim($('#email').val()) == '' ){
				alert('이메일을 입력해주세요.');
				$('#email').focus();
			}
			/*else if ($.trim($('#email').val()) != '' && !ValidEmail($.trim($('#email').val()))) {
				alert('이메일 : 잘못된 이메일 형식입니다.');
				$('#email').focus();
				return;
			}*/
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			
			
			if (confirm("회원가입을 하시겠습니까?")) {
				var form = $('#joinForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'joinUser.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(result){
						console.log("회원가입 응답 result:", result);
		                
		                // JSON 파싱
		                var response = JSON.parse(result);
						console.log("회원가입 response:", response);

		                if (response.error == 'N') {
		                    alert("회원가입되었습니다.");
		                    location.href = '/loginForm.do';
		                } else if (response.error == 'Y') {
		                    alert('회원가입 실패: ' + response.errorMsg);
		                    location.href = '/joinForm.do';
		                }
					},
					error: function() {
		                alert("회원가입 중 오류가 발생했습니다.");
		            }
				});
			}
			
			
			
		})// 회원가입 버튼 클릭 끝
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

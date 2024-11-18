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
<!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="Codedthemes" />
<!-- Favicon icon -->
<link rel="icon"
	href="<c:url value='/images/admin/images/favicon.ico' />"
	type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet"
	href="<c:url value='/pages/admin/pages/waves/css/waves.min.css" type="text/css' />"
	media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin/css/bootstrap/css/bootstrap.min.css' />">
<!-- waves.css -->
<link rel="stylesheet"
	href="<c:url value='/pages/admin/pages/waves/css/waves.min.css' />"
	type="text/css" media="all">
<!-- themify icon -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/images/admin/icon/themify-icons/themify-icons.css' />">
<!-- font-awesome-n -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin/css/font-awesome-n.min.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin/css/font-awesome.min.css' />">
<!-- scrollbar.css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin/css/jquery.mCustomScrollbar.css' />">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admin/css/style.css' />">

<style>
/* 라벨 색상 변경 */
.input-group-append .input-group-text, .input-group-prepend .input-group-text
	{
	background-color: #32589d;
	border-color: rgba(0, 0, 0, 0.15);
}
</style>

</head>

<body>

	<!-- JSTL을 사용하여 세션에서 userId 확인 -->
	<c:set var="userVO" value="${sessionScope.userVO}" />
	<c:set var="isLoggedIn" value="${not empty userVO.userId}" />


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


			<!--header 상단 네비게이션 바-->
			<!-- 		            
					<nav class="navbar header-navbar pcoded-header">
					
					
					    <div class="navbar-wrapper">
					        <div class="navbar-logo">
					            <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
					                <i class="ti-menu"></i>
					            </a>
					            <div class="mobile-search waves-effect waves-light">
					               
					            </div>
					            <a href="/adminMain.do">
					                <img class="img-fluid" src="images/img/logo_hobby_nice_day.png" alt="Theme-Logo" />
					            </a>
					            <a class="mobile-options waves-effect waves-light">
					                <i class="ti-more"></i>
					            </a>
					        </div>
					        <div class="navbar-container container-fluid">
					            
					            <ul class="nav-right">
					            	<a href="/cmm/main/mainPage.do">사용자 페이지 이동 </a>
					                
					            </ul>
					        </div>
					    </div>
					</nav>-->
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
						<div class="page-header" style="background-color: #20263b;">
							<!-- 페이지 헤더 배경색상 -->
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">로그인</h5>
											<p class="m-b-0">관리자 계정으로 로그인 해주세요</p>
										</div>
									</div>
									<div class="col-md-4">
										<ul class="breadcrumb">
											<li class="breadcrumb-item"><a href="/adminMain.do">
											</a></li>
											<li><a href="#!">로그인 페이지</a></li>
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
														<h5>관리자 로그인</h5>
														<span>관리자 로그인 페이지입니다. <code>TB_USER</code></span>

													</div>

													<form id="loginForm" name="loginForm" method="post">

														<div class="card-block table-border-style">
															<div class="table-responsive"
																style="margin-left: 300px; margin-right: 300px;">

																<table class="table table-hover" style="width: 50%;">
																	<thead>
																		<tr>
																			<th colspan="2"><span
																				class="input-group-prepend" id="name"> <label
																					class="input-group-text" for="userId"> <i
																						class="icofont icofont-user-alt-3"> 아이디</i>
																				</label>
																			</span> <input type="text" id="userId" name="userId"
																				class="form-control" autocomplete="new-password"
																				data-toggle="tooltip" required> </br> <span
																				class="input-group-prepend" id="name"> <label
																					class="input-group-text" for="userpasswdName">
																						<i class="icofont icofont-ui-email"> 비밀번호</i>
																				</label>
																			</span> <input type="password" id="passwd" name="passwd"
																				class="form-control" autocomplete="new-password"
																				data-toggle="tooltip" required></th>
																		</tr>



																		<tr>
																			<td colspan="2">

																				<button type="button" id="loginBtn"
																					class="btn waves-effect  waves-light m-r-20"
																					style="width: 100%; background-color: #32589d; color: white;"
																					data-toggle="tooltip" data-placement="right">로그인</button>

																				<!-- 취소 --> <!-- class="btn btn-danger waves-effect waves-light" -->
																				<!-- <button type="button" id="ListBtn" class="btn btn-danger waves-effect waves-light">목록</button> -->

																				<div style="text-align: center; margin-top: 10px;">
																					<a href="/" style="margin-right: 20px;">사용자 페이지</a> 
																					<a href="/joinForm.do" data-toggle="tooltip" data-placement="right">회원가입</a>
																				</div>

																			</td>

																		</tr>

																	</thead>

																</table>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- row 끝  -->
										<!-- Page-body end -->
									</div>
								</div>
								<!-- page-wrapper -->
								<!-- Main-body end -->

								<div id="styleSelector"></div>

								<!--  -->
							</div>
						</div>
						<!-- pcoded-inner-content -->
					</div>
				</div>
			</div>
			<!-- pcoded-main-container -->
		</div>
	</div>
	<!-- pcoded -->
	<!-- Warning Section Starts -->
	<!-- Warning Section Ends -->



	<script>
		//페이지 로드가 완료되면
		if (window.addEventListener)
			window.addEventListener("load", userData, false);
		else if (window.attachEvent)
			window.attachEvent("onload", userData);
		else
			window.onload = userData;
		// var userIdCk = false;
		function userData() {

			// 입력제한

			//id 입력제한
			$('#userId')
					.on(
							'input',
							function() {
								// id 정규표현식 : 영어 대소문자, 숫자만 허용
								let validChars = /^[A-Za-z0-9]*$/;

								// 현재입력된 id
								let userId = $(this).val();

								// 제한된 문자 입력 or 15글자 초과 -> 수정
								if (!validChars.test(userId)
										|| userId.length > 15) {
									// 불필요한 문자 제거, 15글자 초과시 15글자로 제한
									$(this).val(
											userId.replace(/[^A-Za-z0-9]/g, '')
													.substring(0, 15));

									// 15글자 이상 -> 메시지 
									$('#userIdMsg')
											.text(
													"ID는 영어 대소문자와 숫자만 허용하며 최대 15글자까지 입력 가능합니다.")
											.css("color", "red");
								} else {
									$('#userIdMsg').text(""); // 조건만족 시 메시지 제거
								}
							});

			// 비밀번호 입력제한

			// 비밀번호 유효성 검증 정규식: 공백 제외, 영문자, 숫자, 특수문자 포함 8~15자
			const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])[A-Za-z0-9!@#$%^*+=-]{8,15}$/;

			$('#passwd')
					.on(
							'input',
							function() {
								let password = $(this).val();

								// 공백 or 15글자 초과 시 삭제
								password = password.replace(/\s/g, '')
										.substring(0, 15);
								$(this).val(password);

								// 정규표현식 확인
								if (!passwordRegEx.test(password)) {
									$('#userPasswdMsg')
											.text(
													"비밀번호는 공백 없이 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.")
											.css("color", "red");
								} else {
									$('#userPasswdMsg').text(""); // 메시지 삭제
								}
							});

			/************************/
			// 로그인 버튼 클릭 시 
			$('#loginBtn').click(function(e) {
				e.preventDefault();

				if ($.trim($('#userId').val()) == '') {
					alert('아이디를 입력해주세요.');
					$('#userId').focus();
					return false;
				}

				if ($.trim($('#passwd').val()) == '') {
					alert('비밀번호를 입력해주세요');
					$('#passwd').focus();
					return false;
				}

				// 유효성 검사 - 미입력

				if (requiredEmpty()) {
					return;
				}

				if (confirm("관리자페이지 로그인을 하시겠습니까?")) {
					var form = $('#loginForm')[0];
					var formData = new FormData(form);

					$.ajax({
						url : 'loginUser.do',
						processData : false,
						contentType : false,
						data : formData,
						type : 'POST',
						success : function(response) {
							//console.log("회원가입 응답 result:", result);

							// JSON 파싱
							// var response = JSON.parse(result);
							// console.log("로그인 response:", response);

							if (response.error == 'N') {
								
								// location.href = '/adminMain.do';
								//location.href = 'adminReservationStat.do' // 예약현황 페이지로 이동
								
								
		                    	console.log("response.userSe : ", response.userSe)
								
								// 로그인 성공 시 서버에서 보내준 userSe 값을 가져와 분기
			                     // 서버에서 반환된 userSe 값에 따라 분기
			                    if (response.userSe === 'admin') {
			                    	console.log("관리자 경우")
									alert('관리자페이지 로그인 성공');
									location.href = 'adminReservationStat.do'; // 관리자 페이지로 이동
			                    } else {
			                    	console.log("일반 사용자 경우")
									
			                    	alert('관리자 권한이 없어 사용자 페이지로 이동합니다.');
			                        location.href = '/'; // 일반 사용자 페이지로 이동
			                    }
								
							} else if (response.error == 'Y') {
								 alert('관리자 로그인 실패: ' + response.errorMsg);
								location.href = '/adminLogin.do';
							}
						},
						error : function() {
							alert("로그인 중 오류가 발생했습니다.");
						}
					});
				}

			})// 로그인 버튼 클릭 끝
		}

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
	<!-- Required Jquery -->
	<script type="text/javascript" src="js/admin/js/jquery/jquery.min.js "></script>
	<script type="text/javascript"
		src="js/admin/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript"
		src="js/admin/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="js/admin/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="pages/admin/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="js/admin/js/jquery-slimscroll/jquery.slimscroll.js"></script>

	<!-- slimscroll js -->
	<script src="js/admin/js/jquery.mCustomScrollbar.concat.min.js "></script>

	<!-- menu js -->
	<script src="js/admin/js/pcoded.min.js"></script>
	<script src="js/admin/js/vertical/vertical-layout.min.js "></script>

	<script type="text/javascript" src="js/admin/js/script.js "></script>

	<!--공통 컴포넌트 불러오기-->



</body>

</html>

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
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>경량환경 단순홈페이지 템플릿 (자영 : 회원가입)/ Male-Fashion | Template</title>

<!-- 전자정부 프레임워크 기본 -->
<!-- <link href="<c:url value='/'/>css/common.css" rel="stylesheet"
	type="text/css">
	<link href="<c:url value='/'/>css/login.css" rel="stylesheet"
	type="text/css"> -->


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- 템플릿 -->
<!-- Css Styles -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/css/font-awesome.min.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/elegant-icons.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/nice-select.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/css/owl.carousel.min.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/slicknav.min.css' />"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/css/style.css' />"
	type="text/css">


<script type="text/javascript">
	
</script>

<style>

/*약관동의*/
.terms_wrap {
	height: 230px;
	overflow: auto;
	border: 1px solid #eaebed;
	padding: 30px 15px;
	margin-bottom: 15px;
}

.terms_wrap h5 {
	font-size: 18px;
}

.terms_wrap h6 {
	font-size: 16px;
	line-height: 1.3;
}
/*약관동의 체크박스*/
.terms_agree {
	text-align: center;
	padding: 20px 10px;
	margin-top: 20px;
	border-top: 1px solid #eaebed;
	border-bottom: 1px solid #eaebed;
	background: #f1f7ff;
}

.terms_agree .title {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	margin-top: -6px;
	font-weight: 400;
	font-size: 15px;
	line-height: 1.3;
}

@media all and (min-width:640px) {
	.terms_wrap {
		padding: 30px;
	}
}

/*SIGN IN 글씨*/
.jy_page_title span {
	color: #e53637;
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-bottom: 15px;
	display: block;
}

.jy_page_title {
	text-align: left;
	margin-bottom: 40px;
	font-size: 48px;
	margin-bottom: 18px;
	color: #111111;
	font-weight: 700;
	line-height: 46px;
	margin: 0;
}

/*231026추가*/
.terms_wrap2 {
	padding: 2rem;
}
/*231026추가 끝*/


/*성별 라디오 버튼*/
.checkout__input input {
    height: 50px;
    width: 100%;
    border: 1px solid #e1e1e1;
    font-size: 14px;
    color: #b7b7b7;
    padding-left: 20px;
    margin-bottom: 20px;
}

/*input 태그 포커스 */
.checkout__input input:focus {
    border-color: #000; /* 테두리를 검정색으로 변경 */
    outline: none; /* 기본 파란색 외곽선 제거 */

}
</style>

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

	<!-- Hero Section Begin -->
	<!-- Hero Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
	<div class="container">
	
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="jy_page_title">
						<!--section-title  -->
						<span>LOGIN</span>
						<h2>로그인</h2>
						<!--  <p>회원정보를 입력해주세요</p>-->
					</div>
				</div>
			</div>
		</div>
		<div class="jy_margin_1" style="height:50px"></div>
		
		<div class="checkout__form">

			<form id="loginForm" name="loginForm" method="post" >
				<input type="hidden" id="userSe" name="userSe" value="user"><!-- 사용자 구분(일반사용자) -->
				
				<div class="jy_margin_1" style="height:50px"></div>
				
				<!-- 회원가입 폼 시작 -->
				<h6 class="checkout__title">회원정보 입력</h6>
				<div class="row">
					<div class="col-lg-6">
						<div class="checkout__input">
							<p>ID<span>*</span></p>
							<input type="text" id="userId" name="userId" autocomplete="new-password" required /> 
							
						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout__input">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="checkout__input">
							<p>비밀번호<span>*</span></p>
							<input type="password" id="passwd" name="passwd" autocomplete="new-password" required />
						</div>
					</div>
					
				</div>


				


		</div>
		<!-- checkout Form 끝 -->

		</form>

		<button type="reset" class="primary-btn">취소</button>
		
		<a href="#" class="primary-btn loginBtn">로그인</a>
		<a href="/" id="listBtn" class="primary-btn listBtn">목록</a>
	

		<!-- 회원가입 폼 끝-->


	</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Banner Section Begin -->
	<section class="banner spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 offset-lg-4">
				<div class="banner__item"></div>
			</div>

		</div>
	</div>
	</section>
	<!-- Banner Section End -->

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
		
		// 사용자ID 중복체크 - 가져옴
		
		/*
		$('#userIdCk').click(function(e) {
			e.preventDefault();
			var userId = $('#userId').val();
		    console.log("userId: ", userId);  // 입력한 ID 확인
		    if ($.trim(userId) != '') {
				$.post('joinIdCheck.do', {'userId':$('#userId').val()}).done(function(data) {
					console.log("AJAX 응답: ", data);  // 응답 데이터 확인
					if (data.error == 'N') {
						idCheck = true;
						alert('사용가능한 아이디 입니다.');
						$('#userId').prop('readonly', true);
					} else {
						idCheck = false;
						alert(data.errorMsg);
					    console.log("data.errorMsg: ", data.errorMsg);  // 입력한 ID 확인

						$('#userId').prop('readonly', false);
						$('#userId').focus();
					}
				}).fail(function() {
		            alert("AJAX 요청에 실패했습니다.");
		        });
			} else {
				idCheck = false;
		        alert('ID가 중복인지 확인하세요.');
			}
		});
		*/
		
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
		
		

		
		// 로그인 버튼 클릭 시 
		$('.loginBtn').click(function(e) {
			e.preventDefault();
			
			if ($.trim($('#userId').val()) == ''){
				alert('아이디를 입력해주세요.');
				$('#userId').focus();
				return false;
			}
			
			//var groupId = $("input[name='groupId']:checked").val();
			if ($.trim($('#passwd').val()) == ''){
				alert('비밀번호를 입력해주세요');
				$('#passwd').focus();
				return false;
			}
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			

			
			
			// 전자정부에서 가져온 함수
			
			<!--
			function actionLogin() {

			    if (document.loginForm.id.value =="") {
			        alert("아이디를 입력하세요");
			        return false;
			    } else if (document.loginForm.password.value =="") {
			        alert("비밀번호를 입력하세요");
			        return false;
			    } else {
			        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
			        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
			        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
			        document.loginForm.submit();
			    }
			}

			function setCookie (name, value, expires) {
			    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
			}

			function getCookie(Name) {
			    var search = Name + "="
			    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
			        offset = document.cookie.indexOf(search)
			        if (offset != -1) { // 쿠키가 존재하면
			            offset += search.length
			            // set index of beginning of value
			            end = document.cookie.indexOf(";", offset)
			            // 쿠키 값의 마지막 위치 인덱스 번호 설정
			            if (end == -1)
			                end = document.cookie.length
			            return unescape(document.cookie.substring(offset, end))
			        }
			    }
			    return "";
			}

			function saveid(form) {
			    var expdate = new Date();
			    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
			    if (form.checkId.checked)
			        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
			    else
			        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			    setCookie("saveid", form.id.value, expdate);
			}

			function getid(form) {
			    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
			}

			function fnInit() {
			    var message = document.loginForm.message.value;
			    if (message != "") {
			        alert(message);
			    }
			    getid(document.loginForm);
			}
			//-->
			
			
			
			
			if (confirm("로그인을 하시겠습니까?")) {
				var form = $('#loginForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'loginUser.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(result){
						//console.log("회원가입 응답 result:", result);
		                
		                // JSON 파싱
		                var response = JSON.parse(result);
						console.log("로그인 response:", response);

		                if (response.error == 'N') {
		                    alert("로그인되었습니다.");
		                    location.href = '/';
		                } else if (response.error == 'Y') {
		                    alert('로그인 실패: ' + response.errorMsg);
		                    location.href = '/loginForm.do';
		                }
					},
					error: function() {
		                alert("로그인 중 오류가 발생했습니다.");
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

	<!-- Js Plugins -->
	<!--<jsp:include page="/WEB-INF/jsp/main/inc/commonJsPlugins.jsp" />-->
	<script src="<c:url value='/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/js/jquery.nicescroll.min.js' />"></script>
	<script src="<c:url value='/js/jquery.magnific-popup.min.js' />"></script>
	<script src="<c:url value='/js/jquery.countdown.min.js' />"></script>
	<script src="<c:url value='/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	<!--공통 컴포넌트 불러오기-->

</body>
</html>

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
<title>HobbyNiceDay</title>

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

<!-- 네아로 SDK
(1) LoginWithNaverId Javascript SDK
 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 
 <!--  카카오 로그인 sdk -->
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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


/*241030 수 임시 일반로그인 표*/
/*
.generalLoginTable tr{
	border: 1px solid #000;
}

.generalLoginTable td{
	border: 1px solid #000;
}*/

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
				<div class="row">
					<div class="col-lg-7">
					<h6 class="checkout__title">일반 로그인</h6>
					
						<table style="width: 100%; " class="generalLoginTable"> <!-- border: 1px solid #000; border-collapse: collapse; -->
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>ID<span>*</span></p>
										<input type="text" id="userId" name="userId" autocomplete="new-password" required placeholder="ID를 입력해주세요"/> 
										
									</div>
								</td>
								<td rowspan="2" >
									<a href="#" class="primary-btn loginBtn">로그인</a>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>비밀번호<span>*</span></p>
										<input type="password" id="passwd" name="passwd" autocomplete="new-password" required  placeholder="비밀번호를 입력해주세요"/>
									</div>
								
								</td>
							</tr>
							
							<tr>
								<td colspan="2"  style="text-align: center;">
									<a href="/joinForm.do" id="joinBtn" style="margin-right: 30px;"><span>회원가입</span></a>
									<span>      </span>
									<a href="/" id="listBtn" style="margin-left: 30px;">메인화면</a></td> <!--class="primary-btn listBtn"  -->
								</td>
							</tr>
						</table>
						
						
						
						
					</div>
					<div class="col-lg-5">
					
						<h6 class="checkout__title">sns 로그인</h6>
						
						<!-- 네이버 로그인 버튼 생성 위치 -->
				   		<div id="naverIdLogin"></div>
				   		<div id="naver_id_login"></div>
				   		
				   		<!-- 카카오 로그인 버튼  -->
				   		<div class="kakao-btn" onclick="kakaoLogin()"> 
				    		<a>
				    			<img src="<c:url value='/images/img/kakao_login_medium_wide.png' />" alt="카카오 로그인 버튼" >
				    		</a>
						
						</div>
					</div>
					
				</div>


		</div>
		<!-- checkout Form 끝 -->

		</form>
		
   		
		<!-- 로그인 폼 끝-->


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
		          $('#userIdMsg').text("ID는 영어 대소문자와 숫자만 허용하며 최대 15글자까지 입력 가능합니다.").css("color", "red");
		      } else {
		          $('#userIdMsg').text(""); // 조건만족 시 메시지 제거
		      }
 		 });
		
		  
		  // 비밀번호 입력제한
		  
		// 비밀번호 유효성 검증 정규식: 공백 제외, 영문자, 숫자, 특수문자 포함 8~15자
		  const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9])[A-Za-z0-9!@#$%^*+=-]{8,15}$/;

		  $('#passwd').on('input', function() {
			    let password = $(this).val();
			    
			    // 공백 or 15글자 초과 시 삭제
			    password = password.replace(/\s/g, '').substring(0, 15);
			    $(this).val(password);
			    
			    // 정규표현식 확인
			    if (!passwordRegEx.test(password)) {
			        $('#userPasswdMsg').text("비밀번호는 공백 없이 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.").css("color", "red");
			    } else {
			        $('#userPasswdMsg').text(""); // 메시지 삭제
			    }
			});
		
	    
	    // 카카오 로그인 관련 
		window.Kakao.init("5dd23d272be8396574b776bacd38ec63") // restAPI키 : 4GG6BZHFVLLPXEYSzoytVtdziZHbhM0i//  js 키 : 5dd23d272be8396574b776bacd38ec63 // 7a4940699916889409beca8302597c24 (?)
		console.log("카카오  SDK 초기화 여부 확인 : ", Kakao.isInitialized()); // SDK 초기화 여부 확인
				// 출처 : https://velog.io/@eksql3835/Spring-Security%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EA%B8%B0%EB%8A%A5SNS%EB%A1%9C%EA%B7%B8%EC%9D%B8-API
			
		/*		
		function getCookie(name) {
		    var parts = document.cookie.split(name + '=');
		    if (parts.length === 2) { return parts[1].split(';')[0]; }
		  }
		*/
		
				
				
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
			

			
			if (confirm("로그인을 하시겠습니까?")) {
				var form = $('#loginForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'loginUser.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'json',
					//success: function(result){
					success: function(response){
						//console.log("회원가입 응답 result:", result);
		                
		                // JSON 파싱
		                //var response = JSON.parse(result);
						//console.log("로그인 response:", response);

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
			
			
			
		})// 로그인 버튼 클릭 끝
		
		
	};// 전체 불러오기 끝
		

	// 네이버 로그인 관련
	
	/*동의하기 페이지 url
	https://nid.naver.com/oauth2.0/authorize
	?response_type=token
			&client_id=nTM2zP9ui0F2yerONFez
			&state=da8fda31-d2b0-4859-a09b-32aaf9fec26f
			&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2Fcallback
			&version=js-2.0.0
			&svctype=1
	*/
	
	// 오류 페이지 코드
	/* http://localhost:8080/user/callback
	#access_token=AAAAPg67DuD_U8MPFclHg__juHEl1WIvinr58yh8IS3m1MGiiuDWNbNCPzMjNjeK30nOnL3IIlASUtsYgIZo_37FeQA
	&state=da8fda31-d2b0-4859-a09b-32aaf9fec26f&
	token_type=bearer&
	expires_in=3600
	*/
	
	
	console.log("네이버 타는지 확인 ")
	// (2) LoginWithNaverId Javascript 설정 정보 및 초기화
	var naverLogin = new naver.LoginWithNaverId(
	    {
	        clientId: "nTM2zP9ui0F2yerONFez", // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
	        callbackUrl: "http://localhost:8080/joinExtlUsrNaverForm.do", // 본인의 callBack url로 수정하세요.
	        isPopup: true, // 팝업을 통한 연동처리 여부
	        loginButton: {color: "white", type: 3, height: 60},  // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
	    	// callbackHandle: true // callback 페이지가 분리되었을 경우에 callback처리를 해줄 수 있도록 설정
	    }
    );
	console.log("네이버 동의하기", naverLogin)
	// (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출
	naverLogin.init();
	console.log("네이버 초기화")

	
	// 새로 다시 넣어보기
	/*
	var naver_id_login = new naver_id_login("nTM2zP9ui0F2yerONFez", "http://localhost:8080/cmm/user/loginUsr.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,50);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	
  	naver_id_login.init_naver_id_login();
  	*/
	
	// gpt 의 솔루션
	/*
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "nTM2zP9ui0F2yerONFez", // 본인의 Client ID로 수정
        callbackUrl: "http://localhost:8080/user/callback", // 콜백 URL 설정
        isPopup: false, // 팝업 방식이 아닌 페이지 리다이렉트 방식으로 설정
        loginButton: {color: "green", type: 3, height: 50}, // 버튼 설정
        callbackHandle: true
    });
    naverLogin.init(); // 네이버 로그인 초기화

    // 버튼을 페이지에 추가
    naverLogin.setButton("green", 3, 50);
    */
	
	// 카카오 로그인
	// 출처 : https://velog.io/@dev_h_o/Spring-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EB%A1%9C%EA%B7%B8%EC%9D%B8-api-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0REST-API
	/*function kakaoLogin() {
			$.ajax({
				 url:'/memberLoginForm/getKakaoAuthUrl',
				 type:'post',
				 async: false,
				 dataType: 'text',
				 success: function (res) {
				   location.href = res;
				 }
			});
		}
    */
	/*******************/
	// 전역 설정
		
		// 카카오 로그인 관련
		function kakaoLogin(){
			console.log("kakaoLogin 함수 타는 지 확인 ")
			Kakao.Auth.login({
			//window.Kakao.Auth.login({
				success: function(authObj){
				console.log("로그인 성공", authObj) // 여기 탔다!
				
				// 서버로 액세스 토큰 전송
              		sendTokenToServer(authObj.access_token);
				
			    Kakao.Auth.authorize({
				      //redirectUri: 'http://localhost:8080/kakaoCallback'// 'http://localhost:8081/controller/ProductList.do', //
				      redirectUri: 'http://localhost:8080/joinExtlUsrForm.do'
				    });
				
				}
				});
			}

			
			// 카카오 엑세스 토큰 전달 ajax (gpt추가 )
			function sendTokenToServer(accessToken) {
		        // Ajax를 통해 서버로 액세스 토큰 전달
		        $.ajax({
		            url: '/kakaoCallback', //  'http://localhost:8080/kakaoCallback'
		            type: 'POST',
		            data: { token: accessToken },
		            success: function(response) {
		                window.location.href = '/'; // '/mainPage.do';
		            },
		            error: function(error) {
		                console.log(error);
		            }
		        });
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

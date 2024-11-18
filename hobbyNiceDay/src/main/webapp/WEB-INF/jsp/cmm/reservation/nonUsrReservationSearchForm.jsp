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

<style>



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




/*input 태그 포커스 */
.checkout__input input:focus {
    border-color: #000; /* 테두리를 검정색으로 변경 */
    outline: none; /* 기본 파란색 외곽선 제거 */

}
.checkout__input input{
   color : #606060;/*input 태그 긆자 색*/
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
						<span>RESERVATION SEARCH</span>
						<h2>비회원 예약정보 조회</h2>
						<!--  <p>회원정보를 입력해주세요</p>-->
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="jy_margin_1" style="height:70px"></div>
		
		<div class="checkout__form">

			<form id="searchForm" name="searchForm" method="post" >
				<input type="hidden" id="userSe" name="userSe" value="user"><!-- 사용자 구분(일반사용자) -->
				
				
				<!-- 회원가입 폼 시작 -->
				<div class="row">
					<div class="col-lg-12 loginFormColClass" style="padding-right:300px;padding-left:300px;" >
					 <h6 class="checkout__title">예약정보 입력</h6>
					
						<table style="width: 100%; " class="generalLoginTable"> <!-- border: 1px solid #000; border-collapse: collapse; -->
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약자명<span>*</span></p>
										<input type="text" id="reservationNm" name="reservationNm" required placeholder="예약자명을 입력해주세요"/> 
										
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 80%;">
									<div class="checkout__input">
										<p>예약일자<span>*</span></p>
										<input type="date" id="reservationDt" name="reservationDt" required placeholder="예약일자를 입력해주세요"/> 
										
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약자 연락처<span>*</span></p>
										<input type="text" id="reservationPhone" name="reservationPhone" required  placeholder="예약자 연락처를 입력해주세요"/>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약자 이메일<span>*</span></p>
										<input type="text" id="reservationEmail" name="reservationEmail" required  placeholder="예약자 이메일을 입력해주세요"/>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<div class="checkout__input">
										<p>예약 비밀번호<span>*</span></p>
										<input type="password" id="reservationPw" name="reservationPw" required
										autocomplete="new-password"	placeholder="예약조회 시 사용할 비밀번호를 입력해주세요">
									</div>
								</td>
							</tr>
							
							
							<tr>
								<td >
									<a href="#" class="primary-btn searchBtn" style="padding: 14px 30px; width: 100%; text-align: center; ">검색</a>
									
								</td>
							</tr>
							
							<!--
							<tr>
								 
								<td>
									<h6 class="checkout__title">SNS 로그인</h6>
								</td>
							</tr>
								 -->
							
							
							
							<tr>
								<td style="text-align: center;">
									</br>
									<a href="/" id="listBtn">메인화면</a>
								</td> 
								
							</tr>
							
							
						</table>
						
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
		
		// 예약버튼 클릭 전 유효성 검사
		
		// 예약자명 입력 제한 및 길이 제한
		  $('#reservationNm').on('input', function() {
		      // 이름 정규식 (한글 or 영어 대소문자만 허용 // 공백x 특수문자x 숫자x)
		      let validChars = /^[ㄱ-ㅎ|가-힣a-zA-Z]*$/;

		      let reservationNm = $(this).val(); // 현재 입력된 이름

		      // 입력불가 문자 입력 시 삭제
		      if (!validChars.test(reservationNm)) {
		          $(this).val(reservationNm.replace(/[^가-힣a-zA-Z]/g, ''));
		          $('#reservationNmMsg').text("이름은 한글 또는 영어 대소문자만 허용됩니다. 공백,특수문자,숫자는 입력할 수 없습니다.").css("color", "red");
		      } 
		      // 글자수 10글자 제한
		      else if (reservationNm.length > 10) { 
		          $(this).val(reservationNm.substring(0, 10));
		          $('#reservationNmMsg').text("이름은 최대 10자까지 입력 가능합니다.").css("color", "red");
		      } else {
		          $('#reservationNmMsg').text(""); // 정규표현식 o -> 메시지 삭제
		      }
		  });
		
		
		// 예약자 연락처 
		// 휴대전화 
		 $('#reservationPhone').on('input', function() {
	        let reservationPhone = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 허용
	        
	        // 글자수 11 제한
	        if (reservationPhone.length > 11) {
	            reservationPhone = reservationPhone.substring(0, 11);
	        }
	        
	        let formattedNumber;
	
	        if (reservationPhone.length <= 3) {
	            formattedNumber = reservationPhone; // 3자리 이하일 경우 그대로 표시
	        } else if (reservationPhone.length <= 7) {
	            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3); // 4~7자리일 경우 3-4 형식
	        } else if (reservationPhone.length <= 10) {
	            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3, 6) + '-' + reservationPhone.slice(6); // 10자리 형식 3-3-4
	        } else {
	            formattedNumber = reservationPhone.slice(0, 3) + '-' + reservationPhone.slice(3, 7) + '-' + reservationPhone.slice(7); // 11자리 형식 3-4-4
	        }
	
	        $(this).val(formattedNumber); // 포맷팅된 번호를 필드에 표시
	    });
			
			
		
		
		// 예약자 이메일 
		// 이메일 입력 제한: 최대 30글자, 공백 허용하지 않음
		 $('#reservationEmail').on('input', function() {
		     let email = $(this).val().replace(/\s/g, ''); // 공백 제거
		     if (email.length > 30) {
		         email = email.substring(0, 30); // 최대 30글자로 제한
		     }
		     $(this).val(email); // 수정된 값 설정
		 });
		
		

		// 비회원 예약자 비밀번호
		// 비밀번호 유효성 검증 정규식: 공백 없이 최대 15자까지 입력 가능. 영어, 숫자, 특수문자(!@#$%^*+=-)만 허용
		  const passwordRegEx = /^[A-Za-z0-9!@#$%^*+=-]{1,15}$/;
		  
		  $('#reservationPw').on('input', function() {
			    let password = $(this).val();
			    
			    // 공백 or 15글자 초과 시 삭제
			    password = password.replace(/\s/g, '').substring(0, 15);
			    $(this).val(password);
			    
			    // 정규표현식 확인
			    if (!passwordRegEx.test(password)) {
			        $('#userPasswdMsg').text("공백 없이 최대 15자까지, 영어, 숫자, 특수문자(!@#$%^*+=-)를 사용하여 입력하세요.").css("color", "red");
			    } else {
			        $('#userPasswdMsg').text(""); // 유효한 경우 메시지 지우기
			    }
			});
			
					
	    /*************************************************/
				
				
		// 검색 버튼 클릭 시 
		$('.searchBtn').click(function(e) {
			e.preventDefault();
			
			if ($.trim($('#reservationNm').val()) == ''){
				alert('예약자명을 입력해주세요');
				$('#reservationNm').focus();
				return false;
			}
			

			if ($.trim($('#reservationDt').val()) == ''){
				alert('예약날짜를 입력해주세요');
				$('#reservationDt').focus();
				return false;
			}
			
			if ($.trim($('#reservationPhone').val()) == ''){
				alert('예약자 연락처를 입력해주세요');
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
				alert('예약자 이메일을 입력해주세요.');
				$('#reservationEmail').focus();
				return false;
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
			
			

			if ($.trim($('#reservationPw').val()) == ''){
				alert('비밀번호를 입력해주세요');
				$('#reservationPw').focus();
				return false;
			}
			
			// 비밀번호 형식 체크 (영문, 숫자, 특수문자 포함 8~15자)
			let reg = /^[A-Za-z0-9!@#$%^*+=-]{1,15}$/;
			if (!reg.test($('#reservationPw').val())) {
			    alert('비밀번호는 공백 없이 최대 15자까지, 영어, 숫자, 특수문자(!@#$%^*+=-)를 사용하여 입력하세요.');
			    $('#reservationPw').focus();
			    return false;
			}
			
			
			// 유효성 검사 - 미입력
			if (requiredEmpty()) {
				return;
			}
			
			if (confirm("예약정보를 검색하시겠습니까?")) {
				var form = $('#searchForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'searchNonUserReservation.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'json',
					success: function(response){
						console.log("검색 응답 response:", response);
						
						
		                if (response.error == 'N') {
		                    console.log("response.message: ", response.message)
		                    
		                    if (response.listData && response.listData.length > 0) {
		                        // 검색 결과가 있을 경우
		                        alert(response.message);
		                        var reservationId = response.listData[0].reservationId;
		                        var encodedUrl = '/usrReservationDetail.do?reservationId=' + reservationId;
		                        console.log("비회원 정보 조회 폼 encodedUrl:", encodedUrl);
		                        location.href = encodedUrl;
		                    } else {
		                        // 검색 결과가 없는 경우
		                        alert(response.message || "입력하신 정보에 해당하는 검색 결과가 없습니다.");
		                    }
		                    
		                    
		                    
		                    
		                } else if (response.error == 'Y') {
		                    alert('비회원 예약정보 조회 실패: ' + response.errorMsg);
		                    //location.href = '/nonUsrReservationSearchForm.do';
		                }
					},
					error: function() {
		                alert("비회원 예약정보 조회 중 오류가 발생했습니다.");
		            }
				});
			}
			
			
			
		})// 로그인 버튼 클릭 끝
		
		
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

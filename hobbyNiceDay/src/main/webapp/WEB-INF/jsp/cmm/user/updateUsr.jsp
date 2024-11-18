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
    color: #606060;
    padding-left: 20px;
    margin-bottom: 20px;
}

/*input 태그 포커스 */
.checkout__input input:focus {
    border-color: #000; /* 테두리를 검정색으로 변경 */
    outline: none; /* 기본 파란색 외곽선 제거 */

/*241030 약관 동의 포커스*/
input[type="checkbox"]:focus {
    outline: 2px solid #e53637; /* 체크박스에 포커스가 있을 때 테두리 색상 */
}

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
						<span>MEMBER INFORMATION EDIT</span>
						<h2>회원정보 수정</h2>
						<p>회원정보를 입력해주세요.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="jy_margin_1" style="height:50px"></div>
		
		<div class="checkout__form">

			<form id="joinForm" name="joinForm" method="post" >
				<!-- 사용자 구분(일반사용자) --> 
				<input type="hidden" id="userSe" name="userSe" value="${userInfo.userSe}" >
				
				
				<div class="jy_margin_1" style="height:50px"></div>
				
				<!-- 회원가입 폼 시작 -->
				<h6 class="checkout__title">회원정보 입력</h6>
				
				
				
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>ID<span>*</span></p>
							<input type="text" id="userId" name="userId" autocomplete="new-password" required value="${userInfo.userId}" readonly /> 
							
						</div>
					</div>
					
					
				</div>
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>이름<span>*</span></p>
							<input type="text" id="userName" name="userName" autocomplete="new-password" value="${userInfo.userName}" readonly required />
							
						</div>
					</div>
					<div class="col-lg-5">
						<div class="checkout__input">
							<br/>
							<br/>
							<span id="userNameMsg"></span>
						</div>
					</div>
				</div>
				
				
				
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>비밀번호<span>*</span></p>
							<input type="password" id="passwd" name="passwd" autocomplete="new-password" required />
							
						</div>
					</div>
					<div class="col-lg-5">
						<div class="checkout__input">
							<br/>
							<br/>
							<p>비밀번호는 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.<p>
							
							<span id="userPasswdMsg"></span>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>비밀번호 확인<span>*</span></p>
							<input type="password" id="passwdCk" name="passwdCk" required />
						</div>
					</div>
					<div class="col-lg-5">
						<div class="checkout__input">
							<br/>
							<br/>
							<!-- 
							<p>비밀번호는 영문, 숫자, 특수문자(!@#$%^*+=-)를 포함한 8~15자로 입력해주세요.<p>
							 -->
							
							<span id="userPasswdCkMsg"></span>
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-lg-7">
						
							<p>성별<span style="color: #e53637;">*</span></p>
							
							<label for="male">
								<input type="radio" id="male" name="sex" value="M"  required
								<c:if test="${userInfo.sex == 'M'}">checked="checked"</c:if> >
							남성</label>
							
							<label for="female">
								<input type="radio" id="female" name="sex" value="F" 
								<c:if test="${userInfo.sex == 'F'}">checked="checked"</c:if> > 
							여성</label>
							
						<div class="input_radio">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-7">
						</br>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>생년월일<span>*</span></p>
							<input type="date" id="brthdy" name="brthdy" required value="${fn:substring(userInfo.brthdy, 0, 10)}">
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input">
							<p>휴대전화<span>*</span></p>
							<input type="text" id="mbtlnum" name="mbtlnum" placeholder="ex. 010-0000-0000"  value="${userInfo.mbtlnum}" required>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-7">
						<div class="checkout__input" >
							<p>이메일<span>*</span></p>
							<input type="text" id="email" name="email"  placeholder="ex. example@example.com"  sytle="width:70%" required  value="${userInfo.email}">
							<!-- 
							<span>@</span>
				            <select id="emailDomainSelect" required>
				                <option value="">도메인 선택</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="naver.com">naver.com</option>
				                <option value="daum.net">daum.net</option>
				                <option value="custom">직접 입력</option>
				            </select>
				            <input type="text" id="emailCustomDomain" name="emailCustomDomain" placeholder="직접 입력" style="display: none;">
							 -->
							
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-lg-12">
						<div class="checkout__input" style="text-align: center;">
							<a href="#" class="primary-btn joinBtn">수정</a>
							<a href="/" id="listBtn" class="primary-btn listBtn" style="background:#7c7c7c;">메인화면</a>
							
							<a href="/" id="deleteBtn" class="primary-btn listBtn" style="background-color:#D85D5D;color:white;border-color:#D85D5D;margin-right:20px;">회원탈퇴</a>
						</div>
					</div>
				</div>

		</div>
		<!-- checkout Form 끝 -->

		</form>

		<!-- <input type="submit" value="회원가입" class="primary-btn" /> -->
		
		
	

		<!-- 회원가입 폼 끝-->


	</div>
	</section>
	<!-- Checkout Section End -->



	<!-- Contact Section Begin -->

	<!-- Contact Section End -->


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

	<!-- Categories Section Begin -->
	<!-- Categories Section End -->

	<!-- Instagram Section Begin -->
	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->
	<!-- Latest Blog Section End -->

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
		
		// 회원구분 선택 이벤트 리스너
		$('.nice-select .list').on('click', '.option', function() {
		    // 선택된 옵션의 data-value 값을 가져옴
		    const selectedValue = $(this).attr('data-value');
		    // 가져온 값을 숨겨진 select 요소에 반영
		    $('#userSe').val(selectedValue);
		    // 화면에 선택된 옵션 텍스트 표시
		    $('.nice-select .current').text($(this).text());
		    // 선택된 옵션 스타일 변경
		    $('.nice-select .option').removeClass('selected');
		    $(this).addClass('selected');
		    // 콘솔에 선택된 회원 구분 값 출력
		    console.log("회원구분: ", $('#userSe').val());
		});
		
		
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
			
			// 이메일 도메인 선택 
			// 도메인 선택 시 발생하는 이벤트
			$('#emailDomainSelect').change(function() {
			    var selectedDomain = $(this).val();
			    
			    // 사용자가 '직접 입력'을 선택한 경우
			    if (selectedDomain === "custom") {
			        // 직접 입력 필드 보이기
			        $('#emailCustomDomain').show().val("").focus();
			    } else {
			        // 직접 입력 필드 숨기고 이메일 값 설정
			        $('#emailCustomDomain').hide().val("");
			        $('#email').val($('#emailLocalPart').val() + "@" + selectedDomain);
			    }
			});
			
			// 이메일의 로컬 부분 입력 시 전체 이메일 값 갱신
			$('#emailLocalPart').on('input', function() {
			    var selectedDomain = $('#emailDomainSelect').val();
			    if (selectedDomain && selectedDomain !== "custom") {
			        $('#email').val($(this).val() + "@" + selectedDomain);
			    }
			});
			
			// 사용자가 직접 입력한 도메인 값으로 이메일 값 갱신
			$('#emailCustomDomain').on('input', function() {
			    $('#email').val($('#emailLocalPart').val() + "@" + $(this).val());
			});
			
			
		/****************************************************/
		
		// 수정 버튼 클릭 시 
		$('.joinBtn').click(function(e) {
			e.preventDefault();
			
			
			
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
			
			
			if (confirm("회원정보를 수정하시겠습니까?")) {
				var form = $('#joinForm')[0];
				var formData = new FormData(form);
				
				$.ajax({
					url: 'adminUserUpdate.do',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					success: function(response){
						//console.log("회원정보 수정 응답 result:", result);
		                
		                // JSON 파싱
		                //var response = JSON.parse(result);
						// console.log("회원정보 수정 response:", response);

		                if (response.error == 'N') {
		                    alert("회원정보 수정 성공 : ", response.message);
		                    location.reload();
		                } else if (response.error == 'Y') {
		                    alert('회원정보 수정 실패: ' + response.errorMsg);
		                    // location.href = '/joinForm.do';
		                    location.reload();
		                }
					},
					error: function() {
		                alert("회원가입 중 오류가 발생했습니다.");
		            }
				});
			}
			
			
			
		})// 회원가입 버튼 클릭 끝
		
		
		
		/******************************************************************/
		// 삭제 버튼 클릭
	    $('#deleteBtn').click(function (e) {
	    	console.log("회원탈퇴 버튼 클릭")
	    	e.preventDefault(); // 기본 링크 동작 방지
	    	
	    	const userId = "${userInfo.userId}" // 클래스 ID 가져오기
	    	console.log("회원탈퇴 버튼 클릭 userId : ", userId)
	    	
	        if (confirm('회원탈퇴를 진행하시겠습니까?')) {
	        	
	            $.ajax({
	                type: 'POST',
	                url: '/adminUserDelete.do',
	                data: { userId: userId },
	                success: function (response) {
	                    console.log("삭제 응답 데이터: ", response); // 응답 데이터를 로그에 출력
	                    
	                    
	                        if (response.error === "N") {
	                            alert(response.message);
	                            location.href = '/'; // 목록 페이지로 이동
	                        } else if (response.error === "Y") {
	                            alert('회원 탈퇴 실패: ' + response.errorMsg); // 실패 시 오류 메시지 표시
	                        }
                    },
	                error: function (xhr) {
	                    console.error("AJAX 요청 실패: ", xhr);
	                    alert('회원탈퇴 중 오류가 발생했습니다: ' + xhr.responseText);
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

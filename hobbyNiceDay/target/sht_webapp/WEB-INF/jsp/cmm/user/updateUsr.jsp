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
.terms_wrap{height:230px; 
			overflow:auto; 
			border:1px solid #eaebed; 
			padding:30px 15px; 
			margin-bottom:15px; }			
.terms_wrap h5{font-size:18px;}
.terms_wrap h6{font-size:16px; 
				line-height:1.3;}
/*약관동의 체크박스*/				
.terms_agree{ text-align:center; 
				padding:20px 10px; 
				margin-top:20px; 
				border-top:1px solid #eaebed; 
				border-bottom:1px solid #eaebed; 
				background:#f1f7ff;}
.terms_agree .title{display:inline-block; 
					vertical-align:middle; 
					margin-right:10px; 
					margin-top:-6px; 
					font-weight:400; 
					font-size:15px; 
					line-height:1.3;}

@media all and (min-width:640px){
	.terms_wrap{padding:30px;}
}

/*231026추가*/
.terms_wrap2{padding:2rem;}
/*231026추가 끝*/

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
	<!-- 
	<section class="hero">

	<div class="hero__slider owl-carousel">

		<div class="hero__items set-bg"
			data-setbg="<c:url value='/images/img/hero/hero-1.jpg' />">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-7 col-md-8">
						<div class="hero__text">
							<h6>SIGN IN</h6>
							<h2>회원가입</h2>
							<p>회원정보를 입력해주세요</p>
							<!-- form태그? --

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</section>
	 -->
	<!-- Hero Section End -->

	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="contact__text">
						<div class="section-title">
							<span>SIGN IN</span>
							<h2>회원가입</h2>
							<p>회원정보를 입력해주세요</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
            
                <form action="#">
                <!-- 이용약관 시작 -->
							<h4>사이트 이용약관</h4>
							<div class="terms_wrap">
								<h5 class=" ml25">제 1 조 (목적)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>본 약관은 하비나이스데이(Hobby Nice Day)가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차,
										이용자와 광주지역 기업지원성과 통합관리 시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로
										합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 2 조 (약관의 효력과 변경)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 귀하가 본 약관 내용에 동의하는 경우 서비스 제공 행위 및 귀하의 서비스 사용
										행위에 본 약관이 우선적으로 적용됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 하비나이스데이(Hobby Nice Day)
										사이트 내에 공지하거나 유선 연락을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.</li>
									<li>이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며
										계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 3 조 (약관 외 준칙)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신
										윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 4 조 (용어의 정의)</h5>
								<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
								<ul class="list_basic lt03 mt10 ml25">
									<li>이용자 : 본 약관에 따라 하비나이스데이(Hobby Nice Day)가 제공하는 서비스를 받는 자.</li>
									<li>가입 : 하비나이스데이(Hobby Nice Day)가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여
										서비스 이용계약을 완료시키는 행위.</li>
									<li>회원 : 하비나이스데이(Hobby Nice Day)에 개인 정보를 제공하여 회원 등록을 한 자로서 하비나이스데이(Hobby Nice Day)가
										제공하는 서비스를 이용할 수 있는 자.</li>
									<li>비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이
										선정한 문자와 숫자의 조합.</li>
									<li>탈퇴 : 회원이 이용계약을 종료시키는 행위.</li>
								</ul>
								<h4 class="mt30">제 2 장 서비스 제공 및 이용</h4>
								<h5 class=" ml25">제 5 조 (이용계약의 성립)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>이용계약은 신청자가 온라인으로 하비나이스데이(Hobby Nice Day)에서 제공하는 소정의 가입신청 양식에서 요구하는
										사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
										<ul>
											<li>① 다른 사람의 명의를 사용하여 신청하였을 때</li>
											<li>② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때</li>
											<li>③ 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때</li>
											<li>④ 하비나이스데이(Hobby Nice Day)를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우</li>
											<li>⑤ 기타 하비나이스데이(Hobby Nice Day)가 정한 이용신청요건이 미비 되었을 때</li>
										</ul>
									</li>
								</ul>
								<h5 class="mt20 ml25">제 6 조 (회원정보 사용에 대한 동의)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
										<ul>
											<li>① 개인정보의 사용 : 하비나이스데이(Hobby Nice Day)의 서비스 제공과 관련해서 수집된 회원의 신상정보를
												본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.<br> 단, 전기통신기본법 등 법률의 규정에
												의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우
												또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 하비나이스데이(Hobby Nice Day)에 제공한 개인정보를
												스스로 공개한 경우에는 그러하지 않습니다.
											</li>
											<li>② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로
												귀하의 개인정보를 수정/삭제할 수 있습니다.</li>
											<li>③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는
												전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는
												안되며, 작업 종료 시에는 반드시 로그아웃해 주시기 바랍니다.</li>
										</ul>
									</li>
									<li>회원이 본 약관에 따라 이용신청을 하는 것은, 하비나이스데이(Hobby Nice Day)에 기재된 회원정보를 수집,
										이용하는 것에 동의하는 것으로 간주됩니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 7 조 (사용자의 정보 보안)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>가입 신청자가 하비나이스데이(Hobby Nice Day) 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을
										유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.</li>
									<li>ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용
										되었다는 사실을 발견한 경우에는 즉시 하비나이스데이(Hobby Nice Day)에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든
										책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해
										발생하는 손해 및 손실에 대하여 하비나이스데이(Hobby Nice Day)는 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 8 조 (서비스의 중지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을
										제한 및 중지할 수 있습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 9 조 (서비스의 변경 및 해지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한
										손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에
										관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 10 조 (게시물의 저작권)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며,
										게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.</li>
									<li>귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야
										합니다.</li>
								</ul>
								<h4 class="mt30">제 3 장 의무 및 책임</h4>
								<h5 class=" ml25">제 11 조 (광주광역시 지역산업 정보시스템의 의무)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다.
										다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 12 조 (회원의 의무)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가
										정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는
										안됩니다.</li>
									<li>회원은 하비나이스데이(Hobby Nice Day)의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
								</ul>
								<h4 class="mt30">제 4 장 기타</h4>
								<h5 class=" ml25">제 13 조 (양도금지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 14 조 (손해배상)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)의 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도
										하비나이스데이(Hobby Nice Day)가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 15 조 (면책조항)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다.
										하비나이스데이(Hobby Nice Day)는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이
										없습니다. 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는
										이익에 관하여 책임을 부담하지 않습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 16 조 (재판관할)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을
										적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.<br> <br>
										하비나이스데이(Hobby Nice Day)는 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항
										제1호에 따라 아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.<br> <br>
										하비나이스데이(Hobby Nice Day)는 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와
										같이 이용하고 있습니다. 이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용
										목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.
									</li>
								</ul>
							</div>
							<!-- 이용약관 동의 체크바스 -->
							<div class="terms_agree">
								<input type="checkbox" id="agree1" name="agree1" value="Y">
								<label for="agree1">사이트 이용약관에 동의합니다.</label>
							</div>
						
						
						
							<h4>개인정보 수집/이용 동의</h4>
							<div class="terms_wrap">
								<h5 class="mt10 ml25">1. 개인정보의 수집 및 이용 목적</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공[사업 및 과제정보 등록,
										성과 정보 등록] 등</li>
									<li>나. 회원관리
										<ul class="list_basic lt03">
											<li>회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및
												가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달</li>
										</ul>
									</li>
								</ul>
								<h5 class="mt20 ml25">2. 수집하는 개인정보의 항목 [회원 가입]</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>필수항목 : 아이디, 비밀번호, 이름, 전화번호, 이메일 등</li>
									<li>선택항목 : 증빙서류(기업/기관 담당자)</li>
									<li>자동수집 : IP주소, 쿠키, 서비스 이용기록, 방문기록 등</li>
								</ul>
								<h5 class="mt20 ml25">3. 개인정보의 보유 및 이용기간</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그
										개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는
										그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.</li>
								</ul>
								<h5 class="mt20 ml25">4. 동의거부권 및 불이익</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시
										저희가 제공하는 서비스를 이용할 수 없습니다.</li>
								</ul>
							</div>
							<div class="terms_agree">
								<input type="checkbox" id="agree2" name="agree2" value="Y"><label
									for="agree2">개인정보 취급방침에 동의합니다.</label>
							</div>
							<!-- 이용약관 끝 -->
					
                	
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
                            here</a> to enter your code</h6>
                            <h6 class="checkout__title">회원정보 입력</h6>
                            <div class="row">
	                            <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>ID<span>*</span></p>
										<input type="text" id="userId" name="userId"/>
	                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="userName" name="userName"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add">
                                <input type="text" placeholder="Apartment, suite, unite ect (optinal)">
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Country/State<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                                <p>뭐라뭐라</p>
                            </div>
                            <div class="checkout__input">
                                <p>Account Password<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Note about your order, e.g, special noe for delivery
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text"
                                placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        
                        	<!-- 우측
                        <div class="col-lg-4 col-md-6">
                        
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                    <li>02. German chocolate <span>$ 170.0</span></li>
                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span>$750.99</span></li>
                                    <li>Total <span>$750.99</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                        우측 끝 -->
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	
	
	
	<!-- Contact Section Begin -->
	<section class="contact spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="contact__text">
					<div class="section-title">
						<span>SIGN IN</span>
						<h2>회원가입</h2>
						<p>회원정보를 입력해주세요</p>
					</div>
					
					<ul>
						<li>
							<!-- 이용약관 시작 -->
							<h4>사이트 이용약관</h4>
							<div class="terms_wrap">
								<h5 class=" ml25">제 1 조 (목적)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>본 약관은 하비나이스데이(Hobby Nice Day)가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차,
										이용자와 광주지역 기업지원성과 통합관리 시스템의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로
										합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 2 조 (약관의 효력과 변경)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 귀하가 본 약관 내용에 동의하는 경우 서비스 제공 행위 및 귀하의 서비스 사용
										행위에 본 약관이 우선적으로 적용됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 하비나이스데이(Hobby Nice Day)
										사이트 내에 공지하거나 유선 연락을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.</li>
									<li>이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며
										계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 3 조 (약관 외 준칙)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신
										윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 4 조 (용어의 정의)</h5>
								<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
								<ul class="list_basic lt03 mt10 ml25">
									<li>이용자 : 본 약관에 따라 하비나이스데이(Hobby Nice Day)가 제공하는 서비스를 받는 자.</li>
									<li>가입 : 하비나이스데이(Hobby Nice Day)가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여
										서비스 이용계약을 완료시키는 행위.</li>
									<li>회원 : 하비나이스데이(Hobby Nice Day)에 개인 정보를 제공하여 회원 등록을 한 자로서 하비나이스데이(Hobby Nice Day)가
										제공하는 서비스를 이용할 수 있는 자.</li>
									<li>비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이
										선정한 문자와 숫자의 조합.</li>
									<li>탈퇴 : 회원이 이용계약을 종료시키는 행위.</li>
								</ul>
								<h4 class="mt30">제 2 장 서비스 제공 및 이용</h4>
								<h5 class=" ml25">제 5 조 (이용계약의 성립)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>이용계약은 신청자가 온라인으로 하비나이스데이(Hobby Nice Day)에서 제공하는 소정의 가입신청 양식에서 요구하는
										사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
										<ul>
											<li>① 다른 사람의 명의를 사용하여 신청하였을 때</li>
											<li>② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때</li>
											<li>③ 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때</li>
											<li>④ 하비나이스데이(Hobby Nice Day)를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우</li>
											<li>⑤ 기타 하비나이스데이(Hobby Nice Day)가 정한 이용신청요건이 미비 되었을 때</li>
										</ul>
									</li>
								</ul>
								<h5 class="mt20 ml25">제 6 조 (회원정보 사용에 대한 동의)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.</li>
									<li>하비나이스데이(Hobby Nice Day)의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
										<ul>
											<li>① 개인정보의 사용 : 하비나이스데이(Hobby Nice Day)의 서비스 제공과 관련해서 수집된 회원의 신상정보를
												본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.<br> 단, 전기통신기본법 등 법률의 규정에
												의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우
												또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 하비나이스데이(Hobby Nice Day)에 제공한 개인정보를
												스스로 공개한 경우에는 그러하지 않습니다.
											</li>
											<li>② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로
												귀하의 개인정보를 수정/삭제할 수 있습니다.</li>
											<li>③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는
												전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는
												안되며, 작업 종료 시에는 반드시 로그아웃해 주시기 바랍니다.</li>
										</ul>
									</li>
									<li>회원이 본 약관에 따라 이용신청을 하는 것은, 하비나이스데이(Hobby Nice Day)에 기재된 회원정보를 수집,
										이용하는 것에 동의하는 것으로 간주됩니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 7 조 (사용자의 정보 보안)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>가입 신청자가 하비나이스데이(Hobby Nice Day) 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을
										유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.</li>
									<li>ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용
										되었다는 사실을 발견한 경우에는 즉시 하비나이스데이(Hobby Nice Day)에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든
										책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해
										발생하는 손해 및 손실에 대하여 하비나이스데이(Hobby Nice Day)는 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 8 조 (서비스의 중지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을
										제한 및 중지할 수 있습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 9 조 (서비스의 변경 및 해지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한
										손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에
										관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 10 조 (게시물의 저작권)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.</li>
									<li>하비나이스데이(Hobby Nice Day)는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며,
										게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.</li>
									<li>귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야
										합니다.</li>
								</ul>
								<h4 class="mt30">제 3 장 의무 및 책임</h4>
								<h5 class=" ml25">제 11 조 (광주광역시 지역산업 정보시스템의 의무)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다.
										다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 12 조 (회원의 의무)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가
										정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는
										안됩니다.</li>
									<li>회원은 하비나이스데이(Hobby Nice Day)의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
								</ul>
								<h4 class="mt30">제 4 장 기타</h4>
								<h5 class=" ml25">제 13 조 (양도금지)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 14 조 (손해배상)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)의 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도
										하비나이스데이(Hobby Nice Day)가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 15 조 (면책조항)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다.
										하비나이스데이(Hobby Nice Day)는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이
										없습니다. 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는
										이익에 관하여 책임을 부담하지 않습니다.</li>
								</ul>
								<h5 class="mt20 ml25">제 16 조 (재판관할)</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을
										적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.<br> <br>
										하비나이스데이(Hobby Nice Day)는 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항
										제1호에 따라 아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.<br> <br>
										하비나이스데이(Hobby Nice Day)는 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와
										같이 이용하고 있습니다. 이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용
										목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.
									</li>
								</ul>
							</div>
							<!-- 이용약관 동의 체크바스 -->
							<div class="terms_agree">
								<input type="checkbox" id="agree1" name="agree1" value="Y">
								<label for="agree1">사이트 이용약관에 동의합니다.</label>
							</div>
						</li>
						
						<li>
							<h4>개인정보 수집/이용 동의</h4>
							<div class="terms_wrap">
								<h5 class="mt10 ml25">1. 개인정보의 수집 및 이용 목적</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공[사업 및 과제정보 등록,
										성과 정보 등록] 등</li>
									<li>나. 회원관리
										<ul class="list_basic lt03">
											<li>회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및
												가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달</li>
										</ul>
									</li>
								</ul>
								<h5 class="mt20 ml25">2. 수집하는 개인정보의 항목 [회원 가입]</h5>
								<ul class="list_basic lt03 mt10 ml25">
									<li>필수항목 : 아이디, 비밀번호, 이름, 전화번호, 이메일 등</li>
									<li>선택항목 : 증빙서류(기업/기관 담당자)</li>
									<li>자동수집 : IP주소, 쿠키, 서비스 이용기록, 방문기록 등</li>
								</ul>
								<h5 class="mt20 ml25">3. 개인정보의 보유 및 이용기간</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>하비나이스데이(Hobby Nice Day)는 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그
										개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는
										그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.</li>
								</ul>
								<h5 class="mt20 ml25">4. 동의거부권 및 불이익</h5>
								<ul class="list_basic lit03 mt10 ml25">
									<li>정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시
										저희가 제공하는 서비스를 이용할 수 없습니다.</li>
								</ul>
							</div>
							<div class="terms_agree">
								<input type="checkbox" id="agree2" name="agree2" value="Y"><label
									for="agree2">개인정보 취급방침에 동의합니다.</label>
							</div>
							<!-- 이용약관 끝 -->
						</li>
					</ul>



					<!-- 회원가입 폼 -->
					<form id="registerForm" name="registerForm" method="post"
						action="<c:url value='/cmm/uat/uia/insertUser.do'/>">
						<table border="1" cellpadding="10" cellspacing="0"
							style="width: 150%; border-collapse: collapse;">
							<tr>
								<th><span class="impt">*</span>ID</th>
								<td>
									<input type="text" id="userId" name="userId" style="width: 70%;" />
									<button type="button">중복확인</button>
								</td>	
								<th><span class="impt">*</span>이름</th>
								<td><input type="text" id="userName" name="userName" style="width: 70%;" /></td>
							</tr>
							<tr>
								<th><span class="impt">*</span>비밀번호</th>
								<td><input type="password" id="password" name="password" style="width: 100%;" /></td>
								<th>*비밀번호 확인</th>
								<td><input type="password" id="passwordConfirm" name="passwordConfirm" style="width: 100%;" /></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3"><input type="text" name="address" style="width: 80%;" />
									<button type="button">우편번호</button></td>
							</tr>
							<tr>
								<th><span class="impt">*</span>연락처</th>
								<td><input type="text" id="userPhone" name="userPhone" style="width: 100%;" /></td>
								<th>이메일</th>
								<td><input type="text" id="userEmail" name="userEmail" style="width: 100%;" /></td>
							</tr>
							<tr>
								<th><span class="impt">*</span>성별</th>
								<td colspan="3">
									<input type="radio" id="male" name="gender" value="남성" /> 남성 
									<input type="radio" id="female" name="gender" value="여성" /> 여성
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center;">
								<input type="submit" value="회원가입" class="primary-btn" />
								<button type="reset" class="primary-btn">취소</button> 
								<!-- <a href="#" class="primary-btn">회원가입 <span class="arrow_right"></span></a> -->
							</tr>
						</table>
					</form>
					<!-- 회원가입 폼 끝-->
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="contact__form">
					<form action="#">
						<div class="row">
							<div class="col-lg-6">
								<input type="text" placeholder="Name">
							</div>
							<div class="col-lg-6">
								<input type="text" placeholder="Email">
							</div>

							<div class="col-lg-12">
								<label for="userEmail">Email: </label><input type="text"
									id="userEmail" name="userEmail" placeholder="Email">

							</div>


							<div class="col-lg-12">
								<textarea placeholder="Message"></textarea>
								<button type="submit" class="site-btn">Send Message</button>
							</div>


						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>
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

	<!-- Js Plugins -->
		<jsp:include page="/WEB-INF/jsp/main/inc/commonJsPlugins.jsp" />

	<!--공통 컴포넌트 불러오기-->

</body>
</html>

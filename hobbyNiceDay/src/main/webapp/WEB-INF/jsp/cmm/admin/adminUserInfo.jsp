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
                                            <h5 class="m-b-10">회원 정보 조회 페이지</h5>
                                            <p class="m-b-0">등록된 회원을 조회하는 페이지입니다.</p>
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
                                    	<div class="row">
                                    		<!-- 표에 작성해보기  -->
                                    		<div class="col-sm-12">
	                                    	<div class="card">
	                                            <div class="card-header">
	                                                <h5>회원 정보조회</h5>
	                                                <span>회원 정보조회 페이지입니다. <code>TB_USER</code></span>
	                                       		    <div class="card-header-right">
	                                                    <ul class="list-unstyled card-option">
	                                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
	                                                        <li><i class="fa fa-window-maximize full-card"></i></li>
	                                                        <li><i class="fa fa-minus minimize-card"></i></li>
	                                                        <li><i class="fa fa-refresh reload-card"></i></li>
	                                                        <li><i class="fa fa-trash close-card"></i></li>
	                                                    </ul>
	                                                </div>
	                                            </div>
	                                            
	                                            <form id="joinForm" name="joinForm" method="post">
	                                            
	                                            <div class="card-block table-border-style">
	                                                <div class="table-responsive">
	                                                    
	                                                    <table class="table table-hover">
	                                                        <thead>
	                                                            <tr>
	                                                                <th colspan="2">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="userId">
				                                                            	<i class="icofont icofont-user-alt-3">  아이디</i>
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id="userId" name="userId" class="form-control"  data-toggle="tooltip" readonly value="${userInfo.userId}">
			                                                            <!-- <span id="userIdMsg">ID 중복확인이 되지 않았습니다.</span> -->
	                                                                </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userName">
			                                                            	<i class="icofont icofont-ui-email">  이름</i>
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id="userName" name="userName" class="form-control" data-toggle="tooltip"  readonly value="${userInfo.userName}">
	                                                                </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userSe">
			                                                            	<i class="icofont icofont-ui-email">  회원구분</i>
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="userSe" name="userSe"  class="form-control" data-toggle="tooltip" disabled value="${userInfo.userSe}">
			                                                            	<option value="user">사용자</option>
			                                                            	<option value="admin">관리자</option>
			                                                            </select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="brthdy">
			                                                            	<i class="icofont icofont-ui-email">  생년월일</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="date" id="brthdy" name="brthdy" class="form-control" data-toggle="tooltip" readonly  value="${fn:substring(userInfo.brthdy, 0, 10)}">
	                                                                </th>
	                                                                
	                                                            </tr>
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="mbtlnum">
			                                                            	<i class="icofont icofont-ui-email">  휴대전화</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="mbtlnum" name="mbtlnum" class="form-control" data-toggle="tooltip" readonly value="${userInfo.mbtlnum}">
			                                                        </th>
	                                                                <th colspan="2">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="email">
			                                                            	<i class="icofont icofont-ui-email">  이메일</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="email" name="email" class="form-control" data-toggle="tooltip" readonly value="${userInfo.email}">
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="sex">
			                                                            	<i class="icofont icofont-ui-email">  성별</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <div class="gender-buttons">
																	    <!-- 성별 선택 -->
																	    <div class="input-group btn-radio">
																	        <input type="radio" id="male" name="sex" value="M"  
																					    <c:if test="${userInfo.sex == 'M'}">checked="checked"</c:if> disabled="disabled">
																	        <label for="male">남성</label>
																	    </div>
																		    <div class="input-group btn-radio">
																		        <input type="radio" id="female" name="sex" value="F"   
																		        		<c:if test="${userInfo.sex == 'F'}">checked="checked"</c:if> disabled="disabled">
																		        <label for="female">여성</label>
																		    </div>
																	 	</div>
		                                                        	</th>
	                                                                <th  colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="userSe">
			                                                            	<i class="icofont icofont-ui-email">SNS 로그인 회원 구분</i>
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
		                                                        		<button type="button" id="updateBtn" class="btn btn-primary waves-effect waves-light m-r-20" data-toggle="tooltip" data-placement="right">수정</button>
				                                                        <a href="/adminUserList.do" id="ListBtn" class="btn btn-warning waves-effect waves-light">목록</a>
				                                                        <button type="button" id="deleteBtn" class="btn btn-danger waves-effect waves-light"  onclick="deleteUser('${userInfo.userId}')">삭제</button>
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
		
		
			
		
	};// 전체 불러오기 끝
		

	function deleteUser(userId) {
	    if (confirm("삭제하시겠습니까?")) {
	        window.location.href = 'adminUserDelete.do?userId=' + encodeURIComponent(userId);
	    }
	}	
	
	
	</script>
    
</body>



</html>

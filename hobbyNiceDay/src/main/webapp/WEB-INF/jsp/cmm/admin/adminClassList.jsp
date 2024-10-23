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
                                            <h5 class="m-b-10">클래스관리 페이지</h5>
                                            <p class="m-b-0">현재 개설되어 있는 클래스들을 관리하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="index.html"> <i class="fa fa-home"></i> </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">Bootstrap Tables</a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">Basic Tables</a>
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
                                        <!-- Basic table card start -->
                                        <!-- Basic table card end -->
                                        
                                        <!-- Inverse table card start -->
                                        <!-- Inverse table card end -->
                                        
                                        
                                        <!-- Hover table card start -->
                                        <div class="card">
                                            <div class="card-header">
                                                <h5>클래스</h5>
                                                <span>현재 등록되어있는  클래스 목록입니다. <code>TB_CLASS</code></span>
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
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <div style="text-align: right; margin-bottom: 10px;">
										                <button id="btnRegister" class="btn waves-effect waves-light btn-primary btn-outline-primary">
										                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
															  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
															  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
															</svg>   등록
										                </button>
										            </div>
                                                    <table class="userList table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>순번</th>
                                                                <th>클래스ID</th>
                                                                <th>클래스명</th>
                                                                <th>클래스 설명</th>
                                                                <th>클래스 장소</th>
                                                                <th>대분류</th>
                                                                <th>소분류</th>
                                                                <th>최대 참가자수</th>
                                                                <th>최소                                                               	수강가능연령</th>
                                                                <th>클래스 가격</th>
                                                                <th>휴무일</th>
                                                                <th>휴무일 설명</th>
                                                                <th>등록 일시</th>
                                                                <th>마지막 수정일시</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                        	
                                                        </tbody>
                                                    </table>
                                                    
                                                    <c:out value="${userList}" />
                                                </div>
                                            </div>
                                        </div>
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
    <script src="/pages/admin/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="js/admin/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- Custom js -->
    <script src="js/admin/js/pcoded.min.js"></script>
    <script src="js/admin/js/vertical/vertical-layout.min.js"></script>
    <script src="js/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="js/admin/js/script.js"></script>

    <script type="text/javascript">
  //페이지 로드가 완료되면
    if (window.addEventListener) window.addEventListener("load", userList, false);
	else if (window.attachEvent) window.attachEvent("onload", userList);
	else window.onload = userList;
	function userList() {
		
		dataList()
		
		console.log("로드 확인용 ")
    
    
    	// 등록 버튼 클릭 시 회원 등록 페이지로 이동
        $("#btnRegister").click(function() {
            window.location.href = '<c:url value="/adminClassInsertForm.do" />';
        });
    	
   		// 수정 버튼 클릭 시 사용자 ID를 가져와서 페이지로 이동
        $("#btnUpdate").click(function() {
            var userId = $(this).closest("tr").find(".classId").text();
            console.log("userId : ", userId)
            if(userId){
            	 console.log("userId 존재")
            	window.location.href = '<c:url value="/adminClassInsertForm.do" />?userId=' + userId;
            }else{
            	console.log("userId 존재xxx")
            	window.location.href = '<c:url value="/adminClassInsertForm.do" />';
            }
        });        
     
	} 
    
  //리스트 데이터
  
  function dataList() {
	console.log("data List들어오는지 확인")
	$.post('/getAdminClassList.do', function(data) {  // 괄호 수정
		console.log("post 요청 들어오는지 확인")
	    if ($.trim(data.error) == 'N') {
	    	console.log("data : " , data);  // cosole -> console 오타 수정
	        var dataMap = data.dataMap.dataMap.dataMap;
	    	console.log("dataMap : " , dataMap);  // cosole -> console 오타 수정
	        
	    	// dataMap에서 dataMap 배열을 가져옴
			var listData = data.dataMap.dataMap;  // 이 부분이 핵심
			console.log("listData: ", listData);
			
	    	var html = '';
	        var positionNm = '';
	        
	        $.each(listData, function(key, values) {
	            html+= '<tr>';
	            //html+= '    <td>' + ((data.totalCnt - (data.page - 1 ) * data.recordCnt) - key) + '</td>';
	            html+= '    <td></td>';
	            html += '    <td><a href="#" style="text-decoration: underline;">' + $.trim(values.classId) + '</a></td>';
	            html+= '    <td>' + $.trim(values.classNm) + '</td>';
	            html+= '    <td>' + $.trim(values.classDscrptn) + '</td>';
	            html+= '    <td>' + $.trim(values.location) + '</td>';
	            html+= '    <td>' + $.trim(values.classCateBig) + '</td>';
	            html+= '    <td>' + $.trim(values.classCateSmall) + '</td>';
	            html+= '    <td>' + $.trim(values.classMaxCnt) + '</td>';
	            html+= '    <td>' + $.trim(values.classAgeMin) + '</td>';
	            html+= '    <td>' + $.trim(values.classPrice) + '</td>';
	            html+= '    <td>' + $.trim(values.holidayDt) + '</td>'; // join해서 가져와야함
	            html+= '    <td>' + $.trim(values.holidayDesc) + '</td>'; // join 해서 가져와야함
	            html+= '    <td>' + $.trim(values.regDt) + '</td>'; // 등록일시 
	            html+= '    <td>' + $.trim(values.loginRestricted) + '</td>';
	        });
	        
	        //if (data.list.length == 0){ 
	        //    html+= '<tr><td colspan="9" class="nodata">데이터가 존재하지 않습니다.</td></tr>';
	        //}
	        
	        $('.userList tbody').append(html);
	        $('.totalCnt').text(numberWithCommas(data.totalCnt));
	        
	        // 페이징을 만든다
	        //paging('.paging', data.page, data.pageCnt, data.totalCnt);
	    }
	    
	    // $('.userList tbody').children('tr.loading').remove('');
	});
  }
    			/*
    			$('.totalCnt').html(numberWithCommas($.trim(data.totalCnt)));
    			$('.page').html(numberWithCommas($.trim(data.page)));
    			$('.pageCnt').html(numberWithCommas($.trim(data.pageCnt)));
    			*/
    			// 페이징을 만든다
    			//paging('.paging', data.page, data.pageCnt, data.totalCnt);
    		// $('.userList tbody').children('tr.loading').remove('');
   
// 생년월일을 날짜 형식으로 변환하는 함수
function formatDate(dateStr) {
 	var date = new Date(dateStr);
  	var year = date.getFullYear();
  	var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
  	var day = ('0' + date.getDate()).slice(-2); // 일도 2자리로 맞춤
  	
  	return year + '-' + month + '-' + day;
} 
// 생년월일을 통해 나이를 구하는 함수
function calculateAge(birthdate) {
    // 생년월일을 Date 객체로 변환
    var birthDate = new Date(birthdate);
    var today = new Date(); // 현재 날짜

    var age = today.getFullYear() - birthDate.getFullYear(); // 연도 차이 계산
    var monthDiff = today.getMonth() - birthDate.getMonth(); // 월 차이 계산
    var dayDiff = today.getDate() - birthDate.getDate(); // 일 차이 계산

    // 생일이 지나지 않았다면 나이를 1살 줄임
    if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
        age--;
    }

    return age;
}

	</script>
    
</body>



</html>

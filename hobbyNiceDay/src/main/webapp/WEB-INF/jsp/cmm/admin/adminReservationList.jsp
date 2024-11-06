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
    

    <!-- dddddddddddddddddddddddddddddddddddddddddddd -->
    
    
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
                                            <h5 class="m-b-10">예약관리 페이지</h5>
                                            <p class="m-b-0">현재 등록되어있는 예약들을 관리하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li>
                                                <a href="index.html"></a>
                                            </li>
                                            <li>
                                            	<a href="/adminReservationList.do">예약관리</a> > 
                                            </li>
                                            <li>
                                            	<a href="/adminReservationList.do">예약목록</a>
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
                                                <h5>예약목록</h5>
                                                <span>현재 등록중인 예약 목록입니다. <code>TB_RESERVATION</code></span>
                                                
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
                                                    <table class="table table-hover reservationList">
                                                        <thead>
                                                            <tr>
                                                                <th>순번</th>
                                                                <th>예약번호</th>
                                                                <th>사용자ID</th>
                                                                <th>예약자명</th>
                                                                <th>예약인원수</th>
                                                                <th>연락처</th>
                                                                <th>이메일</th>
                                                                <th>클래스명(id)</th>
                                                                <th>예약일자</th>
                                                                <th>시작시간</th>
                                                                <th>종료시간</th>
                                                                <th>예약상태</th>
                                                                <th>예약승인</th>
                                                                <th>회원/비회원</th>
                                                                <th>예약등록일시</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                        </tbody>
                                                    </table>
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
    <script src="assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="js/admin/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- Custom js -->
    <script src="js/admin/js/pcoded.min.js"></script>
    <script src="js/admin/js/vertical/vertical-layout.min.js"></script>
    <script src="js/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="js/admin/js/script.js"></script>
	
	
	
	
	
    <script type="text/javascript">
  //페이지 로드가 완료되면
    if (window.addEventListener) window.addEventListener("load", reservationList, false);
	else if (window.attachEvent) window.attachEvent("onload", reservationList);
	else window.onload = reservationList;
	function reservationList() {
		
		dataList()
		
		console.log("로드 확인용 ")
   		
    	
   		// 수정 버튼 클릭 시 예약상태 변경 
		$("#btnUpdate").click(function() {
            // Collect reservation updates
                let updates = []; // Initialize an array to hold the updates
            $(".reservationList tbody tr").each(function() {
                //var reservationId = $(this).find(".reservationId").text().trim();
                //var updatedStatus = $(this).find(".reservationStatusSelect").val();
				
				let reservationId = $(this).find(".reservationId").text().trim();
                let updatedStatus = $(this).find(".reservationStatusSelect").val();
				
                
             // Only add valid updates to the array
                if (reservationId && updatedStatus) {
                    updates.push({
                        reservationId: reservationId,
                        reservationStatus: updatedStatus
                    });
                }
                
                $.ajax({
                    url: '/updateReservationStatus.do',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8', // Set correct content type for JSON
                    data: JSON.stringify(updates), // Convert updates array to JSON string
                    success: function(response) {
                        if (response.error === 'N') {
                            alert("예약 상태가 성공적으로 업데이트되었습니다.");
                            location.reload(); // Reload to reflect the updated status
                        } else {
                            alert("업데이트에 실패했습니다.");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Error updating reservation status:", error);
                        alert("오류가 발생했습니다. 다시 시도해주세요.");
                    }
                });
            });
        });       
     
	} 
    
  //리스트 데이터
  
  function dataList() {
	console.log("data List들어오는지 확인")
	$.post('/getAdminReservationList.do', function(data) {  // 괄호 수정
		console.log("post 요청 들어오는지 확인")
	    if ($.trim(data.error) == 'N') {
	    	console.log("data : " , data);  // cosole -> console 오타 수정
	        var dataMap = data.dataMap.dataMap.dataMap;
	    	console.log("dataMap : " , dataMap);  // cosole -> console 오타 수정
	        
	    	// dataMap에서 dataMap 배열을 가져옴
			var listData = data.dataMap.dataMap;  // 이 부분이 핵심
			console.log("listData: ", listData);
			
			
			// statusMap을 가져와서 JavaScript 객체로 변환
            var statusMap = data.dataMap.statusMap;
            console.log("statusMap: ", statusMap);
            
	    	var html = '';
	        
	        $.each(listData, function(key, values) {
	            html+= '<tr>';
	            //html+= '    <td>' + ((data.totalCnt - (data.page - 1 ) * data.recordCnt) - key) + '</td>';
	            html+= '    <td>' + (key + 1) + '</td>';
	            html+= '    <td><a href="adminReservationInfo.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '"style="text-decoration: underline;">' + $.trim(values.reservationId) + '</a></td>';
	            html+= '    <td>' + $.trim(values.userId) + '</td>'; // 사용자 ID (비회원인 경우 null)
	            html+= '    <td>' + $.trim(values.reservationNm) + '</td>'; // 예약자명
	            html+= '    <td>' + $.trim(values.reservationCnt) + '</td>';
	            html+= '    <td>' + $.trim(values.reservationPhone) + '</td>'; // 예약자 연락처
	            html+= '    <td>' + $.trim(values.reservationEmail) + '</td>'; // 예약자 이메일
	            html+= '    <td>' + $.trim(values.classNm) + '(' + $.trim(values.classId) + ')</td>'; // 클래스명
	            html+= '    <td>' + $.trim(values.reservationDt) + '</td>'; // 예약일자
	            html+= '    <td>' + $.trim(values.timeStart) + '</td>'; // 시작시간
	            html+= '    <td>' + $.trim(values.timeEnd) + '</td>'; // 종료시간
	            //html+= '    <td>' + $.trim(values.reservationStatus) + '</td>'; // 예약상태
	            
	         // 예약상태를 statusMap을 이용하여 한글로 변환
                var statusKorean = statusMap[values.reservationStatus] || values.reservationStatus; // 한글 변환된 상태가 없을 경우, 기본값 사용
                html += '    <td>' + $.trim(statusKorean) + '</td>';

	         // 로그인 제한 상태에 따라 버튼 표시
                if (values.reservationStatus === 'stay') {
                    // 접수완료 버튼
                    html += '    <td><a href="adminReservationApproved.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: underline;" class="btn waves-effect waves-light btn-success btn-outline-success">접수완료</a></td>';
                } else if (values.reservationStatus === 'approved') {
                    // 접수취소 버튼 
                    html += '    <td><a href="adminReservationReject.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: underline;" class="btn waves-effect waves-light btn-danger btn-outline-danger">접수취소</a></td>';
                } else if (values.reservationStatus === 'reject') {
                    // 접수취소 버튼 
                    html += '    <td><a href="adminReservationApproved.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: underline;" class="btn waves-effect waves-light btn-success btn-outline-success">접수완료</a></td>';
                }else{ // 예약 취소 cancle
                	html += '' // 나중에 확인 필요
                }
	            
	            html+= '    <td>' + $.trim(values.reservationType) + '</td>'; // 회원/비회원 구분 
	            html+= '    <td>' + $.trim(values.regDt) + '</td>'; // 등록일시
	            html+= '</tr>';
	        });
	        
	        //if (data.list.length == 0){ 
	        //    html+= '<tr><td colspan="9" class="nodata">데이터가 존재하지 않습니다.</td></tr>';
	        //}
	        
	        $('.reservationList tbody').append(html);
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
   

	</script>
	
</body>



</html>

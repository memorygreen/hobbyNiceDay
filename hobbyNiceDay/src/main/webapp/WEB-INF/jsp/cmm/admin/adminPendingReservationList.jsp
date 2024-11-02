<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                                <h5>예약 승인대기 목록</h5>
                                                <span>승인 대기중인 예약 목록입니다. <code>TB_RESERVATION</code></span>
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
														
										                <button id="btnUpdate" class="btn waves-effect waves-light btn-success btn-outline-success">
					                                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
															  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
															  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
															</svg> 수정
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
                                                                <th colspan="2">예약상태</th>
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

		// 수정 버튼 클릭 시 변경된 예약 ID의 reservationStatus(예약대기, 예약승인, 예약거부, 예약취소)를 가져와서 변경된 상태로 업데이트
        $("#btnUpdate").click(function() {
        	/*
            var reservationId = $(this).closest("tr").find(".reservationId").text();
            console.log("reservationId : ", reservationId)
            if(userId){
            	 console.log("reservationId 존재")
            	window.location.href = '<c:url value="/adminReservationInsertForm.do" />?reservationId=' + reservationId;
            }else{
            	console.log("reservationId 존재xxx")
            	window.location.href = '<c:url value="/adminReservationInsertForm.do" />';
            }*/
            
            
        	 var updates = [];
        	    
        	    // 모든 예약 행을 순회하면서 상태가 변경된 항목을 수집
        	    $(".reservationList tbody tr").each(function() {
        	        var reservationId = $(this).find("td:eq(1)").text(); // 예약 ID
        	        var newStatus = $(this).find(".reservationStatusSelect").val(); // 선택된 예약 상태

        	        if (newStatus) {
        	            updates.push({
        	                reservationId: reservationId,
        	                reservationStatus: newStatus
        	            });
        	        }
        	    });

        	    // 서버로 전송할 데이터가 있는지 확인
        	    if (updates.length === 0) {
        	        alert("변경할 예약 상태가 없습니다.");
        	        return;
        	    }

        	    console.log("업데이트 항목들: ", updates);

        	    // 서버로 상태 업데이트 요청
        	    $.ajax({
        	        type: "POST",
        	        url: "/updateReservationStatus.do", // 서버에서 처리할 URL
        	        contentType: "application/json", 
        	        data: JSON.stringify(updates), // 데이터를 JSON 문자열로 변환합니다.
        	        success: function(response) {
        	            if (response.error === 'N') {
        	                alert("모든 예약 상태가 성공적으로 업데이트되었습니다.");
        	                location.reload(); // 페이지 새로고침
        	            } else {
        	                alert("업데이트 중 오류가 발생했습니다. 다시 시도해 주세요.");
        	            }
        	        },
        	        error: function(xhr, status, error) {
        	            alert("서버 오류가 발생했습니다. 상태 코드: " + xhr.status);
        	            console.log("에러 내용: ", error);
        	        }
        	    });
            
            
            
            
        });        
     
	} 
    
  //리스트 데이터
  
  function dataList() {
	console.log("예약승인 대기 목록 data List들어오는지 확인")
	$.post('/getAdminPendingReservationList.do', function(data) {  // 괄호 수정
		console.log("post 요청 들어오는지 확인")
	    if ($.trim(data.error) == 'N') {
	    	console.log("data : " , data);  // cosole -> console 오타 수정
	        var dataMap = data.dataMap.dataMap.dataMap;
	    	console.log("dataMap : " , dataMap);  // cosole -> console 오타 수정
	        
	    	// dataMap에서 dataMap 배열을 가져옴
			var listData = data.dataMap.dataMap;  // 이 부분이 핵심
			console.log("listData: ", listData);
			
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
	            html+= '    <td>' + $.trim(values.reservationStatus) + '</td>'; // 예약상태
	            html += '    <td>';
	            html += '<a href="/updateReservationStatus.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" id="btnStatusUpdate" class="btn waves-effect waves-light btn-success btn-outline-success">';
	            html += 	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">'
	            html += 		'<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>'
	            html += 		'<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>'
	            html += 	'</svg> 예약승인'
	            html += '</a>'
	            
	            html += '<a href="/updateReservationStatus.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" id="btnStatusUpdate" class="btn waves-effect waves-light btn-danger btn-outline-danger">';
	            html += 	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">'
	            html += 		'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>'
	            html += 		'<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>'
	            html += 	'</svg> 접수취소'
	            html += '</a>'
	            
				/*
	            html += '        <select class="reservationStatusSelect">';
				html += '            <option value="stay"' + (values.reservationStatus === 'stay' ? ' selected' : '') + '>예약대기</option>';
				html += '            <option value="approved"' + (values.reservationStatus === 'approved' ? ' selected' : '') + '>예약승인</option>';
				html += '            <option value="rejected"' + (values.reservationStatus === 'rejected' ? ' selected' : '') + '>예약거부</option>';
				html += '            <option value="rejected"' + (values.reservationStatus === 'rejected' ? ' selected' : '') + '>예약취소</option>';
				html += '        </select>';
				*/
				html += '    </td>';
				
	            html+= '    <td>' + $.trim(values.reservationType) + '</td>'; // 회원/비회원 구분 
	            html+= '    <td>' + $.trim(values.regDt) + '</td>'; // 등록일시
	            html+= '</tr>';
	        });
	        
	        //if (data.list.length == 0){ 
	        //    html+= '<tr><td colspan="9" class="nodata">데이터가 존재하지 않습니다.</td></tr>';
	        //}
	        
	        $('.reservationList tbody').append(html);
	        //$('.totalCnt').text(numberWithCommas(data.totalCnt));
	        
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
   
	</script>
	
</body>



</html>

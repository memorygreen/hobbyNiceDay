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
    
    /*회원 비회원)라디오 버튼 커스텀 */
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
                        <div class="page-header" style="background-color:#20263b;"> <!-- 페이지 헤더 배경색상 -->
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
                                            
                                            <!-- 필터링 -->
                                            <div class="card-header" style="display: flex; align-items: center; gap: 10px; justify-content: flex-end;">
                                                
                                                
                                                 <!-- 회원/비회원 필터 (라디오 버튼) -->
                                                
											    <div class="gender-buttons">
											     <label>예약자 구분 :</label>
											        <div class="btn-radio">
											            <input type="radio" id="all" name="reservationType" value="" checked>
											            <label for="all">전체</label>
											        </div>
											        <div class="btn-radio">
											            <input type="radio" id="user" name="reservationType" value="user">
											            <label for="user">회원</label>
											        </div>
											        <div class="btn-radio">
											            <input type="radio" id="nonUser" name="reservationType" value="nonUser">
											            <label for="nonUser">비회원</label>
											        </div>
											    </div>
											    
											    <!-- 날짜 필터 -->
											    <label>예약 날짜:</label>
											    <input type="date" name="startDate" id="startDate" class="form-control" style="display: inline-block; width: 150px;">
											    ~
											    <input type="date" name="endDate"  id="endDate" class="form-control" style="display: inline-block; width: 150px;">
											    
											   
                                                
                                                <button id="btnFiltering" class="btn waves-effect waves-light btn-primary btn-outline-primary">
										        	조회
								                </button>
                                            </div>
                                            
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <div style="text-align: right; margin-bottom: 10px;">
														<!-- 
														<button id="btnRegister" class="btn waves-effect waves-light btn-primary btn-outline-primary">
										                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
															  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
															  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
															</svg>   등록
										                </button>
														 -->
										            </div>
										            
										            
										            <!-- 예약목록 표 -->
                                                    <table class="table table-hover reservationList">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 5%;">순번</th>
                                                                <th style="width: 20%;">클래스명</th>
                                                                <th style="width: 10%;">예약자명</th>
                                                                <th style="width: 10%;">연락처</th>
                                                                <th style="width: 10%;">예약일자</th>
                                                                <th style="width: 15%;">예약시간대</th>
                                                                <!-- 
                                                                <th>종료시간</th>
                                                                 -->
                                                                <th style="width: 10%;">예약상태</th>
                                                                <th style="width: 20%;"></th>
                                                                <!-- 
                                                                 <th style="width: 10%;">등록일시</th>
                                                                 -->
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                        </div>
                                        <!-- Hover table card end -->
                                        
                                        
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
    <script src="pages/admin/pages/waves/js/waves.min.js"></script>
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
   		
    	
   		// 필터링 버튼 클릭 시
		$("#btnFiltering").click(function() {
		    const startDate = $('#startDate').val();
		    const endDate = $('#endDate').val();
		    const reservationType = $('input[name="reservationType"]:checked').val();
			
			console.log("btnFiltering 클릭 들어오는지 확인 - startDate : " , startDate, ", endDate : ",endDate, ",reservationType : " , reservationType);

		    
		    
		    // Validate dates
		    if (startDate && endDate && new Date(startDate) > new Date(endDate)) {
		        alert("시작일은 종료일보다 이전이어야 합니다.");
		        return;
		    }

		    // Fetch the filtered data using the dataList function with parameters
		    dataList(startDate, endDate, reservationType);
		});
     
	} 
    
  //리스트 데이터
  
	function dataList(filterStartDate = '', filterEndDate = '', filterReservationType = '') {
    	console.log("dataList 호출 - filterStartDate:", filterStartDate, ", filterEndDate:", filterEndDate, ", filterReservationType:", filterReservationType);

	$.post('/getAdminReservationList.do', {
		startDate: filterStartDate,
		endDate: filterEndDate,
		reservationType: filterReservationType
		},function(data) {  // 괄호 수정
			console.log("post 요청 들어오는지 확인")
		console.log("목록 받아온 결과 data : ",data)
		
			
	
	    if ($.trim(data.error) == 'N') {
	    	// console.log("data : " , data);  // cosole -> console 오타 수정
	        
	    	//var dataMap = data.dataMap.dataMap.dataMap;
	    	//console.log("dataMap : " , dataMap);  // cosole -> console 오타 수정
	        
	    	// dataMap에서 dataMap 배열을 가져옴
			var listData = data.dataMap.dataMap;  // 이 부분이 핵심
			console.log("목록 받아온 결과  listData: ", listData);
			
			
			// statusMap을 가져와서 JavaScript 객체로 변환
            var statusMap = data.dataMap.statusMap;
            // console.log("statusMap: ", statusMap);
            
	    	var html = '';
	        
	        $.each(listData, function(key, values) {
	            html+= '<tr>';
	            html+= '    <td>' + (key + 1) + '</td>';
	            html+= '    <td>' + $.trim(values.classNm) + '</td>'; // 클래스명
	            
	            var userSe = '';
	            // 회원/비회원 구분 
	            if (values.reservationType === 'user') {
	            	userSe = '회원'
	            	// html+= '    <td>회원</td>'; // 회원/비회원 구분 
                    // 접수완료 버튼
                } else if (values.reservationType === 'nonUser') {
                	userSe = '비회원' 
                }
	            
	            html+= '    <td><a href="adminReservationInfo.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '"style="text-decoration: underline;">' + $.trim(values.reservationNm) + '(' + userSe + ')</a></td>'; // 예약자명
	            
	            html+= '    <td>' + $.trim(values.reservationPhone) + '</td>'; // 예약자 연락처
	            html+= '    <td>' + $.trim(values.reservationDt) + '</td>'; // 예약일자
	            html+= '    <td>' + $.trim(values.timeStart) +' - '+ $.trim(values.timeEnd)+ '</td>'; // 시작시간 - 종료식나 (수강시간대)
	            
	            //html+= '    <td>' + ((data.totalCnt - (data.page - 1 ) * data.recordCnt) - key) + '</td>';
	            //html+= '    <td><a href="adminReservationInfo.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '"style="text-decoration: underline;">' + $.trim(values.reservationId) + '</a></td>';
	            // html+= '    <td>' + $.trim(values.userId) + '</td>'; // 사용자 ID (비회원인 경우 null)
	            // html+= '    <td>' + $.trim(values.reservationNm) + '(' + userSe + ')</td>'; // 예약자명
	            // html+= '    <td>' + $.trim(values.reservationCnt) + '</td>';
	            // html+= '    <td>' + $.trim(values.reservationEmail) + '</td>'; // 예약자 이메일
	            // html+= '    <td>' + $.trim(values.timeEnd) + '</td>'; // 종료시간
	            //html+= '    <td>' + $.trim(values.reservationStatus) + '</td>'; // 예약상태
	            
	         // 예약상태를 statusMap을 이용하여 한글로 변환
                var statusKorean = statusMap[values.reservationStatus] || values.reservationStatus; // 한글 변환된 상태가 없을 경우, 기본값 사용
                html += '    <td>' + $.trim(statusKorean) + '</td>';

	         // 로그인 제한 상태에 따라 버튼 표시
                if (values.reservationStatus === 'stay') {
                    // 접수완료 버튼
                    html += '    <td><a href="adminReservationApproved.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: ; margin-bottom:10px;" class="btn waves-effect waves-light btn-success btn-outline-success">접수완료</a>';
                    html += '    <a href="adminReservationReject.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: ;margin-bottom:10px;" class="btn waves-effect waves-light btn-danger btn-outline-danger">접수취소</a>'
                    html +='</td>';
                } else if (values.reservationStatus === 'approved') {
                    // 접수취소 버튼 
                    html += '    <td><a href="adminReservationReject.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: ;" class="btn waves-effect waves-light btn-danger btn-outline-danger">접수취소</a></td>'
                    
                } else if (values.reservationStatus === 'reject') {
                    // 접수취소 버튼 
                    // html += '    <td><a href="adminReservationApproved.do?reservationId=' + encodeURIComponent($.trim(values.reservationId)) + '" style="text-decoration: ;" class="btn waves-effect waves-light btn-success btn-outline-success">접수완료</a></td>';
                    html += '<td></td>' // 나중에 확인 필요
                }else{ // 예약 취소 cancle
                	html += '<td></td>' // 나중에 확인 필요
                }
	            
	            
	            // html+= '    <td>' + $.trim(values.regDt) + '</td>'; // 등록일시
	            html+= '</tr>';
	        });
	        
	       
	        
	       // $('.reservationList tbody').append(html);
	        $('.reservationList tbody').html(html);
		       
	        
	     
	    } else {
	    	
            alert(data.errorMsg);
	    }
         
	});
  }
    		
   

	</script>
	
</body>



</html>

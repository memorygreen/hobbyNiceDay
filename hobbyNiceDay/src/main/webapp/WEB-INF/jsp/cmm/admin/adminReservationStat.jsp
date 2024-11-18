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
    
    
    <!-- 달력 -->
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
	<!-- google calendar api 추가  -->
	<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.15/index.global.min.js"></script>
	
	<style type="text/css">
	
		.fc-sunday .fc-daygrid-day-top { 
		    color: #D85D5D; /* 일요일 글자 빨간색 */
		}
		
		.fc-saturday .fc-daygrid-day-top { 
		    color: #267CC7; /* 토요일 글자 파란색 */
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
                                            <h5 class="m-b-10">예약현황 페이지</h5>
                                            <p class="m-b-0">예약 현황을 확인하는 페이지입니다.</p>
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
                                            	<a href="/adminReservationList.do">예약현황</a>
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
                                                <h5 >예약현황</h5>
                                                <span>예약 현황 목록입니다. <code>TB_RESERVATION</code></span>
                                                <!-- 
                                                <a href="/holidaysTest.do">임시 공휴일 페이지</a>
                                                 -->
                                            </div>
                                            
                                            
                                            <div class="row">
                                            
	                                            <div class="col-lg-6">
	                                            	<div class="card-block table-border-style">
														<!-- 달력추가 -->
														<div id='calendar' >
															<!-- 
															 style="margin-left:20px;margin-top:20px;margin-bottom:20px;margin-right:20px;"
															 -->
														</div>
													</div>	
												</div>
												
												
												<div class="col-lg-6">
													<div class="card-block table-border-style">
	                                                    <div class="table-responsive">
															
															</br>
	                                                    	<h4><span class="selectedDateTotalSpan"></span></h4>
		                                                    <!-- 여기에 원래 테이블 있었음 -->
		                                                    
															<div class="addDateTotalStatTableDiv" style="margin-left:0px;margin-top:0px;margin-bottom:0px;margin-right:0px;">
															<!-- 선택한 날의 통합  통계관련 정보  -->
														
	                                                    	</div>
													    </div>
	                                                </div>
												</div>
												
	                                            
                                            </div>
                                            
                                            
                                            <div class="row">
                                            
                                            <!-- 달력 아래  -->
                                            	<div class="col-lg-12">
	                                                <div class="card-block table-border-style">
	                                                    <div class="table-responsive">
	                                                    	
	                                                    	</br>
	                                                    	<h4><span class="selectedDateSpan"></span></h4>
		                                                    <!-- 여기에 원래 테이블 있었음 -->
		                                                    </br>
		                                                    
		                                                    <div class="addTablesDiv">
		                                                    <!-- 선택한 날 클래스별 통계 정보 -->
		                                                    </div>
	                                                    </div>
	                                                 </div>
	                                             </div>
	                                             
                                            
                                             </div> <!-- row 끝 -->
                                            
                                            
                                            
                                            
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
	
	
	
	
	
	<!-- 예약 상세 정보 모달 -->
	<div class="modal fade" id="reservationDetailModal" tabindex="-1" role="dialog" aria-labelledby="reservationDetailModalLabel" aria-hidden="true">
    	<div class="modal-dialog" role="document" style="max-width: 80%; width: 100%; margin: 0 auto; top: 50%; transform: translateY(-50%);">
      
	     
	        <div class="modal-content">
	            <div class="modal-header">
	                <!-- <h5 class="modal-title" id="reservationDetailModalLabel">예약 상세 정보</h5> -->
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            
	            <div class="modal-body">
	                <!-- 예약 상세 정보가 여기에 표시됩니다 -->
	                <div id="reservationDetailContent">
	                </div>
	            </div>
	            
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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
	
	
	<script>
	
	
	
	
	

	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'wF9FnEiuP7ovoa%2FAip97bLTzER3364FF9xrqLX8sDK%2BEZ3G3esruJoOq6beqmkhQiKEssBXxoGI2mWixkL32jQ%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
	queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent('2024'); /**/
	queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent('02'); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};
	
	
	
	
	
	
	
	
	
	
	
	// frullCalendaer 달력 api
	  document.addEventListener('DOMContentLoaded', function() {
		  
		  
          var calendarEl = document.getElementById('calendar');
          
          
       	  // 1. 표시할 공식 공휴일 목록을 정의합니다.
          var officialHolidays = [
              '신정', '설날', '설날 연휴', '삼일절', '어린이날', 
              '부처님 오신 날', '현충일', '광복절', '추석', 
              '추석 연휴', '개천절', '한글날', '성탄절'
          ];

          
          
          var selectedDate = null; // 선택된 날짜를 저장할 변수
          var holidayDates = []; // 공휴일 날짜를 저장할 배열

          if (!calendarEl) {
              console.error("Element with id 'calendar' not found!");
              return;
          }
          
          var calendar = new FullCalendar.Calendar(calendarEl, {
        	  googleCalendarApiKey : "AIzaSyBIIqXESeaREeCJB3QABFClVC8FGok3yhs", // google api key
        	  eventSources :[ 
			        	        {
			        	             googleCalendarId :'l9ijikc83v1ne5s61er6tava4iplm8id@import.calendar.google.com'  
			        	            	 // 'ko.south_korea#holiday@group.v.calendar.google.com' // 대한민국 공휴일 달력 id
			        	            , color: 'white'   
			        	            , textColor: '#D85D5D'  // 공휴일을 빨간색으로 표시
		        	            
			        	        }
        	 				],
              initialView: 'dayGridMonth', // 월별 보기
              locale: 'ko', // 한국어 설정
              headerToolbar: {
			                  left: 'prev,next today',
			                  center: 'title',
			                  right: 'dayGridMonth'
              				},
      		  firstDay: 0, // 일요일(0)을 월요일(1)을 일주일의 첫째날로 설정
              dateClick: function(info) { // 날짜 선택 관련 로직
            	  
            	 $('.addTablesDiv').html(''); // 아래쪽 표 초기화  
            	  
            	  
            	 
            	// 날짜 클릭 이벤트 추가
            	// 이전 선택된 날짜의 스타일을 초기화
                  if (selectedDate) {
                      var prevCell = document.querySelector('.fc-daygrid-day[data-date="' + selectedDate + '"]');
                      if (prevCell) {
                          prevCell.style.backgroundColor = ''; // 초기화
                      }
                  }
				
              	  // 달력 선택 날짜 -> 예약정보 입력 - 예약날짜 에 넣기
                  selectedDate = info.dateStr;
          	      $('.selectedDateSpan').html(selectedDate + " 클래스별 예약 현황")
			      $('.selectedDateTotalSpan').html(selectedDate + " 예약 현황")
			       
              	  
               	  // 선택된 날짜 셀을 노란색으로 설정
               	  var selectedCell = document.querySelector('.fc-daygrid-day[data-date="' + selectedDate + '"]');
	                if (selectedCell) {
	                    selectedCell.style.backgroundColor = '#FDD7D7';
	                }
	                
                  var dayOfWeek = new Date(info.date).getDay(); // 요일 가져오기 (0: 일요일, 6: 토요일)
                  
                  var reservationSchedulselectedDate = new Date(info.dateStr);
                  var year = reservationSchedulselectedDate.getFullYear();
              	  var month = reservationSchedulselectedDate.getMonth() + 1; // 월은 0부터 시작하므로 +1 필요
    			  var day = reservationSchedulselectedDate.getDate();
    			  var dateText = year + "년 " + month + "월 " + day + "일"; // 'nn월 nn일' 형식으로 날짜 텍스트를 설정
    			  
                  // alert( '예약 날짜가 ' + info.dateStr + '로 선택되었습니다.');// 선택한 날짜가 휴일이면 선택을 막고 알림을 띄웁니다. // 테스트 후 주석 해제
                      
                  
               		// AJAX 요청으로 선택된 날짜의 통합 예약 통계 가져오기
               		$.ajax({
	    	                url: '/getReservationTotalDayStatistics.do',
	    	                method: 'POST',
	    	                data: { reservationDt: selectedDate },
	    	                success: function(response) {
	    	                	// console.log("예약현황 선택날짜별 통합 정보 가져왔는 지확인 response : ",  response);
	    	                	// console.log("예약현황 선택날짜별 통합 정보 가져왔는 지확인 response.data : ",  response.data);
	    	                    if (response.error === 'N') {
	    	                    	
	    	                        displayTotalStat(response.data, selectedDate); // 선택한 날짜도 보내기 
	    	                    } else {
	    	                        alert(response.message || "데이터 조회 중 오류 발생");
	    	                    }
	    	                },
	    	                error: function() {
	    	                    alert("데이터를 불러오는 중 오류가 발생했습니다.");
	    	                }
	    	            });
               		
               		
               		
               		
               		/*************************************************************************************************/
               		
	    			// AJAX 요청으로 선택된 날짜의 클래스별 예약 통계 가져오기
	    	            // $.ajax({ url: '/getReservationDayStatistics.do', });
                  
                  
                  
                  
              },
              dayCellClassNames: function(arg) {
            	  var dayOfWeek = arg.date.getUTCDay();
                  if (dayOfWeek === 6) { // 일요일 
                      return ['fc-sunday']; // 글자색 css
                  } else if (dayOfWeek === 5) { // 토요일
                      return ['fc-saturday']; // 글자색 css
                  }
              }
              
          });
          
         
       	  // 휴일 날짜와 설명
          // classDetails.holidayInfo 값을 가져와서 파싱합니다.
          var holidayInfo = "${classDetails.holidayInfo}"; // 예: "2024-09-05(휴무일), 2024-09-18(휴무일)"
          
          if (holidayInfo) {
              var holidays = holidayInfo.split(','); // 쉼표(,)로 분리하여 배열로 만듭니다.

              // 각 휴일 정보를 파싱하여 이벤트로 변환
              holidays.forEach(function(holiday) {
            	// 공백 제거 후 괄호 기준으로 날짜와 설명을 분리
                  var date = holiday.trim().split('(')[0]; // 날짜 부분 추출
                  var description = holiday.trim().split('(')[1].replace(')', ''); // 설명 부분 추출
				  
               	  // 휴일 날짜를 배열에 저장
                  holidayDates.push(date);
                  
                  // 이벤트 객체 생성
                  var holidayEvent = {
                      title: description,  // 휴일 설명을 제목으로 설정
                      start: date,         // 이벤트 시작일은 휴일 날짜
                      allDay: true,         // 하루종일 이벤트로 설정
                      color: '#D85D5D'  // 휴무일을 빨간색으로 표시
                  };

                  // 이벤트를 달력에 추가
                  calendar.addEvent(holidayEvent);
              });
          }
          
          
          // 캘린더 크기 설정
          //calendar.setOption('contentHeight', 400);
          
          
          calendar.render(); // 달력을 화면에 렌더링
          
       // 페이지 로드 후 강제로 리사이즈 트리거
          setTimeout(function() {
              calendar.updateSize();
          }, 100);
          
      }); // fullCalendar API 함수 끝
      
      
      
      
      
    // 통합정보
    function displayTotalStat(data, selectedDate) {
    	  
    	// 테이블의 기본 HTML 구조
        var html ='' 
       	html = 	'<h6>' + selectedDate + '</h6>'
    	html = '<table class="table table-hover">'; // table table-hover
        html += '<thead>';
        html += '<tr>';
        html += '<th>클래스명</th>';
        // html += '<th>예약상태</th>';
        // html += '<th>전체 예약 인원</th>';
        //html += '<th>현재 예약 인원</th>';
        html += '<th>예약대기(명)</th>';
        html += '<th>접수완료(명)</th>';
        html += '<th>예약취소(명)</th>';
        html += '<th>접수취소(명)</th>';
        html += '<th>수강완료(명)</th>';
        html += '<th>전체(건)</th>';
        html += '</tr>';
        html += '</thead>';
        html += '<tbody>';
    	  
        
        // 서버에서 받은 데이터로 테이블 행 추가
        data.forEach(function(item) {
            //html += '<tr>';
            html += '<tr class="class-row" data-class-id=' + item.classId +  ' data-selected-date='+selectedDate + '>';
            html += '<td>' + item.classNm + '</td>'; // 클래스명
            html += '<td>' + item.stayPeople + '명</td>'; // 예약대기
            html += '<td>' + item.approvedPeople + '명</td>'; // 접수완료
            html += '<td>' + item.cancelPeople + '명</td>'; // 예약취소
            html += '<td>' + item.rejectPeople + '명</td>'; // 접수취소
            
            html += '<td>' + item.donePeople + '명</td>'; // 수강완료
            // html += '<td>' + item.totalReservations + '건</td>';
            html += '<td>' + item.totalAllReservations + '건</td>';
            // html += '<td>' + convertReservationStatus(item.reservationStatus) + '</td>';
            //html += '<td>' + item.totalAllPeopleReserved + '명</td>';
            //html += '<td>' + item.totalPeopleReserved + '명</td>';
            // html += '<td>' + item.totalAllReservations + '건</td>';
            html += '</tr>';
        });

        html += '</tbody>';
        html += '</table>';

        // 해당 div에 테이블 추가
        $('.addDateTotalStatTableDiv').html(html);
    	
        
     	// 클래스 행 클릭 시 이벤트 처리
        $('.class-row').click(function () {
            var classId = $(this).data('class-id');
            var selectedDate = $(this).data('selected-date');
            
            
            console.log("클릭행 클래스의 classId", classId)
            console.log("클릭행 클래스의 selectedDate", selectedDate)
            
            
            fetchClassDetails(classId, selectedDate); // 달력 아래 표 클래스 데이터 ajax 호출                              
        });
     
      }
     
      
    /*************************************************************/
   // (달력 아래 ) 표 나오게 하기 -  특정 클래스의 상세 통계 정보 가져오기
	function fetchClassDetails(classId, selectedDate) {
    	
    	console.log("달력 오른쪽에서 클래스 클릭 시 실행되는 함수 classId : ", classId)
    	console.log("달력 오른쪽에서 클래스 클릭 시 실행되는 함수 selectedDate : ", selectedDate)
    	
    	
	    $.ajax({
	        url: '/getReservationDayStatistics.do',
	        method: 'POST',
	        data: { classId: classId
	        		, reservationDt: selectedDate },
	        success: function(response) {
	        	console.log("달력 아래 클래스 데이터  response : ", response)
	        	
	        	
	            if (response.error === 'N') {
	            	console.log("달력 아래 클래스 데이터 조회 성공 ")
	            	
	                displayReservationStatistics(response.data, selectedDate); //달력 아래 표 생성 
	                $('.addTablesDiv').show(); // 테이블 표시
	            } else {
	            	console.log("달력 아래 클래스 데이터 조회 실패 ")
	            	
	                alert(response.message || "데이터 조회 중 오류 발생");
	            }
	        },
	        error: function() {
	            alert("데이터를 불러오는 중 오류가 발생했습니다.");
	        }
	    });
	}  
    
    
    
    // 달력 아래 표 
	// 날짜 선택 시 해당 날짜의 클래스별 시간대 예약현황을 보여주는 함수 
      function displayReservationStatistics(data, selectedDate) {
    	  
    	  // console.log("displayReservationStatistics 함수 data : " + data)
    	  
    	    var html = '';
    	    let prevClassName = '';
    	    let tableOpened = false;
    	    var isHolidayDisplayed = false; // 휴무일이 이미 표시되었는지 체크하는 변수
    	    
    	    
    	 	// 클래스별 합계를 저장할 변수
    	    let classTotalReservations = 0;
    	    let classTotalPeopleReserved = 0;
			//추가
			let classTotalAllPeopleReserved = 0;
    	    let classStayReservations = 0;
    	    let classApprovedReservations = 0;
    	    let classCancelReservations = 0;
    	    let classRejectReservations = 0;
    	    let classDoneReservations = 0;
			
    	    // var dateHtml = ''; // 일별 통계 표 만드는 html 
    	    
    	    
    	    // 데이터 확인
    		console.log("달력 아래 표 날짜선택 시 AJAX 응답 데이터: ", data);
    	    
    	    data.forEach(function (item, index) {
    	        
    	        console.log("displayReservationStatistics 함수 item : " + item)
    	        
    	        // 새로운 클래스명일 경우 테이블을 새로 생성
    	        if (prevClassName !== item.className) {
    	        	
    	        	
    	        	 // 이전 클래스의 합계 행 추가
    	            // 이전 클래스 테이블이 열려 있으면 닫기
    	            if (tableOpened) {
    	            	
    	            	// 마지막 테이블 제외 이전 클래스들 합계 처리 부분
    	            	// 이전 클래스가 휴무일이 아닐 경우에만 합계 표시
    	                if (!isHolidayDisplayed) {
    	            	
	    	            	html += '<tr style="font-weight: bold; background-color: #f2f2f2;">'
	   	            		html += '    <td>합계</td>'
   	            			html += '    <td>' + classTotalPeopleReserved + '명</td>';
	                        html += '    <td>' + classStayReservations + '건</td>';
	                        html += '    <td>' + classApprovedReservations + '건</td>';
	                        html += '    <td>' + classRejectReservations + '건</td>';
	                        html += '    <td>' + classCancelReservations + '건</td>';
	                        html += '    <td>' + classDoneReservations + '건</td>';
	                        html += '    <td>' + classTotalAllPeopleReserved + '건</td>';
	                        html += '</tr>';
    	                }
    	            	
    	                html += '</tbody></table><br>';
    	                tableOpened = false;
    	            }

    	            // 새로운 테이블 생성
    	            html += '<br/>'
   	            	html += '<br/>'
    	            html += '<h5>' + item.className +'(정원 : ' + item.classMaxCnt + '명)</h5>';
    	            html += '<table class="table table-hover reservationList">';
    	            html += '	<thead>';
    	            html += '		<tr>';
    	            html += '			<th>수강시간대</th>';
    	            html += '			<th>예약인원 (명)</th>';
    	            html += '			<th>예약대기 (건)</th>';
    	            html += '			<th>접수완료 (건)</th>';
    	            html += '			<th>접수취소 (건)</th>';
    	            html += '			<th>예약취소 (건)</th>';
    	            html += '			<th>수강완료 (건)</th>';
    	            html += '			<th>전체 (건)</th>';
    	            html += '		</tr>';
    	            html += '	</thead>';
    	            html += '<tbody>';
    	            
    	            tableOpened = true;
    	            isHolidayDisplayed = false; // 새로운 클래스마다 초기화
					
    	            
    	         // 새로운 클래스가 시작되었으므로 합계를 초기화
    	            classTotalReservations = 0;
    	            classTotalPeopleReserved = 0;
    	            // console.log("새로운 클래스 시작 : classTotalReservations - ", classTotalReservations, "classTotalPeopleReserved", classTotalPeopleReserved);
    	            // 추가
    	            classTotalAllPeopleReserved = 0;
    	            
    	            classStayReservations = 0;
    	    	    classApprovedReservations = 0;
    	    	    classCancelReservations = 0;
    	    	    classRejectReservations = 0;
    	    	    classDoneReservations = 0;
    				
    	        }
				
    	        
    	        
    	        
    	        
     	        // 휴무일인 경우, 테이블 행을 병합하여 한 줄로 표시하고 합계는 생략
    	        if (item.holidayStatus === '휴무일' && !isHolidayDisplayed) {
    	            html += '<tr>';
    	            html += `	<td colspan="8" style="text-align: center; font-weight: bold;">휴무일입니다</td>`;
    	            html += '</tr>';
    	            isHolidayDisplayed = true; // 휴무일이 표시되었음을 기록

    	        } else if (item.holidayStatus !== '휴무일') {
    	            // 휴무일이 아닌 경우 일반 행 추가
    	            html += '<tr>';
    	            html += '	<td>' + item.timeSlot + '</td>';
    	            html += '	<td>' + item.totalPeopleReserved + '명</td>';
    	            // html += '<td><a href="#" onclick="showReservationDetails('${item.classId}', '${item.classDetailId}', '${selectedDate}')">item.totalReservations 건</a></td>`;
    	            html += '	<td>' + item.stayCount + '건</td>'; // 예약대기
    	            html += '	<td>' + item.approvedCount + '건</td>'; // 접수완료
    	            html += '	<td>' + item.rejectCount + '건</td>'; // 접수취소
    	            html += '	<td>' + item.cancelCount + '건</td>'; // 예약취소
    	            html += '	<td>' + item.doneCount + '건</td>'; // 수강완료
    	            html += '<td><a href="javascript:void(0);" style="text-decoration: underline;" onclick="handleReservationClick(\'' 
					       + encodeURIComponent(item.classId) + '\', \'' 
					       + encodeURIComponent(item.classDetailId) + '\', \'' 
					       + encodeURIComponent(selectedDate) + '\', ' 
					       + item.totalAllReservations + ')">' 
					       + item.totalAllReservations + ' 건</a></td>';
					html += '</tr>';
    	            
    	           
    	         	// 클래스별 합계 계산
    	         	// 예약 데이터 누적 계산
    	            classTotalPeopleReserved += parseInt(item.totalPeopleReserved, 10);
    	            classTotalReservations += parseInt(item.totalReservations, 10);
    	            
    	            // 추가
    	            classTotalAllPeopleReserved += parseInt(item.totalAllReservations, 10);
    	            classStayReservations += parseInt(item.stayCount, 10);
    	    	    classApprovedReservations += parseInt(item.approvedCount, 10);
    	    	    classRejectReservations += parseInt(item.rejectCount, 10); 
    	    	    classCancelReservations += parseInt(item.cancelCount, 10);
    	    	    classDoneReservations += parseInt(item.doneCount, 10);
    	            console.log("기존 클래스 : classTotalAllPeopleReserved - ", classTotalAllPeopleReserved, "classStayReservations", classStayReservations);

    	        }

    	        // 현재 클래스명을 이전 클래스명으로 저장
    	        prevClassName = item.className;
    	    });

    	    // 마지막 테이블
    	    // 열려 있으면 닫기
    	    if (tableOpened) {
    	    	console.log("합계 표시하는 곳 classTotalPeopleReserved : ", classTotalPeopleReserved, "classTotalAllPeopleReserved : ", classTotalAllPeopleReserved)
    	    	
    	    	
    	    	// 휴무일이 아닌 경우에만 합계를 표시
			    if (!isHolidayDisplayed) {
			        html += '<tr style="font-weight: bold; background-color: #f2f2f2;">';
			        html += '    <td>합계</td>';
			        html += '    <td>' + classTotalPeopleReserved + '명</td>';
					

			        html += '    <td>' + classStayReservations + '건</td>';
			        html += '    <td>' + classApprovedReservations + '건</td>';
			        
			        html += '    <td>' + classRejectReservations + '건</td>';
			        html += '    <td>' + classCancelReservations + '건</td>';
			        html += '    <td>' + classDoneReservations + '건</td>';
			        html += '    <td>' + classTotalAllPeopleReserved + '건</td>';
			        html += '</tr>';
			    }
   	    		
    	    	 html += '</tbody></table></br></br></br>';
    	    }

    	    // 결과를 화면에 표시
    	    $('.addTablesDiv').html(html);
    	}   
      
    /**************************************************************************************/
    
      // 예약건 수 클릭 시 
      function handleReservationClick(classId, classDetailId, selectedDate, totalReservations) {
    	    // 예약 건수가 0이면 클릭을 막고 알림 표시
    	    if (totalReservations <= 0) {
    	        alert("예약 건수가 없습니다.");
    	        return false;
    	    }
    	    
    	    // 예약 건수가 1 이상인 경우에만 상세 정보 표시
    	    showReservationDetails(classId, classDetailId, selectedDate);
    	}
      
      
      
      // 아래 표
      // 각 클래스 시간대별 예약건수 클릭 시 예약 상세 정보 가져오는 함수 
		function showReservationDetails(classId, classDetailId, selectedDate) {
    	  
    	  	console.log("예약건수 클릭 시 들어오는 showReservationDetails 함수 들어왔는 지확인 ")
    	    // AJAX 요청으로 해당 시간대의 예약 상세 정보 가져오기
    	    $.ajax({
    	        url: '/adminReservationStatDetail.do',
    	        method: 'POST',
    	        data: { 
	    	        	classId: classId
	    	           ,classDetailId: classDetailId
	    	           ,reservationDt: selectedDate
    	        	},
    	        success: function(response) {
    	        	console.log("adminReservationStatDetail 응답 성공 response : ", response)
    	        	console.log("adminReservationStatDetail 응답 성공 response.data : ", response.data)
    	        	
    	        	
    	        	// 예약상태 공통코드 statusMap을 가져와서 JavaScript 객체로 변환
			         var statusMap = response.statusMap;
			         console.log("statusMap: ", statusMap);
			         
    	        	
    	        	
    	            if (response.error === 'N') {
    	            	
    	                // displayReservationDetailTable(response.data);
    	                
    	                
    	             // 예약 건수가 0인지 확인
    	                if (!response.data || response.data.length === 0) {
    	                    // 예약 데이터가 없을 경우
    	                    displayReservationDetailTable([]);
    	                } else {
    	                    // 예약 데이터가 있을 경우
    	                    displayReservationDetailTable(response.data , statusMap, selectedDate);
    	                }

    	             
    	             // 모달 창 열기
    	                $('#reservationDetailModal').modal('show');
    	                
    	            } else {
    	                alert(response.message || "예약 상세 정보를 가져오는 중 오류 발생");
    	            }
    	        },
    	        error: function() {
    	            alert("예약 상세 정보를 가져오는 중 오류가 발생했습니다.");
    	        }
    	    });
    	}
     
      
      
     // 모달 
     // 예약건수 클릭시 상세정보 받아서 화면에 표출하는 함수
     function displayReservationDetailTable(reservations, statusMap, selectedDate ) {
		    console.log("예약건수 클릭 시 응답 데이터 displayReservationDetailTable - reservations :", reservations);
    	 
    	 
		    var detailHtml=''
		    
		    detailHtml = '<h5>' + reservations[0].classNm  +'  ' +selectedDate + '   ' +  reservations[0].timeSlot +  '  예약 상세 정보</h5>';
		    detailHtml += '<table class="table table-hover reservationDetailTable">';
		    detailHtml += '<thead><tr><th>예약자명</th><th>연락처</th><th>이메일</th><th>예약인원수</th><th>예약상태</th></tr></thead>';
		    detailHtml += '<tbody>';
			
		 // 데이터가 없을 경우 메시지 표시
		    if (!reservations || reservations.length === 0) {
		        detailHtml += '<tr><td colspan="4" style="text-align:center;">예약 정보가 없습니다.</td></tr>';
		    } else {
		    	// 예약 데이터가 있을 경우 출력
			    reservations.forEach(function(item) {
			        detailHtml += '<tr>';
			        
			        
			        var reservationType = '';
		            // 회원/비회원 구분 
		            if (item.reservationType === 'user') {
		            	reservationType = '회원'
		            	// html+= '    <td>회원</td>'; // 회원/비회원 구분 
	                    // 접수완료 버튼
	                } else if (item.reservationType === 'nonUser') {
	                	reservationType = '비회원' 
	                }
		            
			        detailHtml += '<td><a href="adminReservationInfo.do?reservationId='+encodeURIComponent(item.reservationId)+'">'+ item.reservationNm +'(' +  reservationType + ')</a></td>';
			        detailHtml += '<td>' + item.reservationPhone + '</td>';
			        detailHtml += '<td>' + item.reservationEmail + '</td>';
			        detailHtml += '<td>' + item.reservationCnt + '</td>';
			        // detailHtml += '<td>' + item.reservationStatus + '</td>';
			     // 예약상태를 statusMap을 이용하여 한글로 변환
	                var statusKorean = statusMap[item.reservationStatus] || item.reservationStatus; // 한글 변환된 상태가 없을 경우, 기본값 사용
	                detailHtml += '    <td>' + $.trim(statusKorean) + '</td>';
			        detailHtml += '</tr>';
			    });
		    }
		 
		    detailHtml += '</tbody></table>';
			
		    // console.log("HTML 내용:", detailHtml);

		    
		 	// 모달 내용 업데이트
		    $('#reservationDetailContent').html(detailHtml);
		 	
		 	
		    
		 	
		    // $('.addDateStatDetailsTableDiv').html(detailHtml);
	}
     
     
     
     
    // 모달이 실제로 열리는지 확인:
  $('#reservationDetailModal').on('shown.bs.modal', function() {
        console.log("모달이 열렸습니다.");
  });   

  // 예약 상태 변환 함수
  function convertReservationStatus(status) {
      switch (status) {
          case 'stay':
              return '예약대기';
          case 'approved':
              return '접수완료';
          case 'cancel':
              return '예약취소';
          case 'reject':
              return '접수취소';
          case 'done':
              return '수강완료';
          default:
              return '알 수 없음';
      }
  }
	</script>
    
    
    
    
    
    <script type="text/javascript">
  //페이지 로드가 완료되면
    if (window.addEventListener) window.addEventListener("load", reservationList, false);
	else if (window.attachEvent) window.attachEvent("onload", reservationList);
	else window.onload = reservationList;
	function reservationList() {
		
		
		console.log("로드 확인용 ")
   		     
     
	} 
    
	</script>
	
</body>



</html>

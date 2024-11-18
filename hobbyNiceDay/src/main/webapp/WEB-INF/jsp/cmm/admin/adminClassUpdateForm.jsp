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

	/* 라벨 색상 변경 */
	.input-group-append .input-group-text, .input-group-prepend .input-group-text {
	    background-color: #32589d;
	    border-color: rgba(0, 0, 0, 0.15);
	    color: #fff;
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
                                            <h5 class="m-b-10">클래스 수정 페이지</h5>
                                            <p class="m-b-0">등록된 클래스 정보를 수정하는 페이지입니다.</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li >
                                                <a href="index.html"> </a>
                                            </li>
                                            <li >
                                            	<a href="/adminClassList.do">클래스 관리 > </a>
                                            </li>
                                            <li >
                                            	<a href="/adminClassInfo.do">클래스 수정</a>
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
	                                                <h5>클래스 수정</h5>
	                                                <span>클래스 수정 페이지입니다. <code>TB_CLASS</code></span>
	                                       		   
	                                            </div>
	                                            
	                                            <form id="insertForm" name="insertForm" method="post"  enctype="multipart/form-data"><!-- 파일 업로드 위해서 추가 -->
	                                            	
	                                            	<!-- 
	                                            	<input type="hidden" id="maxParticipants" name="maxParticipants" ><!-- 최대 에약 가능 인원수 (tb_class_detail
	                                            	<input type="hidden" id="availableCurrentCnt" name="availableCurrentCnt" value="0"> <!-- 현재 예약 인원수
	                                            	<input type="hidden" id="availableSeats" name="availableSeats" > <!-- 남은 좌석 수 
	                                            	<input type="hidden" id="availableStatus" name="availableStatus" value="Y">
	                                            	 -->
	                                            	
	                                            <div class="card-block table-border-style">
	                                                <div class="table-responsive">
	                                                    
	                                                    <table class="table table-hover">
	                                                        <thead>
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="classNm">
				                                                            	* 클래스명
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id=classNm name="classNm" class="form-control" placeholder="클래스명을 입력해주세요" title="클래스명을 입력해주세요"  data-toggle="tooltip"  required
			                                                            	value="${classDetails.classNm}" >
			                                                            
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classDscrptn">
			                                                            	클래스 설명
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id=classDscrptn name="classDscrptn" class="form-control" placeholder="클래스 설명을 입력해주세요" title="클래스 설명을 입력해주세요"  data-toggle="tooltip" 
			                                                           		 value="${classDetails.classDscrptn}" >
	                                                                </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
	                                                                    <span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="location">
			                                                            	* 클래스 장소
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="location" name="location" class="form-control" 
			                                                            	   placeholder="클래스 장소를 입력해주세요" title="클래스 장소를 입력해주세요"  data-toggle="tooltip"  required
			                                                            	   value="${classDetails.location}" >
			                                                            	   </br>	                                                        			
			                                                            	   </br>
	                                                                </th>
	                                                                <th colspan="2" width="50%">
		     															
		     															<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="imgFile">
			                                                            	*  클래스 이미지
			                                                           	</label>
			                                                           	</span>
	                                                            		<input type="file" id="imgFile" name="imgFile" class="form-control" placeholder="클래스 이미지를 등록해주세요" title="클래스 이미지를 등록해주세요" data-toggle="tooltip" 
	                                                            				value = "${classDetails.imgNm}" disabled >
                                                           				<p>현재 등록된 클래스 대표사진 파일명: ${classDetails.imgNm}</p>
                                                           				                                                     
	                                                                </th>
	                                                            </tr>
	                                                        
	                                                            <tr>
	                                                                
																	
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classCateBig">
			                                                            	* 클래스 대분류
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="classCateBig" name="classCateBig"  class="form-control" placeholder="클래스 대분류를 선택해주세요" title="클래스 대분류를 선택해주세요"  data-toggle="tooltip" required  > 
			                                                            	    <option value="">선택</option>
																			    <option value="crafts" ${classDetails.classCateBig == 'crafts' ? 'selected' : ''}>공예</option>
																			    <option value="cooking_baking" ${classDetails.classCateBig == 'cooking_baking' ? 'selected' : ''}>요리&베이킹</option>
																			    <option value="art" ${classDetails.classCateBig == 'art' ? 'selected' : ''}>미술</option>
																			</select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classCateSmall">
			                                                            	* 클래스 소분류
			                                                           	</label>
			                                                           	</span>
			                                                           	<select id="classCateSmall" name="classCateSmall"  class="form-control" placeholder="클래스 소분류를 선택해주세요" title="클래스 소분류를 선택해주세요" data-toggle="tooltip" required>
			                                                            	<option value=" ${classDetails.classCateSmall}">선택</option> <!-- 클래스 대분류에 따른 소분류 코드를 가져와야함 (tb_code) -->
			                                                            	
			                                                            </select>
			                                                         </th>
	                                                                
	                                                            </tr>
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classMaxCnt">
			                                                            	* 최대 참가자수
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="number" min="0" id="classMaxCnt" name="classMaxCnt" class="form-control" placeholder="최대 참가자수를 입력해주세요" title="최대 참가자수를 입력해주세요" data-toggle="tooltip" required
			                                                            		value="${classDetails.classMaxCnt}" readonly >
			                                                        </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classAgeMin">
			                                                            	* 최소수강가능연령
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="number" min="0" id="classAgeMin" name="classAgeMin" class="form-control" placeholder="수강가능한 최소연령을 입력해주세요" title="수강가능한 최소연령을 입력해주세요" data-toggle="tooltip" required
			                                                            		value="${classDetails.classAgeMin}" >
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPrice">
			                                                            	 * 클래스 가격
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="number" min="0" id="classPrice" name="classPrice" class="form-control" placeholder="클래스 가격을 입력해주세요" title="클래스 가격을 입력해주세요" data-toggle="tooltip"
			                                                            		value="${classDetails.classPrice}" >
		                                                        	</th>
		                                                        	
		                                                        	<th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPost">
			                                                            	 * 클래스 게시 여부
			                                                           	</label>
			                                                           	</span><select id="classPost" name="classPost"  class="form-control" placeholder="클래스 소분류를 선택해주세요" title="클래스 소분류를 선택해주세요" data-toggle="tooltip" required>
			                                                            	<option value="">선택</option> <!-- 클래스 대분류에 따른 소분류 코드를 가져와야함 (tb_code) -->
			                                                            	<option value="Y" ${classDetails.classPost == 'Y' ? 'selected' : ''}>게시</option>
			                                                            	<option value="N" ${classDetails.classPost == 'N' ? 'selected' : ''}>미게시</option>
			                                                            </select>
			                                                            
			                                                            <!-- 직접 입력용 소분류 입력란 (기타 선택 시 표시) -->
    																	<input type="text" id="classCateSmallText" name="classCateSmallText" 
    																	class="form-control" placeholder="소분류를 입력하세요" title="소분류를 입력하세요" data-toggle="tooltip" style="display:none;" />
			                                                         </th>
                                                                	
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPrice">
			                                                            	* 클래스 소요시간
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="int" id="classTimeTaken" name="classTimeTaken" class="form-control" placeholder="클래스 소요시간을 입력해주세요" title="클래스 소요시간을 입력해주세요" data-toggle="tooltip"
			                                                            		value="${classDetails.classTimeTaken}" readonly>
		                                                        	</th>
		                                                        	
		                                                        	<th colspan="2" width="50%" >
	                                                                </th>
                                                                	
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="startDt">
			                                                            	* 클래스 시작일자
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="date" id="startDt" name="startDt" class="form-control" placeholder="클래스 시작일자를 입력해주세요" title="클래스 종료일자를 입력해주세요" data-toggle="tooltip"
			                                                          		   value="${classDetails.startDt}" >
		                                                        	</th>
		                                                        	
		                                                        	<th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="endDt">
			                                                            	* 클래스 종료일자
			                                                           	</label>
			                                                           	</span>
    																    <input type="date" id="endDt" name="endDt" class="form-control" placeholder="클래스 종료일자를 입력해주세요" title="클래스 종료일자를 입력해주세요" data-toggle="tooltip"
    																     		value="${classDetails.endDt}" >
		                                                        	</th>
                                                                	
	                                                            </tr>
                                                            
                                                            
                                                            
                                                            <div>
                                                            	<tr>
                                                            		<th>
                                                            			<h5>클래스 수강 시간대</h5>
                                                            		</th>
                                                           		</tr>
                                                            	<c:forEach var="timeSet" items="${timeSetsList}"> 
                                                            		
		                                                            <tr id = "classTimeRow">
		                                                                <th colspan="2"  width="5%">
		                                                                	<span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="timeStart">
				                                                            	*  클래스 시작시간
				                                                           	</label>
				                                                           	</span>
	   																		<input type="time" id="timeStart" name="timeStart[]" class="form-control" placeholder="클래스 시작시간을 입력해주세요" 
	   																			   title="클래스 시작시간을 입력해주세요"  readonly  value="${timeSet.timeStart}" data-toggle="tooltip">
		                                                                </th>   
		                                                                    
		                                                                <th colspan="2" width="5%">
		                                                                	<span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="timeEnd">
				                                                            	* 클래스 종료시간
				                                                           	</label>
				                                                           	</span>
	   																		<input type="time" id="timeEnd" name="timeEnd[]" class="form-control" placeholder="클래스 종료시간을 입력해주세요" 
	   																		title="클래스 종료시간을 입력해주세요" data-toggle="tooltip" readonly value="${timeSet.timeEnd}">
		                                                                </th>  
		                                                                
		                                                                
		                                                            </tr>
	                                                            </c:forEach>
                                                            </div>
                                                            	
                                                            	<tr>
                                                            		<th>
                                                            			<h5>클래스 휴무일</h5>
                                                            		</th>
                                                           		</tr>
                                                            	<c:forEach var="holiday" items="${holidayList}">
		                                                            <tr id = "holidayRow">
		                                                                <!-- 기존 휴무일 날짜 입력 -->
		                                                                <th colspan="2" width="5%">
		                                                                	<span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="holidayDt">
				                                                            	휴무일
				                                                           	</label>
				                                                           	</span>
	   																		<input type="date" id="holidayDt" name="holidayDt[]" class="form-control" placeholder="휴무일을 입력해주세요" title="휴무일을 입력해주세요" data-toggle="tooltip"
	   																		value="${holiday.holidayDt}" readonly>
		                                                                </th>   
		                                                                    
	                                                                    <!-- 기존 휴무일 설명 입력 -->
		                                                                <th colspan="2" width="25%">
			                                                                <span class="input-group-prepend" id="name">
					                                                            <label class="input-group-text" for="holidayDesc">
					                                                            	휴무일 설명
					                                                           	</label>
					                                                           	</span>
		                                                                	<input type="text" id="holidayDesc" name="holidayDesc[]" class="form-control" placeholder="휴무일 설명을 입력해주세요" title="휴무일 설명을 입력해주세요" data-toggle="tooltip"
		                                                                			value="${holiday.holidayDesc}" readonly>                                              
		                                                                </th>
		                                                                
	                                                                	<!-- 휴무일 삭제 버튼 -->
																        <th width="5%">
																            <button type="button" class="btn btn-danger removeHoliday" data-holiday-id="${holiday.holidayId}" style="background-color: ;">X</button>
																        </th>
		                                                                
		                                                               
		                                                                <th ></th>
		                                                                <th></th>
		                                                            </tr>
	                                                        	</c:forEach>
	                                                        	
	                                                        	
	                                                        	
	                                                        	<!-- 새로운 휴무일 추가 -->
																<tr id="newHolidayRow">
																    <th colspan="2" width="5%">
																        <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="newHolidayDt">
				                                                            	휴무일
				                                                           	</label>
			                                                           	</span>
																        
																        <input type="date" id="newHolidayDt" name="newHolidayDt" class="form-control" placeholder="휴무일을 입력해주세요" title="휴무일을 입력해주세요" data-toggle="tooltip">
																        <div  style="margin-top: 5px;"></div>
																    </th>
																    <th colspan="2" width="25%">
																    
																	    <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="holidayDesc">
				                                                            	휴무일 설명
				                                                           	</label>
			                                                           	</span>
																        <input type="text" id="newHolidayDesc" name="newHolidayDesc" class="form-control" placeholder="휴무일 설명을 입력해주세요" title="휴무일 설명을 입력해주세요" data-toggle="tooltip">
																        
																        <!-- 에러 메시지를 표시할 위치 -->
																		<!-- 
																		<div id="errorMessage" style="color: red; margin-top: 10px;"></div>
																		 -->
																		 
																		 <!-- 경고 메시지를 표시할 영역 -->
																		 <div id="holidayDescMsg" style="margin-top: 5px;"></div>
																    </th>
																    <th width="5%">
																        <button id="addHolidayBtn" class="btn btn-inverse">+</button>
																    </th>
																</tr>
	                                                        	
	                                                        	
	                                                        	
	                                                        	
	                                                        	
	                                                        	
	                                                        	
																
																
	                                                        	<tr>
		                                                        	<td colspan="5">
		                                                        		
		                                                        		<div style="text-align: center; margin-top: 10px;">
			                                                        		<!-- 수정 -->
		                                                        			<a href="/adminClassUpdateForm.do?classId=${classDetails.classId}" id="updateBtn" 
		                                                        			class="btn waves-effect  waves-light m-r-20" style=background-color:#32589d;color:white;margin-right:20px;" 
			                                                        				data-toggle="tooltip" data-placement="right">수정</a>
		                                                        			
					                                                        <!-- 목록 -->
					                                                        <a href="/adminClassList.do" id="ListBtn" class="btn waves-effect waves-light"
					                                                        style="background-color:#d8b95d;color:white;border-color:#d8b95d;margin-right:20px;" >클래스 목록</a>
					                                                        
					                                                        <!-- 삭제 -->
					                                                        <a href="#" id="deleteBtn" class="btn waves-effect waves-light m-r-20" 
					                                                        	style="background-color:#D85D5D;color:white;border-color:#D85D5D;margin-right:20px;" data-toggle="tooltip" data-placement="right">
					                                                        	삭제
					                                                        </a>
		                                                        		</div>
	                                                        			 
	                                                        			 
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
	
	var timeSets = "${classDetails.timeSets}";
    console.log("timeSets", timeSets)

	function userData() {
    	
		
	 	 
	 	 
		/*******************************************************************/
		
		// 기존 휴무일 삭제
		$('.removeHoliday').click(function () {
		    const holidayId = $(this).data('holiday-id');
		
		    if (confirm('해당 휴무일을 삭제하시겠습니까?')) {
		        $.ajax({
		            type: 'POST',
		            url: '/adminClassUpdateDeleteHoliday.do',
		            data: { holidayId: holidayId },
		            success: function (response) {
			        	console.log("휴무일 삭제 response : " , response)

		            	
		            	if(response.error === "N"){
				            // alert('휴무일이 성공적으로 삭제되었습니다.');
				            alert(response.message); // 성공 메시지 표시
				            location.reload();  // 페이지 새로고침하여 변경된 내용을 반영
				            // location.href = '/adminClassUpdateForm.do?classId=' + classId;
			        	}else if(response.error === "Y"){
			                alert('휴무일 삭제 중 오류가 발생했습니다: ' + response.errorMsg); // 실패 메시지 표시
			                location.href = '/adminClassUpdateForm.do?classId=' + classId;
			        	}
		            	
		            },
		            error: function (xhr) {
		                alert('휴무일 삭제 중 오류가 발생했습니다: ' + xhr.responseText);
		            }
		        });
		    }
		});
		/***********************************************************/
		
		
		
		//새로운 휴무일 등록 시
		// 휴무일 날짜 입력 시 유효성 검사
	    const startDate = new Date('${classDetails.startDt}');
	    const endDate = new Date('${classDetails.endDt}');
	
	    // 기존 휴무일을 배열로 수집
	    const existingHolidays = [];
	    $('input[name="holidayDt[]"]').each(function () {
	        existingHolidays.push($(this).val());
	    });
	
	    console.log("기존 휴무일 목록:", existingHolidays);
	
	    // 휴무일 날짜 선택 시 유효성 검사
	    $('#newHolidayDt').on('change', function () {
	        const holidayDt = $(this).val();
	        
	        const holidayDate = new Date(holidayDt);
	
	        
	        
	
	        // 휴무일이 클래스 시작일과 종료일 사이에 있는지 확인
	        if (holidayDate < startDate || holidayDate > endDate) {
	            alert('휴무일은 클래스 시작일과 종료일 사이에 있어야 합니다.');
	            resetHolidayInputs();
	            return;
	        }
	
	        // 기존 휴무일과 중복되는지 확인
	        if (existingHolidays.includes(holidayDt)) {
	            alert('이미 등록된 휴무일입니다.');
	            resetHolidayInputs();
	            return;
	        }
	    });


	 	// 입력 필드 초기화 함수
	    function resetHolidayInputs() {
	        $('#newHolidayDt').val('');
	        $('#newHolidayDesc').val('');
	        $('#holidayDescMsg').text('');
	    }
		
		
		// 3. 휴무일 설명이 30자를 초과한 경우, 공백만 입력할 경우 제한
		 	$('#newHolidayDesc').on('input', function () {
			    const maxLength = 30;
			    const description = $(this).val();
			
			    // 공백만 입력된 경우 경고 메시지 표시
			    if (description.trim().length === 0) {
			        $('#holidayDescMsg').text("공백만 입력할 수 없습니다. 휴무일 설명을 입력해주세요.")
			            .css("color", "#D85D5D");
			    } 
			    // 최대 글자 수를 초과한 경우 경고 메시지 표시 및 자동 자르기
			    else if (description.length > maxLength) {
			        $(this).val(description.substring(0, maxLength));
			        $('#holidayDescMsg').text("휴무일 설명은 최대 30자까지 입력할 수 있습니다.")
			            .css("color", "#D85D5D");
			    } 
			    // 유효한 입력일 경우 메시지 삭제
			    else {
			        $('#holidayDescMsg').text("");
			    }
			});
	 	 
		
		
		
		
		
	 	
		
		
		
		
		
		
		
		
		
		// 새로운 휴무일 추가 버튼 클릭
		$('#addHolidayBtn').click(function (e) {
			
			 e.preventDefault(); // 기본 폼 제출 방지
			 
			 const classId = '${classDetails.classId}';
			    const holidayDt = $('#newHolidayDt').val();
			    // const holidayDesc = $('#newHolidayDesc').val();
				const holidayDesc = $('#newHolidayDesc').val().trim(); // 공백 제거
				
				
			    //클래스 시작일자, 종료 일자
			    const startDate = new Date('${classDetails.startDt}');
			    const endDate = new Date('${classDetails.endDt}');
			    const holidayDate = new Date(holidayDt);

			    
		    // 1. 휴무일 날짜가 입력되지 않았을 경우
		    
		    if (!holidayDt) {
		        alert('휴무일을 입력해주세요.');
		        $('#newHolidayDt').focus();
		        return false;
		    }
		    
		    // 2. 휴무일 설명이 입력되지 않았거나 공백만 있는 경우
		    if (!holidayDesc || holidayDesc.length === 0) {
		        alert('휴무일 설명을 입력해주세요.');
		        $('#newHolidayDesc').focus();
		        return false;
		    }
		    
		 	
		 	
		 	
		 
		 	
		    
		    
			
			// 유효성 검사 - 미입력
			// if (requiredEmpty()) {
			// 	return false;
			// }
		    
		    
		    
		     // 유효성 검사를 모두 통과했을 경우, 휴무일 추가 요청 전송
		    if (confirm("새로운 휴무일을 추가하시겠습니까?")) {
				// 휴무일 추가 
			    $.ajax({
			        type: 'POST',
			        url: '/adminClassUpdateInsertHoliday.do',
			        data: { classId: classId
			        		, holidayDt: holidayDt
			        		, holidayDesc: holidayDesc },
			        success: function (response) {
			        	console.log("휴무일 추가 response : " , response)
			        	
			        	// 응답을 JSON 형식으로 파싱
	        			// var jsonResponse = JSON.parse(response);
			        	// console.log("휴무일 추가- 파싱데이터 jsonResponse : " , jsonResponse)
					    
			        	
			        	if(response.error === "N"){
				            // alert('휴무일이 성공적으로 추가되었습니다.');
				            alert(response.message); // 성공 메시지 표시
				            location.reload();  // 페이지 새로고침하여 변경된 내용을 반영
				            // location.href = '/adminClassUpdateForm.do?classId=' + classId;
			        	}else if(response.error === "Y"){
			                alert('휴무일 추가 중 오류가 발생했습니다: ' + response.errorMsg); // 실패 메시지 표시
			                // location.href = '/adminClassUpdateForm.do?classId=' + classId;
			        	}
			        },
			        error: function (xhr) {
			            alert('휴무일 추가 중 오류가 발생했습니다: ' + xhr.responseText);
			         	// location.href = '/adminClassUpdateForm.do?classId=' + classId;
			        }
			    });
			
		    }
		});
		
		/***************************************************************************/
		// 소분류, 대분류 
		// DB에서 가져온 값
	    var selectedClassCateBig = "${classDetails.classCateBig}"; // 대분류 값
	    var selectedClassCateSmall = "${classDetails.classCateSmall}"; // 소분류 값
	    
	    
	    console.log("대분류: " + selectedClassCateBig);
	    console.log("소분류: " + selectedClassCateSmall);
	    
		// 대분류와 소분류 데이터를 객체로 정의
		// 대분류에 따른 소분류 목록 정의
	    
	    // 대분류와 소분류 데이터를 객체로 정의
	    var categories = {
	        crafts: [
	            { value: 'soap_making', text: '비누' },
	            { value: 'candle_making', text: '캔들' },
	            { value: 'pottery', text: '도자기' },
	            { value: 'leather_crafting', text: '가죽' },
	            { value: 'knitting', text: '뜨개질' },
	            { value: 'embroidery', text: '자수' },
	            { value: 'etc', text: '기타' }
	        ],
	        art: [
	            { value: 'watercolor', text: '수채화' },
	            { value: 'oil_painting', text: '유화' },
	            { value: 'drawing', text: '드로잉' },
	            { value: 'calligraphy', text: '캘리그래피' },
	            { value: 'sculpture', text: '조각' },
	            { value: 'craft_art', text: '공예 미술' },
	            { value: 'etc', text: '기타' }
	        ],
	        music: [
	            { value: 'guitar', text: '기타' },
	            { value: 'piano', text: '피아노' },
	            { value: 'ukulele', text: '우쿨렐레' },
	            { value: 'vocal', text: '보컬' },
	            { value: 'drumming', text: '드럼' },
	            { value: 'violin', text: '바이올린' },
	            { value: 'etc', text: '기타' }
	        ],
	        exercise: [
	            { value: 'yoga', text: '요가' },
	            { value: 'pilates', text: '필라테스' },
	            { value: 'dance', text: '댄스' },
	            { value: 'taekwondo', text: '태권도' },
	            { value: 'fitness', text: '피트니스' },
	            { value: 'climbing', text: '클라이밍' },
	            { value: 'etc', text: '기타' }
	        ],
	        cooking_baking: [ // 요리 & 베이킹 대분류 추가
	            { value: 'korean_cuisine', text: '한식' }, // 한식 소분류
	            { value: 'western_cuisine', text: '양식' }, // 양식 소분류
	            { value: 'bakery', text: '제과제빵' }, // 제과제빵 소분류
	            { value: 'dessert', text: '디저트' }, // 디저트 소분류
	            { value: 'etc', text: '기타' } 
	        ],
	        etc: [ // 요리 & 베이킹 대분류 추가
	        	{ value: 'etc', text: '기타' } 
	        ]
	    };

            
	    // 대분류 선택 시 소분류를 업데이트하는 jQuery 코드
	    
	    $('#classCateBig').on('change', function() {
	        var selectedCategory = $(this).val(); // 선택된 대분류 값
	        var $classCateSmall = $('#classCateSmall'); // 소분류 선택 요소
	        var $classCateSmallText = $('#classCateSmallText'); // 소분류 입력 요소

			/*
	        // '기타'가 선택되면 select 숨기고 input 보이게 설정
	        if (selectedCategory === 'etc') {
	            $classCateSmall.hide();
	            $classCateSmallText.show();
	        } else {
	            $classCateSmallText.hide();
	            $classCateSmall.show();
	        }
            */
	            // 소분류 초기화
	            $classCateSmall.empty();
	            $classCateSmall.append('<option value="">선택</option>');

	            // 대분류에 맞는 소분류 항목 추가
	            if (categories[selectedCategory]) {
	                $.each(categories[selectedCategory], function(index, subcategory) {
	                    $classCateSmall.append('<option value="' + subcategory.value + '">' + subcategory.text + '</option>');
	                });
	            }
	        
	        
	        
	        
	    }); // 대분류 소분류 끝 
	    
		
	    
            
         // 대분류에 맞는 소분류 채우기
            function populateClassCateSmall() {
                var $classCateSmall = $('#classCateSmall');
                $classCateSmall.empty(); // 기존 옵션 삭제
                $classCateSmall.append('<option value="">선택</option>');
				
                
                // 선택된 대분류에 해당하는 소분류 목록이 있는지 확인
                if (categories[selectedClassCateBig]) {
                    $.each(categories[selectedClassCateBig], function (index, subcategory) {
                        var option = $('<option>', {
                            value: subcategory.value,
                            text: subcategory.text
                        });
                        // 소분류 값이 일치하면 선택
                        if (subcategory.value === selectedClassCateSmall) {
                            option.prop('selected', true);
                        }
                        $classCateSmall.append(option);
                    });
                }
                
	    }; // 대분류 소분류 끝 
		
	 // 초기 실행 - 소분류 가져오기  (페이지 로드 시 호출)
	    populateClassCateSmall();
		
		
		/************************************************************************/
		
		// 수정버튼 클릭 시
	    $('#updateBtn').click(function(e) {
	        e.preventDefault(); // 폼의 기본 제출 기능 방지

	        const classId = '${classDetails.classId}';
	        
	        if (requiredEmpty()) {
	            return;
	        }
			
	        
	     // form 데이터를 자동으로 수집
	     if (confirm("클래스를 수정하시겠습니까?")) {
				var form = $('#insertForm')[0];
				var formData = new FormData(form);
		        // const formData = $('#insertForm').serialize();
					
		        console.log("전송할 formData : " + formData)
		        
		        // 수정할 클래스 정보 수집
		        
		        // 클래스 수정 요청 (휴무일 제외)
		        $.ajax({
		            type: 'POST',
		            url: '/adminClassUpdate.do?classId=' + classId,
		            // contentType: 'application/json',
		            // data: JSON.stringify(classData),
		            processData: false,
					contentType: false,
		            data: formData,
		            success: function(response) {
		           
		            	console.log("응답 데이터: ", response);
		            	
		            	if (response.error === "N") {
		                    alert(response.message);
		                    location.href = '/adminClassInfo.do?classId=' + classId;
		                } else if (response.error == 'Y') {
		                	 alert('클래스 수정 실패 : ' + response.errorMsg);
			                    location.href = '/adminClassUpdate.do?classId=' + classId;
		                    // alert('오류: ' + response.message);
		                }
		            },
		            error: function(xhr) {
		            	 const errorResponse = JSON.parse(xhr.responseText);
		                 alert('수정 중 오류 발생: ' + errorResponse.errorMsg);
		                 //alert('클래스 정보 수정 중 오류가 발생했습니다: ' + xhr.responseText);
		            }
		        });
	     	}
	    });
		
		
		/******************************************************************/
		// 삭제 버튼 클릭
	    $('#deleteBtn').click(function (e) {
	    	console.log("삭제 버튼 클릭")
	    	e.preventDefault(); // 기본 링크 동작 방지
	    	
	    	const classId = '${classDetails.classId}'; // 클래스 ID 가져오기
	    	console.log("삭제 버튼 클릭 classId : ", classId)
	    	
	        if (confirm('해당 클래스를 삭제하시겠습니까?')) {
	        	
	            $.ajax({
	                type: 'POST',
	                url: '/adminDeleteClass.do',
	                data: { classId: classId },
	                success: function (response) {
	                    console.log("삭제 응답 데이터: ", response); // 응답 데이터를 로그에 출력
	                    
	                    
	                        // const jsonResponse = typeof response === "string" ? JSON.parse(response) : response;
	                        // console.log("파싱된 응답 데이터: ", jsonResponse);
							
	                        if (response.error === "N") {
	                            alert(response.message);
	                            location.href = '/adminClassList.do'; // 목록 페이지로 이동
	                        } else if (response.error === "Y") {
	                            alert('클래스 삭제 실패: ' + response.errorMsg); // 실패 시 오류 메시지 표시
	                        }
                    },
	                error: function (xhr) {
	                    console.error("AJAX 요청 실패: ", xhr);
	                    alert('클래스 삭제 중 오류가 발생했습니다: ' + xhr.responseText);
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
    
</body>



</html>
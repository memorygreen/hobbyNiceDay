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
                                            <h5 class="m-b-10">클래스 정보조회 페이지</h5>
                                            <p class="m-b-0">등록된 클래스 정보를 조회하는 페이지입니다.</p>
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
                                            	<a href="/adminClassInfo.do">클래스 정보조회</a>
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
	                                                <h5>클래스 정보조회</h5>
	                                                <span>클래스 정보조회 페이지입니다. <code>TB_CLASS</code></span>
	                                       		    
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
				                                                            	<i class="icofont icofont-user-alt-3"> * 클래스명</i>
				                                                            </label>
			                                                            </span>
			                                                            <input type="text" id=classNm name="classNm" class="form-control" placeholder="클래스명을 입력해주세요" title="클래스명을 입력해주세요"  data-toggle="tooltip"  
			                                                            	value="${classDetails.classNm}" readonly>
			                                                            
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classDscrptn">
			                                                            	<i class="icofont icofont-ui-email">  클래스 설명</i>
			                                                           	</label>
			                                                           	</span>
			                                                           	<input type="text" id=classDscrptn name="classDscrptn" class="form-control" placeholder="클래스 설명을 입력해주세요" title="클래스 설명을 입력해주세요"  data-toggle="tooltip" 
			                                                           		 value="${classDetails.classDscrptn}" readonly>
	                                                                </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
	                                                                    <span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="location">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 장소</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="location" name="location" class="form-control" 
			                                                            	   placeholder="클래스 장소를 입력해주세요" title="클래스 장소를 입력해주세요"  data-toggle="tooltip" 
			                                                            	   value="${classDetails.location}" readonly>
			                                                            	   </br>	                                                        			
			                                                            	   </br>
	                                                                </th>
	                                                                <th colspan="2" width="50%">
		     															
		     															<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="imgFile">
			                                                            	<i class="icofont icofont-ui-email">  클래스 이미지 </i>
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
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 대분류</i>
			                                                           	</label>
			                                                           	</span>
			                                                            
			                                                            <select id="classCateBig" name="classCateBig"  class="form-control" placeholder="클래스 대분류를 선택해주세요" title="클래스 대분류를 선택해주세요"  data-toggle="tooltip" required  disabled > 
			                                                            	    <option value="">선택</option>
																			    <option value="crafts" ${classDetails.classCateBig == 'crafts' ? 'selected' : ''}>공예</option>
																			    <option value="art" ${classDetails.classCateBig == 'art' ? 'selected' : ''}>미술</option>
																			    <option value="music" ${classDetails.classCateBig == 'music' ? 'selected' : ''}>음악</option>
																			    <option value="exercise" ${classDetails.classCateBig == 'exercise' ? 'selected' : ''}>운동</option>
																			    <option value="etc" ${classDetails.classCateBig == 'etc' ? 'selected' : ''}>기타</option>
																			</select>
			                                                            
			                                                                                                             
	                                                                </th>
	                                                                
	                                                                <th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classCateSmall">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 소분류</i>
			                                                           	</label>
			                                                           	</span>
			                                                           	<select id="classCateSmall" name="classCateSmall"  class="form-control" placeholder="클래스 소분류를 선택해주세요" title="클래스 소분류를 선택해주세요" data-toggle="tooltip" required disabled>
			                                                            	<option value=" ${classDetails.classCateBig}">선택</option> <!-- 클래스 대분류에 따른 소분류 코드를 가져와야함 (tb_code) -->
			                                                            	
			                                                            </select>
			                                                         </th>
	                                                                
	                                                            </tr>
	                                                           
																<tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classMaxCnt">
			                                                            	<i class="icofont icofont-ui-email"> * 최대 참가자수</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="number" min="0" id="classMaxCnt" name="classMaxCnt" class="form-control" placeholder="최대 참가자수를 입력해주세요" title="최대 참가자수를 입력해주세요" data-toggle="tooltip" required
			                                                            		value="${classDetails.classMaxCnt}" readonly >
			                                                        </th>
	                                                                <th colspan="2" width="50%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classAgeMin">
			                                                            	<i class="icofont icofont-ui-email">  최소수강가능연령</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="number" min="0" id="classAgeMin" name="classAgeMin" class="form-control" placeholder="수강가능한 최소연령을 입력해주세요" title="수강가능한 최소연령을 입력해주세요" data-toggle="tooltip"
			                                                            		value="${classDetails.classAgeMin}" readonly>
			                                                        </th>
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPrice">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 가격</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="text" id="classPrice" name="classPrice" class="form-control" placeholder="클래스 가격을 입력해주세요" title="클래스 가격을 입력해주세요" data-toggle="tooltip"
			                                                            		value="${classDetails.classPrice}" readonly>
		                                                        	</th>
		                                                        	
		                                                        	<th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPost">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 게시 여부</i>
			                                                           	</label>
			                                                           	</span><select id="classPost" name="classPost"  class="form-control" placeholder="클래스 소분류를 선택해주세요" title="클래스 소분류를 선택해주세요" data-toggle="tooltip" required disabled>
			                                                            	<option value="">선택</option> <!-- 클래스 대분류에 따른 소분류 코드를 가져와야함 (tb_code) -->
			                                                            	<option value="Y" ${classDetails.classPost == 'Y' ? 'selected' : ''}>게시</option>
			                                                            	<option value="N" ${classDetails.classPost == 'N' ? 'selected' : ''}>미게시</option>
			                                                            </select>
			                                                            
			                                                            <!-- 직접 입력용 소분류 입력란 (기타 선택 시 표시) -->
    																	<input type="text" id="classCateSmallText" name="classCateSmallText" class="form-control" placeholder="소분류를 입력하세요" title="소분류를 입력하세요" data-toggle="tooltip" style="display:none;" />
			                                                         </th>
                                                                	
	                                                            </tr>
	                                                            
	                                                            <tr>
	                                                                <th colspan="2" width="50%">
																		<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="classPrice">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 소요시간</i>
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
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 시작일자</i>
			                                                           	</label>
			                                                           	</span>
			                                                            <input type="date" id="startDt" name="startDt" class="form-control" placeholder="클래스 시작일자를 입력해주세요" title="클래스 종료일자를 입력해주세요" data-toggle="tooltip"
			                                                          		   value="${classDetails.startDt}" readonly>
		                                                        	</th>
		                                                        	
		                                                        	<th colspan="2" width="50%" >
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="endDt">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 종료일자</i>
			                                                           	</label>
			                                                           	</span>
    																    <input type="date" id="endDt" name="endDt" class="form-control" placeholder="클래스 종료일자를 입력해주세요" title="클래스 종료일자를 입력해주세요" data-toggle="tooltip"
    																     		value="${classDetails.endDt}" readonly>
		                                                        	</th>
                                                                	
	                                                            </tr>
                                                            <div>
	                                                            <tr id = "classTimeRow">
	                                                                <th colspan="2"  width="5%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="timeStart">
			                                                            	<i class="icofont icofont-ui-email"> *  클래스 시작시간</i>
			                                                           	</label>
			                                                           	</span>
   																		<input type="time" id="timeStart" name="timeStart[]" class="form-control" placeholder="클래스 시작시간을 입력해주세요" title="클래스 시작시간을 입력해주세요" data-toggle="tooltip">
	                                                                </th>   
	                                                                    
	                                                                <th colspan="2" width="5%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="timeEnd">
			                                                            	<i class="icofont icofont-ui-email"> * 클래스 종료시간 </i>
			                                                           	</label>
			                                                           	</span>
   																		<input type="time" id="timeEnd" name="timeEnd[]" class="form-control" placeholder="클래스 종료시간을 입력해주세요" title="클래스 종료시간을 입력해주세요" data-toggle="tooltip">
	                                                                </th>  
	                                                                <!-- 
	                                                                <th  width="5%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="maxParticipants">
			                                                            	<i class="icofont icofont-ui-email"> 최대 수강가능 인원</i>
			                                                           	</label>
			                                                           	</span>
   																		<input type="number" id="maxParticipants" name="maxParticipants[]" class="form-control" placeholder="수강가능 인원을 입력해주세요" title="수강가능 인원을 입력해주세요" data-toggle="tooltip">
   																		
	                                                                </th> 
	                                                                 -->
                                                                	<th width="5%">
	                                                                	<button id="addTime"  class="btn btn-inverse waves-effect waves-light">+</button>
	                                                                    </br>
	                                                                </th>
	                                                                
	                                                            </tr>
                                                            </div>
	                                                            <tr id = "holidayRow">
	                                                                
	                                                                <th colspan="2" width="5%">
	                                                                	<span class="input-group-prepend" id="name">
			                                                            <label class="input-group-text" for="holidayDt">
			                                                            	<i class="icofont icofont-ui-email">  휴무일</i>
			                                                           	</label>
			                                                           	</span>
   																		<input type="date" id="holidayDt" name="holidayDt[]" class="form-control" placeholder="휴무일을 입력해주세요" title="휴무일을 입력해주세요" data-toggle="tooltip">
	                                                                </th>   
	                                                                    
	                                                                <th colspan="2" width="25%">
		                                                                <span class="input-group-prepend" id="name">
				                                                            <label class="input-group-text" for="holidayDesc">
				                                                            	<i class="icofont icofont-ui-email">  휴무일 설명</i>
				                                                           	</label>
				                                                           	</span>
	                                                                	<input type="text" id="holidayDesc" name="holidayDesc[]" class="form-control" placeholder="휴무일 설명을 입력해주세요" title="휴무일 설명을 입력해주세요" data-toggle="tooltip">                                              
	                                                                </th>
                                                                	<th width="5%">
	                                                                	<button id="addHoliday"  class="btn btn-inverse waves-effect waves-light">+</button>
	                                                                    </br>
	                                                                </th>
	                                                                
	                                                               
	                                                                <th ></th>
	                                                                <th></th>
	                                                            </tr>
	                                                        	
	                                                        	<tr>
		                                                        	<td colspan="2">
		                                                        		<a href="/adminClassUpdateForm.do" id="updateBtn" class="btn btn-primary waves-effect waves-light m-r-20" data-toggle="tooltip" data-placement="right">수정</button>
	                                                        
				                                                        <!-- 취소 -->
				                                                        <a href="/adminClassList.do?classId=${classDetails.classId}" class="btn btn-warning waves-effect waves-light">목록</a>
				                                                        
				                                                        <!-- 삭제 -->
				                                                        <button type="button" id="deleteBtn" class="btn btn-danger waves-effect waves-light m-r-20" data-toggle="tooltip" data-placement="right">삭제</button>
	                                                        
		                                                        	</td>
		                                                        	<td colspan="2"></td>
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
	
	var timeSets = "${classDetails.timeSets}";
    console.log("timeSets", timeSets)

	function userData() {
		// 시간 넣기
		  parseAndAddTimeInputs(timeSets);
		console.log("함수 이후 확인")
		
		
		/***************************************************************************/
		
		// DB에서 가져온 값
	    var selectedClassCateBig = "${classDetails.classCateBig}"; // 대분류 값
	    var selectedClassCateSmall = "${classDetails.classCateSmall}"; // 소분류 값
	    
		// 대분류와 소분류 데이터를 객체로 정의
		// 대분류에 따른 소분류 목록 정의
	    var categories = {
	        crafts: [
	            { value: 'soap_making', text: '비누 만들기' },
	            { value: 'candle_making', text: '캔들 만들기' },
	            { value: 'pottery', text: '도자기 공예' },
	            { value: 'leather_crafting', text: '가죽 공예' },
	            { value: 'knitting', text: '뜨개질' },
	            { value: 'embroidery', text: '자수' }
	        ],
	        art: [
	            { value: 'watercolor', text: '수채화' },
	            { value: 'oil_painting', text: '유화' },
	            { value: 'drawing', text: '드로잉' },
	            { value: 'calligraphy', text: '캘리그래피' },
	            { value: 'sculpture', text: '조각' },
	            { value: 'craft_art', text: '공예 미술' }
	        ],
	        music: [
	            { value: 'guitar', text: '기타 연주' },
	            { value: 'piano', text: '피아노' },
	            { value: 'ukulele', text: '우쿨렐레' },
	            { value: 'vocal', text: '보컬 트레이닝' },
	            { value: 'drumming', text: '드럼 연주' },
	            { value: 'violin', text: '바이올린 연주' }
	        ],
	        exercise: [
	            { value: 'yoga', text: '요가' },
	            { value: 'pilates', text: '필라테스' },
	            { value: 'dance', text: '댄스' },
	            { value: 'taekwondo', text: '태권도' },
	            { value: 'fitness', text: '피트니스' },
	            { value: 'climbing', text: '클라이밍' }
	        ]
	    };

	    
            
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
		
	};// 전체 불러오기 끝

	
	
	
// db에서 불러온 시작시간 - 종료시간 불러오는 함수
        
        function parseAndAddTimeInputs(timeSets) {
            var timeArray = timeSets.split(','); // Split by comma to get each time set
			console.log("timeArray", timeArray)
			
            $.each(timeArray, function(index, timeSet) {
                var parts = timeSet.split(';'); // Split by semicolon to get ID and time range
                var classDetailId = parts[0].trim(); // Class Detail ID
                var timeRange = parts[1].trim(); // Time range
                var times = timeRange.split('-'); // Split by dash to get start and end times
                var timeStart = times[0].trim();
                var timeEnd = times[1].trim();
                console.log("timeStart", timeStart, "timeEnd", timeEnd)
				
                
                // 시간 형식으로 변환
                
                //timeStart = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                //timeEnd = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                //console.log("시간형식으로 변환 이후 - timeStart", timeStart, "timeEnd", timeEnd)
				
                
                
                // Create a new row for each time set
                var newRow = `
					            <tr class="classTimeRow">
					                <th colspan="2" width="5%">
					                    <span class="input-group-prepend" id="name">
					                        <label class="input-group-text" for="timeStart_${index}">
					                            <i class="icofont icofont-ui-email"> * 클래스 시작시간</i>
					                        </label>
					                    </span>
					                    <input type="time" name="timeStart[]" id="timeStart_${index}" class="form-control" placeholder="클래스 시작시간을 입력해주세요" title="클래스 시작시간을 입력해주세요" data-toggle="tooltip" value="${timeStart}" readonly>
					                </th>
					                <th colspan="2" width="5%">
					                    <span class="input-group-prepend" id="name">
					                        <label class="input-group-text" for="timeEnd_${index}">
					                            <i class="icofont icofont-ui-email"> * 클래스 종료시간 </i>
					                        </label>
					                    </span>
					                    <input type="time" name="timeEnd[]" id="timeEnd_${index}" class="form-control" placeholder="클래스 종료시간을 입력해주세요" title="클래스 종료시간을 입력해주세요" data-toggle="tooltip" value="${timeEnd}" readonly>
					                </th>
					                <th width="5%">
					                    <button type="button" class="btn btn-danger removeTimeRow">-</button>
					                </th>
					            </tr>
					        `;
        
                // Append the new row to the time-container
                $('.classTimeRow').append(newRow);
                
                $('#classTimeRow').parent().append(newRow);
                
                $('#timeStart' + ${index}).val(timeStart);
                $('#timeEnd' + ${index}).val(timeEnd);
                console.log("추가 이후")
                // $('.classTimeContainer').append(newRow);
            });
        }



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
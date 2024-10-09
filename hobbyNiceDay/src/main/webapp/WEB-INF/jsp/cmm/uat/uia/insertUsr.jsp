<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<title>경량환경 단순홈페이지 템플릿 - 로그인</title>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/login.css" rel="stylesheet" type="text/css" >
<script type="text/javascript">

</script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?linkIndex=0" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?linkIndex=1" /></div>
    <!-- //header 끝 -->
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?linkIndex=2" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- content 시작 --> 
            <div id="content">
             
				<form id="registerForm" name="registerForm" method="post" action="<c:url value='/cmm/uat/uia/insertUser.do'/>">
				    <label for="userId">아이디: </label><input type="text" id="userId" name="userId" /><br/>
				    <label for="password">비밀번호: </label><input type="password" id="password" name="password" /><br/>
				    <label for="userName">이름: </label><input type="text" id="userName" name="userName" /><br/>
				    <label for="email">이메일: </label><input type="text" id="email" name="email" /><br/>
				    <input type="submit" value="회원가입" />
				</form>
				             
            </div>                      
            <!-- //content 끝 -->    
    </div>  
    <!-- //container 끝 -->
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?linkIndex=3" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
</body>
</html>

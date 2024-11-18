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
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>
   <h2>공공데이터 API를 이용한 공휴일 출력</h2>
    <button id="loadHolidays">공휴일 가져오기</button>
    <div id="holidayList"></div>

    <script>
    
    if (window.addEventListener) window.addEventListener("load", reservationList, false);
	else if (window.attachEvent) window.attachEvent("onload", reservationList);
	else window.onload = reservationList;
	function reservationList() {
		
		
		console.log("로드 확인용 ")
   		     
        function getHolidaysApiData() {
            console.log("공공데이터 공휴일 데이터 가져오는 함수탔는지 클릭");
			
            var year = "2024" // 년도
            var month = "05" // 월
            var apiKey = 'wF9FnEiuP7ovoa%2FAip97bLTzER3364FF9xrqLX8sDK%2BEZ3G3esruJoOq6beqmkhQiKEssBXxoGI2mWixkL32jQ%3D%3D';  //apiKey 
            var url = 'http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?serviceKey=' + apiKey + '&solYear=' + year + '&solMonth=' + month;
         	
            
            var xhr = new XMLHttpRequest();
            console.log("xhr : ", xhr )
            
            //xhr.open('GET', url + queryParams);
            xhr.open('GET', url);
            
            xhr.onreadystatechange = function () {
            	if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log("API 응답 성공:", xhr.responseText);
                    
                    // XML 파싱
                    var parser = new DOMParser();
                    var xmlDoc = parser.parseFromString(xhr.responseText, 'text/xml');
                    
                    // <item> 태그 접근
                    var items = xmlDoc.getElementsByTagName('item');
                    console.log("items.length:", items.length);

                 	// 공휴일 데이터를 'YYYY-MM-DD(공휴일 이름)' 형태로 반환
                 	var holidayList = [];
                 	
                    // var holidayListHtml = '<ul>';
                    for (var i = 0; i < items.length; i++) {
                        var dateName = items[i].getElementsByTagName('dateName')[0]?.textContent;
                        var locdate = items[i].getElementsByTagName('locdate')[0]?.textContent;

                        if (dateName && locdate) {
                            console.log("dateName:", dateName, "locdate:", locdate);
                            
                            // 날짜 형식을 'YYYY-MM-DD'로 변환
                            var formattedDate = locdate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
                            console.log("formattedDate : " , formattedDate)
                            // holidayListHtml += '<li>'+formattedDate +':' + dateName + '</li>';
                            
                            holidayList.push(formattedDate +'('+ dateName +')');
                        }
                    }
                    // holidayListHtml += '</ul>';
                    
                    // 결과를 쉼표로 구분된 문자열로 출력
		            var holidayString = holidayList.join(', ');
		            console.log("최종 공휴일 목록:", holidayString);
                    
		            
		            
                    // ('#holidayList').html(holidayListHtml);
		            
                    // 결과를 HTML에 표시
		            $('#holidayList').text(holidayString);
                    
		            return holidayString;
                    
                    
                } else if (xhr.readyState === 4) {
                    console.error("API 호출 실패:", xhr.status);
                    alert('공휴일 데이터를 가져오는 중 오류가 발생했습니다.');
                }
            };
            
            xhr.send('');
            console.log("xhr : ", xhr )
            
        }

        // 버튼 클릭 시 공휴일 데이터를 가져오는 함수 실행
        $('#loadHolidays').on('click', function() {
        	getHolidaysApiData();
        });
	}
    </script>
   
    
</body>



</html>
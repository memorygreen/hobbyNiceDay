<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>


/*
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "nTM2zP9ui0F2yerONFez", // 본인걸로 수정, 띄어쓰기 금지.
        callbackUrl: "/joinExtlUsrForm.do", // 아무거나 설정
        isPopup: false,
        callbackHandle: true
    });
    naverLogin.init();
    */	
    
    //  (4) Callback 의 처리. 정상적으로 Callback 처리가 완료도리 경우 main Page로 redirect (또는 Popup close) 
    window.addEventListener('load', function () {
    	console.log("콜백함수 잘 실행됐는지 확인1")
    	
    // gpt 추가 :  해시 값에서 파라미터 추출
    const hashParams = new URLSearchParams(window.location.hash.substring(1)); // '#' 제거
    const accessToken = hashParams.get('access_token');
    const state = hashParams.get('state');
    const tokenType = hashParams.get('token_type');
    const expiresIn = hashParams.get('expires_in');
    
    
    	
    	//console.log("콜백함수 잘 실행됐는지 확인2")
   	if (accessToken) {
       console.log('Access Token:', accessToken);
    
    // 네이버 로그인 초기화
    naverLogin.getLoginStatus(function (status) {
    	 if (status) {
	        //console.log("확인 " , naverLogin.user);
	        // (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크
	        var age = naverLogin.user.getAge();
	        var birthday = naverLogin.user.getBirthday();
	        var email = naverLogin.user.getEmail();
	        var gender = naverLogin.user.getGender();
	        var id = naverLogin.user.getId();
	        var name = naverLogin.user.getName();
	        //var nickName = naverLogin.user.getNickName();
	 
	        $.ajax({
	            type: 'post',
	            url: 'naverSave',
	            data: {'n_age':age
		            	, 'n_birthday':birthday
		            	, 'n_email':email
		            	, 'n_gender':gender
		            	, 'n_id':id
		            	, 'n_name':name
		            	//, 'n_nickName':nickName
	            		},
	            dataType: 'text',
	            success: function(result) {
	                if(result=='ok') {
	                    console.log('네이버 sns 로그인 성공')
	                    location.replace("http://localhost:8080/joinExtlUsrForm.do") 
	                } else if(result=='no') {
	                    console.log('네이버 sns 로그인 실패')
	                    location.replace("http://localhost:8080/loginForm.do")
	                }
	            },
	            error: function(result) {
	                console.log('네이버 sns 로그인 오류 발생')
	            }
	        })
 
	    } else {
	        console.log("callback 처리에 실패하였습니다.");
	    }
    });
    }
});
    
    
    // 새로 해보기
    /*
    var naver_id_login = new naver_id_login("nTM2zP9ui0F2yerONFez", "http://localhost:user/callback.jsp");
			alert(naver_id_login.oauthParams.access_token);
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			console.log('콜백실행')  
		  
		  
		 function naverSignInCallback() {
			//nickname = naver_id_login.getProfileData('nickname');
			name = naver_id_login.getProfileData('name');
			email = naver_id_login.getProfileData('email');
			id = naver_id_login.getProfileData('id');
				
			
				$.ajax({
					type: 'POST',
					url: 'naverSave',  // naverlogin
					data: {
						//'userid': nickname,
						'username': name,
						'email': email,
						'naver_uid': id 
						}, // data
					dataType: 'text',
					success: function(result) {
						if(result == 1) {
							console.log('성공')
							closePopupAndRedirect(); 
						} else  {
							window.close();
						}
					}, 
					error: function(result) {
						window.close();
					} 
				}) 
		  }
			*/
</script>
</body>
</html>

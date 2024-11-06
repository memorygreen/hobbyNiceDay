package egovframework.com.user.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.cryptography.EgovEnvCryptoService;
import org.egovframe.rte.fdl.cryptography.EgovPasswordEncoder;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.NaverVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.user.service.UserService;

@Controller
public class UserController {
	
	
	/** 암호화서비스 */
    @Resource(name = "egovEnvCryptoService")
    private EgovEnvCryptoService cryptoService;
    
    @Resource(name = "egovPasswordEncoder")
    private EgovPasswordEncoder egovPasswordEncoder;
	
    
    @Resource(name = "UserService")
    private UserService userService;

	 
//	@Autowired
//	    private egovframework.com.user.service.UserService userService;
	
	
	 // 회원가입 페이지로 이동
    @RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
    public String joinForm() throws Exception {
        return "/cmm/user/joinUsr";
    }
    
    // 회원가입 기능
    @RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> joinUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) throws Exception {
    	System.out.println("회원가입 기능 들어왔는지 확인");
    	JsonObject jsonObj = new JsonObject();
    	//HashMap<String, Object> retMap = new HashMap<>();
    	
        try {
        	// 클라이언트 IP 가져오기
            String clientIp = getClientIp(request);
            System.out.println("clientIp"+ clientIp);
            // UserVO에 클라이언트 IP 설정
            userVO.setRegIp(clientIp);

            // 세션에서 sns_provider 값 가져와서 userVO에 설정
            HttpSession session = request.getSession();
            String snsProvider = (String) session.getAttribute("sns_provider");
            userVO.setSnsProvider(snsProvider); // userVO에 snsProvider 설정
            
         	System.out.println("회원 가입 시 입력할 userVO"+ userVO);		
        	
         	/* 회원가입 서비스 호출*/
            int resultJoin = userService.joinUser(userVO);
            System.out.println("mapper 완료됐나 확인");
            
            if(resultJoin > 0) {
            	jsonObj.addProperty("error", "N");
            	//return "redirect:/loginForm.do";
            	System.out.println("회원가입 성공 시 리턴 직전, jsonObj:"+ jsonObj);
            }else {
            	jsonObj.addProperty("error", "Y");
            	jsonObj.addProperty("errorMsg", "회원가입에 실패했습니다. 관리자에게 문의하세요.");
            }
            
        } catch (Exception e) {
        	jsonObj.addProperty("error", "Y");
        	jsonObj.addProperty("errorMsg", "회원가입에 실패했습니다. 관리자에게 문의하세요.");
            System.out.println("회원가입 실패 시 리턴 직전, jsonObj:"+ jsonObj);

        }
        return  ResponseEntity.ok(jsonObj.toString());
      
    }
    

 // 클라이언트 IP를 가져오는 메서드 추가
    private String getClientIp(HttpServletRequest request) throws Exception{
	     String ip = request.getHeader("X-Forwarded-For");
	     if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("Proxy-Client-IP");
	     }
	     if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("WL-Proxy-Client-IP");
	     }
	     if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("HTTP_CLIENT_IP");
	     }
	     if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	     }
	     if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getRemoteAddr();
	     }
	     return ip;
    }
    
    // 회원가입 id 중복 체크 기능
    @RequestMapping(value = "/joinIdCheck.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody // 추가: JSON으로 반환
    public String joinIdCheck(@RequestParam("userId") String userId) throws Exception{
    	
    //public Map<String, Object> checkUserId(@RequestParam("userId") String userId) {
	//public HashMap<String, Object> joinIdCheck(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap<String, Object> param) throws Exception {
    	JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new HashMap<>();
    	System.out.println("회원가입 시 id 중복체크-> userId 받았는지 확인"+ userId);
  //      Map<String, Object> result = new HashMap<>();
    	 // Map<String, Boolean>
//    	System.out.println("param:"+param);
 		 //HashMap<String, Object> listMap = new HashMap<>();
    	 
    	// 241015 자영 : 정답은 gson이었다 https://myeongdev.tistory.com/24
 		 
         try {
        	 // userId null인지 확인 후 문자열 반환
        	 //String userId = param.get("userId") != null ? param.get("userId").toString() : "";
        	 
        	 boolean  idDuplicateCk = userService.joinIdCheck(userId);
        	 System.out.println("idDuplicateCk :"+ idDuplicateCk);
        	 
        	 if (!idDuplicateCk) {
        		 System.out.println("중복아닌 경우  :"+ idDuplicateCk);
                 retMap.put("error", "N");
                 retMap.put("exist", false);
                 
                 jsonObj.addProperty("error", "N");
                 jsonObj.addProperty("exist", false);

                 
             } else {
            	 System.out.println("중복인경우 :"+ idDuplicateCk);
            	 retMap.put("error", "Y");

                 retMap.put("exist", true);
                 retMap.put("errorMsg", "이미 사용 중인 아이디입니다.");
                 jsonObj.addProperty("error", "Y");
                 jsonObj.addProperty("exist", true);
                 

             }
             // boolean exists = userService.joinIdCheck(userId);  // DB에 ID가 존재하는지 체크
             //idCkResult.put("exists", exists);  // 존재 여부를 클라이언트에 전달
             
        	 //retMap.put("dataMap", idCkData);
			 //retMap.put("error", "N");
        	 System.out.println("try 마지막 :"+ idDuplicateCk);
        	 
             
         } catch (Exception e) {
             // 로그를 통해 에러의 원인을 확인
             System.out.println("ID 중복 체크 중 오류 발생: " + e.getMessage());
             //e.printStackTrace();
             
            	retMap.put("error", "Y");
     			retMap.put("errorTitle", "Error");
     			retMap.put("errorMsg", "시스템 오류가 발생했습니다.");
     			//SiiruUtil.logFile(req, e);
     	 }
         
         System.out.println("id 중복확인 리턴 직전 retMap:"+ retMap);
         System.out.println("id 중복확인 리턴 직전 jsonObj:"+ jsonObj);
         //ObjectMapper objectMapper = new ObjectMapper();
         //String newJsonStr = objectMapper.writeValueAsString(retMap);
         //return ResponseEntity.ok().body(retMap);
         //return retMap;
         return jsonObj.toString();

     }
    
    // 관리자페이지 전체 회원 목록 조회 기능
    @RequestMapping(value = "/getAdminUserList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminUserAllList(Model model) throws Exception{
    	System.out.println("관리자 전체 회원목록 조회 됐는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = userService.getAdminUserList();  // 모든 사용자 정보 가져오기
		    	System.out.println("listData 확인 : "+ listData);
		    	
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	System.out.println("listMap 확인 : "+ listMap);
		        
		    	retMap.put("error", "N");
				retMap.put("dataMap", listMap);
				System.out.println("retMap 확인 : "+ retMap);
		        
				Gson gson = new Gson();
			    String jsonStr = gson.toJson(retMap);  // retMap을 JSON 문자열로 변환
			    System.out.println("jsonStr 확인 : " + jsonStr);
			     return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    	 } catch (Exception e) {
    		 	retMap.put("error", "Y");
    		 	retMap.put("errorMsg", "회원 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
    	 
     }
   
    // 로그인 페이지로 이동
    @RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
    public String loginForm() throws Exception{
    	System.out.println("로그인 페이지로 이동 완료");
    	return "/cmm/user/loginUsr";
    }
    
    
 // 리턴 URL을 세션에 저장하고 로그인 페이지로 리다이렉트
    @RequestMapping(value = "/setUrlLoginForm.do")
    public String setReturnUrlAndRedirectToLogin(@RequestParam("returnUrl") String returnUrl, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("returnUrl", returnUrl); // 리턴할 URL 세션에 저장
        return "redirect:/loginForm.do"; // 로그인 페이지로 리다이렉트
    }
    
    // 로그인 기능
    @RequestMapping(value = "/loginUser.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
	public ResponseEntity<String> loginUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) throws Exception {
        //public ResponseEntity<String> joinUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) {
    	
    	JsonObject jsonObj = new JsonObject();
        try {
			// 1. 일반 로그인 처리
        	
        	System.out.println("로그인 서비스 보내기전 userVO : " + userVO);
        	
        	// 로그인 시도 (id,pw같아야함!)
        	UserVO resultVO = userService.loginUser(userVO); // id,pw 같은 경우 resultVO 반환
        	System.out.println("로그인 서비스 받은 후 resultVO : " + resultVO);
			
		
	        // 로그인 성공한 경우 
			if (resultVO != null) {
						System.out.println("로그인 성공");
				
				// 로그인 제한 Y 인 경우 (id pw 일치하지만)
				if ("Y".equals(resultVO.getLoginRestricted())) {
                	System.out.println("로그인 실패(id,pw일치하지만) : 로그인 제한");
	                jsonObj.addProperty("error", "Y");
	                jsonObj.addProperty("errorMsg", "로그인이 제한되었습니다. 관리자에게 문의하세요.");
	                
	            } else { // 로그인 제한 N인 경우
	            
			        // 2. 로그인 성공 시 세션에 사용자 정보 저장
		            HttpSession session = request.getSession(true); // request 객체로 세션을 생성/가져옴
		            session.setAttribute("userVO", resultVO); // UserVO 객체 저장 // 로그인 결과인 resultVO를 세션에 저장
		            session.setMaxInactiveInterval(3600); // Session의 유효 시간 설정 (1800초 = 30분)
		            System.out.println("세션에 저장된 userId: " + session.getAttribute("userId"));
		            System.out.println("세션에 저장된 userVO: " + session.getAttribute("userVO"));
			        
		            // IP 주소 가져오기
		            String clientIp = getClientIp(request);
		            int resultUpdtLoginDt = userService.updateLastLoginDt(resultVO.getUserId(), clientIp); // 등록자 ip, id , 일시 등록(업데이트)
		            System.out.println("마지막 로그인 일시 업데이트 성공확인 (resultUpdtLoginDt): " + resultUpdtLoginDt);
		            
					if(resultUpdtLoginDt > 0) { // 로그인 일시, 로그인 횟수, 로그인 ip 업데이트 성공 
						jsonObj.addProperty("error", "N");
						System.out.println("로그인 성공 jsonObj"+ jsonObj);					
					}else { // 실패
						jsonObj.addProperty("error", "Y");
			            jsonObj.addProperty("errorMsg", "마지막 로그인 시간 업데이트 실패");
			            System.out.println("마지막 로그인 시간 업데이트 실패 jsonObj"+ jsonObj);
					}
					
					// 로그인 성공 시 리턴할 URL 확인 (클래스 상세화면 비회원 예약하기 클릭 시 로그인 화면 이동->로그인 완료 후 예약상세화면으로 리다이렉트)
		            // String returnUrl = (String) session.getAttribute("returnUrl");
		            
		            /*
		            if (returnUrl != null && !returnUrl.isEmpty()) {
		                session.removeAttribute("returnUrl"); // 세션에서 리턴 URL 제거
		                jsonObj.addProperty("returnUrl", returnUrl); // 리턴할 URL을 JSON에 추가
		            } else {
		                jsonObj.addProperty("returnUrl", "/cmm/main/mainPage.do"); // 기본 리턴 URL
		            }*/
	            
	            }
				
			} else { // 로그인 실패한 경우 
				System.out.println("로그인 실패한 경우");

	            // userVO가 null이면 id 존재 여부 확인
	            if (!userService.joinIdCheck(userVO.getUserId())) { // id 존재하지 않는 경우 
	                System.out.println("id 존재하지 않는 경우 ");
	            	jsonObj.addProperty("error", "Y");
	                jsonObj.addProperty("errorMsg", "존재하지 않는 아이디입니다.");
	                
	            } else { 
	            	// id는 존재하나 비밀번호가 일치하지 않는 경우   
	            	// 비밀번호 틀린 경우
	            	System.out.println("비밀번호 일치하지 않는 경우");
	                
	                // DB에서 사용자의 전체 정보를 가져옴
	                UserVO existingUserVO = userService.getUserInfo(userVO.getUserId());
	                System.out.println("로그인 틀린 횟수 : " + existingUserVO.getLoginErrCnt());
	                System.out.println("로그인 실패한 사람 정보(비번 틀림) : " + existingUserVO);
	                
	                // 로그인 실패 횟수 증가
	                int resultUpdtLoginErrCnt = userService.updateLoginErrCnt(existingUserVO.getUserId());
	                System.out.println("로그인 실패 업데이트 성공 확인 (resultUpdtLoginErrCnt): " + resultUpdtLoginErrCnt);
	                
	                // 로그인 오류 횟수를 업데이트한 후 확인하여 제한 설정
	                Integer loginErrCnt = existingUserVO.getLoginErrCnt();
	                System.out.println("비번 틀린 사람 틀리기 전 오류 횟수 : " + loginErrCnt);
	                
	                
	                
	                if ("Y".equals(existingUserVO.getLoginRestricted())) {
	                	System.out.println("로그인 실패(id만 일치) : 로그인 제한");
		                jsonObj.addProperty("error", "Y");
		                jsonObj.addProperty("errorMsg", "로그인 실패:로그인이 제한되었습니다. 관리자에게 문의하세요.");
	                }else {
	                	

		                // 로그인 오류 횟수가 5회에 도달했을 때 제한을 설정
		                if (loginErrCnt >= 4) { // 이번 오류로 인해 5회가 되면 제한
		                	System.out.println("이번이 5회째인사람");
		                    userService.updateLoginRestricted(existingUserVO); // 로그인 제한 설정
		                    jsonObj.addProperty("error", "Y");
		                    jsonObj.addProperty("errorMsg", "5회 이상의 로그인 오류로 인해 로그인이 제한되었습니다.");
		                } else {
		                	System.out.println("이번오류가 5회가 아직 안 된 사람 ");
		                	
		                    jsonObj.addProperty("error", "Y");
		                    jsonObj.addProperty("errorMsg", "비밀번호가 일치하지 않습니다. 틀린횟수 : " + (loginErrCnt+1) + "회");
		                }
	                	
	                }
	            }
			}
        } catch (Exception e) {
        	System.out.println("catch or 로그인 제한 걸린 경우)");
        	
        	// 로그인 제한 오류 처리
            if (e.getMessage().contains("로그인이 제한되어 있는 경우")) {
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", e.getMessage());
            } else {
                // 기타 오류 처리
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "로그인 중 기타 오류가 발생했습니다. 관리자에게 문의하세요.");
            }
            e.printStackTrace();
            
        }
        
        System.out.println("return 직전 jsonObj"+jsonObj);
        //return ResponseEntity.ok(jsonObj.toString());
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(jsonObj.toString()); // json을 문자열로 파싱해서 jsp로 전송
	}
    
    
    
    // 관리자 로그인 제한 해제 기능
    @RequestMapping(value = "/adminUserRestrictedClear.do", method = RequestMethod.GET)
    public String clearLoginRestriction(@RequestParam("userId") String userId, Model model) throws Exception {
        // 서비스 호출하여 제한 해제
        int result = userService.clearLoginRestriction(userId);
        if (result > 0) {
            model.addAttribute("message", "로그인 제한이 해제되었습니다.");
        } else {
            model.addAttribute("message", "로그인 제한 해제에 실패했습니다.");
        }
        return "redirect:/adminUserList.do";
    }
    
    // 관리자 로그인 강제 제한 기능
    @RequestMapping(value = "/adminUserRestricted.do", method = RequestMethod.GET)
    public String setLoginRestriction(@RequestParam("userId") String userId, Model model) throws Exception {
        // 서비스 호출하여 로그인 제한 설정
    	
    	UserVO userVO = new UserVO();
    	userVO.setUserId(userId);
        int result = userService.updateLoginRestricted(userVO);
        
        if (result > 0) {
            model.addAttribute("message", "로그인이 제한되었습니다.");
        } else {
            model.addAttribute("message", "로그인 제한 설정에 실패했습니다.");
        }
        return "redirect:/adminUserList.do";
    }
    
    // 관리자 - 회원 삭제 기능
    @RequestMapping("/adminUserDelete.do")
    public String adminUserDelete(@RequestParam("userId") String userId,  Model model) {
        
        	int result;
			try {
				result = userService.deleteUser(userId);
				
				if (result > 0) {
					System.out.println("관리자페이지 : 회원 삭제 성공");
					model.addAttribute("message", "회원이 성공적으로 삭제되었습니다.");
				} else {
					System.out.println("관리자페이지 : 회원 삭제 실패");
					model.addAttribute("message", "회원 삭제에 실패하였습니다.");
				}
			} catch (Exception e) {
				System.out.println("관리자페이지 : 회원 삭제 중 예외 발생");
				e.printStackTrace();
			}
        return "redirect:/adminUserList.do";
    }
    
    // 사용자 - 회원정보 조회
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String myPage(HttpServletRequest request, Model model) {
        // 세션에서 로그인된 사용자 정보 가져오기
        UserVO loggedInUser = (UserVO) request.getSession().getAttribute("UserVO");

        // 로그인이 안 되어 있으면 로그인 페이지로 리다이렉트
        if (loggedInUser == null) {
            return "redirect:/loginForm.do";
        }

        // 사용자 정보를 모델에 추가하여 JSP에 전달
        model.addAttribute("user", loggedInUser);

        return "/cmm/user/myPage";
    }
    
    
    
    // 회원정보수정 페이지로 이동
    @RequestMapping(value = "/updateUsrForm.do", method = RequestMethod.GET)
    public String updateUsrForm(HttpServletRequest request, Model model) throws Exception  {
    	
    	// 세션에 있는 id 가져오기
    	HttpSession session = request.getSession();
        UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
    	String userId = sessionUserVo.getUserId();
    	System.out.println("userId : " + userId);
    	UserVO userInfo = userService.getUserInfo(userId);
        System.out.println("관리자 페이지 회원 상세보기 데이터 조회 : "+ userInfo);
        model.addAttribute("userInfo", userInfo);
    	
    	
    	return "/cmm/user/updateUsr";
    }
    
    
    
    
    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	/*@RequestMapping(value = "/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/cmm/main/mainPage.do";
	}*/
	
    
    // 로그아웃

    // 로그아웃 기능
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false); // 기존 세션 가져오기 새로운 세션을 생성하지 말고, 기존 세션만 가져오도록 지시하는 역할
        
        
        if (session != null) { // 로그인 되어있는 경우
        	
        	//String snsProvider = (String) session.getAttribute("snsProvider");
        	UserVO userVo = (UserVO) session.getAttribute("userVO");
        	String snsProvider = userVo.getSnsProvider();
        	System.out.println("snsProvider : " + snsProvider);
        	
        	if("k".equals(snsProvider)) { // 카카오 계정 로그아웃
        		// 세션에서 Kakao Access Token 가져오기
                String kakaoAccessToken = (String) session.getAttribute("kakaoAccessToken");
                System.out.println("kakaoAccessToken"+ kakaoAccessToken);
                // 카카오 로그아웃 API 호출
                revokeKakaoAccessToken(kakaoAccessToken);
                System.out.println("카카오 액세스 토큰이 무효화되었습니다.");
        		
        		
        		session.invalidate(); // 세션 무효화
        		System.out.println("카카오 계정 로그아웃: 세션이 무효화되었습니다.");
        	}else if("n".equals(snsProvider)) { // 네이버 계정 로그아웃
        		session.invalidate(); // 세션 무효화
        		System.out.println("네이버 계정 로그아웃: 세션이 무효화되었습니다.");
        	}else { // 일반회원 로그아웃
        		session.invalidate(); // 세션 무효화
        		System.out.println("로그아웃: 세션이 무효화되었습니다.");
        		
        	}
        	
        	
        	
        }

        // 로그아웃 후 메인 페이지로 리다이렉트
        return "redirect:/cmm/main/mainPage.do";
    }
    
    // 카카오 계정 로그아웃

     // Kakao 액세스 토큰 무효화 메서드 추가
	 private void revokeKakaoAccessToken(String accessToken) {
	     String revokeUrl = "https://kapi.kakao.com/v1/user/logout";
	     RestTemplate restTemplate = new RestTemplate();
	
	     HttpHeaders headers = new HttpHeaders();
	     headers.add("Authorization", "Bearer " + accessToken);
	     
	     HttpEntity<String> entity = new HttpEntity<>(headers);
	
	     try {
	         ResponseEntity<String> response = restTemplate.postForEntity(revokeUrl, entity, String.class);
	         if (response.getStatusCode() == HttpStatus.OK) {
	             System.out.println("카카오 로그아웃 성공: " + response.getBody());
	         } else {
	             System.out.println("카카오 로그아웃 실패: " + response.getStatusCode());
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("카카오 로그아웃 처리 중 오류 발생: " + e.getMessage());
	     }
	 }
    // 카카오 로그인 redirect  
    @RequestMapping(value = "/joinExtlUsrForm.do", method = RequestMethod.GET)
    public String getAccessToken(@RequestParam("code") String code //  카카오 인증 후 리디렉션된 URL에서 쿼리 파라미터 code를 받아옴
    		    				,HttpServletRequest request, Model model) throws Exception  {
        
    	// 2. 액세스 토큰 요청 설정
    	String tokenUrl = "https://kauth.kakao.com/oauth/token"; //  카카오의 액세스 토큰을 요청할 URL
        RestTemplate restTemplate = new RestTemplate(); // RestTemplate 객체는 RESTful API를 호출하기 위한 Spring의 기본 HTTP 클라이언트
        
        HttpHeaders headers = new HttpHeaders(); // HttpHeaders 객체는 요청 헤더를 설정
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED); // Content-Type을 application/x-www-form-urlencoded로 설정
        
        // 3. 토큰 요청 파라미터 구성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>(); //params는 액세스 토큰 요청에 필요한 파라미터를 설정
        params.add("grant_type", "authorization_code"); // grant_type은 "authorization_code"로 설정하여 인증 코드를 사용한 방식임을 나타냄
        params.add("client_id", "5dd23d272be8396574b776bacd38ec63"); // 카카오 개발자 센터에서 발급받은 앱 키
        params.add("redirect_uri", "http://localhost:8080/joinExtlUsrForm.do"); //  카카오 인증 후 리디렉션될 URL
        params.add("code", code); // 앞서 받아온 인증 코드
        
        
        // 4. 토큰 요청 전송
        HttpEntity<MultiValueMap<String, String>> tokenRequest  = new HttpEntity<>(params, headers); // HttpEntity를 사용해 요청 본문과 헤더를 포함한 요청 객체를 만듦
        ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, tokenRequest , String.class);// restTemplate.postForEntity 메서드를 사용해 토큰을 요청하고, 응답을 ResponseEntity로 받음
        
        
        // 5. 토큰 응답 처리
        if (response.getStatusCode() == HttpStatus.OK) { // 응답 코드가 200 OK인 경우, 응답 본문을 가져옴
            // 액세스 토큰을 JSON에서 추출
            String responseBody = response.getBody();
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class); 
            String accessToken = jsonObject.get("access_token").getAsString();// Gson을 사용해 JSON 형식의 응답 본문을 파싱하여 access_token 값을 추출, // 이 access_token은 이후 사용자 정보 요청에 사용
            
             
            // 액세스 토큰을 세션에 저장
            HttpSession session = request.getSession(true);
            session.setAttribute("kakaoAccessToken", accessToken);
            System.out.println("카카오 로그인 시 accessToken 세션에 추가 : " + accessToken);
            
            // 6. 액세스 토큰을 사용하여 사용자 정보 요청
            String userInfoUrl = "https://kapi.kakao.com/v2/user/me"; // userInfoUrl : 사용자 정보를 요청할 카카오 API URL
            HttpHeaders userInfoHeaders = new HttpHeaders(); // Authorization 헤더에 Bearer와 액세스 토큰을 포함해 사용자 정보 요청을 보냄
            userInfoHeaders.add("Authorization", "Bearer " + accessToken); // restTemplate.exchange 메서드를 사용해 GET 요청을 보내고, 응답을 받음

            HttpEntity<String> userInfoRequest = new HttpEntity<>(userInfoHeaders);
            ResponseEntity<String> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoRequest, String.class);
            
            // 7. 사용자 정보 응답 처리
            if (userInfoResponse.getStatusCode() == HttpStatus.OK) { // 응답 코드가 200 OK인 경우, 응답 본문에서 사용자 정보를 JSON 형식으로 파싱
                // 사용자 정보 응답 처리
                String userInfoResponseBody = userInfoResponse.getBody();
                JsonObject userInfo = gson.fromJson(userInfoResponseBody, JsonObject.class);
                String kakaoUserId = userInfo.get("id").getAsString(); // id 필드를 추출하여 카카오 고유 사용자 ID를 가져옴
                
                

                // 사용자 존재 여부 확인 추가
                if (userService.joinIdCheck(kakaoUserId)) {  //사용자가 이미 존재하는지 확인
                	System.out.println("SNS 카카오 로그인 시 기존 사용자 있는 경우 ");
                    UserVO resultVO = userService.getUserBySNSId(kakaoUserId , "k");  // 여기서 snsId와 snsProvider를 함께 전달
                    System.out.println("카카오 로그인 성공, 세션에 담을 값 : " + resultVO);
                    
                    //HttpSession session = request.getSession(true);
                    session.setAttribute("userVO", resultVO);  //  // 기존 사용자 세션에 로그인 정보 저장
                    System.out.println("기존 카카오 로그인 시 세션에 저장 된 userVO : " +  resultVO);
                    
                    
                    // 1) 로그인한 IP 주소 가져오기
                    String clientIp = getClientIp(request);
                    System.out.println("sns 로그인 clientIp : "+ clientIp);

                    // 2) 로그인 정보 업데이트 (로그인 일시, 로그인 횟수, 로그인 IP)
                    int resultUpdtLoginDt = userService.updateLastLoginDt(resultVO.getUserId(), clientIp);
                    if (resultUpdtLoginDt > 0) {  // 로그인 업데이트 성공
                        System.out.println("SNS 로그인 - 마지막 로그인 일시 및 IP 업데이트 성공: " + resultUpdtLoginDt);
                    } else {  // 실패 시 오류 로그 출력
                        System.out.println("SNS 로그인 - 마지막 로그인 일시 및 IP 업데이트 실패");
                    }

                    
                    
                    return "redirect:/cmm/main/mainPage.do";  // 메인 페이지 또는 원하는 페이지로 이동
                } else { // 신규 사용자일 경우 추가 정보 입력 페이지로 이동
                	System.out.println("SNS 카카오 로그인 시 기존 사용자 없는 경우 ");
                    HttpSession sessionNew = request.getSession();
                    sessionNew.setAttribute("sns_provider", "k");  // 세션에 SNS 제공자 정보 저장
                    model.addAttribute("kakaoUserId", kakaoUserId);   // 폼 제출 시 사용할 kakaoUserId 전달 // 사용자 정보를 Model에 추가하여 뷰에 전달
                    
                    return "/cmm/user/joinExtlUsr"; // 추가 정보 입력 페이지로 리디렉션
                }
                
                /*
                // (나중에 추가)세션에 SNS 제공자 정보 저장 (카카오: "k")
                HttpSession session = request.getSession();
                session.setAttribute("sns_provider", "k");
                
                
                // 8. 모델에 사용자 정보 추가 및 뷰 반환
                // 사용자 정보를 모델에 추가하여 전달
                model.addAttribute("kakaoUserId", kakaoUserId); // 사용자 정보를 Model에 추가하여 뷰에 전달
                model.addAttribute("userInfo", userInfo);
                
                return "/cmm/user/joinExtlUsr"; // joinExtlUsr JSP 파일을 반환하여 사용자 정보가 포함된 추가 정보 입력 화면을 표시
                */
                
                
            } else { // 9. 오류 처리: 토큰 요청이나 사용자 정보 요청이 실패할 경우
            	
                model.addAttribute("error", "사용자 정보 요청 실패: " + userInfoResponse.getStatusCode()); //  오류 메시지를 모델에 추가
                return "error"; // 오류 페이지로 이동 //  오류 페이지로 리다이렉트
            }
        } else {
            model.addAttribute("error", "액세스 토큰 요청 실패: " + response.getStatusCode());
            return "error"; // 오류 페이지로 이동
        }
    }
    
    
//    // 네이버 로그인 관련
//    @RequestMapping("/naver.do")
//    public String naver() throws Exception {
//    	
//        return "naver_login";
//    }
    
    // 콜백함수
    @RequestMapping(value="/callback", method=RequestMethod.GET)
    public String callBack(HttpServletRequest request, Model model) throws Exception{
    	System.out.println("콜백 페이지 호출");
        //return "cmm/user/callback";
//    	return "/joinExtlUsrForm.do";
    	
    	// gpt 솔루션
    	// 콜백 URL에 포함된 파라미터를 처리
        String accessToken = request.getParameter("access_token");
        String state = request.getParameter("state");

        // 토큰이 제대로 전달되었는지 확인
        if (accessToken != null && !accessToken.isEmpty()) {
            System.out.println("네이버 로그인 성공");

            model.addAttribute("accessToken", accessToken);
            return "cmm/user/callback"; // 실제로 사용할 JSP 파일의 경로로 변경
        } else {
            model.addAttribute("error", "인증에 실패했습니다.");
            System.out.println("네이버 로그인 에러");
            return "error"; // 에러 페이지로 이동
        }
    }
    
    
    
    /*
 // 네이버 로그인 redirect (카카오 복붙)  
    @RequestMapping(value = "/joinExtlUsrNaverForm.do", method = RequestMethod.GET)
    public String joinExtlUsrNaverForm(HttpServletRequest request, Model model) throws Exception  {
        
    	// 2. 액세스 토큰 요청 설정
    	//String tokenUrl = "https://kauth.kakao.com/oauth/token"; //  카카오의 액세스 토큰을 요청할 URL
    	
    	String tokenUrl = "https://nid.naver.com/oauth2.0/token"; //  네이버 접근 토큰 발급, 갱신, 삭제 요청 url 
    	
        RestTemplate restTemplate = new RestTemplate(); // RestTemplate 객체는 RESTful API를 호출하기 위한 Spring의 기본 HTTP 클라이언트
        
        HttpHeaders headers = new HttpHeaders(); // HttpHeaders 객체는 요청 헤더를 설정
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED); // Content-Type을 application/x-www-form-urlencoded로 설정
        
        // 3. 토큰 요청 파라미터 구성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>(); //params는 액세스 토큰 요청에 필요한 파라미터를 설정
        params.add("grant_type", "authorization_code"); // grant_type은 "authorization_code"로 설정하여 인증 코드를 사용한 방식임을 나타냄
        params.add("client_id", "nTM2zP9ui0F2yerONFez"); // 네이버 개발자 센터에서 발급받은 앱 키
        params.add("client_secret", "Fx_g2Y0Qzz"); // 네이버 개발자 센터에서 발급받은 앱 키
        params.add("code", code); // 앞서 받아온 인증 코드
        params.add("redirect_uri", "http://localhost:8080/joinExtlUsrNaverForm.do"); //  카카오 인증 후 리디렉션될 URL

        // state
        // response_type - 기본값 : code
        // ex. https://nid.naver.com/oauth2.0/token
         // ?grant_type=authorization_code
         //&client_id=jyvqXeaVOVmV
         // &client_secret=527300A0_COq1_XV33cf&code=EIc5bFrl4RibFls1&state=9kgsGTfH4j7IyAkg  

        
        // 4. 토큰 요청 전송
        HttpEntity<MultiValueMap<String, String>> tokenRequest  = new HttpEntity<>(params, headers); // HttpEntity를 사용해 요청 본문과 헤더를 포함한 요청 객체를 만듦
        ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, tokenRequest , String.class);// restTemplate.postForEntity 메서드를 사용해 토큰을 요청하고, 응답을 ResponseEntity로 받음
        
        
        // 5. 토큰 응답 처리
        if (response.getStatusCode() == HttpStatus.OK) { // 응답 코드가 200 OK인 경우, 응답 본문을 가져옴
            // 액세스 토큰을 JSON에서 추출
            String responseBody = response.getBody();
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class); 
            String accessToken = jsonObject.get("access_token").getAsString();// Gson을 사용해 JSON 형식의 응답 본문을 파싱하여 access_token 값을 추출, // 이 access_token은 이후 사용자 정보 요청에 사용

            
         // Step 2: Use access token to fetch user info
            // 6. 액세스 토큰을 사용하여 사용자 정보 요청
//            String userInfoUrl = "https://kapi.kakao.com/v2/user/me"; // userInfoUrl : 사용자 정보를 요청할 카카오 API URL
            String userInfoUrl =  "https://openapi.naver.com/v1/nid/me"; // 네이버 접근 토큰을 이용하여 프로필 API 호출
            HttpHeaders userInfoHeaders = new HttpHeaders(); // Authorization 헤더에 Bearer와 액세스 토큰을 포함해 사용자 정보 요청을 보냄
            userInfoHeaders.add("Authorization", "Bearer " + accessToken); // restTemplate.exchange 메서드를 사용해 GET 요청을 보내고, 응답을 받음

            HttpEntity<String> userInfoRequest = new HttpEntity<>(userInfoHeaders);
            ResponseEntity<String> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoRequest, String.class);
            
            // 7. 사용자 정보 응답 처리
            if (userInfoResponse.getStatusCode() == HttpStatus.OK) { // 응답 코드가 200 OK인 경우, 응답 본문에서 사용자 정보를 JSON 형식으로 파싱
                // 사용자 정보 응답 처리
                String userInfoResponseBody = userInfoResponse.getBody();
                JsonObject userInfo = gson.fromJson(userInfoResponseBody, JsonObject.class);
                String naverUserId = userInfo.get("id").getAsString(); // id 필드를 추출하여 카카오 고유 사용자 ID를 가져옴
                
                

                // 사용자 존재 여부 확인 추가
                if (userService.joinIdCheck(naverUserId)) {  //사용자가 이미 존재하는지 확인
                	System.out.println("SNS 카카오 로그인 시 기존 사용자 있는 경우 ");
                    UserVO resultVO = userService.getUserBySNSId(naverUserId , "n");  // 여기서 snsId와 snsProvider를 함께 전달
                    System.out.println("카카오 로그인 성공, 세션에 담을 값 : " + resultVO);
                    
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userVO", resultVO);  //  // 기존 사용자 세션에 로그인 정보 저장
                   
                    
                    
                    // 1) 로그인한 IP 주소 가져오기
                    String clientIp = getClientIp(request);
                    System.out.println("sns 로그인 clientIp : "+ clientIp);

                    // 2) 로그인 정보 업데이트 (로그인 일시, 로그인 횟수, 로그인 IP)
                    int resultUpdtLoginDt = userService.updateLastLoginDt(resultVO.getUserId(), clientIp);
                    if (resultUpdtLoginDt > 0) {  // 로그인 업데이트 성공
                        System.out.println("SNS 로그인 - 마지막 로그인 일시 및 IP 업데이트 성공: " + resultUpdtLoginDt);
                    } else {  // 실패 시 오류 로그 출력
                        System.out.println("SNS 로그인 - 마지막 로그인 일시 및 IP 업데이트 실패");
                        
                    }

                    
                    
                    return "redirect:/cmm/main/mainPage.do";  // 메인 페이지 또는 원하는 페이지로 이동
                } else { // 신규 사용자일 경우 추가 정보 입력 페이지로 이동
                	System.out.println("SNS 카카오 로그인 시 기존 사용자 없는 경우 ");
                    HttpSession session = request.getSession();
                    session.setAttribute("sns_provider", "k");  // 세션에 SNS 제공자 정보 저장
                    model.addAttribute("naverUserId", naverUserId);   // 폼 제출 시 사용할 kakaoUserId 전달 // 사용자 정보를 Model에 추가하여 뷰에 전달
                    
                    return "/cmm/user/joinExtlUsr"; // 추가 정보 입력 페이지로 리디렉션
                }
                
                /*
                // (나중에 추가)세션에 SNS 제공자 정보 저장 (카카오: "k")
                HttpSession session = request.getSession();
                session.setAttribute("sns_provider", "k");
                
                
                // 8. 모델에 사용자 정보 추가 및 뷰 반환
                // 사용자 정보를 모델에 추가하여 전달
                model.addAttribute("kakaoUserId", kakaoUserId); // 사용자 정보를 Model에 추가하여 뷰에 전달
                model.addAttribute("userInfo", userInfo);
                
                return "/cmm/user/joinExtlUsr"; // joinExtlUsr JSP 파일을 반환하여 사용자 정보가 포함된 추가 정보 입력 화면을 표시
                //*
                
                
            } else { // 9. 오류 처리: 토큰 요청이나 사용자 정보 요청이 실패할 경우
            	
                model.addAttribute("error", "사용자 정보 요청 실패: " + userInfoResponse.getStatusCode()); //  오류 메시지를 모델에 추가
                return "error"; // 오류 페이지로 이동 //  오류 페이지로 리다이렉트
            }
        } else {
            model.addAttribute("error", "액세스 토큰 요청 실패: " + response.getStatusCode());
            return "error"; // 오류 페이지로 이동
        }
    }
    */
    
    
    // 네이버 로그인 정보
    @RequestMapping(value="naverSave", method=RequestMethod.POST)
    public @ResponseBody String naverSave(@RequestParam("ageN") String ageN
							    		, @RequestParam("n_birthday") String birthdayN
							    		, @RequestParam("n_email") String emailN
							    		, @RequestParam("n_gender") String genderN
							    		, @RequestParam("n_id") String idN
							    		, @RequestParam("n_name") String nameN
							    		//, @RequestParam("n_nickName") String n_nickName
							    		)  throws Exception {
	    System.out.println("###############     naverSave    ##############################");
	    System.out.println("ageN : " + ageN);
	    System.out.println("n_birthday : " + birthdayN);
	    System.out.println("n_email : " + emailN);
	    System.out.println("n_gender : " + genderN);
	    System.out.println("n_id : " + idN);
	    System.out.println("n_name : " + nameN);
	    //System.out.println("n_nickName : " + n_nickName);
	    System.out.println("#############################################");
	    
	    // naverVO에 저장
	    NaverVO naver = new NaverVO();
	    naver.setN_age(ageN);
	    naver.setN_birthday(birthdayN);
	    naver.setN_email(emailN);
	    naver.setN_gender(genderN);
	    naver.setN_id(idN);
	    naver.setN_name(nameN);
	    //naver.setN_nickName(n_nickName);
	    
	    
	    System.out.println("zzzzz =" +naver.getN_age());
	 
	    String result = "no";
	    
	    if(naver!=null) {
	        result = "ok";
	    }
	 
	    return result;
    
    }

    // sns 로그인 추가정보 입력 화면
    /*
    @RequestMapping(value="/joinExtlUsrForm.do", method=RequestMethod.GET)
    public String joinExtlUsrForm() throws Exception{
    	System.out.println("sns 추가 페이지 호출");
        return "/cmm/main/joinExtlUsr";
    }*/
    
    // 	sns 로그인 추가정보 입력 화면(카카오) (일단 리다이렉트 성공)
    /*
    @RequestMapping(value = "/joinExtlUsrForm.do", method = RequestMethod.GET)
    public String getAccessToken(@RequestParam("code") String code, Model model) {
    	   String tokenUrl = "https://kauth.kakao.com/oauth/token";
    	    RestTemplate restTemplate = new RestTemplate();

    	    HttpHeaders headers = new HttpHeaders();
    	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

    	    MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    	    params.add("grant_type", "authorization_code");
    	    params.add("client_id", "5dd23d272be8396574b776bacd38ec63"); // YOUR_KAKAO_CLIENT_ID
    	    params.add("redirect_uri", "http://localhost:8080/joinExtlUsrForm.do");
    	    params.add("code", code);

    	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
    	    ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, request, String.class);

    	    if (response.getStatusCode() == HttpStatus.OK) {
    	        model.addAttribute("tokenResponse", response.getBody());
    	        return "/cmm/user/joinExtlUsr"; // 실제 JSP 파일 경로로 수정
    	    } else {
    	        model.addAttribute("error", "액세스 토큰 요청 실패: " + response.getStatusCode());
    	        return "error"; // 오류 페이지로 이동
    	    }
    	}

    */
    
    
}
    
    
    
    
    


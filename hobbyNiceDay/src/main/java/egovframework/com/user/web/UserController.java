package egovframework.com.user.web;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.cryptography.EgovEnvCryptoService;
import org.egovframe.rte.fdl.cryptography.EgovPasswordEncoder;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

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
    public String joinForm() {
        return "/cmm/user/joinUsr";
    }
    
    // 회원가입 기능
    @RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> joinUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) {
    	System.out.println("회원가입 기능 들어왔는지 확인");
    	JsonObject jsonObj = new JsonObject();
    	//HashMap<String, Object> retMap = new HashMap<>();
    	
        try {
        	// 클라이언트 IP 가져오기
            String clientIp = getClientIp(request);
            System.out.println("clientIp"+ clientIp);
            // UserVO에 클라이언트 IP 설정
            userVO.setRegIp(clientIp);
            
         	System.out.println("userVO"+ userVO);		
        	
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
    private String getClientIp(HttpServletRequest request) {
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
    public String  checkUserId(@RequestParam("userId") String userId) {
    	
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
    
    
    // 로그인 페이지로 이동
    @RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
    public String loginForm() {
    	return "/cmm/user/loginUsr";
    }
    
    // 회원정보수정 페이지로 이동
    @RequestMapping(value = "/updateUsrForm.do", method = RequestMethod.GET)
    public String updateUsrForm() {
    	return "/cmm/user/updateUsr";
    }
}
    
    
    
    
    


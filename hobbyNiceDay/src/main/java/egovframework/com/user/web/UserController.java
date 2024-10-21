package egovframework.com.user.web;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.cryptography.EgovEnvCryptoService;
import org.egovframe.rte.fdl.cryptography.EgovPasswordEncoder;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import egovframework.com.cmm.LoginVO;
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
    
    // 전체 회원 목록 조회 기능
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
    
    /*proflist 참고하기*/
 // 리스트 데이터
// 	@RequestMapping({"/getProfListData.do","/{siteId}/getProfListData.do"})
// 	@ResponseBody
// 	public void getProfListData(HttpServletRequest req, HttpServletResponse res, @RequestParam HashMap<String, Object> param) throws Exception {
// 		HashMap<String, Object> retMap = new HashMap<>();
// 		HashMap<String, Object> listMap = new HashMap<>();
// 		try {
// 			// 로그인정보 가져오기
// 			LoginVO loginVO = (LoginVO) SiiruUtil.getAttribute("siiruLogin");
// 			param.put("deptId", loginVO.getDeptId());
// 			param.put("loginId", loginVO.getUserId());
//
// 			//기관 책임자 여부 체크 
// 			//int chargeAuth = pgCommonService.getInstChargeAuth(param);
// 			//if(chargeAuth > 0) {
// 			//	param.put("chargeYn", "Y");
// 			//}else {
// 			//	param.put("chargeYn", "N");
// 			//}
// 			
// 			// 페이지 번호
// 			int movePage = NumberUtil.toInt(param.get("movePage"),"1");
// 			param.put("movePage", movePage);
// 			// 한페이지 레코드 개수
// 			double recordCnt = NumberUtil.toDouble(SiiruProperties.getSiiRU("recordCnt"),10);
// 			if (StringUtil.isNotEmpty(param.get("recordCnt"))) recordCnt = NumberUtil.toDouble(param.get("recordCnt"));
// 			param.put("recordCnt", (int)recordCnt);
// 			// limit 시작 개수 (Mariadb, mySql)
// 			param.put("limitStart", ((movePage - 1) * (int)recordCnt));
// 			// 전체 개수
// 			double totalCnt = pgProfService.getProfListTotal(param);
// 			// 전체 페이지수
// 			double pageCnt = Math.ceil(totalCnt / recordCnt);
// 			// 리스트
// 			ArrayList<EgovMap> listData = pgProfService.getProfListData(param);
// 			// 복호화
// 			for (EgovMap list : listData) {
// 				list.put("telno", cryptoService.getPrivacyDecrypt((String)list.get("telno")));
// 			}
// 			// 리턴값 정리
// 			listMap.put("page", movePage);
// 			listMap.put("pageCnt", pageCnt);
// 			listMap.put("totalCnt", totalCnt);
// 			listMap.put("recordCnt", recordCnt);
// 			listMap.put("list", listData);
// 			retMap.put("error", "N");
// 			retMap.put("dataMap", listMap);
// 		} catch (DataAccessException e) {
// 			retMap.put("error", "Y");
// 			retMap.put("errorTitle", "Error");
// 			retMap.put("errorMsg", "시스템 오류가 발생했습니다.");
// 			SiiruUtil.logFile(req, e);
// 		}
// 		SiiruUtil.writeJson(retMap, res);
// 	}
    
    
    
    
    
    
    
    
    // 로그인 페이지로 이동
    @RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
    public String loginForm() throws Exception{
    	return "/cmm/user/loginUsr";
    }
    
    
    @RequestMapping(value = "/loginUser.do")
    @ResponseBody
	public ResponseEntity<String> loginUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) throws Exception {
        //public ResponseEntity<String> joinUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request) {
    	
    	JsonObject jsonObj = new JsonObject();
        try {
			// 1. 일반 로그인 처리
			UserVO resultVO = userService.loginUser(userVO); // id,pw 같은 경우 resultVO 반환
			System.out.println(resultVO);
			
			boolean loginPolicyYn = true;
		
		
			if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("") && loginPolicyYn) {
				System.out.println("로그인 성공");
				request.getSession().setAttribute("UserVO", resultVO); // 세션에 담기
//				return "forward:/cmm/main/mainPage.do";
				jsonObj.addProperty("error", "N");
				System.out.println("로그인 성공 jsonObj"+ jsonObj);
			} else {
				jsonObj.addProperty("error", "Y");
	            jsonObj.addProperty("errorMsg", "아이디 또는 비밀번호가 잘못되었습니다.");
	//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
				//return "/cmm/user/loginUsr";
	            System.out.println("로그인 실패 jsonObj"+ jsonObj);
			}
        } catch (Exception e) {
        	System.out.println("catch");
            jsonObj.addProperty("error", "Y");
            jsonObj.addProperty("errorMsg", "로그인 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            e.printStackTrace();
        }
        
        System.out.println("return 직전 jsonObj"+jsonObj);
        return ResponseEntity.ok(jsonObj.toString());

	}
    
    
    
    
    
    // 회원정보수정 페이지로 이동
    @RequestMapping(value = "/updateUsrForm.do", method = RequestMethod.GET)
    public String updateUsrForm() {
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
	
    
    
    
    
}
    
    
    
    
    


package egovframework.com.reservation.web;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.code.service.CodeService;
import egovframework.com.reservation.service.ReservationService;
import egovframework.com.user.service.UserService;

@Controller
public class ReservationController {
	
	@Resource(name = "ReservationService")
	  private ReservationService reservationService;
	
	@Resource(name = "ClassService")
    private ClassService classService;
    
	@Resource(name = "CodeService")
    private CodeService codeService;
    
	
    // 회원 예약하기 페이지로 이동
    @RequestMapping(value = "/reservationUsrForm.do", method = RequestMethod.GET)
    public String reservationUsrForm(@RequestParam("classId") String classId, Model model) throws Exception{
    	System.out.println("회원 클래스 예약 페이지 이동했는지 확인 ");
    	// 해당 클래스 정보 가져오기 
    	int intClassId = Integer.parseInt(classId); // classId int형 : 문자열->정수 변환
        ClassVO classDetails = classService.getClassDetails(intClassId);
        System.out.println("회원 예약 폼 클래스 정보 조회 : "+ classDetails);
        model.addAttribute("classDetails", classDetails);
    	
    	return "/cmm/reservation/reservationUsr";
    }
    
    
    // 회원 예약 등록 기능
    @RequestMapping(value = "/reservationUsrInsert.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> reservationUsrInsert(@ModelAttribute("reservationVO") ReservationVO reservationVO
	    											, HttpServletRequest request) throws Exception {
    	System.out.println("회원 예약 등록 기능 들어왔는지 확인");
    	JsonObject jsonObj = new JsonObject();

    	try {
    		// UserVO에 클라이언트 IP 설정
    		
    		String clientIp = getClientIp(request);// 클라이언트 IP 가져오기
    		System.out.println("clientIp"+ clientIp);
    		reservationVO.setRegIp(clientIp);
    		
    		
    		System.out.println("예약 등록 시 넘어온 reservationVO : " + reservationVO);

            // 예약 번호 생성 및 설정
            // String reservationNum = reservationService.generateReservationNum(reservationVO);
            // reservationVO.setReservationNum(reservationNum);
    		
    		// classDetailId 시간대 설정 (문자열->숫자)
    		int classDetailId =  Integer.parseInt(request.getParameter("classDetailId"));
    		reservationVO.setClassDetailId(classDetailId);
    		reservationVO.setRegId(request.getParameter("userId")); // 등록자 id 입력
    		reservationVO.setReservationType("user"); // 회원/비회원 구분자
    		reservationVO.setReservationStatus("stay"); // 예약상태 (대기 stay, 취소 cancel, 승인 confirm, 거부 reject)
    		
            /* 예약 등록 서비스 호출*/
    		int resrultInsertReservation = reservationService.insertReservation(reservationVO);
    		System.out.println("회원 예약 들어갔는지 resrultInsertReservation  생성됐나 확인 : " + resrultInsertReservation); // 1을 반환하고 있음
    		
//    		int resrultInsertReservation  = reservationVO.getresrultInsertReservation (); // 생성된 classId 가져오기
//            System.out.println("생성된 reservationVO에서 resrultInsertReservation  가져오기 : " + resrultInsertReservation ); // 확인 필요
            
            if(resrultInsertReservation  > 0) { //
            	jsonObj.addProperty("error", "N");
            	//return "redirect:/loginForm.do";
            	System.out.println("회원 예약 등록 성공 시 리턴 직전, jsonObj:"+ jsonObj);
            }else { // 확인 분기 이게 맞는지 확인 필요함
            	jsonObj.addProperty("error", "Y");
            	jsonObj.addProperty("errorMsg", "회원 예약 등록에 실패했습니다. 관리자에게 문의하세요.");
            }
    		
//            System.out.println("reservationVO : " + reservationVO);
    		
            
        } catch (Exception e) {
        	jsonObj.addProperty("error", "Y");
        	jsonObj.addProperty("errorMsg", "회원 예약 등록 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            System.out.println("회원 예약 등록 실패 시 리턴 직전, jsonObj:"+ jsonObj);

        }
    	
        return  ResponseEntity.ok(jsonObj.toString());
      
    }
    
    
    
    
    // 관리자 페이지 예약 목록(전체) 가져오는 기능
    @RequestMapping(value = "/getAdminReservationList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getAdminReservationList(Model model) throws Exception{
    	System.out.println("관리자 전체 예약 목록 조회 됐는지 확인");
    	
    	//JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = reservationService.getAdminReservationList();  // 모든 사용자 정보 가져오기
		    	System.out.println("listData 확인 : "+ listData);
		    	
		    	 
		    	// 예약 상태 공통코드 가져오는 리스트
		        List<EgovMap> statusCodes = codeService.getCodesByType("reservation_status"); // Make sure to implement this in your service
		        
		        System.out.println("예약 상태 공통코드 가져오는 리스트 : " + statusCodes);
		        Map<String, String> statusMap = new HashMap<>();
		        for (EgovMap code : statusCodes) {
		        	System.out.println("code : " + code);
		            statusMap.put((String) code.get("codeValue"), (String) code.get("codeNm"));
		            System.out.println("각각 statusMap : " + statusMap);
		        }
		    	System.out.println("공통코드 반복문 돌리고 나서 : " + statusMap);
		    	
		    	
		    	// 예약일자, 등록일시 포맷 설정
		    	// 날짜 형식을 변환하기 위한 포맷터 생성
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        
		        // 시간 형식을 변환하기 위한 SimpleDateFormat 객체 생성
		        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

		        
		        // 리스트의 각 데이터를 순회하며, 날짜 필드를 형식에 맞게 변환
		        for (EgovMap item : listData) {
		            Date reservationDt = (Date) item.get("reservationDt");
		            Date regDt = (Date) item.get("regDt");

		            Object timeStartObj = item.get("timeStart");
		            Object timeEndObj = item.get("timeEnd");
		            
		            if (reservationDt != null) {
		                // reservationDt 필드를 yyyy-MM-dd 형식의 문자열로 변환
		                item.put("reservationDt", dateFormat.format(reservationDt));
		            }
		            if (regDt != null) {
		                // regDt 필드를 yyyy-MM-dd HH:mm:ss 형식의 문자열로 변환
		                item.put("regDt", dateTimeFormat.format(regDt));
		            }
		            
		            if (timeStartObj instanceof Time) {
		                // timeStart를 HH:mm 형식의 문자열로 변환
		                String formattedTimeStart = timeFormat.format((Time) timeStartObj);
		                item.put("timeStart", formattedTimeStart);
		            }
		            if (timeEndObj instanceof Time) {
		                // timeEnd를 HH:mm 형식의 문자열로 변환
		                String formattedTimeEnd = timeFormat.format((Time) timeEndObj);
		                item.put("timeEnd", formattedTimeEnd);
		            }
		        }
		    	
		        // Populate listMap with formatted data and add to retMap
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	listMap.put("statusMap", statusMap); // 예약상태 공통코드 담아온 거 넣기
		    	System.out.println("listMap 확인 : "+ listMap);
		        
		    	retMap.put("error", "N");
				retMap.put("dataMap", listMap);
				System.out.println("retMap 확인 : "+ retMap);
		        
				// Convert retMap to JSON and return
				Gson gson = new Gson();
			    String jsonStr = gson.toJson(retMap);  // retMap을 JSON 문자열로 변환
			    System.out.println("jsonStr 확인 : " + jsonStr);
			    
			    return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    	 } catch (Exception e) {
    		 	retMap.put("error", "Y");
    		 	retMap.put("errorMsg", "예약 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
   
    

    // 관리자페이지 예약대기 승인요청 목록 조회
    @RequestMapping(value = "/getAdminPendingReservationList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getAdminPendingReservationList(Model model) throws Exception{

    	System.out.println("관리자 승인대기(stay) 예약 목록 조회 됐는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = reservationService.getAdminPendingReservationList();  // 모든 사용자 정보 가져오기
		    	System.out.println("listData 확인 : "+ listData);
		    	
		    	
		    	// 예약일자, 등록일시 포맷 설정
		    	// 날짜 형식을 변환하기 위한 포맷터 생성
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        
		        // 시간 형식을 변환하기 위한 SimpleDateFormat 객체 생성
		        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

		        
		        // 리스트의 각 데이터를 순회하며, 날짜 필드를 형식에 맞게 변환
		        for (EgovMap item : listData) {
		            Date reservationDt = (Date) item.get("reservationDt");
		            Date regDt = (Date) item.get("regDt");

		            Object timeStartObj = item.get("timeStart");
		            Object timeEndObj = item.get("timeEnd");
		            
		            if (reservationDt != null) {
		                // reservationDt 필드를 yyyy-MM-dd 형식의 문자열로 변환
		                item.put("reservationDt", dateFormat.format(reservationDt));
		            }
		            if (regDt != null) {
		                // regDt 필드를 yyyy-MM-dd HH:mm:ss 형식의 문자열로 변환
		                item.put("regDt", dateTimeFormat.format(regDt));
		            }
		            
		            if (timeStartObj instanceof Time) {
		                // timeStart를 HH:mm 형식의 문자열로 변환
		                String formattedTimeStart = timeFormat.format((Time) timeStartObj);
		                item.put("timeStart", formattedTimeStart);
		            }
		            if (timeEndObj instanceof Time) {
		                // timeEnd를 HH:mm 형식의 문자열로 변환
		                String formattedTimeEnd = timeFormat.format((Time) timeEndObj);
		                item.put("timeEnd", formattedTimeEnd);
		            }
		        }
		    	
		        // 변환된 listData를 HashMap에 추가
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	System.out.println("listMap 확인 : "+ listMap);
		        
		    	retMap.put("error", "N");
				retMap.put("dataMap", listMap);
				System.out.println("retMap 확인 : "+ retMap);
		        
				
				 // JSON으로 변환 
				Gson gson = new GsonBuilder()
						        .create();
			    String jsonStr = gson.toJson(retMap);  // retMap을 JSON 문자열로 변환
			    System.out.println("jsonStr 확인 : " + jsonStr);
			     return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    	 } catch (Exception e) {
    		 	retMap.put("error", "Y");
    		 	retMap.put("errorMsg", "승인 대기 예약 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
    
    // 관리자 예약현황(통계) 페이지 이동 
    @RequestMapping(value = "/adminStatusList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminStatusList(Model model) throws Exception{

    	System.out.println("관리자 예약 현황(통계) 목록 조회 됐는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = reservationService.getAdminPendingReservationList();  // 모든 사용자 정보 가져오기
		    	System.out.println("listData 확인 : "+ listData);
		    	
		    	
		    	// 예약일자, 등록일시 포맷 설정
		    	// 날짜 형식을 변환하기 위한 포맷터 생성
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        
		        // 시간 형식을 변환하기 위한 SimpleDateFormat 객체 생성
		        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

		        
		        // 리스트의 각 데이터를 순회하며, 날짜 필드를 형식에 맞게 변환
		        for (EgovMap item : listData) {
		            Date reservationDt = (Date) item.get("reservationDt");
		            Date regDt = (Date) item.get("regDt");

		            Object timeStartObj = item.get("timeStart");
		            Object timeEndObj = item.get("timeEnd");
		            
		            if (reservationDt != null) {
		                // reservationDt 필드를 yyyy-MM-dd 형식의 문자열로 변환
		                item.put("reservationDt", dateFormat.format(reservationDt));
		            }
		            if (regDt != null) {
		                // regDt 필드를 yyyy-MM-dd HH:mm:ss 형식의 문자열로 변환
		                item.put("regDt", dateTimeFormat.format(regDt));
		            }
		            
		            if (timeStartObj instanceof Time) {
		                // timeStart를 HH:mm 형식의 문자열로 변환
		                String formattedTimeStart = timeFormat.format((Time) timeStartObj);
		                item.put("timeStart", formattedTimeStart);
		            }
		            if (timeEndObj instanceof Time) {
		                // timeEnd를 HH:mm 형식의 문자열로 변환
		                String formattedTimeEnd = timeFormat.format((Time) timeEndObj);
		                item.put("timeEnd", formattedTimeEnd);
		            }
		        }
		    	
		        // 변환된 listData를 HashMap에 추가
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	System.out.println("listMap 확인 : "+ listMap);
		        
		    	retMap.put("error", "N");
				retMap.put("dataMap", listMap);
				System.out.println("retMap 확인 : "+ retMap);
		        
				
				 // JSON으로 변환 
				Gson gson = new GsonBuilder()
						        .create();
			    String jsonStr = gson.toJson(retMap);  // retMap을 JSON 문자열로 변환
			    System.out.println("jsonStr 확인 : " + jsonStr);
			     return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    	 } catch (Exception e) {
    		 	retMap.put("error", "Y");
    		 	retMap.put("errorMsg", "승인 대기 예약 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
    
    
    
    // 관리자 페이지 예약 정보 수정
    // 관리자 예약 수정 기능
    @RequestMapping(value = "/updateReservationInfo.do")
    @ResponseBody
	public ResponseEntity<String> updateReservationInfo(@ModelAttribute("reservationVO") ReservationVO reservationVO, HttpServletRequest request) throws Exception {
        
    	JsonObject jsonObj = new JsonObject();
        try {
		
	            // IP 주소 가져오기
	            String clientIp = getClientIp(request);
	            reservationVO.setRegIp(clientIp);
	            
	            // 세션에 있는 id 가져오기
	        	HttpSession session = request.getSession();
	            UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
	        	String userId = sessionUserVo.getUserId();
	        	System.out.println("userId : " + userId);
	        	
	        	// 등록자 id 설정
	        	reservationVO.setRegId(userId);
	            int resultUpdtLoginDt = reservationService.updateReservationInfo(reservationVO);
	            
	            System.out.println("관리자페이지 예약 정보 수정 성공확인 (resultUpdtLoginDt): " + resultUpdtLoginDt);
	            
				if(resultUpdtLoginDt > 0) { // 예약정보 수정 성공 
					jsonObj.addProperty("error", "N");
					System.out.println("관리자페이지 예약 정보 수정 성공 jsonObj"+ jsonObj);					
				}else { // 실패
					jsonObj.addProperty("error", "Y");
		            jsonObj.addProperty("errorMsg", "관리자페이지 예약 정보 수정 업데이트 실패");
		            System.out.println("관리자페이지 예약 정보 수정 업데이트 실패 jsonObj"+ jsonObj);
				}
				
				
				
				
        } catch (Exception e) {
        	System.out.println("catch or 예약정보 수정 예외 경우)");
        	
        	// 로그인 제한 오류 처리
            if (e.getMessage().contains("예약정보 수정 제한")) {
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", e.getMessage());
            } else {
                // 기타 오류 처리
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "예약정보 수정 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            }
            e.printStackTrace();
            
        }
        
        System.out.println("return 직전 jsonObj"+jsonObj);
        return ResponseEntity.ok(jsonObj.toString());

	}
    
    // 관리자 페이지 예약대기 목록에서 예약상태 변경하는 기능
    //@RequestMapping(value = "/updateReservationStatus.do", method = RequestMethod.POST, consumes = "application/json;charset=UTF-8", produces = "application/json")
    @RequestMapping(value = "/updateReservationStatus.do", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, String>> updateReservationStatus(@RequestBody List<Map<String, Object>> updates) throws Exception {
//    	public ResponseEntity<Map<String, String>> updateReservationStatus(@ModelAttribute("reservationVO") ReservationVO reservationVO) {
    	System.out.println("예약상태 변경하는 메소드 들어왔는지 확인 ");
    	System.out.println("updates : " + updates);
    	
        Map<String, String> result = new HashMap<>();
        
        try {
            // 각 예약에 대해 상태 업데이트 처리
            for (Map<String, Object> update : updates) {
                int reservationId = (int) update.get("reservationId");
                String reservationStatus = (String) update.get("reservationStatus");
                System.out.println("reservationId : " + reservationId + " reservationStatus : " + reservationStatus);
                // 예약 상태 업데이트 로직
                int updateResult = reservationService.updateReservationStatus(reservationId, reservationStatus);
                System.out.println(reservationId + "번 예약 updateResult : " + updateResult);
            }

            result.put("error", "N");
            result.put("message", "모든 예약 상태가 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            result.put("error", "Y");
            result.put("message", "업데이트 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return ResponseEntity.ok(result);
    }
    
    
    // 관리자 - 예약 승인 기능 
    @RequestMapping(value = "/adminReservationApproved.do", method = RequestMethod.GET)
    public String adminReservationApproved(@RequestParam("reservationId") String reservationId, Model model, HttpServletRequest request) throws Exception {
        // 서비스 호출하여 제한 해제
    	
    	int intReservationId = Integer.parseInt(request.getParameter("reservationId"));
        int result = reservationService.adminReservationApproved(intReservationId);
        if (result > 0) {
            model.addAttribute("message", "관리자 예약승인(접수)이 완료되었습니다.");
        } else {
            model.addAttribute("message", "관리자 예약승인(접수)에 실패했습니다.");
        }
        return "redirect:/adminReservationList.do";
    }
    
    
 // 관리자 - 접수최소 기능 
    @RequestMapping(value = "/adminReservationReject.do", method = RequestMethod.GET)
    public String adminReservationReject(@RequestParam("reservationId") String reservationId, Model model, HttpServletRequest request) throws Exception {
        // 서비스 호출하여 제한 해제
    	
    	int intReservationId = Integer.parseInt(request.getParameter("reservationId"));
        int result = reservationService.adminReservationReject(intReservationId);
        if (result > 0) {
            model.addAttribute("message", "관리자 접수취소가 완료되었습니다.");
        } else {
            model.addAttribute("message", "관리자 접수취소에 실패했습니다.");
        }
        return "redirect:/adminReservationList.do";
    }
    
    // 241029
    // 회원 예약 화면 - 예약날짜 예약가능 시간대, 예약가능 인원수 조회 기능
    // 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
    @RequestMapping(value = "/getDayAvailableTimeSlots.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getAvailableTimeSlots(
            @RequestParam("classId") String classId,
            @RequestParam("reservationDt") String reservationDt) throws Exception {
    	
    	System.out.println("특정 날짜 시간대 예약 가능 좌석 수 조회 메소드 들어왔는 지 확인");
    	
    	Map<String, Object> response = new HashMap<>();
    	JsonObject jsonObj = new JsonObject();
    	Gson gson = new Gson();
    	String jsonStr ="";
        try {
            // String 타입의 날짜를 Date 타입으로 변환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println("reservationDt : " + reservationDt);
            
            // classId int로 형 변환
        	int intClassId = Integer.parseInt(classId); // classId int형 : 문자열->정수 변환
        	System.out.println("intClassId : " + intClassId);
            // 서비스 호출하여 시간대별 예약 가능 정보를 가져오기
            List<EgovMap> availableTimeSlots = reservationService.getAvailableTimeSlots(intClassId, reservationDt);
            
            System.out.println("특정 날짜 선택 시 시간대 조회 : db에서 조회해 온 availableTimeSlots : " + availableTimeSlots);
            
            
            response.put("error", "N");
            response.put("availableTimeSlots", availableTimeSlots); // 시간대별 예약 정보 리스트 추가

            
            //            jsonObj.addProperty("availableTimeSlots",availableTimeSlots);

    	    jsonStr = gson.toJson(availableTimeSlots);  // retMap을 JSON 문자열로 변환
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "Y");
            response.put("errorMsg", "시간대별 예약 가능 정보 조회 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error 발생");
        }
        
        //return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(response);
        // return ResponseEntity.ok(response);
        return ResponseEntity.ok(jsonStr);
        
//        return jsonObj.toString();
        
    }
    
 // 월별 예약정보(현재예약인원, 남은 자석, 예약가능여부) 가져오는 기능
    @RequestMapping(value = "/getMonthlyAvailableTimeSlots.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getMonthlyAvailableTimeSlots(
    	    @RequestParam("classId") String classId,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate) throws Exception {
    	
    	System.out.println("특정 날짜 시간대 예약 가능 좌석 수 조회 메소드 들어왔는 지 확인");
    	
    	Map<String, Object> response = new HashMap<>();
    	JsonObject jsonObj = new JsonObject();
    	Gson gson = new Gson();
    	String jsonStr ="";
        try {
            // String 타입의 날짜를 Date 타입으로 변환
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//            System.out.println("startDate : " + startDate);
            
        	System.out.println("월별 예약정보 조회  startDate : " + startDate);
        	System.out.println("월별 예약정보 조회  endDate : " + endDate);
        	
        	
            // classId int로 형 변환
        	int intClassId = Integer.parseInt(classId); // classId int형 : 문자열->정수 변환
        	System.out.println("intClassId : " + intClassId);
            // 서비스 호출하여 시간대별 예약 가능 정보를 가져오기
            
        	
        	List<EgovMap> availableTimeSlots = reservationService.getMonthlyAvailableTimeSlots(intClassId, startDate, endDate);
            
            
            System.out.println("db에서 조회해 온 월별 availableTimeSlots : " + availableTimeSlots);
            
            
            response.put("error", "N");
            response.put("availableTimeSlots", availableTimeSlots); // 시간대별 예약 정보 리스트 추가

            
            //            jsonObj.addProperty("availableTimeSlots",availableTimeSlots);

    	    jsonStr = gson.toJson(availableTimeSlots);  // retMap을 JSON 문자열로 변환
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "Y");
            response.put("errorMsg", "월별 예약 가능 정보 조회 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error 발생");
        }
        
        //return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON).body(response);
        // return ResponseEntity.ok(response);
        return ResponseEntity.ok(jsonStr);
        
//        return jsonObj.toString();
        
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
    
    
    // 회원 예약 리스트 확인
    @RequestMapping(value = "/myReservationList.do", method = RequestMethod.GET)
    public String myReservationList(Model model) throws Exception{
    	
    	return "/cmm/reservation/myReservationList";
    }
    
    

    // 회원 페이지 예약 목록 가져오는 기능
    @RequestMapping(value = "/getMyReservationList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getMyReservationList(Model model, HttpServletRequest request) throws Exception{
    	System.out.println("관리자 전체 예약 목록 조회 됐는지 확인");
    	
    	//JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
	            HttpSession session = request.getSession();
	            UserVO userVO = (UserVO) session.getAttribute("userVO"); // userVO 객체 자체를 가져옴
	            String userId = null;
	            
//	            String userId = (String) session.getAttribute("userVO.userId");
	            System.out.println("세션에 있는 userVO : " + userVO);
	            
	           
				if (userVO != null) {
				    userId = userVO.getUserId(); // userId 속성 꺼내기
				    System.out.println("세션에서 가져온 userId: " + userId);
				} else {
				    System.out.println("세션에 userVO 객체가 존재하지 않습니다.");
				}
	            
	            
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = reservationService.getMyReservationList(userVO);  // 모든 사용자 정보 가져오기
		    	System.out.println("listData 확인 : "+ listData);
		    	
		    	
		    	// 예약일자, 등록일시 포맷 설정
		    	// 날짜 형식을 변환하기 위한 포맷터 생성
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        
		        // 시간 형식을 변환하기 위한 SimpleDateFormat 객체 생성
		        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

		        
		        // 리스트의 각 데이터를 순회하며, 날짜 필드를 형식에 맞게 변환
		        for (EgovMap item : listData) {
		            Date reservationDt = (Date) item.get("reservationDt");
		            Date regDt = (Date) item.get("regDt");

		            Object timeStartObj = item.get("timeStart");
		            Object timeEndObj = item.get("timeEnd");
		            
		            if (reservationDt != null) {
		                // reservationDt 필드를 yyyy-MM-dd 형식의 문자열로 변환
		                item.put("reservationDt", dateFormat.format(reservationDt));
		            }
		            if (regDt != null) {
		                // regDt 필드를 yyyy-MM-dd HH:mm:ss 형식의 문자열로 변환
		                item.put("regDt", dateTimeFormat.format(regDt));
		            }
		            
		            if (timeStartObj instanceof Time) {
		                // timeStart를 HH:mm 형식의 문자열로 변환
		                String formattedTimeStart = timeFormat.format((Time) timeStartObj);
		                item.put("timeStart", formattedTimeStart);
		            }
		            if (timeEndObj instanceof Time) {
		                // timeEnd를 HH:mm 형식의 문자열로 변환
		                String formattedTimeEnd = timeFormat.format((Time) timeEndObj);
		                item.put("timeEnd", formattedTimeEnd);
		            }
		        }
		    	
		    	
		        
		     // 예약 상태 공통코드 가져오는 리스트
		        List<EgovMap> statusCodes = codeService.getCodesByType("reservation_status"); // Make sure to implement this in your service
		        
		        System.out.println("예약 상태 공통코드 가져오는 리스트 : " + statusCodes);
		        Map<String, String> statusMap = new HashMap<>();
		        for (EgovMap code : statusCodes) {
		        	System.out.println("code : " + code);
		            statusMap.put((String) code.get("codeValue"), (String) code.get("codeNm"));
		            System.out.println("각각 statusMap : " + statusMap);
		        }
		    	System.out.println("공통코드 반복문 돌리고 나서 : " + statusMap);
		    	
		        
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	listMap.put("statusMap", statusMap); // 예약상태 공통코드 담아온 거 넣기
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
    		 	retMap.put("errorMsg", "예약 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
    
    
    
    
    

    
}
    
    
    


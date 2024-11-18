package egovframework.com.reservation.web;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.code.service.CodeService;
import egovframework.com.reservation.service.ReservationService;

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
    
    
 // 비회원 예약하기 페이지로 이동
    @RequestMapping(value = "/reservationNonUsrForm.do", method = RequestMethod.GET)
    public String reservationNonUsrForm(@RequestParam("classId") String classId, Model model) throws Exception{
    	// 해당 클래스 정보 가져오기 
    	int intClassId = Integer.parseInt(classId); 
    	// classId int형 : 문자열->정수 변환
        
    	ClassVO classDetails = classService.getClassDetails(intClassId);
        System.out.println("비회원 예약 폼 클래스 정보 조회 : "+ classDetails);
        model.addAttribute("classDetails", classDetails);
    	
    	return "/cmm/reservation/reservationNonUsr";
    }
    
    
    
    
    
    // 회원 예약 등록 기능
    @RequestMapping(value = "/reservationUsrInsert.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String reservationUsrInsert(@ModelAttribute("reservationVO") ReservationVO reservationVO
	    											, HttpServletRequest request) throws Exception {
    	System.out.println("예약 등록 기능 들어왔는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	
    	try {
    		// UserVO에 클라이언트 IP 설정
    		
    		String clientIp = getClientIp(request);// 클라이언트 IP 가져오기
    		System.out.println("clientIp"+ clientIp);
    		reservationVO.setRegIp(clientIp);
    		
    		
    		System.out.println("예약 등록 시 넘어온 reservationVO : " + reservationVO);

            
    		// classDetailId 시간대 설정 (문자열->숫자)
    		int classDetailId =  Integer.parseInt(request.getParameter("classDetailId"));
    		System.out.println("예약 등록하려는 classDetailId : " + classDetailId);
    		
    		reservationVO.setClassDetailId(classDetailId);
    		reservationVO.setRegId(request.getParameter("userId")); // 등록자 id 입력
    		reservationVO.setReservationStatus("stay"); // 예약상태 (대기 stay, 취소 cancel, 접수완료 approved, 접수취소 reject, 수강완료 done)  		
    		String reservationDt = request.getParameter("reservationDt");
    		System.out.println("예약 등록하려는 reservationDt : " + reservationDt);
    		
    		
    		int intClassId = reservationVO.getClassId(); // 클래스
    		System.out.println("예약 등록하려는 intClassId : " + intClassId);

    		String classId = request.getParameter("classId");
    		System.out.println("예약 등록하려는 classId : " + classId);
    		
    		// 예약하려는 인원수
    		int reservationCnt = reservationVO.getReservationCnt();
    		
    		
    		/*예약 등록 서비스 호출 전 인원확인 (예약 정원체크)*/
    		ReservationVO reservationCkVO = reservationService.getAvailableSeatsCk(reservationVO);
    		System.out.println("예약 등록 전 예약 정원 체크 정보 : " + reservationCkVO);
    		
    		// 예약 정원 확인 - 남은 좌석수
    		int availavleSeats = reservationCkVO.getAvailableSeatsWithAllReservations();
    		System.out.println("예약 등록 전 해당 시간대 남은 좌석수 :  : " + availavleSeats);
    		
    		if (availavleSeats <= 0) {
    			// 남은좌석수가 0인 경우(혹은 음수)
    			System.out.println("예약 등록 - 예약 정원 체크 :해당 시간대 예약 가능 인원 초과");
    		    jsonObj.addProperty("error", "Y");
    		    jsonObj.addProperty("errorMsg", "해당 시간대에 예약 가능한 인원이 초과되었습니다.");
    		    jsonObj.addProperty("classId", reservationVO.getClassId()); // classId 추가

    		    
    		    return jsonObj.toString();
    		    
    		}else if(reservationCnt > availavleSeats) {
    			// 예약하려는 인원이 예약가능좌석보다 많은 경우 - 초과 (예약불가)
    			System.out.println("예약 등록 - 예약 정원 체크 :해당 시간대 예약 가능 인원 초과");
    		    jsonObj.addProperty("error", "Y");
    		    jsonObj.addProperty("errorMsg", "해당 시간대에 예약 가능한 인원이 초과되었습니다.");
    		    jsonObj.addProperty("classId", reservationVO.getClassId()); // classId 추가

    		    return jsonObj.toString();
    		
    		}else if(reservationCnt<=availavleSeats) { 
    			// 예약하려는 인원이 예옉갸능좌석보다 적거나 같은 경우 => 예약가능
    			
    			/* 예약 등록 서비스 호출*/
    			int resrultInsertReservation = reservationService.insertReservation(reservationVO);
    			System.out.println("예약 등록 들어갔는지 resrultInsertReservation  생성됐나 확인 : " + resrultInsertReservation); // 1을 반환하고 있음
    			
    			if(resrultInsertReservation  > 0) { 
    				// 예약 등록 성공 시
    				jsonObj.addProperty("error", "N");

					jsonObj.addProperty("resrvationType", "user");
					//return "redirect:/loginForm.do";
					System.out.println("예약 등록 성공 시 리턴 직전, jsonObj:"+ jsonObj);
    				
    				
    				
    			}else { 
    				// 예약 등록 실패 시
    				// 확인 분기 이게 맞는지 확인 필요함
    				jsonObj.addProperty("error", "Y");
    				jsonObj.addProperty("errorMsg", "예약 등록에 실패했습니다. 관리자에게 문의하세요.");
    			}
    			
    		}
    		
        } catch (Exception e) {
        	jsonObj.addProperty("error", "Y");
        	jsonObj.addProperty("errorMsg", "예약 등록 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            System.out.println("예약 등록 실패 시 리턴 직전, jsonObj:"+ jsonObj);

        }
    	
        return  jsonObj.toString();
      
    }
    
    
    // 비회원 예약 검색 폼 이동
    @RequestMapping(value = "/nonUsrReservationSearchForm.do", method = RequestMethod.GET)
    public String nonUsrReservationSearchForm() throws Exception{
    	System.out.println("비회원 예약검색페이지 이동했는지 확인 ");
    	
    	return "/cmm/reservation/nonUsrReservationSearchForm";
    }
    
    // 비회원 예약 검색 기능
    @RequestMapping(value = "/searchNonUserReservation.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> searchNonUserReservation(@ModelAttribute("reservationVO") ReservationVO reservationVO
	    											, HttpServletRequest request) throws Exception {
    	System.out.println("비회원 예약 검색 기능 들어왔는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	
    	HashMap<String, Object> retMap = new  HashMap<>(); 
    	Gson gson = new Gson();
    	
    	String jsonStr =  gson.toJson(retMap);
    	try {
    		
    		System.out.println("비회원 예약 검색 시 넘어온 reservationVO : " + reservationVO);

    		String reservationDt = request.getParameter("reservationDt");
    		System.out.println("비회원 예약 검색하려는 예약일자 reservationDt : " + reservationDt);
    		
    		List<EgovMap> listData = new ArrayList<EgovMap>();
	    	listData = reservationService.searchNonUserReservation(reservationVO);  // 비회원 예약정보 조회 서비스 호출
	    	System.out.println("비회원 예약 검색 결과 - listData 확인 : "+ listData);
	    	
	    	
	    	
	    	 // 검색 결과가 없는 경우
	        if (listData == null || listData.isEmpty()) {
	        	System.out.println("비회원 검색 결과 없는 경우");
	            retMap.put("error", "N");
	            retMap.put("message", "입력하신 정보에 해당하는 검색 결과가 없습니다.");
	      
	        } else {
	        	System.out.println("비회원 검색 결과 있는 경우");
	            
	            // 검색 결과가 있을 경우
	            retMap.put("listData", listData);
	            retMap.put("error", "N");
	            retMap.put("message", "비회원 예약정보 검색에 성공했습니다.");
	        }
	    	
	        
	        

	    	
        } catch (Exception e) {
        	System.out.println("비회원 검색 에러");
        	retMap.put("error", "Y");
        	retMap.put("errorMsg", "비회원 예약 검색 중 오류가 발생했습니다. 관리자에게 문의하세요.");
        	// jsonObj.addProperty("error", "Y");
        	
        	
        }
    	
		
    	jsonStr = gson.toJson(retMap);  // HashMap retMap을 JSON 문자열로 변환
    	System.out.println("jsonStr 확인 : " + jsonStr);

    	return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환

      
    }
    
    // 회원(비회원) 예약 상세보기 페이지 이동
    @RequestMapping(value = "/usrReservationDetail.do", method = RequestMethod.GET)
    public String usrReservationDetail(@RequestParam("reservationId") String reservationId, Model model) throws Exception{
    	System.out.println("예약상세보기 페이지 이동했는지 확인 ");
    	
    	// 해당 클래스 정보 가져오기 
    	int intReservationId = Integer.parseInt(reservationId); // classId int형 : 문자열->정수 변환
        ReservationVO reservationDetails = reservationService.getReservationDetails(intReservationId);
        
        // 예약 상태 코드 가져오기
        String reservationStatus = reservationDetails.getReservationStatus();

        // 공통 코드에서 예약 상태 코드 리스트를 가져옴
        List<EgovMap> statusCodes = codeService.getCodesByType("reservation_status");
        
     // 상태 코드를 한글로 매핑하는 Map 생성
        Map<String, String> statusMap = new HashMap<>();
        for (EgovMap code : statusCodes) {
            String codeValue = (String) code.get("codeValue");
            String codeName = (String) code.get("codeNm");
            statusMap.put(codeValue, codeName); // 예약 상태 코드와 한글 매핑
        }
        
        // 한글 상태 이름을 가져옴
        String statusName = statusMap.get(reservationStatus);  // reservationStatus에 해당하는 한글 상태명을 가져옴
        reservationDetails.setReservationStatus(statusName);  // 예약 상태에 한글 이름 설정

        
        // 예약일자 날짜 형식 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedReservationDt = dateFormat.format(reservationDetails.getReservationDt());
        model.addAttribute("formattedReservationDt", formattedReservationDt);
        
        
        // 수강시간대 형식 변환
        SimpleDateFormat inputFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");

        // timeStart와 timeEnd를 포맷팅
        if (reservationDetails.getTimeStart() != null) {
            Date timeStart = inputFormat.parse(reservationDetails.getTimeStart());
            reservationDetails.setTimeStart(outputFormat.format(timeStart));
        }

        if (reservationDetails.getTimeEnd() != null) {
            Date timeEnd = inputFormat.parse(reservationDetails.getTimeEnd());
            reservationDetails.setTimeEnd(outputFormat.format(timeEnd));
        }
        
        System.out.println("예약 상세보기 정보 조회 : "+ reservationDetails);
        model.addAttribute("reservationDetails", reservationDetails);
    	
        System.out.println("예약 상세정보 모델에 넣기 model : " +  model);
    	return "/cmm/reservation/usrReservationDetail";
    }
    

    
    // 관리자페이지 - (달력 아래) 예약현황(통계) 달력에서 선택한 날짜의 각클래스 시간대별 예약인원, 예약건수 조회
    @RequestMapping(value = "/getReservationDayStatistics.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getReservationDayStatistics(@RequestParam("reservationDt") String reservationDt
    														 , HttpServletRequest request) throws Exception{ 
        System.out.println("예약 통계 선택한 날짜 정보 가져오는 지 확인 ");
    	
        Map<String, Object> retMap = new HashMap<>();
        Gson gson = new Gson();
    	String jsonStr =  gson.toJson(retMap);
    	
    	// 달력 오른쪽에서 클릭한 클래스의 classId 얻기
    	int intClassId = Integer.parseInt(request.getParameter("classId"));
    	
    	
        try {
            List<EgovMap> statisticsList = reservationService.getReservationDayStatistics(reservationDt, intClassId);
            System.out.println("선택한 날짜에 대한 정보 : " + statisticsList);
            retMap.put("error", "N");
            retMap.put("data", statisticsList);
            
            jsonStr =  gson.toJson(retMap);

        	System.out.println("예약현황 선택 날짜 정보 불러오는 중 성공 경우 : " + jsonStr);
        } catch (Exception e) {
        	System.out.println("예약현황 선택 날짜 정보 불러오는 중 오류 발생 경우");
        	retMap.put("error", "Y");
        	retMap.put("message", "데이터 조회 중 오류 발생");
        }

        System.out.println("리턴 직전 resultMap:  ");
//        return retMap;
        return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    }
    
    
 // 관리자페이지 - (달력 오른쪽) 예약현황(통계) 달력에서 선택한 날짜의 통합정보 조회(클래스별 예약인원 합계, 예약건수 합계)
    @RequestMapping(value = "/getReservationTotalDayStatistics.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getReservationTotalDayStatistics(@RequestParam("reservationDt") String reservationDt) throws Exception {
        System.out.println("예약 통계 선택한 날짜 통합 정보 가져오는 지 확인 ");
    	
        Map<String, Object> retMap = new HashMap<>();
        Gson gson = new Gson();
    	String jsonStr =  gson.toJson(retMap);
    	
        try {
        	// 선택날짜 통합정보 조회
            List<EgovMap> totalList = reservationService.getReservationTotalDayStatistics(reservationDt);
            System.out.println("선택한 날짜에 대한 통합 정보 : " + totalList);
            retMap.put("error", "N");
            retMap.put("data", totalList);
            
            jsonStr =  gson.toJson(retMap);

        	System.out.println("예약현황 선택 날짜 통합 정보 불러오는 중 성공 경우 : " + jsonStr);
        } catch (Exception e) {
        	System.out.println("예약현황 선택 날짜 통합 정보 불러오는 중 오류 발생 경우");
        	retMap.put("error", "Y");
        	retMap.put("message", "데이터 조회 중 오류 발생");
        }

        System.out.println("리턴 직전 resultMap:  ");
//        return retMap;
        return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    }
    
    
    // 관리자 예약 현황(통계) 건수 클릭 시 상세 정보
    @RequestMapping(value = "/adminReservationStatDetail.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getReservationDetail(@RequestParam("classDetailId") int classDetailId,
											            @RequestParam("classId") int classId,
											            @RequestParam("reservationDt") String reservationDt, Model model) throws Exception{
    	
    	 Map<String, Object> retMap = new HashMap<>();
         Gson gson = new Gson();
     	String jsonStr =  gson.toJson(retMap);
	
     	 try {	
		     	// 예약 상세 정보를 조회하는 서비스 호출
			List<EgovMap> reservationList = reservationService.getReservationStatusDetails(classDetailId, classId, reservationDt);
			
			System.out.println("선택한 건수에 대한 정보 : " + reservationList);
            retMap.put("error", "N");
            retMap.put("data", reservationList);
            
            
        	
        	
        	
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
	    	retMap.put("statusMap", statusMap); // 예약상태 공통코드 담아온 거 넣기
	    	
	    	jsonStr =  gson.toJson(retMap);

        	System.out.println("예약현황 선택 날짜 정보 불러오는 중 성공 경우 : " + jsonStr);
        	
			
     	 }catch(Exception e) {
         	System.out.println("예약현황 선택 날짜 정보 불러오는 중 오류 발생 경우");
         	retMap.put("error", "Y");
         	retMap.put("message", "데이터 조회 중 오류 발생");
         }

         System.out.println("리턴 직전 resultMap:  "  + jsonStr);
//         return retMap;
         return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
	}
    
    
    // 수료증 발급 시 예약정보 가져오기
    
    @RequestMapping(value = "/getReservationDetails.do", method = RequestMethod.GET,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> getReservationDetails(@RequestParam("reservationId") String reservationId) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        
        int intReservationId = Integer.parseInt(reservationId);
        try {
            ReservationVO reservation = reservationService.getReservationDetails(intReservationId);
            if (reservation != null) {
                resultMap.put("error", "N");
                resultMap.put("dataMap", reservation);
            } else {
                resultMap.put("error", "Y");
                resultMap.put("errorMsg", "예약 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            resultMap.put("error", "Y");
            resultMap.put("errorMsg", "오류 발생: " + e.getMessage());
        }
        return resultMap;
    }
    
    
    
    // 관리자 페이지 예약 목록(전체) 가져오는 기능
    @RequestMapping(value = "/getAdminReservationList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getAdminReservationList(Model model,
			    		@RequestParam(value = "startDate", required = false) String startDate,
			            @RequestParam(value = "endDate", required = false) String endDate,
			            @RequestParam(value = "reservationType", required = false) String reservationType) throws Exception{
    	
    	System.out.println("관리자 전체 예약 목록 조회 됐는지 확인");
    	
    	System.out.println("startDate : " + startDate);
    	System.out.println("endDate : " + endDate);
    	System.out.println("reservationType : " + reservationType);
    	
    	
    	//JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
    		 
    		 	// 필터링 시
    		 	Map<String, Object> paramMap = new HashMap<>();
    		 	paramMap.put("startDate", startDate != null && !startDate.isEmpty() ? startDate : null);
    	        paramMap.put("endDate", endDate != null && !endDate.isEmpty() ? endDate : null);
    	        paramMap.put("reservationType", reservationType != null && !reservationType.isEmpty() ? reservationType : null);
    	        
    	        System.out.println("필터링 paramMap : " + paramMap);
    	        
    	        // 예약정보 데이터 담을 변수
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	
		    	
		    	 if (startDate == null && endDate == null && (reservationType == null || reservationType.isEmpty())) {
		             // Fetch all reservations if no filters are provided
		             
		    		 // 예약데이터 호출 서비스
		             listData = reservationService.getAdminReservationList();  // 모든 사용자 정보 가져오기
		             System.out.println("기본 listData 확인 : "+ listData);
		             
		         } else {
		             // 필터링된 예약데이터 호출 서비스 
		             listData = reservationService.getAdminReservationFilteringList(paramMap);
		             System.out.println("필터링된 listData 확인 : "+ listData);
		         }
		    	
		    	 
		    	// 예약 상태 공통코드 가져오는 리스트
		        List<EgovMap> statusCodes = codeService.getCodesByType("reservation_status"); // Make sure to implement this in your service
		        // System.out.println("예약 상태 공통코드 가져오는 리스트 : " + statusCodes);
		        
		        Map<String, String> statusMap = new HashMap<>();
		        
		        for (EgovMap code : statusCodes) {
		        	// System.out.println("code : " + code);
		            statusMap.put((String) code.get("codeValue"), (String) code.get("codeNm"));
		            //System.out.println("각각 statusMap : " + statusMap);
		        }
		        
		    	// System.out.println("공통코드 반복문 돌리고 나서 : " + statusMap);
		    	listMap.put("statusMap", statusMap); // 예약상태 공통코드 담아온 거 넣기
		    	
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
   
    
    // 관리자 페이지 예약 정보 수정
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
    
    
    
    
    // 관리자 - 클래스 삭제 기능
    // 클래스 삭제 메서드 추가 adminClassDelete.do
    @RequestMapping(value = "/adminDeleterReservation.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminDeleteReservation(@RequestParam("reservationId") int reservationId) throws Exception {
        System.out.println("예약 삭제 메소드 왔는 지 확인 reservationId : " + reservationId);
 	   
        JsonObject jsonObj = new JsonObject();
        // int intClassId = Integer.parseInt(classId);
        try {
            // 예약 삭제 서비스 호출
            int deletedCount = reservationService.deleteReservation(reservationId);
            System.out.println("예약 삭제 모두 완료 했는지 확인 : " + deletedCount);
            
            if (deletedCount > 0) {
         	   System.out.println("예약 삭제 성공 ");
                // 예약 삭제 성공 
         	   jsonObj.addProperty("error", "N");
                jsonObj.addProperty("message", "예약 삭제가 성공적으로 완료되었습니다.");
            } else { 
         	   System.out.println("예약 삭제 실패");
         	   // 예약 삭제 실패 
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "예약를 찾을 수 없거나 이미 삭제되었습니다.");
            }
        } catch (Exception e) {
     	   System.out.println("예약 삭제 시 서버 오류 발생 (catch)");
            e.printStackTrace();
            jsonObj.addProperty("error", "Y");
            jsonObj.addProperty("errorMsg", "예약 삭제 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());
        }
        
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
    
    
    // 관리자 - 예약 승인 (접수완료) 기능 
    @RequestMapping(value = "/adminReservationApproved.do", method = RequestMethod.GET)
    public String adminReservationApproved(@RequestParam("reservationId") String reservationId, Model model, HttpServletRequest request) throws Exception {
        // 서비스 호출하여 제한 해제
    	
    	int intReservationId = Integer.parseInt(request.getParameter("reservationId"));
    	HashMap<String, Object> params = new  HashMap<>(); 
    	
    	// IP 주소 가져오기
        String clientIp = getClientIp(request);
        
        // 세션에 있는 id 가져오기
    	HttpSession session = request.getSession();
        UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
    	String userId = sessionUserVo.getUserId();
    	System.out.println("userId : " + userId);
    	
    	
    	params.put("reservationId", reservationId); // 접수완료 ip
    	params.put("confmIp", clientIp); // 접수완료 ip
    	params.put("confmId", userId); // 접수완료 ip
    	
    	
    	
    	
    	
    	
        int result = reservationService.adminReservationApproved(params);
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
    
    
    // 사용자 - 예약취소 기능 
    @RequestMapping(value = "/myReservationCancel.do", method = RequestMethod.GET)
    public String adminReservationCancel(@RequestParam("reservationId") String reservationId
    									, @RequestParam("reservationType") String reservationType
    									, Model model
    									, HttpServletRequest request) throws Exception {
    	System.out.println("사용자 예약취소 버튼 클릭");
    	System.out.println("reservationType (회원/비회원) : " + reservationType);

    	// 서비스 호출하여 제한 해제
    	int intReservationId = Integer.parseInt(request.getParameter("reservationId"));
        int result = reservationService.myReservationCancel(intReservationId);
        if (result > 0) {
            model.addAttribute("message", "회원 예약취소가 완료되었습니다.");
        } else {
            model.addAttribute("message", "회원 예약취소가에 실패했습니다.");
        }
        
        
        if(reservationType.equals("user")) {
        	// 회원 예약인 경우
        	return "redirect:/myReservationList.do";
        }else {
        	// 비회원 예약인 경우
        	return "redirect:/main.do";
        }
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
    
    
    
    
    // 회원 예약 리스트 확인
    @RequestMapping(value = "/myReservationList.do", method = RequestMethod.GET)
    public String myReservationList(Model model) throws Exception{
    	
    	return "/cmm/reservation/myReservationList";
    }
    
    

    // 회원 페이지 예약 목록 가져오는 기능
    @RequestMapping(value = "/getMyReservationList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getMyReservationList(Model model
											    		,@RequestParam("page") int page // 현재 페이지 번호
											            ,@RequestParam("pageSize") int pageSize // 한 페이지에 표시할 항목 수) 
											            ,HttpServletRequest request) throws Exception{
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
	            
	            /*페이징*/
				// offset 계산: (page - 1) * pageSize
			    int offset = (page - 1) * pageSize;

			    // DAO에 전달할 파라미터 설정
			    Map<String, Object> params = new HashMap<>();
			    params.put("userId", userId);
			    params.put("pageSize", pageSize);
			    params.put("offset", offset);

				 // 전체 예약 건수 가져오기
		        int totalCount = reservationService.getReservationCount(userId);

		        // 전체 페이지 수 계산
		        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

				
				
				// 회원별 예약정보 불러오기
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	//listData = reservationService.getMyReservationList(userVO);  // 모든 사용자 정보 가져오기
		    	listData = reservationService.getMyReservationList(params);  // 모든 사용자 정보 가져오기
		    	
		    	

		        // 응답 데이터 구성
		        // Map<String, Object> response = new HashMap<>();
		    	listMap.put("totalCount", totalCount); // 전체 예약 건수
		    	// listMap.put("listData", listData); // 예약 데이터 (밑에서 정돈해서 넣음)
		    	listMap.put("currentPage", page); // 현재 페이지
		    	listMap.put("totalPages", totalPages); // 전체 페이지 수
		    	
		    	
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
    
    
    
    
    // 수료증 발급 (찐)
    // 수료증 발급 
    @RequestMapping(value = "/myReservationDone.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    public String myReservationDone(HttpServletResponse response) {
    	// 예약 정보 가져오기  
    	return "cmm/reservation/reservationDonePopUp";
    }
    
    // 수료증 발급 (pdf)
    @RequestMapping(value = "/myReservationDonePdf.do", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
    public void downloadCertificate(@RequestParam("reservationId") int reservationId, HttpServletResponse response) {
    	// 예약 정보 가져오기  
    	ReservationVO reservation = null;
        try {
            reservation = reservationService.getReservationDetails(reservationId);
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        // PDF 파일 생성 (메모리에 저장)             
        ByteArrayOutputStream baos = new ByteArrayOutputStream();             
        Document document = new Document();             
        try {
			PdfWriter.getInstance(document, baos);
		} catch (DocumentException e) {
			e.printStackTrace();
		}             
        document.open();                                       
        
        // 한글 폰트 설정 (프로젝트 내 폰트 파일 사용)             
        String fontPath = getClass().getClassLoader().getResource("fonts/Pretendard-Medium.ttf").getPath();                         
        
        // 시스템 폰트 경로             
        BaseFont baseFont =null;
		try {
			baseFont = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		} catch (DocumentException | IOException e) {
			e.printStackTrace();
		}
		
		
		// 폰트 설정
		Font titleFont = new Font(baseFont, 24, Font.BOLD);
	    Font contentFont = new Font(baseFont, 14);
	    Font dateFont = new Font(baseFont, 12, Font.ITALIC);
        // Font font = new Font(baseFont, 12);
	    
	    
        // 현재 날짜 가져오기             
        LocalDate today = LocalDate.now();             
        String issueDate = today.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));      
        
        
       
        try {
        	
        	// 수료증 제목
        	Paragraph title = new Paragraph("수료증", titleFont);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph("\n\n"));
            
            
            // 수료증 내용 작성
            document.add(new Paragraph("성명: " + reservation.getReservationNm(), contentFont));
            document.add(new Paragraph("과정: " + reservation.getClassNm(), contentFont));
            
            
            
            // 예약 일자를 가져와서 형식 변경
            SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", java.util.Locale.ENGLISH);
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); // 변경하고 싶은 형식
            Date reservationDate=null;
			try {
				reservationDate = inputFormat.parse(reservation.getReservationDt().toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}
    		
            String formattedReservationDate  = outputFormat.format(reservationDate);
            
            document.add(new Paragraph("수강일시: " + formattedReservationDate , contentFont));
            document.add(new Paragraph("\n위 사람은 " + reservation.getClassNm() + " 클래스를 수강하였음을 증명합니다.", contentFont));
            document.add(new Paragraph("\n발급일자: " + issueDate, dateFont));
            document.add(new Paragraph("\n\nHobby Nice Day 대표", contentFont));
			
			
            // 표 생성
            /*
            PdfPTable table = new PdfPTable(2); // 2열 표
            table.setWidthPercentage(80);
            table.setSpacingBefore(20f);
            table.setSpacingAfter(20f);

            table.addCell(new PdfPCell(new Paragraph("항목", contentFont)));
            table.addCell(new PdfPCell(new Paragraph("내용", contentFont)));
            table.addCell(new PdfPCell(new Paragraph("수강자명", contentFont)));
            table.addCell(new PdfPCell(new Paragraph(reservation.getReservationNm(), contentFont)));
            table.addCell(new PdfPCell(new Paragraph("클래스명", contentFont)));
            table.addCell(new PdfPCell(new Paragraph(reservation.getClassNm(), contentFont)));
            table.addCell(new PdfPCell(new Paragraph("수강일자", contentFont)));
            table.addCell(new PdfPCell(new Paragraph(reservation.getReservationDt().toString(), contentFont)));

            document.add(table);
             */
            
            
            
            
            
			
		} catch (DocumentException e) {
			e.printStackTrace();
		}             
                                                           
        document.close();              

        // PDF 파일을 브라우저로 전송             
        response.setContentType("application/pdf");             
        response.setHeader("Content-Disposition", "attachment; filename=completion_certificate.pdf");             
        response.setContentLength(baos.size());              
        
        
	try {
		OutputStream os = response.getOutputStream();
		baos.writeTo(os);             
		os.flush();             
		os.close();         
	} catch (IOException e) {
		e.printStackTrace();
	}            
        
}
    
 // InputStream을 byte[]로 변환하는 메서드
    private byte[] readInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] data = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray();
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
}
    
    
    


package egovframework.com.classes.web;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cryptography.EgovEnvCryptoService;
import org.egovframe.rte.fdl.cryptography.EgovPasswordEncoder;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.user.service.UserService;

@Controller
public class ClassController {
	
	
    @Resource(name = "ClassService")
    private ClassService classService;

    
    

	/** 암호화서비스 */
    @Resource(name = "egovEnvCryptoService")
    private EgovEnvCryptoService cryptoService;
    
    @Resource(name = "egovPasswordEncoder")
    private EgovPasswordEncoder egovPasswordEncoder;
	
    
    @Resource(name = "UserService")
    private UserService userService;
    
    
    // 메인화면 ( 모집중인 클래스 목록 리스트)
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMainClassList(HttpServletRequest request, ModelMap model) throws Exception {

	    // 모든 클래스 목록을 가져오는 서비스 호출
		List<EgovMap> listData = new ArrayList<EgovMap>();
	    listData = classService.getMainClassList();  // 클래스 목록을 불러오는 서비스 호출
	    System.out.println("클래스 목록: " + listData); // 디버깅을 위한 출력

	    // 클래스 목록을 모델에 추가
	    model.addAttribute("classList", listData);
	    
	    
	    // 241102 이미지 가져오기 테스트
	    int imgId= 7; // 임시로 지정
		
        List<ImgVO> images = classService.getImagesByClassId(imgId);
        // model.addAttribute("classDetails", classDetails);
        System.out.println("메인 이미지 정보 : " + images);
        
        model.addAttribute("images", images);
	    
	    

	    // 메인 페이지 JSP로 이동
	    return "main/main";
	}
	
    
    
    
    
    
    
    // 관리자 클래스 등록 기능
    @RequestMapping(value = "/insertClass.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> insertClass(@ModelAttribute("classVO") ClassVO classVO
    										    , @RequestParam(value = "imgNm" , required = false) MultipartFile imgFile
    											, HttpServletRequest request) throws Exception {
    	System.out.println("관리자 클래스 등록 기능 들어왔는지 확인");
    	JsonObject jsonObj = new JsonObject();

    	try {
    		// UserVO에 클라이언트 IP 설정
    		// 클라이언트 IP 가져오기
    		String clientIp = getClientIp(request);
    		System.out.println("clientIp"+ clientIp);
    		classVO.setRegIp(clientIp);
    		

            // 3. 클래스 정보 저장
            /* 클래스 등록 서비스 호출*/
    		int affectedRows = classService.insertClass(classVO);
    		System.out.println("클래스 들어갔는지 classId 생성됐나 확인 : " + affectedRows); // 1을 반환하고 있음 
    		int classId = classVO.getClassId(); // 생성된 classId 가져오기
            System.out.println("생성된 classVO에서 classId 가져오기 : " + classId); // 확인 필요
            
            if(classId > 0) {
            	jsonObj.addProperty("error", "N");
            	//return "redirect:/loginForm.do";
            	System.out.println("클래스 등록 성공 시 리턴 직전, jsonObj:"+ jsonObj);
            }else { // 확인 분기 이게 맞는지 확인 필요함
            	jsonObj.addProperty("error", "Y");
            	jsonObj.addProperty("errorMsg", "클래스 등록에 실패했습니다. 관리자에게 문의하세요.");
            }
    		
            System.out.println(classVO);
            
    		// 이미지 저장 처리
    		// 1. 파일이 있을 때만 처리
    		 if (imgFile != null && !imgFile.isEmpty()) {
	           // String imgFilePath = saveImg(imgFile);  // 파일 저장
	            String imgFileName = imgFile.getOriginalFilename();  // 파일명 추출
    		
    		
//    		if (classVO.getImgUrl() != null && !classVO.getImgUrl().isEmpty()) {
//                String imgFilePath = saveImg(classVO.getImgUrl());  // 파일 저장
//                String imgFileName = classVO.getImgUrl().getOriginalFilename();  // 파일명 추출
//                
                // 파일 경로 및 파일명 classVO에 설정
//                classVO.setImgFilePath(imgFilePath);
//                classVO.setImgNm(imgFileName);
//                //System.out.println("imgUrl : " + imgUrl);
//                System.out.println("이미지 파일이 처리되었습니다: " + imgFileName);
//               
//                ImgVO imgVO = new ImgVO();
//                imgVO.setImgUrl(imgFilePath);
//                imgVO.setImgNm(imgFileName);
//                System.out.println("imgVO : " + imgVO);
//                
//                // 2. DB에 이미지 정보 저장 후 ID 반환
//                int imgId = classService.insertImage(imgVO);  // DB에 이미지 저장
//                classVO.setImgId(imgId);  // 이미지 ID 설정
//                System.out.println("imgId : "  + imgId);
                
            } else {
                // 파일이 없을 경우 기본값 처리 또는 경로를 null로 설정
            	System.out.println("파일 없는 경우 classVO의 imgUrl -> null 처리");
                classVO.setImgFilePath(null);  // 필요에 따라 null 또는 기본값으로 설정
            }
    		
    		// + imgUrl 이 있으면 이미지 업로드 처리, 없으면 넘어감(null 허용이니까)
        	// 1. 이미지 업로드 처리
//    		MultipartFile file = classVO.getImgUrl();
//    		String fileName = file.getOriginalFilename();
//    		String filePath = "/uploads/" + fileName;
//    		file.transferTo(new File(filePath));  // 파일 저장
//    		classVO.setImgUrl(filePath);  // 파일 경로 저장
            
    		
    		/*
            String imgUrl = saveImg(imgFile);
            System.out.println("imgUrl : " + imgUrl);
            classVO.setImgUrl(imgUrl);  // 이미지 URL 설정
            ImgVO imgVO = new ImgVO();         // ImgVO 객체 생성
            imgVO.setImgUrl(imgUrl);           // 이미지 URL 설정
            int imgId = classService.insertImage(imgVO);  // 이미지 정보 저장 후 ID 반환
            classVO.setImgId(imgId);           // 클래스에 이미지 ID 설정
            */
            
    		// + 휴무일이 있으면 등록처리 ,없으면 넘어감(null 허용)
            // 2. 휴무일 등록 처리
    		 
    		// HttpServletRequest에서 파라미터 추출 (holidayDt[] 및 holidayDesc[])
	        String[] holidayDtArray = request.getParameterValues("holidayDt[]");
	        String[] holidayDescArray = request.getParameterValues("holidayDesc[]");

    		System.out.println("휴무일 처리 전 classId : " + classId);
    		// 휴무일 저장 처리 (여러 개의 휴무일을 반복문으로 처리)
    	        if (holidayDtArray != null && holidayDescArray != null) {
    	            for (int i = 0; i < holidayDtArray.length; i++) {
    	                // 휴무일 날짜 변환
    	                String holidayDtStr = holidayDtArray[i];
    	                
    	             // holidayDt 값이 비어 있는지 확인
    	                if (holidayDtStr == null || holidayDtStr.trim().isEmpty()) {
    	                    System.out.println("휴무일 값이 비어 있습니다. 건너뜁니다.");
    	                    continue; // 값이 없을 경우, 해당 반복을 건너뜀
    	                }
    	                
    	                try {
    	                
	    	                // 유효한 값인 경우에만 변환 및 처리
	    	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    	                Date holidayDt = dateFormat.parse(holidayDtStr); // SimpleDateFormat.parse() 시 예외처리 발생 가능
	
	    	                // 휴무일 VO 생성 및 설정
	    	                HolidayVO holidayVO = new HolidayVO();
	    	                holidayVO.setHolidayDt(holidayDt);
	    	                holidayVO.setHolidayDesc(holidayDescArray[i]);
	    	                holidayVO.setRegIp(clientIp);
	    	                holidayVO.setClassId(classId);  // CLASS_ID 설정
	
	    	                // 휴무일 테이블에 저장
	    	                int holidayId = classService.insertHoliday(holidayVO);
	    	                System.out.println("휴무일 등록 완료. holidayId: " + holidayId + ", classId : " + classId );
	    	                // 필요 시, 클래스에 연결할 휴무일 ID 추가 처리 (필요한 로직에 따라 조정 가능)
    	                } catch (ParseException e) {
    	                    System.out.println("휴무일 변환 오류: " + holidayDtStr);
    	                    e.printStackTrace();
    	                    jsonObj.addProperty("error", "Y");
    	                    jsonObj.addProperty("errorMsg", "휴무일 변환 오류가 발생했습니다. 관리자에게 문의하세요.");
    	                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());
    	                }
    	                
    	                
    	            }
    	        }
    	  
    	        // TB_CLASS_DETAIL 저장
    	        String[] timeStartArray = request.getParameterValues("timeStart[]");
    	        String[] timeEndArray = request.getParameterValues("timeEnd[]");

        		System.out.println("클래스 세부정보 처리 전 classId : " + classId);
        		// 클래스 세부정보 저장 처리 (여러 개의 클래스 시작, 종료 시간을 반복문으로 처리)
        		if (timeStartArray != null && timeEndArray != null) {
        			
        		    for (int i = 0; i < timeStartArray.length; i++) {
        		        // 시작, 종료 시간 추출
        		        String timeStart = timeStartArray[i];
        		        System.out.println(i  + "번째 timeStart : " + timeStart);
        		        String timeEnd = timeEndArray[i];
        		        System.out.println(i  + "번째 timeEnd : " + timeEnd);
        		        
        		        // null 체크 및 처리 (예시)
        		        if (timeStart == null || timeStart.isEmpty()) {
        		            System.out.println("timeStart 값이 null 또는 비어있습니다.");
        		            continue; // 또는 예외 처리
        		        }

        		        if (timeEnd == null || timeEnd.isEmpty()) {
        		            System.out.println("timeEnd 값이 null 또는 비어있습니다.");
        		            continue; // 또는 예외 처리
        		        }
        		        
        		        // 클래스 세부정보 VO 생성 및 설정
        		        ClassVO classDetailVO = new ClassVO();
        		        classDetailVO.setClassId(classId);  // CLASS_ID 설정
        		        classDetailVO.setTimeStart(timeStart);
        		        classDetailVO.setTimeEnd(timeEnd);
        		        classDetailVO.setClassDetailRegIp(clientIp);   // 등록 IP 설정
        		        	
        		        int classMaxCnt = Integer.parseInt(request.getParameter("classMaxCnt"));
        		        classDetailVO.setMaxParticipants(classMaxCnt);  // 기본 참가자 수 설정
        		        classDetailVO.setAvailableSeats(0);  // 기본 남은 좌석 수 설정
        		        classDetailVO.setAvailableStatus("Y");  // 예약 가능 상태 설정
        		        
        		        // 클래스 세부정보 테이블에 저장
        		        int classDetailId = classService.insertClassDetail(classDetailVO);
        		        System.out.println("클래스 세부정보 등록 완료. classDetailId: " + classDetailId + ", classId: " + classId);
        		    }
        		}else { // 클래스 시간대 null일 때 처리 
        			
        		}
            
        } catch (Exception e) {
        	jsonObj.addProperty("error", "Y");
        	jsonObj.addProperty("errorMsg", "클래스 등록 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            
        	e.printStackTrace(); // 예외 상세 출력
        	
        	System.out.println("클래스 등록 실패 시 리턴 직전, jsonObj:"+ jsonObj);
            
        }
    	
        return  ResponseEntity.ok(jsonObj.toString());
      
    }
    
    
    // 관리자 전체 클래스 목록 조회 기능
    @RequestMapping(value = "/getAdminClassList.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> getAdminClassList(Model model) throws Exception{
    	System.out.println("관리자 전체 클래스 목록 조회 됐는지 확인");
    	
    	JsonObject jsonObj = new JsonObject();
    	HashMap<String, Object> retMap = new  HashMap<>();
    	HashMap<String, Object> listMap = new  HashMap<>();
    	 try {
		    	
		    	List<EgovMap> listData = new ArrayList<EgovMap>();
		    	listData = classService.getAdminClassList();  // 모든 사용자 정보 가져오기
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
    		 	retMap.put("errorMsg", "클래스 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
   
    
    
    // 이미지 파일 저장 메소드
    /*
    private String saveImg(MultipartFile imgFile) throws IOException {
        String fileName = imgFile.getOriginalFilename();
        // 이미지 파일을 저장할 디렉토리 설정
        String saveDir = "C:/Users/user/Desktop/saveClassImg";
        
        // 디렉토리가 존재하지 않으면 생성
        File directory = new File(saveDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        
        // 파일 저장 경로 설정
        String filePath = saveDir + "/" + fileName;
        
        // 파일 저장
        imgFile.transferTo(new File(filePath));
        
        // 저장된 파일 경로 반환 (필요 시, 파일 경로를 반환하거나 파일명을 반환)
        return filePath;
    }*/
    
    

	// 241101 추가 이미지 업로드 테스트 ㅌ페이지 불러오기 
	@RequestMapping(value = "/imgTest.do")
	public String imgTest(HttpServletRequest request, ModelMap model) throws Exception {
		System.out.println("이미지 테스트 페이지로 이동");
	    // 메인 페이지 JSP로 이동
	    return "cmm/user/imgTest";
	}
	
	
    // 241101 이미지 업로드 테스트
    //@RequestMapping(value ="/imgTestinsert.do")
    
    @RequestMapping(value = "/imgTestinsert.do", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public ResponseEntity<String> imgTestinsert(@ModelAttribute("imgVO") ImgVO imgVO, MultipartFile imgFile, HttpServletRequest request) throws Exception {
        	
    		Map<String, Object> response = new HashMap<>();
    		JsonObject jsonObj = new JsonObject();
    		try {
    			System.out.println("이미지 업로드 탔는지 확인, "  + imgVO);
		    		int intClassId= 11; 
		    	   // 판매자
		    		String clientIp = getClientIp(request);
		    		
		    		
		    		imgVO.setImgType("class"); // 임시로 클래스 로 지정    	
		    		imgVO.setImgRep("y"); // 임시로 클래스 대표 이미지로 지정
		    		
		    		imgVO.setRegId("admin"); // 임시로 관리자 id 
		    		imgVO.setRegIp(clientIp); // 세션 ip값
		    		
		    		
		            int imgId = classService.saveItem(intClassId, imgVO, imgFile);
		           
		            System.out.println("이미지 업로드 테스트 등록 성공했는지 확인 : " + imgId);
		      
		            response.put("error", "N");
		            response.put("imgId", imgId); // Return saved image ID or any required data
		            
		            
//		            jsonObj.addProperty("error", "N");
//		            jsonObj.addProperty("imgId", imgId);
		            //return "redirect:/cmm/user/imgTest";
    		} catch (Exception e) {
    			System.out.println("이미지 업로드 예외 발생 catch 문");
    	        response.put("error", "Y");
    	        
    	        response.put("errorMsg", e.getMessage());
    	        
//    	        jsonObj.addProperty("error", "Y");
//    	        jsonObj.addProperty("errorMsg", e.getMessage());
    	    } 
    		
    		Gson gson = new Gson();
    		String jsonStr = gson.toJson(response);
    		System.out.println("이미지 업로드 테스트 리턴 직전 : " + jsonStr);
    		//return response;
    		return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
    }
    
    
    // 이미지 조회 테스트
    @RequestMapping("/getImagesByClassId.do")
    public String getClassDetails(@RequestParam("classId") int classId, Model model) throws Exception {
        // ClassVO classDetails = classService.getClassDetails(classId);
    	
    	int imgId= 7; // 임시로 지정
    			
        List<ImgVO> images = classService.getImagesByClassId(imgId);
        // model.addAttribute("classDetails", classDetails);
        System.out.println("이미지 정보 : " + images);
        
        model.addAttribute("images", images);
        return "cmm/user/imgTest";
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
    
    
    // 클래스 상세보기 페이지로 이동
    @RequestMapping(value = "/classView.do", method = RequestMethod.GET)
    public String classView(@RequestParam("classId") String classId, Model model)  throws Exception{
    	
    	int intClassId = Integer.parseInt(classId); // classId int형 : 문자열->정수 변환
        ClassVO classDetails = classService.getClassDetails(intClassId);
        System.out.println("클래스 상세보기 데이터 조회 : "+ classDetails);
        model.addAttribute("classDetails", classDetails);
        return "/cmm/classes/classView";  // JSP 페이지로 이동
    }
    
   
        
}
    
    
    
    
    


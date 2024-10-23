package egovframework.com.classes.web;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    		
    		
    		
    		// 이미지 저장 처리
    		// 1. 파일이 있을 때만 처리
    		 if (imgFile != null && !imgFile.isEmpty()) {
	            String imgFilePath = saveImg(imgFile);  // 파일 저장
	            String imgFileName = imgFile.getOriginalFilename();  // 파일명 추출
    		
    		
//    		if (classVO.getImgUrl() != null && !classVO.getImgUrl().isEmpty()) {
//                String imgFilePath = saveImg(classVO.getImgUrl());  // 파일 저장
//                String imgFileName = classVO.getImgUrl().getOriginalFilename();  // 파일명 추출
//                
                // 파일 경로 및 파일명 classVO에 설정
                classVO.setImgFilePath(imgFilePath);
                classVO.setImgNm(imgFileName);
                //System.out.println("imgUrl : " + imgUrl);
                System.out.println("이미지 파일이 처리되었습니다: " + imgFileName);
               
                ImgVO imgVO = new ImgVO();
                imgVO.setImgUrl(imgFilePath);
                imgVO.setImgNm(imgFileName);
                System.out.println("imgVO : " + imgVO);
                
                // 2. DB에 이미지 정보 저장 후 ID 반환
                int imgId = classService.insertImage(imgVO);  // DB에 이미지 저장
                classVO.setImgId(imgId);  // 이미지 ID 설정
                System.out.println("imgId : "  + imgId);
                
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
            
            // 날짜 형식 설정
            String holidayDtStr = request.getParameter("holidayDt");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            // 문자열을 Date로 변환
            Date holidayDt = dateFormat.parse(holidayDtStr);
            
            HolidayVO holidayVO = new HolidayVO();
            holidayVO.setHolidayDt(holidayDt);
            holidayVO.setHolidayDesc(request.getParameter("holidayDesc"));
            holidayVO.setRegIp(clientIp);

            // 휴무일 테이블에 등록
            int holidayId = classService.insertHoliday(holidayVO);
//            if(holidayId == null) {
//            	System.out.println("휴무일 등록 성공");
//            }else {
//            	System.out.println("휴무일 등록 실패");
//            }
            System.out.println("holidayId : "+holidayId);
            classVO.setHolidayId(holidayId);  // 휴무일 ID 설정
        	System.out.println("휴무일id 넣은 후 classVO : "+ classVO);

            // 3. 클래스 정보 저장
            /* 클래스 등록 서비스 호출*/
            int resultInsertClass = classService.insertClass(classVO);
            System.out.println("mapper 완료됐나 확인");
            
            if(resultInsertClass > 0) {
            	jsonObj.addProperty("error", "N");
            	//return "redirect:/loginForm.do";
            	System.out.println("클래스 등록 성공 시 리턴 직전, jsonObj:"+ jsonObj);
            }else {
            	jsonObj.addProperty("error", "Y");
            	jsonObj.addProperty("errorMsg", "클래스 등록에 실패했습니다. 관리자에게 문의하세요.");
            }
            
        } catch (Exception e) {
        	jsonObj.addProperty("error", "Y");
        	jsonObj.addProperty("errorMsg", "클래스 등록 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            System.out.println("클래스 등록 실패 시 리턴 직전, jsonObj:"+ jsonObj);

        }
    	
        return  ResponseEntity.ok(jsonObj.toString());
      
    }
    
    
    // 전체 회원 목록 조회 기능
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
    public String joinForm() throws Exception {
        return "/cmm/classes/classView";
    }
    
    
    // 클래스 정보 불러오기
    
    
    
    
    // 달력
    @Resource(name = "ClassService")
    private ClassService ClassService;

//    @GetMapping("/getAvailableDates")
//    public List<ClassAvailableVO> getAvailableDates(
//            @RequestParam("start") String start,
//            @RequestParam("end") String end) {
//        try {
//            // start와 end 날짜 범위로 예약 가능한 클래스 정보 조회
//            return ClassService.getAvailableDates(start, end);
//        } catch (Exception e) {
//            // 예외 처리 로직
//            return Collections.emptyList();
//        }
//    }
    
    // 예시
    @RequestMapping(value = "/getEvents.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> getEvents() throws Exception{
    	
    	JsonObject jsonObj = new JsonObject();
    	//HashMap<String, Object> retMeventsap = new HashMap<>();
    	
      List<Map<String, Object>> events = new ArrayList<>();
      Map<String, Object> event = new HashMap<>();
      event.put("title", "Sample Event");
      event.put("start", "2024-10-20");
      events.add(event);
      //return ResponseEntity.ok(events);

      return events;
    }
    
        
}
    
    
    
    
    


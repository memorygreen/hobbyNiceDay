package egovframework.com.classes.web;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.code.service.CodeService;
import egovframework.com.user.service.UserService;

@Controller
public class ClassController {
	
	
    @Resource(name = "ClassService")
    private ClassService classService;

    
    @Resource(name = "CodeService")
    private CodeService codeService;
    

	/** 암호화서비스 */
    @Resource(name = "egovEnvCryptoService")
    private EgovEnvCryptoService cryptoService;
    
    @Resource(name = "egovPasswordEncoder")
    private EgovPasswordEncoder egovPasswordEncoder;
	
    
    @Resource(name = "UserService")
    private UserService userService;
    
    
    // 메인화면 ( 모집중인 클래스 목록 리스트)
	
	@RequestMapping(value = "/main.do")
	public String getMainClassList(HttpServletRequest request, ModelMap model) throws Exception {

	    // 모든 클래스 목록을 가져오는 서비스 호출
		List<EgovMap> listData = new ArrayList<EgovMap>();
	    listData = classService.getMainClassList();  // 클래스 목록을 불러오는 서비스 호출
	    System.out.println("클래스 목록: " + listData); // 디버깅을 위한 출력

	    // 클래스 목록을 모델에 추가
	    model.addAttribute("classList", listData);
	    
	   

	    // 메인 페이지 JSP로 이동
	    return "main/main";
	}
	
	// @RequestMapping(value = "/cmm/main/mainPage.do")
	public String mainPage(HttpServletRequest request, ModelMap model) throws Exception {

	    // 모든 클래스 목록을 가져오는 서비스 호출
		List<EgovMap> listData = new ArrayList<EgovMap>();
	    listData = classService.getMainClassList();  // 클래스 목록을 불러오는 서비스 호출
	    System.out.println("클래스 목록: " + listData); // 디버깅을 위한 출력

	    // 클래스 목록을 모델에 추가
	    model.addAttribute("classList", listData);
	    
	    // 메인 페이지 JSP로 이동
	    return "main/main";
	}
	
	
	// 클래스 조회 전체(게시중인거 전체)
		//@RequestMapping(value = "/classAllList.do/{category}", method = RequestMethod.GET)
	// @RequestMapping(value = {"/classAllList.do", "/classAllList/{category}"}, method = RequestMethod.GET)
		//@RequestMapping(value = "/classAllList/{category}", method = RequestMethod.GET)
		
	@RequestMapping(value = "/classAllList/{category}", method = RequestMethod.GET)
	public String classAllList( @PathVariable(value = "category", required = false) String category,
					           @RequestParam(value = "searchInput", required = false) String searchInput,
					           @RequestParam(value = "sort", required = false) String sort,
					            HttpServletRequest request, ModelMap model ) throws Exception {
		
		
		 //@RequestParam(value = "page", defaultValue = "1") int page,
        //@RequestParam(value = "pageSize", defaultValue = "9") int pageSize,
		
		// URL에서 page와 pageSize 파라미터를 가져옴 (기본값 설정)
	    int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	    int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 9;

	    
		// int page = 1; //초기 기본 페이지
		// int pageSize = 12; // 한 페이지당 보여줄 클래스 개수
		// 페이지의 시작 인덱스 계산
		
		System.out.println("클래스 조회 확인- category : " + category + ",page : " + page + ", pageSize : " + pageSize + ", sort : " + sort);
		
		int offset = (page - 1) * pageSize;
		System.out.println("offset : " + offset);
		
		
		// 파라미터 설정
        Map<String, Object> params = new HashMap<>();
        
        category = category.equals("all") ? null : category;
        params.put("category", category);
        params.put("searchInput", searchInput); // 검색 단어 입력
        params.put("sort", sort); // 정렬 조건 
        params.put("offset", offset);
        params.put("pageSize", pageSize);
		System.out.println("입력할 map : " + params);
        
        // 클래스 목록 조회
		// 모든 클래스 목록을 가져오는 서비스 호출(일단 메인 거랑 동일한거 가져옴)
		// List<EgovMap> listData = classService.getClassAllListPaging(offset, pageSize);  // 클래스 목록을 불러오는 서비스 호출
	    
        List<EgovMap> listData = classService.getClassListByCategory(params);

        System.out.println("조회해온 클래스 목록: " + listData); // 디버깅을 위한 출력
	    
	    
	    
	    // 전체 클래스 개수 가져오기
        int totalClassCount = classService.getClassCountByCategory(params);
        System.out.println("클래스 개수 totalClassCount : " + totalClassCount);

        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalClassCount / pageSize);

        System.out.println("총 페이지 수 계산 totalPages : " + totalPages);
	    
        
        
        // 현재 날짜 가져오기
        String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        model.addAttribute("currentDate", currentDate);

        
	    // 클래스 목록을 모델에 추가
	    model.addAttribute("classList", listData);
	    model.addAttribute("totalClassCount", totalClassCount);
	    
	    // 페이징 관련 모델에 추가
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    
	    model.addAttribute("pageSize", pageSize);
	    
	    model.addAttribute("searchInput", searchInput); // 검색결과 조회 시 검색어도 남아있도록 
	    
	    model.addAttribute("sort", sort); // 정렬
	    // 메인 페이지 JSP로 이동
	    return "cmm/classes/classAllList";
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
    
    
    // 회원 클래스 상세보기 페이지로 이동
    @RequestMapping(value = "/classView.do", method = RequestMethod.GET)
    public String classView(@RequestParam("classId") String classId, Model model
    						, HttpServletRequest request)  throws Exception{
    	
    	
    	int intClassId = Integer.parseInt(classId); // classId int형 : 문자열->정수 변환
    	System.out.println("클래스 상세보기 컨트롤러 intClassId : " + intClassId);
    	
        ClassVO classDetails = classService.getClassDetails(intClassId);
        System.out.println("클래스 상세보기 데이터 조회 : "+ classDetails);
        
        
        
        model.addAttribute("classDetails", classDetails);
        
        
        return "/cmm/classes/classView";  // JSP 페이지로 이동
    }
    

    
    // public ResponseEntity<String> imgTestinsert(@ModelAttribute("imgVO") ImgVO imgVO, MultipartFile imgFile, HttpServletRequest request) throws Exception {

	//, @RequestParam(value = "imgNm" , required = false) MultipartFile imgFile
    
    // 관리자 클래스 등록 기능
    @RequestMapping(value = "/insertClass.do", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> insertClass(@ModelAttribute("classVO") ClassVO classVO
    										 ,@ModelAttribute("imgVO") ImgVO imgVO
    										 , MultipartFile imgFile
    										 , HttpServletRequest request) throws Exception {
    	System.out.println("관리자 클래스 등록 기능 들어왔는지 확인");
    	JsonObject jsonObj = new JsonObject();

    	try {
    		// UserVO에 클라이언트 IP 설정
    		// 클라이언트 IP 가져오기
    		String clientIp = getClientIp(request);
    		System.out.println("clientIp"+ clientIp);
    		classVO.setRegIp(clientIp);
    		
    		
    		// 세션에 있는 id 가져오기
        	HttpSession session = request.getSession();
            UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
        	String userId = sessionUserVo.getUserId();
        	System.out.println("세션 userId : " + userId);
        	
    		// 클래스id 가져오기
        	//int classId = classVO.getClassId();

    		// 1. 이미지 저장 처리
    		// 1. 파일이 있을 때만 처리
    		 if (imgFile != null && !imgFile.isEmpty()) {
	           // String imgFilePath = saveImg(imgFile);  // 파일 저장
	            String imgFileName = imgFile.getOriginalFilename();  // 파일명 추출
	            System.out.println("imgFileName : " + imgFileName);
	            
	            // 이미지 등록 
	            imgVO.setImgType("class"); // 임시로 클래스 로 지정    	
	    		imgVO.setImgRep("y"); // 임시로 클래스 대표 이미지로 지정
	    		
	    		imgVO.setRegId(userId); // 등록자 id
	    		imgVO.setRegIp(clientIp); // 세션 ip값
	    		System.out.println("이미지 등록할 imgVO : " + imgVO);
	    		
	        	String savePath = request.getServletContext().getRealPath("/resources/uploadImg"); // 실제 이미지가 저장될 경로
	    		// String savePath = request.getServletContext().getRealPath("/"); // 실제 이미지가 저장될 경로
	        	
	        	System.out.println("이미지 저장될 경로 : " + savePath);
	        	String sssss = request.getContextPath();
	        	System.out.println("이미지 저장될 경로 sssss : " + sssss);
	            
	        	int imgId = classService.saveItem(imgVO, imgFile, savePath);
	            System.out.println("이미지 업로드 후 반환 imgId : " + imgId);
	            
	            classVO.setImgId(imgId); // 등록한 이미지의 이미지id를 클래스vo 에 저장
	            
	            System.out.println("이미지 업로드 후 classVO : " + classVO);
	            
                
            } else { // 파일이 없을 경우 기본값 처리 또는 경로를 null로 설정
            	System.out.println("파일 없는 경우 classVO의 imgUrl -> null 처리");
                // classVO.setImgFilePath(null);  // 필요에 따라 null 또는 기본값으로 설정
            }
    		

            // 3. 클래스 정보 저장
            /* 클래스 등록 서비스 호출*/
    		int affectedRows = classService.insertClass(classVO);
    		System.out.println("클래스 들어갔는지 classId 생성됐나 확인 : " + affectedRows + "개 성공"); // 1을 반환하고 있음 
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
    
    
    // 관리자 클래스 수정 - 휴무일 등록 
    @RequestMapping(value = "/adminClassUpdateInsertHoliday.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminClassUpdateInsertHoliday(@RequestParam("classId") int classId,     
    															@ModelAttribute HolidayVO holidayVO
    															, HttpServletRequest request) throws Exception{
        
    	JsonObject jsonObj = new JsonObject();
    	
    	try {
    		
    		// 휴무일 수강기간 내에 존재 하는지 확인
    		 // 클래스 시작일과 종료일을 가져오기 위해 클래스 정보를 조회함
            ClassVO classDetails = classService.getClassDetails(classId);
            Date holidayDate = holidayVO.getHolidayDt();
            // 날짜 형식 설정
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = dateFormat.parse(classDetails.getStartDt()); // 클래스 시작일
            Date endDate = dateFormat.parse(classDetails.getEndDt());     // 클래스 종료일
            // Date holidayDate = dateFormat.parse(holidayDt);               // 휴무일 날짜
    		
         // 휴무일이 클래스 날짜 범위 내에 있는지 확인
            if (holidayDate.before(startDate) || holidayDate.after(endDate)) {
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "휴무일은 클래스 시작일과 종료일 사이에 있어야 합니다.");
                // return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(jsonObj.toString());
                return ResponseEntity.ok(jsonObj.toString());

            }
    		
    		
    		// 1. 지정된 날짜에 예약이 있는지 확인
            int hasReservations = classService.hasReservationsOnDate(holidayVO.getClassId(), holidayVO.getHolidayDt());
            System.out.println("hasReservations : " + hasReservations);
            
            if (hasReservations > 0 ) {
            	// 휴무일로 지정하고자 하는 날짜에 예약이 있는 경우
            	System.out.println("해당 날짜에 예약이 있어 휴무일로 지정 불가");
            	jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "해당 날짜에 예약이 있어 휴무일로 지정이 불가합니다.");
                // return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("해당 날짜에 예약이 있어 휴무일로 지정할 수 없습니다.");
                return ResponseEntity.ok(jsonObj.toString());

            }
            
            
            // 2. 동일한 날짜에 이미 등록된 휴일이 있는지 확인
            int existingHoliday = classService.ckDuplicateHoliday(holidayVO.getClassId(), holidayVO.getHolidayDt());
            System.out.println("existingHoliday : " + existingHoliday);
            if (existingHoliday > 0) {
            	System.out.println("해당 날짜에 이미 휴일이 등록");
                // return ResponseEntity.status(HttpStatus.CONFLICT).body("해당 날짜에 이미 휴일이 등록되어 있습니다.");
            	jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "해당 날짜에 이미 휴일이 등록되어 있습니다.");
                return ResponseEntity.ok(jsonObj.toString());

            }
            
            
            // 3. 예약과 중복된 휴일이 없으면 휴일 등록
            
            // UserVO에 클라이언트 IP 설정
    		// 클라이언트 IP 가져오기
    		String clientIp = getClientIp(request);
    		System.out.println("clientIp"+ clientIp);
    		holidayVO.setRegIp(clientIp);
    		
    		
    		// 세션에 있는 id 가져오기
        	HttpSession session = request.getSession();
            UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
        	String userId = sessionUserVo.getUserId();
        	System.out.println("세션 userId : " + userId);
    		holidayVO.setRegId(userId);

        	
            // 휴무일 등록
        	int result = classService.adminClassUpdateInsertHoliday(holidayVO);
            	
        	if(result > 0) {
        		// 새로운 휴무일 등록 성공 시
        		System.out.println("새로운 휴무일 등록 성공 ");
        		jsonObj.addProperty("error", "N");
                jsonObj.addProperty("message", "휴무일이 성공적으로 추가되었습니다.");
                // return ResponseEntity.ok("휴일 등록이 완료되었습니다.");
        	} else {
        		// 새로운 휴무일 등록 실패 시
        		System.out.println("새로운 휴무일 등록 실패 ");
        		jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "휴무일 추가 중 오류가 발생했습니다.");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());

                // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("휴일 등록에 실패했습니다.");
        	}
            	
            
            
        } catch (Exception e) {
            e.printStackTrace();
            jsonObj.addProperty("error", "Y");
            jsonObj.addProperty("errorMsg", "서버 오류가 발생했습니다.");
            // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());

            //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류가 발생했습니다.");
        }
    	
    	
        return ResponseEntity.ok(jsonObj.toString());

    	
    }
    
    
    
    // 관리자 페이지 - 기존 휴무일 삭제
    
    @RequestMapping(value = "/adminClassUpdateDeleteHoliday.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminClassUpdateDeleteHoliday(@RequestParam("holidayId") int holidayId) {
        JsonObject jsonObj = new JsonObject();
        
        try {
        	
            // 휴무일 삭제 서비스 호출
            int deletedCount = classService.adminClassUpdateDeleteHoliday(holidayId);

            if (deletedCount > 0) {
                jsonObj.addProperty("error", "N");
                jsonObj.addProperty("message", "휴무일 삭제가 성공적으로 완료되었습니다.");
            } else {
                jsonObj.addProperty("error", "Y");
                jsonObj.addProperty("errorMsg", "휴무일을 찾을 수 없거나 이미 삭제되었습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObj.addProperty("error", "Y");
            jsonObj.addProperty("errorMsg", "휴무일 삭제 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());
        }
        return ResponseEntity.ok(jsonObj.toString());
    }
    
    
    // 관리자 클래스 수정 기능 (휴무일 제외)
    @RequestMapping(value = "/adminClassUpdate.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<String> adminClassUpdate(@ModelAttribute ClassVO classVO
    											  , HttpServletRequest request) throws Exception {
    	JsonObject jsonObj = new JsonObject();
    	
    	Map<String, Object> response = new HashMap<>();
        try {
        	
            System.out.println("클래스 수정 시 수신된 데이터: " + classVO.toString()); // 데이터 확인용 로그 추가

        	 // UserVO에 클라이언트 IP 설정
    		// 클라이언트 IP 가져오기
    		String clientIp = getClientIp(request);
    		System.out.println("clientIp"+ clientIp);
    		classVO.setUpdtIp(clientIp);
    		
    		
    		// 세션에 있는 id 가져오기
        	HttpSession session = request.getSession();
            UserVO sessionUserVo = (UserVO) session.getAttribute("userVO");
        	String userId = sessionUserVo.getUserId();
        	System.out.println("세션 userId : " + userId);
        	classVO.setUpdtId(userId);

        	
    		
            // 클래스 정보 업데이트 서비스 호출
            int result = classService.adminClassUpdate(classVO);
            System.out.println("클래스 수정 결과 : " + result);
            
            // 업데이트 결과에 따라 응답 생성
            if (result > 0) {
            	jsonObj.addProperty("error", "N");
            	jsonObj.addProperty("message", "클래스 정보가 성공적으로 수정되었습니다.");
                // response.put("error", "N"); // 성공 시
                // response.put("message", "클래스 정보가 성공적으로 수정되었습니다.");
            } else {
            	jsonObj.addProperty("error", "Y");
            	jsonObj.addProperty("errorMsg", "클래스 정보 수정에 실패했습니다.");
                //response.put("error", "Y"); // 실패 시
                //response.put("message", "클래스 정보 수정에 실패했습니다.");
            }
            // return ResponseEntity.ok(response);
        } catch (Exception e) {
        	System.out.println("클래스 정보 수정 중 서버 오류 바생(catch)");
            e.printStackTrace();
            response.put("error", "Y");
            response.put("errorMsg", "클래스 정보 수정 중 서버 오류가 발생했습니다.");
            // response.put("errorDetail", e.getMessage());
            // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
        
        
        return ResponseEntity.ok(jsonObj.toString());
    }
    

   // 관리자 - 클래스 삭제 기능
   // 클래스 삭제 메서드 추가 adminClassDelete.do
   @RequestMapping(value = "/adminDeleteClass.do", method = RequestMethod.POST,  produces = "application/json; charset=UTF-8")
   @ResponseBody
   public ResponseEntity<String> adminDeleteClass(@RequestParam("classId") int classId) throws Exception {
       System.out.println("클래스 삭제 메소드 왔는 지 확인 classId : " + classId);
	   
       JsonObject jsonObj = new JsonObject();
       // int intClassId = Integer.parseInt(classId);
       try {
           // 클래스 삭제 서비스 호출
           int deletedCount = classService.deleteClass(classId);
           System.out.println("클래스 삭제 모두 완료 했는지 확인 : " + deletedCount);
           
           if (deletedCount > 0) {
        	   System.out.println("클래스 삭제 성공 ");
               // 클래스 삭제 성공 
        	   jsonObj.addProperty("error", "N");
               jsonObj.addProperty("message", "클래스 삭제가 성공적으로 완료되었습니다.");
           } else { 
        	   System.out.println("클래스 삭제 실패");
        	   // 클래스 삭제 실패 
               jsonObj.addProperty("error", "Y");
               jsonObj.addProperty("errorMsg", "클래스를 찾을 수 없거나 이미 삭제되었습니다.");
           }
       } catch (Exception e) {
    	   System.out.println("클래스 삭제 시 서버 오류 발생 (catch)");
           e.printStackTrace();
           jsonObj.addProperty("error", "Y");
           jsonObj.addProperty("errorMsg", "클래스 삭제 중 오류가 발생했습니다. 관리자에게 문의하세요.");
           // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(jsonObj.toString());
       }
       
       return ResponseEntity.ok(jsonObj.toString());
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
		    	
		    	
		    	
		    	
		    	// 대분류 공통코드 가져오기
		        List<EgovMap> bigCategories  = codeService.getCodesByType("category_big"); // Make sure to implement this in your service
		        System.out.println("클래스 대분류 공통코드 가져오는 리스트 : " + bigCategories);

		        List<EgovMap> smallCategories   = codeService.getCodesByType("category_small"); // Make sure to implement this in your service
		        System.out.println("클래스 소분류 공통코드 가져오는 리스트 : " + smallCategories);
		        
		        // 대분류를 맵으로 저장
		        Map<String, String> bigCateMap = new HashMap<>();
		        for (EgovMap code : bigCategories) {
		        	System.out.println("code : " + code);
		        	bigCateMap.put((String) code.get("codeValue"), (String) code.get("codeNm"));
		            System.out.println("각각 statusMap : " + bigCateMap);
		        }
		    	System.out.println("공통코드 반복문 돌리고 나서 : " + bigCateMap);
		    	listMap.put("bigCateMap", bigCateMap); // 예약상태 공통코드 담아온 거 넣기
		    	
		    	// 소분류를 맵으로 저장
		    	Map<String, String> smallCateMap = new HashMap<>();
	            for (EgovMap code : smallCategories) {
	                smallCateMap.put((String) code.get("codeValue"), (String) code.get("codeNm"));
	            }
	            listMap.put("smallCateMap", smallCateMap);
		    	
	            
		    	
		    	listMap.put("dataMap", listData); // hashMap에 담기
		    	System.out.println("listMap 확인 : "+ listMap);
		        
		    	
		    	retMap.put("error", "N");
				retMap.put("dataMap", listMap);
				System.out.println("retMap 확인 : "+ retMap);
		        
				 // JSON 문자열로 변환
				Gson gson = new Gson();
			    String jsonStr = gson.toJson(retMap);  // retMap을 JSON 문자열로 변환
			    System.out.println("jsonStr(JSON 변환 결과) 확인 : " + jsonStr);
			    
			    
			    
			     return ResponseEntity.ok(jsonStr);  // 변환된 JSON 문자열 반환
			     
    	 } catch (Exception e) {
    		 	retMap.put("error", "Y");
    		 	retMap.put("errorMsg", "클래스 목록 조회 중 발생했습니다.");
    		 	
    	        e.printStackTrace();  // 예외 출력
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 에러 발생");
    	 }
     }
   
    

	// 241101 추가 이미지 업로드 테스트 페이지 불러오기 
	@RequestMapping(value = "/imgTest.do")
	public String imgTest(HttpServletRequest request, ModelMap model) throws Exception {
		System.out.println("이미지 테스트 페이지로 이동");
	    // 메인 페이지 JSP로 이동
	    return "cmm/user/imgTest";
	}
	
	
	// 241101 추가 이미지 업로드 테스트 페이지 불러오기 
		@RequestMapping(value = "/holidaysTest.do")
		public String holidaysTest(HttpServletRequest request, ModelMap model) throws Exception {
			System.out.println("공휴일 테스트 페이지로 이동");
		    // 메인 페이지 JSP로 이동
		    return "cmm/user/holidaysTest";
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
        
}
    
    
    
    
    


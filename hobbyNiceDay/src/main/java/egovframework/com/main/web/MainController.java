package egovframework.com.main.web;
import java.util.ArrayList;
import java.util.Date;
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
import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.user.service.UserService;

@Controller
public class MainController {
	
	
	/** 암호화서비스 */
	/*
    @Resource(name = "egovEnvCryptoService")
    private EgovEnvCryptoService cryptoService;
    
    @Resource(name = "egovPasswordEncoder")
    private EgovPasswordEncoder egovPasswordEncoder;
	
    
    @Resource(name = "UserService")
    private UserService userService;
    
    @Resource(name = "ClassService")
    private ClassService classService;


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
        System.out.println("이미지 정보 : " + images);
        
        model.addAttribute("images", images);
	    
	    

	    // 메인 페이지 JSP로 이동
	    return "main/main";
	}
	*/
    
}
    
    
    
    
    


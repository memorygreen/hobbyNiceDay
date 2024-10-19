package egovframework.com.admin.web;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import egovframework.com.user.service.UserService;

@Controller
public class AdminController {
	
	
    @Resource(name = "UserService")
    private UserService userService;

	// 관리자 메인 페이지로 이동
    @RequestMapping(value = "/adminMain.do", method = RequestMethod.GET)
    public String adminMain() throws Exception {
        return "/cmm/admin/adminMain";
    }
    
    

    /*
     * 회원 관리
     */
    // 관리자 회원 관리 페이지로 이동
    @RequestMapping(value = "/adminUserList.do", method = RequestMethod.GET)
    public String adminUserList() throws Exception {
        return "/cmm/admin/adminUserList";
    }
    
    // 관리자 회원 등록 페이지로 이동
    @RequestMapping(value = "/adminUserInsertForm.do", method = RequestMethod.GET)
    public String adminUserInsertForm() throws Exception {
        return "/cmm/admin/adminUserInsertForm";
    }
     
    // 관리자 자기자신 회원정보 수정 페이지로 이동
    @RequestMapping(value = "/adminUserInfo.do", method = RequestMethod.GET)
    public String adminUserInfo() throws Exception {
    	return "/cmm/admin/adminUserInfo";
    }
    
    
    // (아래 4개는 사용자 회원 crud에서 분기해도 될 듯 사용자구분 일반 vs 관리자)
    // 관리자 로그인
    
    // 관리자 로그아웃
    
    // 관리자 회원 탈퇴
    
    // 관리자 회원정보 수정 
    
    
    
    /*
     * 예약 관리
     */
    // 관리자 예약 관리 페이지로 이동
    @RequestMapping(value = "/adminReservationList.do", method = RequestMethod.GET)
    public String adminReservationList() throws Exception {
        return "/cmm/admin/adminReservationList";
    }
    // 관리자 예약 등록 페이지로 이동
    @RequestMapping(value = "/adminReservationInsertForm.do", method = RequestMethod.GET)
    public String adminReservationInsertForm() throws Exception {
        return "/cmm/admin/adminReservationInsertForm";
    }
    
    
    
    /*
     * 클래스 관리
     */
    // 관리자 클래스 관리 페이지로 이동
    @RequestMapping(value = "/adminClassList.do", method = RequestMethod.GET)
    public String adminClassList() throws Exception {
        return "/cmm/admin/adminClassList";
    }
 // 관리자 클래스 등록 페이지로 이동
    @RequestMapping(value = "/adminClassInsertForm.do", method = RequestMethod.GET)
    public String adminClassInsertForm() throws Exception {
        return "/cmm/admin/adminClassInsertForm";
    }
    
    
    
    
    
    
    
}
    
    
    
    
    


package egovframework.com.admin.web;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import egovframework.com.classes.service.ClassService;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;
import egovframework.com.reservation.service.ReservationService;
import egovframework.com.user.service.UserService;

@Controller
public class AdminController {
	
	
    @Resource(name = "UserService")
    private UserService userService;

    @Resource(name = "ClassService")
    private ClassService classService;

    @Resource(name = "ReservationService")
    private ReservationService reservationService;

	// 관리자 메인 페이지로 이동
    @RequestMapping(value = "/adminMain.do", method = RequestMethod.GET)
    public String adminMain() throws Exception {
        return "/cmm/admin/adminMain";
    }
    
    
    // 	관리자 로그인 페이지로 이동
    @RequestMapping(value = "/adminLogin.do", method = RequestMethod.GET)
    public String adminLogin() throws Exception {
        return "/cmm/admin/adminLogin";
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
     
    // 관리자 회원정보 조회 페이지로 이동
    @RequestMapping(value = "/adminUserInfo.do", method = RequestMethod.GET)
    public String adminUserInfo(@RequestParam("userId") String userId, Model model) throws Exception {
    	
        UserVO userInfo = userService.getUserInfo(userId);
        System.out.println("관리자 페이지 회원 상세보기 데이터 조회 : "+ userInfo);
        model.addAttribute("userInfo", userInfo);
    	return "/cmm/admin/adminUserInfo";
    }
    
    // 관리자 자기자신
    
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
    
    
 // 관리자 예약 관리 페이지로 이동
    @RequestMapping(value = "/adminPendingReservationList.do", method = RequestMethod.GET)
    public String adminPendingReservationList() throws Exception {
        return "/cmm/admin/adminPendingReservationList";
    }
    
    
    // 관리자 예약 등록 페이지로 이동
    @RequestMapping(value = "/adminReservationInsertForm.do", method = RequestMethod.GET)
    public String adminReservationInsertForm() throws Exception {
        return "/cmm/admin/adminReservationInsertForm";
    }
    
    // 관리자 예약정보 조회 페이지로 이동
    @RequestMapping(value = "/adminReservationInfo.do", method = RequestMethod.GET)
    public String adminReservationInfo(@RequestParam("reservationId") String reservationId, Model model) throws Exception {
    	
        ReservationVO reservationInfo = reservationService.getReservationInfo(reservationId);
        System.out.println("관리자 페이지 예약 상세보기 데이터 조회 : "+ reservationInfo);
        
        // reservationDt를 yyyy-MM-dd 형식으로 변환
//        if (reservationInfo.getReservationDt() != null) {
//            SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
//            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = inputFormat.parse(reservationInfo.getReservationDt().toString());
//            String formattedDate = outputFormat.format(date);
//            reservationInfo.setReservationDt(formattedDate); // 변환된 날짜 설정
//        }
        
//        System.out.println("관리자 페이지 예약 상세보기 데이터 조회(날짜 지정) : "+ reservationInfo);

        model.addAttribute("reservationInfo", reservationInfo);
    	return "/cmm/admin/adminReservationInfo";
    }
    
    
    // 관리자 예약 수정 페이지로 이동
    @RequestMapping(value = "/adminReservationUpdateForm.do", method = RequestMethod.GET)
    public String adminReservationUpdateForm(@RequestParam("reservationId") String reservationId, Model model) throws Exception {
    	System.out.println("관리자페이지 예약 수정하기 페이지 호출 메소드 들어왔는 지 확인 reservationId : " + reservationId);
        ReservationVO reservationInfo = reservationService.getReservationInfo(reservationId);
        System.out.println("관리자 페이지 예약 수정하기 페이지 데이터 조회 : "+ reservationInfo);
        
        model.addAttribute("reservationInfo", reservationInfo);
    	return "/cmm/admin/adminReservationUpdateForm";
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
    
    
    
    
    


package egovframework.com.user.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.UserVO;

@Controller
public class UserController {
	 
	@Autowired
	    private egovframework.com.user.service.UserService userService;
	
	
	 // 회원가입 페이지로 이동
    @RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
    public String joinForm() {
        return "/cmm/user/joinUsr";
    }
    // 회원가입 기능
    @RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
    public String joinUser(@ModelAttribute("userVO") UserVO userVO, Model model) {
        try {
            userService.joinUser(userVO);
            model.addAttribute("message", "회원가입 성공");
            //return "redirect:/login.do";
            return "redirect:/uat/uia/egovLoginUsr.do"; //  "/uat/uia/egovLoginUsr.do"
            
        } catch (Exception e) {
            model.addAttribute("message", "회원가입 실패: " + e.getMessage());
            return "/cmm/user/joinUsr";  // 회원가입 JSP 경로 명확히 명시
        }
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

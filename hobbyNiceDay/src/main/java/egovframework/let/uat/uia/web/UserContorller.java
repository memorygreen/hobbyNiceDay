package egovframework.let.uat.uia.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.UserVO;
import egovframework.let.uat.uia.service.UserService;

@Controller
public class UserContorller {
	 
	@Autowired
	    private UserService userService;
	
	
	
    @RequestMapping(value = "/cmm/uat/uia/insertUser.do", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute("userVO") UserVO userVO, Model model) {
        try {
            userService.insertUser(userVO);
            model.addAttribute("message", "회원가입 성공");
            //return "redirect:/login.do";
            return "redirect:/uat/uia/egovLoginUsr.do"; //  "/uat/uia/egovLoginUsr.do"
            
        } catch (Exception e) {
            model.addAttribute("message", "회원가입 실패: " + e.getMessage());
            //return "user/register";
            return "/cmm/uat/uia/insertUsr";  // 회원가입 JSP 경로 명확히 명시
        }
    }

    @RequestMapping(value = "/cmm/uat/uia/insertForm.do", method = RequestMethod.GET)
    public String showRegisterPage() {
        return "/cmm/uat/uia/insertUsr";
    }
}

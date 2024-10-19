package egovframework.com.classes.web;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import egovframework.com.classes.service.ClassService;
import egovframework.com.user.service.UserService;

@Controller
public class ClassController {
	
	
    @Resource(name = "UserService")
    private UserService userService;

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
    
    
    
    
    


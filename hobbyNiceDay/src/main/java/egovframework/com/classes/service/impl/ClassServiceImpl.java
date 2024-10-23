package egovframework.com.classes.service.impl;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import antlr.collections.List;
import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("ClassService")
public class ClassServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.classes.service.ClassService {
    @Resource(name = "ClassDAO")
    private ClassDAO ClassDAO;
    
//    public List<ClassAvailableVO> getAvailableDates(String start, String end) {
//        return classMapper.selectAvailableDates(start, end);
//    }
    
    // 클래스 등록
    @Override
    public int insertClass(ClassVO classVO) throws Exception {
    	int result = ClassDAO.insertClass(classVO);
    	return result;
    };
    
    // 이미지 등록
    @Override
    public int insertImage(ImgVO imgVO) throws Exception {
        // 이미지 저장 후 imgId 반환
        return ClassDAO.insertImage(imgVO);
    }
    
    
    // 휴무일 등록 
    @Override
    public int insertHoliday(HolidayVO holidayVO) throws Exception {
    	// 휴무일 저장 후 holidayId 반환
        return ClassDAO.insertHoliday(holidayVO);
    }
    
    // 클래스 세부정보 등록 
    @Override
    public int insertClassDetail(ClassVO classVO) throws Exception {
    	// 휴무일 저장 후 classDetailId 반환
        return ClassDAO.insertClassDetail(classVO);
    }
    
    
 // 관리자 회원 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getAdminClassList() throws Exception {
        return ClassDAO.getAdminClassList();  // 모든 사용자 리스트 가져오기
    }
    
    
}
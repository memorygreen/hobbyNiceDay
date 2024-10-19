package egovframework.com.classes.service.impl;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import antlr.collections.List;
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
    
}
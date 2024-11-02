package egovframework.com.code.service.impl;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 코드 관련 서비스를 구현한 구현체
@Service("CodeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.code.service.CodeService {
    @Resource(name = "CodeDAO")
    private CodeDAO codeDAO;
    
    
    // 예약 상태 공통코드 
    @Override
    public List<EgovMap> getCodesByType(String codeType) throws Exception {
        return codeDAO.getCodesByType(codeType);
    }
    
    
}
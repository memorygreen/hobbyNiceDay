package egovframework.com.code.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;

// 클래스 관련 서비스
public interface CodeService {
	
	// 예약상태 공통코드에서 가져오는 기능
	public List<EgovMap> getCodesByType(String string) throws Exception;
	
	
	
}

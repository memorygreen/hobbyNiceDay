package egovframework.com.classes.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;

// 클래스 관련 서비스
public interface ClassService {
	
	// 관리자 클래스 등록 기능
	public int insertClass(ClassVO classVO) throws Exception;
	
	// 관리자 클래스 등록 시 이미지 등록
	public int insertImage(ImgVO imgVO) throws Exception;
	
	// 관리자 클래스 등록 시 휴무일 등록
	public int insertHoliday(HolidayVO holidayVO) throws Exception;
	
	// 관리자 클래스 등록 시 수강 시간대 등록
	public int insertClassDetail(ClassVO classVO) throws Exception;
		
	
	// 관리자 클래스 전체 조회 
	List<EgovMap> getAdminClassList() throws Exception;
}

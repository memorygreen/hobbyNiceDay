package egovframework.com.classes.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.web.multipart.MultipartFile;

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
		
	// 관리자 클래스 전체 목록 조회 
	List<EgovMap> getAdminClassList() throws Exception;
	
	
	
	// 메인화면 전체 클래스 조회
	public List<EgovMap> getMainClassList() throws Exception;
	
	// 클래스 상세보기 화면 (해당 classId의 데이터 호출)
	public ClassVO getClassDetails(int intClassId) throws Exception;

	
	// 241101
	// 이미지 1개 업로드 테스트 
	public int saveItem(ImgVO imgVO, MultipartFile imgFile, String savePath) throws Exception;

	// 이미지 조회 테스트
	public List<ImgVO> getImagesByClassId(int imgId) throws Exception;
	
	// 관리자 - 클래스 삭제
	public int deleteClass(int classId) throws Exception;
}

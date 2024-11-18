package egovframework.com.classes.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
	
	
	
	
	
	// 241101
	// 이미지 1개 업로드 테스트 
	public int saveItem(ImgVO imgVO, MultipartFile imgFile, String savePath) throws Exception;

	// 이미지 조회 테스트
	public List<ImgVO> getImagesByClassId(int imgId) throws Exception;
	
	// 관리자 - 클래스 삭제
	public int deleteClass(int classId) throws Exception;
	
	// 관리자 - 클래스 상세보기 - 해당 클래스 휴무일 조회
	public List<EgovMap> getHolidaysByClassId(int classId)  throws Exception;
	
	// 관리자 - 클래스 상세보기 - 해당 클래스 수강시간대 조회 
	public List<EgovMap> getTimeSetsByClassId(int classId)  throws Exception;
	
	
	// 관리자 - 클래스 수정 - 새로 등록할 휴무일에 예약 있는지 여부 확인 
	public int hasReservationsOnDate(int classId, Date holidayDt) throws Exception;
	
	
	// 관리자 - 클래스 수정 - 새로 등록할 휴무일이 이미 존재하는 휴무일인지 확ㅇ인
	public int ckDuplicateHoliday(int classId, Date holidayDt)  throws Exception;
	
	// 관리자 - 클래스 수정 - 휴무일 새로 등록
	public int adminClassUpdateInsertHoliday(HolidayVO holidayVO) throws Exception;
	
	
	// 관리자 - 클래스 수정 - 기존 휴무일 삭제
	public int adminClassUpdateDeleteHoliday(int holidayId)  throws Exception;
	
	// 관리자 클래스 수정 기능 (휴무일 제외)
	public int adminClassUpdate(ClassVO classVO) throws Exception;
	
	
	// 메인화면 전체 클래스 조회
	public List<EgovMap> getMainClassList() throws Exception;
	
	// 클래스 상세보기 화면 (해당 classId의 데이터 호출)
	public ClassVO getClassDetails(int intClassId) throws Exception;

	// 클래스 전체 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassAllList() throws Exception;
	
	// 클래스 공예 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassCraftsList() throws Exception;
		
	
	// 클래스 미술 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassArtList() throws Exception;
		
	// 클래스 요리제빵 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassCookingList() throws Exception;
	
	
	
	// 클래스 전체 리스트 개수 (게시중인거 모두)
	public int getAllClassCount() throws Exception;
	
	// 클래스 공예 리스트 개수 (게시중인거 모두)
	public int getCraftsCount() throws Exception;
		
		
	// 클래스 미술 리스트 개수 (게시중인거 모두)
	public int getArtCount() throws Exception;
		
	// 클래스 요리제빵 리스트 개수 (게시중인거 모두)
	public int getCookingCount() throws Exception;
	
	// (페이징용 테스트 ) 클래스 전체 리스트
	public List<EgovMap> getClassAllListPaging(int offset, int pageSize) throws Exception;
	
	// (최종) 클래스 리스트 - 카테고리별 , 페이징 포함  
	public List<EgovMap> getClassListByCategory(Map<String, Object> params) throws Exception;

	// (최종) 클래스 리스트 - 카테고리별 클래스 개수 구하기
	public int getClassCountByCategory(Map<String, Object> params)throws Exception;
					
}

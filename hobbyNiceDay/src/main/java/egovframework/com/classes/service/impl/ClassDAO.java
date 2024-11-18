package egovframework.com.classes.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.UserVO;



// 클래스 관련 DAO 
@Repository("ClassDAO")
public class ClassDAO extends EgovAbstractMapper {
	
	@Resource(name="egov.sqlSessionTemplate")
	private SqlSession sqlSession;

	// 클래스 등록
	public int insertClass(ClassVO classVO) throws Exception{
		int result = insert("ClassDAO.insertClass", classVO);
		return result;
	}
	
	
	// 이미지 저장 메서드
    public int insertImage(ImgVO imgVO) throws Exception {
        // 이미지 정보를 TB_IMG에 저장
        insert("ClassDAO.saveImage", imgVO);
        // 저장된 이미지의 imgId를 반환 (MyBatis의 selectKey를 사용해 자동으로 설정된 imgId를 가져옴)
        return imgVO.getImgId(); 
    }
    
    
    // 클래스 상세정보  등록
    public int insertClassDetail(ClassVO classVO) throws Exception {
        insert("ClassDAO.insertClassDetail", classVO);
        return classVO.getClassDetailId();  // 삽입된 클래스 세부정보의 ID 반환
    }
    
    
    // 휴무일 등록
    public int insertHoliday(HolidayVO holidayVO) throws Exception {
        sqlSession.insert("ClassDAO.insertHoliday", holidayVO);
        return holidayVO.getHolidayId();  // 삽입된 휴무일의 ID 반환
    }

	// 관리자 클래스 테이블 전체 조회
	public List<EgovMap> getAdminClassList() throws Exception {
		List<EgovMap> result = selectList("ClassDAO.getAdminClassList");
		return result;
	}
	
	
	// 클래스 상세보기 - 해당 클래스 휴무일 조회
	public List<EgovMap> getHolidaysByClassId(int classId) {
		System.out.println("매개변수 classId : " + classId);
		List<EgovMap> result =  selectList("ClassDAO.getHolidaysByClassId", classId);
		System.out.println("dao 휴무일 조회 결과 : " + result );
		return result;
	}
	
	 // 클래스 상세보기 - 클래스별 수강시간대 조회 
	public List<EgovMap> getTimeSetsByClassId(int classId) {
		List<EgovMap> result =  selectList("ClassDAO.getTimeSetsByClassId", classId);
		return result;
	}
	
	// 241101
	// 이미지 등록 테스트
	public int saveItem(ImgVO imgVO) {
		insert("ClassDAO.saveItem", imgVO);
		int result = imgVO.getImgId();
		return result;
	}

	// 이미지 조회 테스트 
	public List<ImgVO> getImagesByClassId(int imgId) {
		List<ImgVO> result =  selectList("ClassDAO.getImagesByClassId", imgId);
		return result;
	}
	
	// 관리자 - 클래스 삭제
	
	// 클래스 삭제 관련 - class_detail_id 참조하는 예약 정보 삭제
		public int deleteReservationByClassId(int classId) {
			return delete("ClassDAO.deleteReservationByClassId", classId);			
		}
	
    // 클래스 세부 정보 삭제
    public int deleteClassDetailByClassId(int classId) {
        return delete("ClassDAO.deleteClassDetailByClassId", classId);
    }

    // 클래스에 연결된 img_id 조회
    public int findImgIdByClassId(int classId) {
        Integer imgId = selectOne("ClassDAO.findImgIdByClassId", classId);
        return (imgId != null) ? imgId : 0;
    }

    // 이미지 삭제
    public int deleteImageByClassId(int imgId) {
        return delete("ClassDAO.deleteImageByClassId", imgId);
    }

    // 휴일 정보 삭제
    public int deleteHolidayByClassId(int classId) {
        return delete("ClassDAO.deleteHolidayByClassId", classId);
    }

    // 클래스 삭제
    public int deleteClassById(int classId) {
        return delete("ClassDAO.deleteClassById", classId);
    }

    
 // 관리자 - 클래스 수정 - 새로 등록할 휴무일에 예약 있는지 여부 확인 
	public int hasReservationsOnDate(int classId, Date holidayDt) {
		Map<String, Object> params = new HashMap<>();
	    params.put("classId", classId);
	    params.put("holidayDt", holidayDt);
		System.out.println("ClassDAO hasReservationsOnDate params : " + params);
		
		
		return sqlSession.selectOne("ClassDAO.hasReservationsOnDate", params);

	}

	// 관리자 - 클래스 수정 - 새로 등록할 휴무일이 이미 존재하는 휴무일인지 확인
	public int ckDuplicateHoliday(int classId, Date holidayDt) {
		Map<String, Object> params = new HashMap<>();
	    params.put("classId", classId);
	    params.put("holidayDt", holidayDt);
		System.out.println("ClassDAO ckDuplicateHoliday params : " + params);
		
		return sqlSession.selectOne("ClassDAO.ckDuplicateHoliday", params);
	}

	// 관리자 - 클래스 수정 - 휴무일 새로 등록
	public int adminClassUpdateInsertHoliday(HolidayVO holidayVO) {
		int result = insert("ClassDAO.adminClassUpdateInsertHoliday", holidayVO);
		return result;		
	}

	// 관리자 - 클래스 수정 - 기존 휴무일 삭제
	public int adminClassUpdateDeleteHoliday(int holidayId) {
		int result = delete("ClassDAO.adminClassUpdateDeleteHoliday", holidayId);
		return result;
	}

	// 관리자 클래스 수정 기능 (휴무일 제외)
	public int adminClassUpdate(ClassVO classVO) {
		int result = update("ClassDAO.adminClassUpdate", classVO);
		return result;
	}
	
	
	
	
	

	// 메인화면 클래스 테이블 전체 조회
	public List<EgovMap> getMainClassList() throws Exception {
		List<EgovMap> result = selectList("ClassDAO.getMainClassList");
		return result;
	}

	// 클래스 상세보기 화면 조회 
	public ClassVO getClassDetails(int classId) throws Exception {
		return (ClassVO) selectOne("ClassDAO.getClassDetails", classId);
		
	}
	
	// 클래스 리스트 : 전체 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassAllList() {
		List<EgovMap> result = selectList("ClassDAO.getClassAllList");

		return result;
	}

	// 클래스 리스트 : 공예 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassCraftsList() {
		List<EgovMap> result = selectList("ClassDAO.getClassCraftsList");
		return result;
	}

	// 클래스 리스트 :  미술 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassArtList() {
		List<EgovMap> result = selectList("ClassDAO.getClassList");
		return result;
	}

	// 클래스 리스트 : 요리제빵 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getCookingArtList() {
		List<EgovMap> result = selectList("ClassDAO.getCookingList");

		return result;
	}
	
	// 클래스 전체 리스트 개수 (게시중인거 모두)

	public int getAllClassCount() {

        return selectOne("ClassDAO.getAllClassCount");
	}

	// 클래스 공예 리스트 개수 (게시중인거 모두)
	public int getCraftsCount() {

        return selectOne("ClassDAO.getCraftsCount");
	}

	// 클래스 미술 리스트 개수 (게시중인거 모두)
	public int getArtCount() {
        return selectOne("ClassDAO.getArtCount");

	}

	// 클래스 요리제빵 리스트 개수 (게시중인거 모두)
	public int getCookingCount() {
		return selectOne("ClassDAO.getCookingCount");

	}

	// 페이징 테스트 : 클래스 전체 리스트 
	public List<EgovMap> getClassAllListPaging(int offset, int pageSize) {
		Map<String, Object> params = new HashMap<>();
	    params.put("offset", offset);
	    params.put("pageSize", pageSize);
		System.out.println(" params : " + params);
		
		List<EgovMap> result = selectList("ClassDAO.getClassAllListPaging", params);
		return result;
	}


	// (최종) 클래스 리스트 - 카테고리별 , 페이징 포함  
	public List<EgovMap> getClassListByCategory(Map<String, Object> params) {
		List<EgovMap> result = selectList("ClassDAO.getClassListByCategory", params);
		return result;
	}


	// (최종) 클래스 리스트 - 카테고리별 클래스 개수 구하기
	public int getClassCountByCategory(Map<String, Object> params) {
		int result = selectOne("ClassDAO.getClassCountByCategory", params);
		return result;
	}

	
		

	

   
}
	

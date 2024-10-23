package egovframework.com.classes.service.impl;

import java.util.List;

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

	// 관리자 회원 테이블 전체 조회
	public List<EgovMap> getAdminClassList() throws Exception {
		List<EgovMap> result = selectList("ClassDAO.getAdminClassList");
		return result;
	}
}
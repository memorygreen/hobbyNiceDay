package egovframework.com.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.UserVO;



// 회원 관련 DAO 
@Repository("UserDAO")
public class UserDAO extends EgovAbstractMapper {
	
	@Resource(name="egov.sqlSessionTemplate")
	private SqlSession sqlSession;


    /**
     * 회원 정보를 DB에 저장한다.
     * @param vo UserVO
     * @exception Exception
     */
	// 회원가입
    public int joinUser(UserVO vo) throws Exception {
        int resultJoin = insert("UserDAO.joinUser", vo);
        return resultJoin;
    }
    
    
    // 회원가입 id 중복 체크
	public int  joinIdCheck(String userId) throws Exception {
		//return 0;
		//return selectOne("UserDAO.joinIdCheck", userId);
        return selectOne("UserDAO.joinIdCheck", userId);
	}
	
	// 로그인 
	public UserVO loginUser(UserVO vo) throws Exception {
		return (UserVO) selectOne("UserDAO.loginUser", vo);
	}

	// 관리자 회원 테이블 전체 조회
	public List<EgovMap> getAdminUserList() throws Exception {
		List<EgovMap> resultJoin = selectList("UserDAO.getAdminUserList");
		return resultJoin;
	}
}
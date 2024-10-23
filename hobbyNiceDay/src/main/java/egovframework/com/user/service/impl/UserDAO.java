package egovframework.com.user.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


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
	
	// 로그인 시간 업데이트 241021
	public int updateLastLoginDt(Map<String, Object> paramMap) throws Exception {
		int result = update("UserDAO.updateLastLoginDt", paramMap);
		return result;
	}
	
	// 로그인 성공 시 로그인실패횟수 0으로 초기화
	public int resetLoginErrCnt(String userId) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    int result = update("UserDAO.resetLoginErrCnt", paramMap);
	    return result;
	}
	
	
	// 로그인 제한 설정 (5회 이상 실패 시 제한)
	public void updateLoginRestricted(String userId, String restricted) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("loginRestricted", restricted); //"Y"
	    update("UserDAO.updateLoginRestricted", paramMap);
	}
	
	
	// 로그인 실패횟수 업데이트 241021
	public int updateLoginErrCnt(Map<String, Object> paramMap) throws Exception {
		int result = update("UserDAO.updateLoginErrCnt", paramMap);
		return result;
	}

	
	// 관리자 회원 테이블 전체 조회
	public List<EgovMap> getAdminUserList() throws Exception {
		List<EgovMap> resultJoin = selectList("UserDAO.getAdminUserList");
		return resultJoin;
	}
}
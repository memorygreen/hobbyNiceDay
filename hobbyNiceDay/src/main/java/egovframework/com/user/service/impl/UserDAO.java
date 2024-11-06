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

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.sim.service.EgovFileScrty;


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
		UserVO userVO = (UserVO) selectOne("UserDAO.loginUser", vo);
		// 복호화해서 세션에 값 넣기
		if (userVO != null) {
	        // 이메일 복호화
	        String decryptedEmail = EgovFileScrty.decode(userVO.getEmail());
	        userVO.setEmail(decryptedEmail);
	        
	        // 연락처 복호화
	        String decryptedMbtlnum = EgovFileScrty.decode(userVO.getMbtlnum());
	        userVO.setMbtlnum(decryptedMbtlnum);
	        
	        // 생년월일 복호화
	        String decryptedBrthdy= EgovFileScrty.decode(userVO.getBrthdy());
	        userVO.setBrthdy(decryptedBrthdy);
	    }
		
		return userVO;
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
	
	// 로그인 실패횟수가 5이상이면 로그인 제한을 Y로 바꿈
	public int updateLoginRestricted(UserVO userVO) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userVO.getUserId());
	    paramMap.put("loginRestricted", "Y"); // 오타났었다
	    
	    int result = update("UserDAO.updateLoginRestricted", paramMap);
	    return result;
	}

	// 관리자 페이지 - 로그인 제한 해제 기능
	public int clearLoginRestriction(String userId) {
		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("loginRestricted", "N");
	    
		
	    int result = update("UserDAO.clearLoginRestriction", paramMap);
	    return result;
	    
	}
	
	
	
	// 로그인 실패횟수 업데이트 241021
	public int updateLoginErrCnt(Map<String, Object> paramMap) throws Exception {
		int result = update("UserDAO.updateLoginErrCnt", paramMap);
		// UserVO userVO = update("UserDAO.updateLoginErrCnt", paramMap);
		
		return result;
	}

	
	// 관리자 회원 테이블 전체 조회
	public List<EgovMap> getAdminUserList() throws Exception {
		List<EgovMap> resultJoin = selectList("UserDAO.getAdminUserList");
		

	    // Decrypt email and mobile number for each user
	    for (EgovMap user : resultJoin) {
	        String encryptedEmail = (String) user.get("email");
	        if (encryptedEmail != null) {
	            String decryptedEmail = EgovFileScrty.decode(encryptedEmail);
	            user.put("email", decryptedEmail);
	            System.out.println("user : " + user);
	        }

	        String encryptedMbtlnum = (String) user.get("mbtlnum");
	        if (encryptedMbtlnum != null) {
	            String decryptedMbtlnum = EgovFileScrty.decode(encryptedMbtlnum);
	            user.put("mbtlnum", decryptedMbtlnum);

	            System.out.println("user : " + user);
	        }
	        
	        String encryptedBrthdy = (String) user.get("brthdy");
	        if (encryptedBrthdy != null) {
	            String decryptedBrthdy = EgovFileScrty.decode(encryptedBrthdy);
	            user.put("brthdy", decryptedBrthdy);

	            System.out.println("user : " + user);
	        }
	    }
		System.out.println("resultJoin : " + resultJoin);
		
		return resultJoin;
	}
	
	// 관리자페이지 회원 상세보기 화면 조회 
	public UserVO getUserInfo(String userId) throws Exception {
		UserVO userVO =  selectOne("UserDAO.getUserInfo", userId);
//		return (UserVO) selectOne("UserDAO.getUserInfo", userId);
		 if (userVO != null) {
		        // 이메일 복호화
		        String decryptedEmail = EgovFileScrty.decode(userVO.getEmail());
		        userVO.setEmail(decryptedEmail);
		        
		        // 연락처 복호화
		        String decryptedMbtlnum = EgovFileScrty.decode(userVO.getMbtlnum());
		        userVO.setMbtlnum(decryptedMbtlnum);
		        
		        // 생년월일 복호화
		        String decryptedBrthdy= EgovFileScrty.decode(userVO.getBrthdy());
		        userVO.setBrthdy(decryptedBrthdy);
		    }
		    
		    return userVO;
	}
	
	
	// 카카오 로그인 기존 회원인지 확인
	public UserVO getUserBySNSId(String snsId,  String snsProvider) {
		Map<String, Object> params = new HashMap<>();
	    params.put("snsId", snsId);
	    params.put("snsProvider", snsProvider);
	    //return sqlSession.selectOne("UserDAO.getUserBySNSId", params);
	    return (UserVO) selectOne("UserDAO.getUserBySNSId", params);
    }

	// 관리자 회원 삭제 기능
	public int deleteUser(String userId) {
		int result = delete("UserDAO.deleteUser", userId);
		return result;
		

	}

	
	
	
}
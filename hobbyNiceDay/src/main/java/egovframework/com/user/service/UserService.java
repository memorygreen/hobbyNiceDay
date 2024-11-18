package egovframework.com.user.service;

import java.util.ArrayList;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.UserVO;
// 회원 관련 서비스
public interface UserService {
	// 회원가입 서비스
	public int joinUser(UserVO vo) throws Exception;
	// 회원가입 시 id 중복확인
	public boolean joinIdCheck(String userId)throws Exception;
	
	// 로그인 서비스
	public UserVO loginUser(UserVO vo) throws Exception;
	
	// 관리자 회원테이블 전체 리스트 조회 
	public List<EgovMap> getAdminUserList()  throws Exception;
	
	// 로그인 시간 업데이트 
	public int updateLastLoginDt(String userId, String clientIp)  throws Exception;;
	
	// 로그인 실패 시 로그인실패횟수 업데이트 
	public int updateLoginErrCnt(String userId)  throws Exception;
	
	// 관리자 페이지 회원 1명 정보 조회  
	public UserVO getUserInfo(String userId) throws Exception;
	
	// 카카오 로그인 기존 회원인지 확인
	public UserVO getUserBySNSId(String kakaoUserId,  String snsProvider) throws Exception;
	
	// 로그인 실패 5회 시 로그인 제한 
	public int updateLoginRestricted(UserVO userVO) throws Exception;
	
	// 관리자 - 로그인 제한 해제 기능
	public int clearLoginRestriction(String userId) throws Exception;
	
	// 관리자 - 회원 삭제 기능
	public int deleteUser(String userId) throws Exception;
	
	// 관리자 - 회원 정보 수정 기능 
	public int adminUserUpdate(UserVO userVO) throws Exception;
	
	
}

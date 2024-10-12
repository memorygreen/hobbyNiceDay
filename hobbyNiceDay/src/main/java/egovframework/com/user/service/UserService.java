package egovframework.com.user.service;

import egovframework.com.cmm.UserVO;
// 회원 관련 서비스
public interface UserService {
	// 회원가입 서비스
	public void joinUser(UserVO vo) throws Exception;

}

package egovframework.com.user.service.impl;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.user.service.UserService {
    @Resource(name = "UserDAO")
    private UserDAO UserDAO;
    
    // 회원가입
    @Override
    public int joinUser(UserVO userVO) throws Exception {
        // 비밀번호 암호화
        String encryptedPassword = EgovFileScrty.encryptPassword(userVO.getPasswd(), userVO.getUserId());
        userVO.setPasswd(encryptedPassword);

        // DAO 호출
        int resultJoin = UserDAO.joinUser(userVO);
        return resultJoin;
    }
    
    // 회원가입 시 id 중복확인
    @Override
    public  boolean   joinIdCheck(String userId) throws Exception{
    	int count = (Integer) UserDAO.joinIdCheck(userId);
        return count > 0;
    }
    
    
    // 관리자 회원 전체 테이블 조회
    @Override
    public List<EgovMap> getAdminUserList() throws Exception {
        return UserDAO.getAdminUserList();  // 모든 사용자 리스트 가져오기
    }
    
    
    
    @Override
	public UserVO loginUser(UserVO vo) throws Exception {

		// 1. 입력한 비밀번호를 암호화한다.
		String enpassword = EgovFileScrty.encryptPassword(vo.getPasswd(), vo.getUserId());
		vo.setPasswd(enpassword);

		// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		UserVO userVo = UserDAO.loginUser(vo);

		// 3. 결과를 리턴한다.
		if (userVo != null && !userVo.getUserId().equals("") && !userVo.getPasswd().equals("")) {
			return userVo;
		} else {
			userVo = new UserVO();
		}

		return userVo;
	}

	/**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    /*
	@Override
	public UserVO searchId(UserVO vo) throws Exception {

		// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
		UserVO userVO = loginDAO.searchId(vo);

		// 2. 결과를 리턴한다.
		if (userVO != null && !userVO.getId().equals("")) {
			return userVO;
		} else {
			userVO = new UserVO();
		}

		return userVO;
	}*/

	/**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    /*
	@Override
	public boolean searchPassword(UserVO vo) throws Exception {

		boolean result = true;

		// 1. 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답이 DB와 일치하는 사용자 Password를 조회한다.
		UserVO userVO = loginDAO.searchPassword(vo);
		if (userVO == null || userVO.getPassword() == null || userVO.getPassword().equals("")) {
			return false;
		}

		// 2. 임시 비밀번호를 생성한다.(영+영+숫+영+영+숫=6자리)
		String newpassword = "";
		for (int i = 1; i <= 6; i++) {
			// 영자
			if (i % 3 != 0) {
				newpassword += EgovStringUtil.getRandomStr('a', 'z');
				// 숫자
			} else {
				newpassword += EgovNumberUtil.getRandomNum(0, 9);
			}
		}

		// 3. 임시 비밀번호를 암호화하여 DB에 저장한다.
		UserVO pwVO = new userVO();
		String enpassword = EgovFileScrty.encryptPassword(newpassword, vo.getId());
		pwVO.setId(vo.getId());
		pwVO.setPassword(enpassword);
		pwVO.setUserSe(vo.getUserSe());
		loginDAO.updatePassword(pwVO);

		return result;
	}*/
    
    
    
}
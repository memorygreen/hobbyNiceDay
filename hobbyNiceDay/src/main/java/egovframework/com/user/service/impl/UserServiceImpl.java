package egovframework.com.user.service.impl;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cryptography.EgovCryptoService;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.user.service.UserService {
    @Resource(name = "UserDAO")
    private UserDAO userDAO;
    
    
    /** 암호화서비스 - 복호화 하려고 가져옴 */
	@Resource(name = "egovARIACryptoService")
	EgovCryptoService cryptoService;

    
    // 회원가입
    @Override
    public int joinUser(UserVO userVO) throws Exception {
        // 비밀번호 암호화
        String encryptedPassword = EgovFileScrty.encryptPassword(userVO.getPasswd(), userVO.getUserId());
        userVO.setPasswd(encryptedPassword);
        
        // 휴대폰 번호 암호화
        String encryptedMbtlnum = EgovFileScrty.encode(userVO.getMbtlnum());
        userVO.setMbtlnum(encryptedMbtlnum);
        
        // 생년월일 암호화
        String encryptedBrthdy = EgovFileScrty.encode(userVO.getBrthdy());
        userVO.setBrthdy(encryptedBrthdy);
        
        // 이메일 암호화
        String encryptedEmail = EgovFileScrty.encode(userVO.getEmail());
        userVO.setEmail(encryptedEmail);
        
        // DAO 호출
        int resultJoin = userDAO.joinUser(userVO);
        return resultJoin;
    }
    
    // 회원가입 시 id 중복확인
    @Override
    public  boolean   joinIdCheck(String userId) throws Exception{
    	int count = (Integer) userDAO.joinIdCheck(userId);
        return count > 0;
    }
    
    
    // 관리자 회원 전체 테이블 조회
    @Override
    public List<EgovMap> getAdminUserList() throws Exception {
        return userDAO.getAdminUserList();  // 모든 사용자 리스트 가져오기
    }
    
    // 관리자페이지 회원 1명 정보 상세보기
    public UserVO getUserInfo(String userId) throws Exception {
    	return userDAO.getUserInfo(userId);
    }
    
    
    // 로그인 
    @Override
    public UserVO loginUser(UserVO vo) throws Exception {

        // 1. 입력한 비밀번호를 암호화한다.
        String enpassword = EgovFileScrty.encryptPassword(vo.getPasswd(), vo.getUserId());
        vo.setPasswd(enpassword);

        // 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
        UserVO userVo = userDAO.loginUser(vo);
        System.out.println("로그인 성보 가져오기 "+ userVo);

        // 3. 로그인 제한 여부 확인
        if (userVo != null && "Y".equals(userVo.getLoginRestricted())) {
            System.out.println("로그인 제한 Y로 걸려있는 경우 "); 
        	// 로그인 제한된 경우 예외 발생 및 메시지 반환
            throw new Exception("로그인이 제한되었습니다. 관리자에게 문의하세요.");
        }

        // 4. 로그인 실패 제한 (5회 이상 실패 시 제한)
        if (userVo != null && userVo.getLoginErrCnt() >= 5) {
            // LOGIN_RESTRICTED 컬럼을 Y로 업데이트
            userDAO.updateLoginRestricted(userVo.getUserId(), "Y");
            
            System.out.println("UserServiceImpl 로그인 제한인 경우");
            throw new Exception("로그인이 제한되었습니다. 관리자에게 문의하세요.");
        }

        // 5. 로그인 성공 여부 확인
        if (userVo != null && !userVo.getUserId().equals("") && !userVo.getPasswd().equals("")) {
            // 로그인 성공 시 로그인 실패 횟수를 0으로 초기화 (로그인 제한 걸리기 전)
            int result = userDAO.resetLoginErrCnt(userVo.getUserId());
            System.out.println("로그인 성공 시 로그인 실패 횟수 0으로 초기화 : "+ result);
            return userVo;
        } else {
            // 로그인 실패 시 실패 횟수를 증가시키고 null 반환
            if (userVo != null) {
            	Map<String, Object> paramMap = new HashMap<>();
                paramMap.put("userId", userVo.getUserId());
                int result = userDAO.updateLoginErrCnt(paramMap);
                System.out.println("로그인 실패 시 로그인 실패횟수 추가 " + result);
            }
            return null;  // 로그인 실패
        }
    }
    
    
    
    
    // 로그인 시간, 로그인성공 횟수 업데이트 
    @Override
    public int updateLastLoginDt(String userId, String clientIp) throws Exception {
    	 Map<String, Object> paramMap = new HashMap<>();
         paramMap.put("userId", userId);
         
         Timestamp lastLoginDt = new Timestamp(new Date().getTime()); // 현재 시간
         
         paramMap.put("lastLoginDt", lastLoginDt);
         paramMap.put("lastLoginIp", clientIp);  // 로그인 시 IP
    	 int result = userDAO.updateLastLoginDt(paramMap);
    	 return result;
    }
    
 // 로그인 실패 회수 업데이트 
    @Override
    public int updateLoginErrCnt(String userId) throws Exception {
    	 Map<String, Object> paramMap = new HashMap<>();
         paramMap.put("userId", userId);
    	 int result = userDAO.updateLoginErrCnt(paramMap);
    	 return result;
    }
    
    
    
    // 카카오 로그인 기존 회원인지 확인
 	public UserVO getUserBySNSId(String kakaoUserId,  String snsProvider) throws Exception {
 		 return userDAO.getUserBySNSId(kakaoUserId, snsProvider);  // DAO 메서드 호출
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
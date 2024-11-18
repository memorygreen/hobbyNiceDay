package egovframework.com.user.service.impl;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.cryptography.EgovCryptoService;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.UserVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.user.service.UserService {
    @Resource(name = "UserDAO")
    private UserDAO userDAO;
    
    
    
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
    	String encryptedPassword = EgovFileScrty.encryptPassword(vo.getPasswd(), vo.getUserId());
    	System.out.println("서비스impl 에서 비밀번호 암호화 : " + encryptedPassword);
    	vo.setPasswd(encryptedPassword);
    	
        // 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
        UserVO userVo = userDAO.loginUser(vo);
        System.out.println("로그인 성보 가져오기 "+ userVo);
        
        
     // 조회 결과가 없으면 로그인 실패
        if (userVo == null) {
            return null;
        }
        
        
        // 3. 로그인 제한 여부 확인
        if ("Y".equals(userVo.getLoginRestricted())) {
            System.out.println("로그인 제한 Y로 걸려있는 경우 "); 
        	// 로그인 제한된 경우 예외 발생 및 메시지 반환
            //throw new Exception("(로그인제한 Y로 걸려있는 경우)로그인이 제한되었습니다. 관리자에게 문의하세요.");
            userVo.setLoginRestricted("Y");
            return userVo;
        }else if("N".equals(userVo.getLoginRestricted())){
        	
            // 5. 로그인 성공 시 실패 횟수 초기화 및 반환
            int result = userDAO.resetLoginErrCnt(userVo.getUserId());
            System.out.println("로그인 성공 시 로그인 실패 횟수 0으로 초기화 : "+ result);
            return userVo;
            
        }
        
        return userVo;
        
    }
    
    
    // 로그인 시 제한 기능
       @Override
       public int updateLoginRestricted(UserVO userVO) throws Exception {
    	   
           int result = userDAO.updateLoginRestricted(userVO);
           // System.out.println("5회 실패 후 사용자 로그인 제한.");
           
       	 return result;
       }
       
       

       // 관리자 - 로그인 제한 해제
       @Override
       public int clearLoginRestriction(String userId) throws Exception {
           return userDAO.clearLoginRestriction(userId);
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
    
    
    // 관리자 - 회원 삭제 기능
    @Override
    public int deleteUser(String userId) throws Exception {
    	
    	// 예약 삭제 (제약조건에 casecade 걸려있어서 넘어간듯)
    	
    	// 회원 삭제
        int result = userDAO.deleteUser(userId);
        return result;
    }
    
    
    // 관리자 - 회원 수정 기능
    public int adminUserUpdate(UserVO userVO) throws Exception{
    	
    	
    	// 비밀번호 암호화
        if(userVO.getPasswd() != null) {
        	// 비밀번호가 있을 경우 암호화(사용자 회원정보 수정)
        	String encryptedPassword = EgovFileScrty.encryptPassword(userVO.getPasswd(), userVO.getUserId());
        	userVO.setPasswd(encryptedPassword);
        }
        // 관리자 페이지 회원정보 수정 시에는 비밀번호 x
        

        // 휴대폰 번호 암호화
        String encryptedMbtlnum = EgovFileScrty.encode(userVO.getMbtlnum());
        userVO.setMbtlnum(encryptedMbtlnum);
        
        // 생년월일 암호화
        String encryptedBrthdy = EgovFileScrty.encode(userVO.getBrthdy());
        userVO.setBrthdy(encryptedBrthdy);
        
        // 이메일 암호화
        String encryptedEmail = EgovFileScrty.encode(userVO.getEmail());
        userVO.setEmail(encryptedEmail);
    	
    	
    	int result = userDAO.adminUserUpdate(userVO);
    	return result;
    }
    
    
    
    
    
    
    
    // 카카오 로그인 기존 회원인지 확인
 	public UserVO getUserBySNSId(String kakaoUserId,  String snsProvider) throws Exception {
 		UserVO userVo =  userDAO.getUserBySNSId(kakaoUserId, snsProvider);  // DAO 메서드 호출
 		System.out.println("userServiceImpl - 복호화 하기 전 사용자 정보: " + userVo);
 		// 카카오 로그인 성공 시 세션에 담을 개인정보를 복호화 241114 추가

 	    if (userVo != null) {
 	        // 2. 연락처 복호화
 	        if (userVo.getMbtlnum() != null) {
 	            String decryptedMbtlnum = EgovFileScrty.decode(userVo.getMbtlnum());
 	            userVo.setMbtlnum(decryptedMbtlnum);
 	        }
 	        
 	        // 3. 생년월일 복호화
 	        if (userVo.getBrthdy() != null) {
 	            String decryptedBrthdy = EgovFileScrty.decode(userVo.getBrthdy());
 	            userVo.setBrthdy(decryptedBrthdy);
 	        }
 	        
 	        // 4. 이메일 복호화
 	        if (userVo.getEmail() != null) {
 	            String decryptedEmail = EgovFileScrty.decode(userVo.getEmail());
 	            userVo.setEmail(decryptedEmail);
 	        }
 	    }
 	    
 	   System.out.println("userServiceImpl - 복호화된 사용자 정보: " + userVo);
 	   
 	   return userVo;
 		 
 		 
 		 
 		 
 		 
 		 
 		 
 	}

    
   
    
    
}
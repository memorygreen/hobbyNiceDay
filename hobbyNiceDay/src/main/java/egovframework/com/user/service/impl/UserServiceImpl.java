package egovframework.com.user.service.impl;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.UserVO;
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
    
    
    
}
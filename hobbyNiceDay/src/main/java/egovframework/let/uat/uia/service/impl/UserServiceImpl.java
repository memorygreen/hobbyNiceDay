package egovframework.let.uat.uia.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.UserVO;
import egovframework.let.uat.uia.service.UserService;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {
    @Resource(name = "UserDAO")
    private UserDAO UserDAO;

    @Override
    public void insertUser(UserVO userVO) throws Exception {
        // 비밀번호 암호화
        String encryptedPassword = EgovFileScrty.encryptPassword(userVO.getPassword(), userVO.getUserId());
        userVO.setPassword(encryptedPassword);

        // DAO 호출
        UserDAO.insertUser(userVO);
    }
}
package egovframework.com.user.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.UserVO;

// 회원 관련 DAO 
@Repository("UserDAO")
public class UserDAO extends EgovAbstractMapper {


    /**
     * 회원 정보를 DB에 저장한다.
     * @param vo UserVO
     * @exception Exception
     */
    public void joinUser(UserVO vo) throws Exception {
        insert("UserDAO.joinUser", vo);
    }
}
package egovframework.com.classes.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.UserVO;



// 클래스 관련 DAO 
@Repository("ClassDAO")
public class ClassDAO extends EgovAbstractMapper {
	
	@Resource(name="egov.sqlSessionTemplate")
	private SqlSession sqlSession;

}
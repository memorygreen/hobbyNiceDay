package egovframework.com.cmm;

import java.io.Serializable;

import lombok.Data;


/**
 * @Class Name : UserVO.java
 * @Description : User VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2024.10.09    사용자          최초 생성
 *
 *  @author 사용자
 *  @since 2024.10.09
 *  @version 1.0
 *  @see
 *  
 */

@Data
public class UserVO implements Serializable {
    
    private static final long serialVersionUID = 1L;

    /** 아이디 */
    private String userId;
    /** 비밀번호 */
    private String password;
    /** 이름 */
    private String userName;
    /** 이메일 주소 */
    private String email;
    /** 생년월일 */
    private String brthdy;

    /** 전화번호 */
    private String mbtlnum;
    /** 성별 */
    private String sex;

    /** sns 로그인 제공자 */
    private String snsProvider;
    /** 회원구분 */
    private String userSe;
    
    
    /** 가입 날짜 */
    private String regDt;
    /** 가입 id */
    private String regId;
    /** 가입 ip */
    private String regIp;
    
    /** 수정 날짜 */
    private String UpdtDt;
    
    /** 수정 Id */
    private String UpdtId;
    
    /** 수정 Ip */
    private String UpdtIp;
}
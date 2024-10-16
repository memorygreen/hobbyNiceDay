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

    // 사용자 고유 ID
    private String userId;
    // 비밀번호
    private String passwd;
    // 사용자 이름
    private String userName;
    // 이메일
    private String email;
    // 생년월일
    private String brthdy;
    // 휴대폰 번호
    private String mbtlnum;
    // 성별
    private String sex;
    // SNS 로그인 제공자 (네이버, 카카오 등)
    private String snsProvider;
    // 회원 구분 (user, admin)
    private String userSe;
    // 등록 IP
    private String regIp;
    // 등록 ID
    private String regId;
    // 등록 일시
    private String regDt;
    // 수정 ID
    private String updtId;
    // 수정 IP
    private String updtIp;
    // 수정 일시
    private String updtDt;
    // 마지막 로그인 IP
    private String lastLoginIp;
    // 마지막 로그인 일시
    private String lastLoginDt;

}
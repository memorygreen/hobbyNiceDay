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
public class NaverVO implements Serializable {
    
    private static final long serialVersionUID = 1L;

    
    // 네이버 로그인 관련
    private String n_age;
    private String n_birthday;
    private String n_email;
    private String n_gender;
    private String n_id;
    private String n_name;
    private String n_nickName;
    
    
    

}
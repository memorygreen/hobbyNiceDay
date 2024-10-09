package egovframework.com.cmm;

import java.io.Serializable;

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
    /** 전화번호 */
    private String phone;
    /** 가입 날짜 */
    private String createdAt;

    /**
     * userId attribute 를 리턴한다.
     * @return String
     */
    public String getUserId() {
        return userId;
    }

    /**
     * userId attribute 값을 설정한다.
     * @param userId String
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * password attribute 를 리턴한다.
     * @return String
     */
    public String getPassword() {
        return password;
    }

    /**
     * password attribute 값을 설정한다.
     * @param password String
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * userName attribute 를 리턴한다.
     * @return String
     */
    public String getUserName() {
        return userName;
    }

    /**
     * userName attribute 값을 설정한다.
     * @param userName String
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * email attribute 를 리턴한다.
     * @return String
     */
    public String getEmail() {
        return email;
    }

    /**
     * email attribute 값을 설정한다.
     * @param email String
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * phone attribute 를 리턴한다.
     * @return String
     */
    public String getPhone() {
        return phone;
    }

    /**
     * phone attribute 값을 설정한다.
     * @param phone String
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * createdAt attribute 를 리턴한다.
     * @return String
     */
    public String getCreatedAt() {
        return createdAt;
    }

    /**
     * createdAt attribute 값을 설정한다.
     * @param createdAt String
     */
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}

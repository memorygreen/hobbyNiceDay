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
public class ImgVO implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int imgId;              // 이미지 고유 ID
    private String imgNm;           // 이미지 파일명  (원본 파일명)
    private String imgUrl;          // 이미지 저장 경로 또는 URL
    private String imgType;         // 이미지 분류 (클래스, 리뷰 등)
    private String imgRep;          // 대표 이미지 여부 (Y/N)
    
    // 등록 관련 필드
    private String regIp;           // 등록 IP
    private String regId;           // 등록 ID
    private String regDt;           // 등록 일시
    private String updtId;          // 수정 ID (Nullable)
    private String updtIp;          // 수정 IP (Nullable)
    private String updtDt;          // 수정 일시 (Nullable)
    

}
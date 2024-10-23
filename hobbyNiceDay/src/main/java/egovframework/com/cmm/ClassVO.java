package egovframework.com.cmm;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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
public class ClassVO implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    
    // 클래스 정보 관련 필드
    private int classId;            // 클래스 고유 ID
    private String classNm;         // 클래스 이름
    private String classDscrptn;    // 클래스 설명
    private String location;        // 클래스 장소
    private String classCateBig;    // 클래스 대분류 (공예, 미술, 음악 등)
    private String classCateSmall;  // 클래스 소분류 (향수, 비누 등)
    private int classAgeMin;        // 최소 수강 가능 연령
    private int classMaxCnt;        // 최대 참가자 수
    private int classPrice;      // 클래스 가격 // 할인된 가격도 추가해야하나?
    
    // 이미지 관련 필드
    private int imgId;           // 클래스 이미지 ID
//    private String imgUrl;           // 클래스 이미지 파일이 저장된 경로 (URL)
    private MultipartFile imgUrl;  // 파일 업로드를 처리하기 위해 MultipartFile로 변경
    private String imgNm;           // 클래스 이미지 파일명 (원본 파일명)
    private String imgFilePath;    // 이미지 저장 경로

    
    // 휴무일 관련 필드
    private int holidayId;          // 휴무일 고유 ID (외래 키)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date holidayDt;
    //private int holidayDt;          // 휴무일자
    private String holidayDesc;        // 휴무일 설명
    
    
    // 등록 관련 필드
    private String regIp;           // 등록 IP
    private String regId;           // 등록 ID
    private String regDt;           // 등록 일시
    private String updtId;          // 수정 ID (Nullable)
    private String updtIp;          // 수정 IP (Nullable)
    private String updtDt;          // 수정 일시 (Nullable)

    
    

}
package egovframework.com.cmm;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class HolidayVO implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private int classId; // fk 클래스 고유 id 
    private int holidayId;       // 휴무일 고유 ID
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date holidayDt;
    // private String holidayDt;    // 휴무일 날짜
    
    
    private String holidayDesc;  // 휴무일 설명
    private String isPublicHoliday;  // 공휴일 여부 IS_PUBLIC_HOLIDAY
    private String regIp;        // 등록 IP
    private String regId;        // 등록 ID
    private String regDt;          // 등록일시
    private String updtId;       // 수정 ID
    private String updtIp;       // 수정 IP
    private String updtDt;         // 수정일시

    

}
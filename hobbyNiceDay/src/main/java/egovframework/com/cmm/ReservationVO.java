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
public class ReservationVO implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int reservationId;     // 예약 고유 ID
    private String userId;         // 사용자 ID (회원일 경우)
    private int classId;           // 클래스 ID
    private int classDetailId;     // 클래스 세부 시간 ID
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reservationDt;    // 예약 날짜
    
    private int reservationCnt;    // 예약 인원수
    private String reservationNm;  // 예약자명
    private String reservationPhone; // 예약자 연락처
    private String reservationEmail; // 예약자 이메일
    private String reservationEtc;   // 예약 비고 사항
    private String reservationType;  // 회원/비회원 구분자
    private String reservationStatus; // 예약 상태 (예약, 취소, 승인 등)
    private String regIp;           // 등록 IP
    private String regId;           // 등록자 ID
    private Date regDt;             // 등록일시
    private String updtId;          // 수정자 ID
    private String updtIp;          // 수정 IP
    private Date updtDt;            // 수정 일시
    private String confmId;         // 승인자 ID
    private String confmIp;         // 승인 IP
    private Date confmDt;           // 승인 일시
    
    private String reservationNum; // 예약 번호
    private String reservationPw; // 비회원 예약시 비밀번호
    
    // tb_class 관련 필드 추가
    // 클래스 정보 관련 필드
    //private int classId;            // 클래스 고유 ID
    private String classNm;         // 클래스 이름
    private String classDscrptn;    // 클래스 설명
    private String location;        // 클래스 장소
    private String classCateBig;    // 클래스 대분류 (공예, 미술, 음악 등)
    private String classCateSmall;  // 클래스 소분류 (향수, 비누 등)
    private int classAgeMin;        // 최소 수강 가능 연령
    private int classMaxCnt;        // 최대 참가자 수
    private int classPrice;      // 클래스 가격 // 할인된 가격도 추가해야하나?
    private String classPost;  // 클래스 게시 여부
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDt; // 클래스 수강 시작일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDt; // 클래스 수강 종료일
    
    
 // TB_CLASS_DETAIL 관련 필드들
    //private int classDetailId; // 클래스 디테일 ID
    //private int maxParticipants;// 최대 예약 가능 인원수(시간대별)
    //private int availableCurrentCnt; // 현재 예약된 인원수
    //private int availableSeats; // 남은 좌석 수
    //private String availableStatus; // 예약 가능 상태
    private String timeStart; // 시작 시간
    private String timeEnd; // 종료 시간
    
    private String reservationTime; // 예약시간대
    
    // private String timeSets; // 시간대 정보 (ex. 14:00-16:00)

    private int availableSeatsWithAllReservations; // 정원 체크 각 시간대별 남은 자리
}
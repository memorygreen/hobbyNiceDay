package egovframework.com.reservation.service;

import java.util.Date;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;

// 예약 관련 서비스
public interface ReservationService {
	
	// 예약 생성
	public int insertReservation(ReservationVO reservationVO) throws Exception;
	
	// 관리자페이지 예약 전체 목록 조회
	public List<EgovMap> getAdminReservationList() throws Exception;
	
	// 관리자 페이지 예약 1건 정보 조회  
	public ReservationVO getReservationInfo(String rservationId) throws Exception;

	// 남은 좌석 수 조회 (test)
	public int getRemainingSeats(int classDetailId, String reservationDate) throws Exception;
	
	// 관리자페이지 예약대기 예약 목록 조회
	public List<EgovMap> getAdminPendingReservationList() throws Exception;
	
	// 관리자페이지 예약상태 변경 기능
	public int updateReservationStatus(int reservationId, String reservationStatus) throws Exception;
	
	
    // 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
	public List<EgovMap> getAvailableTimeSlots(int classId, String reservationDt) throws Exception;;
	
	// 마이페이지 회원별 예약 목록 조회
	public List<EgovMap> getMyReservationList(UserVO userVo) throws Exception;
	
	// 관리자 예약정보 수정
	public int updateReservationInfo(ReservationVO reservationVO) throws Exception;
	
	
	// 월별 예약가능 정보 조회 테이블 
	public List<EgovMap> getMonthlyAvailableTimeSlots(int classId, String startDate, String endDate) throws Exception;
		
	// 예약 등록 시 예약번호 생성
    // public String generateReservationNum(ReservationVO reservationVO) throws Exception;
	
	
}

package egovframework.com.reservation.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;

// 예약 관련 서비스
public interface ReservationService {
	
	// 예약 등록 전 정원 체크
	public ReservationVO getAvailableSeatsCk(ReservationVO reservationVO) throws Exception;

	// 예약 등록
	public int insertReservation(ReservationVO reservationVO) throws Exception;
	
	
	// 관리자페이지 예약 전체 목록 조회
	public List<EgovMap> getAdminReservationList() throws Exception;
	
	// 관리자페이지 예약 필터링 목록 조회
	public List<EgovMap> getAdminReservationFilteringList(Map<String, Object> paramMap) throws Exception;
	
	// 관리자 페이지 예약 1건 정보 조회  
	public ReservationVO getReservationInfo(String rservationId) throws Exception;

	// 관리자페이지 예약대기 예약 목록 조회
	public List<EgovMap> getAdminPendingReservationList() throws Exception;
	
	// 관리자페이지 예약상태 변경 기능
	public int updateReservationStatus(int reservationId, String reservationStatus) throws Exception;
	
	
    // 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
	public List<EgovMap> getAvailableTimeSlots(int classId, String reservationDt) throws Exception;;
	
	
	// 관리자 예약정보 수정
	public int updateReservationInfo(ReservationVO reservationVO) throws Exception;
	
	
	// 월별 예약가능 정보 조회 테이블 
	public List<EgovMap> getMonthlyAvailableTimeSlots(int classId, String startDate, String endDate) throws Exception;
	
	// 관리자 - 예약 승인(접수)기능
	public int adminReservationApproved(HashMap<String, Object> params)  throws Exception;
	
	// 관리자 - 접수 취소 기능
	public int adminReservationReject(int reservationId)  throws Exception;
	
	// 사용자 - 예약 취소 기능
	public int myReservationCancel(int intReservationId) throws Exception;


	// 마이페이지 회원별 예약 목록 조회
	public List<EgovMap> getMyReservationList(Map<String, Object> params) throws Exception;
	
	// 마이페이지 회원별 예약 건수
	public int getReservationCount(String userId)  throws Exception;

	// 비회원 예약정보 검색 기능
	public List<EgovMap> searchNonUserReservation(ReservationVO reservationVO) throws Exception;

	// 회원(비회원) 예약 상세보기 기능
	public ReservationVO getReservationDetails(int reservationId) throws Exception;

	// (달력 아래쪽) 관리자 페이지 예약현황(통계) 조회기능(선택한 날짜의 각 클래스 시간대별 예약 인원수, 예약건수)
	public List<EgovMap> getReservationDayStatistics(String reservationDt, int intClassId) throws Exception;

	// 관리자 예약현황(통계) 예약건수 선택시 클래스 시간대별 예약정보 목록
	public List<EgovMap> getReservationStatusDetails(int classDetailId, int classId, String reservationDt) throws Exception;

	// (달력 오른쪽) 관리자 예약현황(통계) 날짜선택시 통합 예약정보 목록
	public List<EgovMap> getReservationTotalDayStatistics(String reservationDt) throws Exception;

	// 관리자 - 예약 삭제 
	public int deleteReservation(int reservationId)  throws Exception;

	
	
	
}

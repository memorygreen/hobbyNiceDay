package egovframework.com.reservation.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.sim.service.EgovFileScrty;



// 클래스 관련 DAO 
@Repository("ReservationDAO")
public class ReservationDAO extends EgovAbstractMapper {
	
	@Resource(name="egov.sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	// 관리자 예약 테이블 전체 조회
	public List<EgovMap> getAdminReservationList() throws Exception {
		
		List<EgovMap> result = selectList("ReservationDAO.getAdminReservationList");
		
	    // 복호화
	    for (EgovMap reservation : result) {
	    	//이메일 복호화
	        String encryptedEmail = (String) reservation.get("reservationEmail");
	        if (encryptedEmail != null) {
	            String decryptedEmail = EgovFileScrty.decode(encryptedEmail);
	            reservation.put("reservationEmail", decryptedEmail);
	        }
	        
	        // 전화번호 복호화
	        String encryptedMbtlnum = (String) reservation.get("reservationPhone");
	        if (encryptedMbtlnum != null) {
	            String decryptedMbtlnum = EgovFileScrty.decode(encryptedMbtlnum);
	            reservation.put("reservationPhone", decryptedMbtlnum);

	        }
	    }
		
		
		return result;
	}
	
	
	// 관리자페이지 필터링 목록 
	public List<EgovMap> getAdminReservationFilteringList(Map<String, Object> paramMap) throws Exception{
		
		List<EgovMap> result = selectList("ReservationDAO.getAdminReservationFilteringList", paramMap);


	    // 복호화
	    for (EgovMap reservation : result) {
	    	//이메일 복호화
	        String encryptedEmail = (String) reservation.get("reservationEmail");
	        if (encryptedEmail != null) {
	            String decryptedEmail = EgovFileScrty.decode(encryptedEmail);
	            reservation.put("reservationEmail", decryptedEmail);
	        }
	        
	        // 전화번호 복호화
	        String encryptedMbtlnum = (String) reservation.get("reservationPhone");
	        if (encryptedMbtlnum != null) {
	            String decryptedMbtlnum = EgovFileScrty.decode(encryptedMbtlnum);
	            reservation.put("reservationPhone", decryptedMbtlnum);

	        }
	    }
		
		
		return result;
	}
	
	
	// 관리자페이지 예약 1건 상세보기 화면 조회 
	public ReservationVO getReservationInfo(String reservationId) throws Exception {
		ReservationVO reservationVO= (ReservationVO) selectOne("ReservationDAO.getReservationInfo", reservationId);
		
		// 개인정보 복호화
		if (reservationVO != null) {
	        // 이메일 복호화
	        String decryptedEmail = EgovFileScrty.decode(reservationVO.getReservationEmail());
	        reservationVO.setReservationEmail(decryptedEmail);;
	        
	        // 연락처 복호화
	        String decryptedMbtlnum = EgovFileScrty.decode(reservationVO.getReservationPhone());
	        reservationVO.setReservationPhone(decryptedMbtlnum);
	    }
		return reservationVO;
	}
	

	// 관리자페이지 승인대기 에약 목록 조회 (알림)
	public List<EgovMap> getAdminPendingReservationList() throws Exception {
		List<EgovMap> result = selectList("ReservationDAO.getAdminPendingReservationList");
		return result;	
	}
	
	
	// 관리자 페이지 예약대기 예약상태 변경 기능
	public  int updateReservationStatus(int reservationId, String reservationStatus)  throws Exception{
		//return update("ReservationDAO.updateReservationStatus");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("reservationId", reservationId);
		paramMap.put("reservationStatus", reservationStatus);
		
		return sqlSession.update("ReservationDAO.updateReservationStatus", paramMap);
	}
	// 관리자 예약정보 수정
	public  int updateReservationInfo(ReservationVO reservationVO)  throws Exception{
		//return update("ReservationDAO.updateReservationStatus");
		
		return sqlSession.update("ReservationDAO.updateReservationInfo", reservationVO);
	}
	
	// 관리자페이지 - 예약승인 (접수완료)
	public int adminReservationApproved(HashMap<String, Object> params) throws Exception {
		
		params.put("reservationStatus", "approved");
	    
		
	    int result = update("ReservationDAO.adminReservationApproved", params);
	    return result;
	}
	
	// 관리자 페이지 - 접수취소(예약거절)
	public int adminReservationReject(int reservationId) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("reservationId", reservationId);
	    paramMap.put("reservationStatus", "reject");
	    
		
	    int result = update("ReservationDAO.adminReservationReject", paramMap);
	    return result;
	}
	
	// 사용자 - 예약 취소 기능
	public int myReservationCancel(int reservationId) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("reservationId", reservationId);
	    paramMap.put("reservationStatus", "cancel");
	    
		
	    int result = update("ReservationDAO.myReservationCancel", paramMap);
	    return result;
	}
		
	
	// 예약 등록
	public int insertReservation(ReservationVO reservationVO) throws Exception {
	    return insert("ReservationDAO.insertReservation", reservationVO);
	}
	
	// 예약 등록 전 정원 체크
	public ReservationVO getAvailableSeatsCk(ReservationVO reservationVO)  throws Exception{
		
		System.out.println("예약 등록 전 정원 체크 DAO : " + reservationVO);
        
		ReservationVO resultVO =  selectOne("ReservationDAO.getAvailableSeatsCk", reservationVO);
        System.out.println("예약 등록 후 정원 체크 DAO : " + resultVO);
        
        int classMaxCnt = reservationVO.getClassMaxCnt();
        System.out.println("예약 등록 후 정원 체크 DAO - classMaxCnt : "  + classMaxCnt);
        
        if (resultVO == null) {
            resultVO = new ReservationVO();
            resultVO.setAvailableSeatsWithAllReservations(classMaxCnt); // 예약없을 경우 클래스 시간대별 최대 수강인원 세팅  
        }
        return resultVO;
		
	}
	
	// 예약 등록 시 예약번호 업데이트 기능 
	public int updateReservationNum(ReservationVO reservationVO)  throws Exception{
		return sqlSession.update("ReservationDAO.updateReservationNum", reservationVO);
	}
	
	
	// 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
	public List<EgovMap> getAvailableTimeSlots(int classId, String reservationDt)  throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("classId", classId);
        paramMap.put("reservationDt", reservationDt);
        
		List<EgovMap> result = selectList("ReservationDAO.getAvailableTimeSlots", paramMap);
		return result;	
		
	}
	
	
	

	// 마이페이지 1명 회원 예약 전체 조회
	public List<EgovMap> getMyReservationList(Map<String, Object> params) throws Exception {
		List<EgovMap> result = selectList("ReservationDAO.getMyReservationList", params);
		return result;
	}
	
	
	// 마이페이지 회원별 전체 예약건수 
	public int getReservationCount(String userId) throws Exception {
		int result =  selectOne("ReservationDAO.getReservationCount", userId);
		return result;
	}
	
	
	// 월별 예약가능 날짜 조회 
	public List<EgovMap> getMonthlyAvailableTimeSlots(int classId, String startDate, String endDate) throws Exception {
		
		Map<String, Object> params = new HashMap<>();
	    params.put("classId", classId);
	    params.put("startDate", startDate);
	    params.put("endDate", endDate);
		System.out.println("reservationDAO getMonthlyAvailableTimeSlots params : " + params);
		
		List<EgovMap> result = selectList("ReservationDAO.getMonthlyAvailableTimeSlots", params);
		return result;
	}
	
	
	// 비회원 예약정보 검색 기능
	public List<EgovMap> searchNonUserReservation(ReservationVO reservationVO) throws Exception{
		List<EgovMap> result = selectList("ReservationDAO.searchNonUserReservation", reservationVO);
		return result;
	}
	
	
	// 회원(비회원) 예약 상세보기 페이지
	public ReservationVO getReservationDetails(int reservationId) throws Exception {
		ReservationVO reservationVO= (ReservationVO) selectOne("ReservationDAO.getReservationDetails", reservationId);
		
		
		//이메일 복호화
        String encryptedEmail = reservationVO.getReservationEmail();
        String decryptedEmail = "";
		try {
			decryptedEmail = EgovFileScrty.decode(encryptedEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
        reservationVO.setReservationEmail(decryptedEmail);
        
        
        // 전화번호 복호화
        String encryptedMbtlnum =  reservationVO.getReservationPhone();
        String decryptedMbtlnum = "";
		try {
			decryptedMbtlnum = EgovFileScrty.decode(encryptedMbtlnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
        reservationVO.setReservationPhone(decryptedMbtlnum);
		
        return reservationVO;
	}
	
	// (달력 아래쪽) 관리자 페이지 예약현황(통계) 조회기능(선택한 날짜의 각 클래스 시간대별 예약 인원수, 예약건수)
	public List<EgovMap> getReservationDayStatistics(String reservationDt, int classId) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("reservationDt", reservationDt);
		paramMap.put("classId", classId);
		
		
		
		List<EgovMap> result = selectList("ReservationDAO.getReservationDayStatistics", paramMap);

		return result;
	}
	
	// 관리자 예약현황(통계) 예약건수 선택시 클래스 시간대별 예약정보 목록
	public List<EgovMap> getReservationStatusDetails(int classDetailId, int classId, String reservationDt) throws Exception{
		
		
		Map<String, Object> params = new HashMap<>();
	    params.put("classId", classId);
	    params.put("classDetailId", classDetailId);
	    params.put("reservationDt", reservationDt);
		System.out.println("reservationDAO getReservationStatusDetails params : " + params);
		
		
		List<EgovMap> result = selectList("ReservationDAO.getReservationStatusDetails", params);
		
		// 복호화
	    for (EgovMap reservation : result) {
	    	//이메일 복호화
	        String encryptedEmail = (String) reservation.get("reservationEmail");
	        if (encryptedEmail != null) {
	            String decryptedEmail = EgovFileScrty.decode(encryptedEmail);
	            reservation.put("reservationEmail", decryptedEmail);
	            System.out.println("reservation : " + reservation);
	        }
	        
	        // 전화번호 복호화
	        String encryptedMbtlnum = (String) reservation.get("reservationPhone");
	        if (encryptedMbtlnum != null) {
	            String decryptedMbtlnum = EgovFileScrty.decode(encryptedMbtlnum);
	            reservation.put("reservationPhone", decryptedMbtlnum);

	            System.out.println("reservation : " + reservation);
	        }
	    }
		
		return result;
	}
	
	
	// (달력 오른쪽) 관리자 예약자 페이지 - 날짜 선택 시 통합 정보 조회
	public List<EgovMap> getReservationTotalDayStatistics(String reservationDt) throws Exception {
		List<EgovMap> result = selectList("ReservationDAO.getReservationTotalDayStatistics", reservationDt);
				
		return result;
	}
	
	
	
	// 관리자 - 예약 삭제
	public int deleteReservation(int reservationId) throws Exception {
		int result =  delete("ReservationDAO.deleteReservation", reservationId);
		return result;
	}

	
	
	
	
	
	
}
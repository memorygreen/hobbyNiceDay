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
	
	// 남은 좌석 확인 (클릭한 날짜)
	public int getRemainingSeats(int classDetailId, String reservationDate) throws Exception {
	    
		Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("classDetailId", classDetailId);
        paramMap.put("reservationDate", reservationDate);
        return selectOne("ReservationDAO.getRemainingSeats", paramMap);
		
		//return selectOne("reservationMapper.getRemainingSeats", Map.of("classDetailId", classDetailId, "reservationDate", reservationDate));
	}
	
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
	
	// 예약 등록
	public int insertReservation(ReservationVO reservationVO) throws Exception {
	    return insert("ReservationDAO.insertReservation", reservationVO);
	}
	
	
	// 예약 등록 시 예약번호 업데이트 기능 
	public int updateReservationNum(ReservationVO reservationVO) {
		return sqlSession.update("ReservationDAO.updateReservationNum", reservationVO);
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
	
	// 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
	public List<EgovMap> getAvailableTimeSlots(int classId, String reservationDt) {
		Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("classId", classId);
        paramMap.put("reservationDt", reservationDt);
        
		List<EgovMap> result = selectList("ReservationDAO.getAvailableTimeSlots", paramMap);
		return result;	
		
	}
	
	// 관리자 예약정보 수정
	public  int updateReservationInfo(ReservationVO reservationVO)  throws Exception{
		//return update("ReservationDAO.updateReservationStatus");
		
        return sqlSession.update("ReservationDAO.updateReservationInfo", reservationVO);
	}
	
	

	// 마이페이지 1명 회원 예약 전체 조회
	public List<EgovMap> getMyReservationList(UserVO userVo) throws Exception {
		List<EgovMap> result = selectList("ReservationDAO.getMyReservationList", userVo);
		return result;
	}
	
	// 월별 예약가능 날짜 조회 
	public List<EgovMap> getMonthlyAvailableTimeSlots(int classId, String startDate, String endDate) {
		
		Map<String, Object> params = new HashMap<>();
	    params.put("classId", classId);
	    params.put("startDate", startDate);
	    params.put("endDate", endDate);
		System.out.println("reservationDAO getMonthlyAvailableTimeSlots params : " + params);
		
		List<EgovMap> result = selectList("ReservationDAO.getMonthlyAvailableTimeSlots", params);
		return result;
	}
	
	// 관리자페이지 - 예약승인 (접수완료)
	public int adminReservationApproved(int reservationId) {
		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("reservationId", reservationId);
	    paramMap.put("reservationStatus", "approved");
	    
		
	    int result = update("ReservationDAO.adminReservationApproved", paramMap);
	    return result;
	}
	
	// 관리자 페이지 - 접수취소(예약거절)
	public int adminReservationReject(int reservationId) {
		
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("reservationId", reservationId);
	    paramMap.put("reservationStatus", "reject");
	    
		
	    int result = update("ReservationDAO.adminReservationReject", paramMap);
	    return result;
	}	
	
}
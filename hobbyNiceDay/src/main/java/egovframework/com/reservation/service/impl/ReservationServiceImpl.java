package egovframework.com.reservation.service.impl;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ReservationVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 예약 관련 서비스를 구현한 구현체
@Service("ReservationService")
public class ReservationServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.reservation.service.ReservationService {
    @Resource(name = "ReservationDAO")
    private ReservationDAO reservationDAO;
  
    
    // 관리자 예약 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getAdminReservationList() throws Exception {
        return reservationDAO.getAdminReservationList();  // 모든 사용자 리스트 가져오기
    }
    
 // 관리자페이지 예약 필터링 목록 조회
    public List<EgovMap> getAdminReservationFilteringList(Map<String, Object> paramMap) throws Exception{
    	return reservationDAO.getAdminReservationFilteringList(paramMap);  // 모든 사용자 리스트 가져오기
    }
    
    
    
    // 관리자페이지 예약 1건 정보 상세보기
    public ReservationVO getReservationInfo(String reservationId) throws Exception {
    	return reservationDAO.getReservationInfo(reservationId);
    }
    
    
    // 예약 등록
    @Override
    public int insertReservation(ReservationVO reservationVO) throws Exception {
        // 예약 생성
    	
        // Step 1: 예약 등록 (DB에 저장) (RESERVATION_ID 자동 생성)
        
        // 전화번호 암호화
        String encryptedPhone = EgovFileScrty.encode(reservationVO.getReservationPhone());
        reservationVO.setReservationPhone(encryptedPhone);
        
        // 이메일 암호화
        String encryptedEmail = EgovFileScrty.encode(reservationVO.getReservationEmail());
        reservationVO.setReservationEmail(encryptedEmail);
        
        
        // 예약비밀번호 암호화
        if(reservationVO.getReservationPw() != null) {
        	// 비회원 - 예약 비밀번호 있을 경우 암호화 o
        	String encryptedReservationPw = EgovFileScrty.encryptPassword(reservationVO.getReservationPw(),reservationVO.getReservationPhone() );
        	reservationVO.setReservationPw(encryptedReservationPw);
        }else {
        	// 회원 - 예약비밀번호 없을 경우 암호화x
        }
        
        // 예약 등록
        int reservationId = reservationDAO.insertReservation(reservationVO);
        reservationVO.setReservationId(reservationId);
        
        
        System.out.println("예약등록 후 reservationVO : " + reservationVO);
        
        return reservationId;
    }
    
    
    // 예약 등록 전 예약 정원 체크 
    public ReservationVO getAvailableSeatsCk(ReservationVO reservationVO) throws Exception{
    	ReservationVO resultVO = reservationDAO.getAvailableSeatsCk(reservationVO);
		return resultVO;
    }
	
    // 비회원 예약정보 검색 기능
 	public List<EgovMap> searchNonUserReservation(ReservationVO reservationVO) throws Exception{
 		
 		
 		// 전화번호 암호화
        System.out.println("비회원예약 검색 - 암호화 하기전 전화번호 : " + reservationVO.getReservationPhone());
        String encryptedPhone = EgovFileScrty.encode(reservationVO.getReservationPhone());
        System.out.println("비회원예약 검색 - 암호화 된 전화번호 : " + encryptedPhone);
        reservationVO.setReservationPhone(encryptedPhone);
        
        // 이메일 암호화
        System.out.println("비회원예약 검색 - 암호화 하기전 이메일 : " + reservationVO.getReservationEmail());
        String encryptedEmail = EgovFileScrty.encode(reservationVO.getReservationEmail());
        System.out.println("비회원예약 검색 - 암호화 된 이메일 : " + encryptedEmail);
        reservationVO.setReservationEmail(encryptedEmail);
        
        System.out.println("비회원예약 검색 - 암호화 전 예약비밀번호 : " + reservationVO.getReservationPw());
 	
        if(reservationVO.getReservationPw() != null) {
        	// 비회원 - 예약 비밀번호 있을 경우 암호화 o
        	String encryptedReservationPw = EgovFileScrty.encryptPassword(reservationVO.getReservationPw(),reservationVO.getReservationPhone() );
        	reservationVO.setReservationPw(encryptedReservationPw);
        }else {
        	// 회원 - 예약비밀번호 없을 경우 암호화x
        }
 		
 		
 		return reservationDAO.searchNonUserReservation(reservationVO);
 	} 
 	
 	
 // (달력 아래쪽) 관리자 페이지 예약현황(통계) 조회기능(선택한 날짜의 각 클래스 시간대별 예약 인원수, 예약건수)
 	public List<EgovMap> getReservationDayStatistics(String reservationDt, int intClassId) throws Exception {
 		return reservationDAO.getReservationDayStatistics(reservationDt, intClassId);

 	}
 	
 	// 관리자 예약현황(통계) 예약건수 선택시 클래스 시간대별 예약정보 목록
 	public List<EgovMap> getReservationStatusDetails(int classDetailId, int classId, String reservationDt)  throws Exception {
 		return reservationDAO.getReservationStatusDetails(classDetailId, classId, reservationDt);

 	} 
	
 	// (달력 오른쪽) 관리자 예약현황(통계) 날짜 선택 시 통합 정보 목록
 	public List<EgovMap> getReservationTotalDayStatistics(String reservationDt) throws Exception{
 		return reservationDAO.getReservationTotalDayStatistics(reservationDt);
 	}
	
 	
 	
    
 	// 비회원(회원) 예약 상세보기 기능
	public ReservationVO getReservationDetails(int reservationId) throws Exception{
		return reservationDAO.getReservationDetails(reservationId);
	} 

 	
    // 관리자페이지 예약승인대기 에약 목록 조회 
    @Override
    public java.util.List<EgovMap> getAdminPendingReservationList() throws Exception {
        return reservationDAO.getAdminPendingReservationList();
    }
    
	// 관리자페이지 예약상태 변경 기능
    @Override
	public int updateReservationStatus(int reservationId, String reservationStatus) throws Exception{
		return reservationDAO.updateReservationStatus(reservationId, reservationStatus);
	}
	
    // 특정 날짜에 클래스 시간대별 예약 가능 좌석 수 조회
	@Override
    public List<EgovMap> getAvailableTimeSlots(int classId, String reservationDt) throws Exception {
        return reservationDAO.getAvailableTimeSlots(classId, reservationDt);
    }
	
	// 월별 예약가능 날짜
	@Override
	public List<EgovMap> getMonthlyAvailableTimeSlots(int classId, String startDate, String endDate) throws Exception {
	    
	    return reservationDAO.getMonthlyAvailableTimeSlots(classId, startDate, endDate);
	}
	
	
	
	// 관리자 예약 정보 수정
	@Override
	public int updateReservationInfo(ReservationVO reservationVO) throws Exception{
		
		// (일단 예약 등록에서 복사해옴)
		// 전화번호 암호화
        System.out.println("예약수정 - 암호화 하기전 전화번호 : " + reservationVO.getReservationPhone());
        String encryptedPhone = EgovFileScrty.encode(reservationVO.getReservationPhone());
        System.out.println("예약수정 - 암호화 된 전화번호 : " + encryptedPhone);
        reservationVO.setReservationPhone(encryptedPhone);
        
        // 이메일 암호화
        System.out.println("예약수정 - 암호화 하기전 이메일 : " + reservationVO.getReservationEmail());
        String encryptedEmail = EgovFileScrty.encode(reservationVO.getReservationEmail());
        System.out.println("예약수정 - 암호화 된 이메일 : " + encryptedEmail);
        reservationVO.setReservationEmail(encryptedEmail);
        
        
		return reservationDAO.updateReservationInfo(reservationVO);
	}
			
	// 관리자 페이지 - 예약 승인(접수완료) 기능
	@Override
	public int adminReservationApproved(HashMap<String, Object> params)  throws Exception {
		return reservationDAO.adminReservationApproved(params);
	}
	
	// 관리자 페이지 - 접수취소 기능
	@Override
	public int adminReservationReject(int reservationId)  throws Exception {
		return reservationDAO.adminReservationReject(reservationId);
	}
	
	
	// 관리자 페이지 - 예약취소 기능
	@Override
	public int myReservationCancel(int reservationId)  throws Exception {
		return reservationDAO.myReservationCancel(reservationId);
	}
	
	// 관리자 페이지 - 예약 삭제 기능
	public int deleteReservation(int reservationId)  throws Exception {
		return reservationDAO.deleteReservation(reservationId);
	}
	
	
	// 마이페이지 1명 회원 예약 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getMyReservationList(Map<String, Object> params) throws Exception {
        return reservationDAO.getMyReservationList(params);  // 한 사용자의 예약 리스트 가져오기
    }
    
    // 마이페이지 회원별 전체 예약건수
    @Override
    public int getReservationCount(String userId)  throws Exception {
    	  return reservationDAO.getReservationCount(userId); // 전체 예약 수 조회
    }
    
    
    
    // 예약번호 생성 메서드
    public String generateReservationNum(ReservationVO reservationVO) throws Exception {
    	// 날짜-클래스ID-랜덤번호 형식의 예약 번호 생성
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String classId = String.valueOf(reservationVO.getClassId());
        //String uniqueNumber = String.format("%04d", new Random().nextInt(10000));

        return date + "-" + classId ;
    }
    
    
}
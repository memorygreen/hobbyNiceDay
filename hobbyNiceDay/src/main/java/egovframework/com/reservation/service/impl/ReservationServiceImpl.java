package egovframework.com.reservation.service.impl;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.ReservationVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 예약 관련 서비스를 구현한 구현체
@Service("ReservationService")
public class ReservationServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.reservation.service.ReservationService {
    @Resource(name = "ReservationDAO")
    private ReservationDAO reservationDAO;
    
    // 남은 좌석 확인 
    @Override
    public int getRemainingSeats(int classDetailId, String reservationDate) throws Exception {
        // DAO를 통해 남은 좌석 수 조회
        return reservationDAO.getRemainingSeats(classDetailId, reservationDate);
    }
    
    // 관리자 예약 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getAdminReservationList() throws Exception {
        return reservationDAO.getAdminReservationList();  // 모든 사용자 리스트 가져오기
    }
    
    // 관리자페이지 예약 1건 정보 상세보기
    public ReservationVO getReservationInfo(String reservationId) throws Exception {
    	return reservationDAO.getReservationInfo(reservationId);
    }
    
    
    // 예약 등록
    @Override
    public int insertReservation(ReservationVO reservationVO) throws Exception {
        // 예약 생성
    	
    	// Step 1: 예약 번호 생성
        String reservationNum = generateReservationNum(reservationVO);
        reservationVO.setReservationNum(reservationNum); // 생성된 예약 번호를 ReservationVO에 설정
        System.out.println("예약번호 생성 됐는지 확인 : " + reservationNum);
        
        
        // Step 2: 예약 등록 (DB에 저장) (RESERVATION_ID 자동 생성)
        
        // 전화번호 암호화
        System.out.println("예약등록 - 암호화 하기전 전화번호 : " + reservationVO.getReservationPhone());
        String encryptedPhone = EgovFileScrty.encode(reservationVO.getReservationPhone());
        System.out.println("예약등록 - 암호화 된 전화번호 : " + encryptedPhone);
        reservationVO.setReservationPhone(encryptedPhone);
        
        // 이메일 암호화
        System.out.println("예약등록 - 암호화 하기전 이메일 : " + reservationVO.getReservationEmail());
        String encryptedEmail = EgovFileScrty.encode(reservationVO.getReservationEmail());
        System.out.println("예약등록 - 암호화 된 이메일 : " + encryptedEmail);
        reservationVO.setReservationEmail(encryptedEmail);
        
        
        // 예약 등록
        int reservationId = reservationDAO.insertReservation(reservationVO);
        
        System.out.println("예약 등록 id result : " + reservationId);
        
        reservationVO.setReservationId(reservationId);
        System.out.println("예약번호 업데이트 하기 전 reservationVO : " + reservationVO);
        // Step 3: 예약 번호 업데이트 (RESERVATION_NUM 조합)
        int updateResult = reservationDAO.updateReservationNum(reservationVO);
        System.out.println("예약번호 업데이트 성공했는지 확인 : " + updateResult);
        
        return reservationId;
    }
    
    // 관리자페이지  승인대기 에약 목록 조회 
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
			
	// 관리자 페이지 - 예약 승인 기능
	public int adminReservationApproved(int reservationId)  throws Exception {
		return reservationDAO.adminReservationApproved(reservationId);
	}
	
// 관리자 페이지 - 접수취소 기능
	public int adminReservationReject(int reservationId)  throws Exception {
		return reservationDAO.adminReservationReject(reservationId);
	}
	
	// 마이페이지 1명 회원 예약 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getMyReservationList(UserVO userVo) throws Exception {
        return reservationDAO.getMyReservationList(userVo);  // 한 사용자의 예약 리스트 가져오기
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
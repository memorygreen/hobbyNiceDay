package egovframework.com.classes.service.impl;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.ClassVO;
import egovframework.com.cmm.HolidayVO;
import egovframework.com.cmm.ImgVO;
import egovframework.com.cmm.UserVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

// 회원 관련 서비스를 구현한 구현체
@Service("ClassService")
public class ClassServiceImpl extends EgovAbstractServiceImpl implements egovframework.com.classes.service.ClassService {
    @Resource(name = "ClassDAO")
    private ClassDAO classDAO;
    
//    public List<ClassAvailableVO> getAvailableDates(String start, String end) {
//        return classMapper.selectAvailableDates(start, end);
//    }
    
    // 클래스 등록
    @Override
    public int insertClass(ClassVO classVO) throws Exception {
    	int result = classDAO.insertClass(classVO);
    	return result;
    };
    
    // 이미지 등록
    @Override
    public int insertImage(ImgVO imgVO) throws Exception {
        // 이미지 저장 후 imgId 반환
        return classDAO.insertImage(imgVO);
    }
    
    
    // 휴무일 등록 
    @Override
    public int insertHoliday(HolidayVO holidayVO) throws Exception {
    	// 휴무일 저장 후 holidayId 반환
        return classDAO.insertHoliday(holidayVO);
    }
    
    // 클래스 세부정보 등록 
    @Override
    public int insertClassDetail(ClassVO classVO) throws Exception {
    	// 휴무일 저장 후 classDetailId 반환
        return classDAO.insertClassDetail(classVO);
    }
    
    
    // 관리자 클래스 전체 테이블 조회
    @Override
    public java.util.List<EgovMap> getAdminClassList() throws Exception {
        return classDAO.getAdminClassList();  // 모든 사용자 리스트 가져오기
    }
    
    // 메인화면 클래스 전체 테이블 조회 (게시여부 Y인것들만)
    @Override
    public List<EgovMap> getMainClassList() throws Exception {
        return classDAO.getMainClassList();  // 모든 사용자 리스트 가져오기
    }
    
    

	// 클래스 전체 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassAllList() throws Exception{
		return classDAO.getClassAllList();  // 게시중인 전체 클래스 목록 가져오기
	}
	
	// 클래스 공예 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassCraftsList() throws Exception{
		return classDAO.getClassCraftsList();  // 게시중인 전체 클래스 목록 가져오기
	}
		
	
	// 클래스 미술 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassArtList() throws Exception{
		return classDAO.getClassArtList();  // 게시중인 전체 클래스 목록 가져오기
	}
		
	// 클래스 요리제빵 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassCookingList() throws Exception{
		return classDAO.getCookingArtList();  // 게시중인 전체 클래스 목록 가져오기
	}
    
    
    
	// 클래스 전체 리스트 개수 (게시중인거 모두)
	public int getAllClassCount() throws Exception{
		return classDAO.getAllClassCount();
	}
	
	// 클래스 공예 리스트 개수 (게시중인거 모두)
	public int getCraftsCount() throws Exception{
		return classDAO.getCraftsCount();
	}
		
		
	// 클래스 미술 리스트 개수 (게시중인거 모두)
	public int getArtCount() throws Exception{
		return classDAO.getArtCount();
	}
		
	// 클래스 요리제빵 리스트 개수 (게시중인거 모두)
	public int getCookingCount() throws Exception{
		return classDAO.getCookingCount();
	}
			

    // 페이징 용 테스트 클래스 전체 리스트 조회 (게시중인거 모두)
	public List<EgovMap> getClassAllListPaging(int offset, int pageSize) throws Exception{
		return classDAO.getClassAllListPaging(offset, pageSize);
	}
	
	
	// (최종) 클래스 리스트 - 카테고리별 , 페이징 포함  
	public List<EgovMap> getClassListByCategory(Map<String, Object> params) throws Exception{
		return classDAO.getClassListByCategory(params);
	}
    
	
	// (최종) 클래스 리스트 - 카테고리별 클래스 개수 구하기
	public int getClassCountByCategory(Map<String, Object> params)throws Exception{
		return classDAO.getClassCountByCategory(params);
	}
    
    // 클래스 상세보기
    public ClassVO getClassDetails(int classId) throws Exception {
    	return classDAO.getClassDetails(classId);
    }
    // 클래스 상세보기 - 해당 클래스 휴무일 조회
	public List<EgovMap> getHolidaysByClassId(int classId) throws Exception {
		System.out.println("휴무일조회 serviceImpl classId : " + classId);
		return classDAO.getHolidaysByClassId(classId);
	}
	
	// 클래스 상세보기 - 해당 클래스 수강시간대 조회 
	public List<EgovMap> getTimeSetsByClassId(int classId) throws Exception {
		return classDAO.getTimeSetsByClassId(classId);
			
	}
	
	// 관리자 - 클래스 수정 - 새로 등록할 휴무일에 예약 있는지 여부 확인 
	public int hasReservationsOnDate(int classId, Date holidayDt) throws Exception{
		return classDAO.hasReservationsOnDate(classId, holidayDt);
	}
	
	// 관리자 - 클래스 수정 - 새로 등록할 휴무일이 이미 존재하는 휴무일인지 확ㅇ인
	public int ckDuplicateHoliday(int classId, Date holidayDt)  throws Exception{
		return classDAO.ckDuplicateHoliday(classId, holidayDt);
	}
	
	// 관리자 - 클래스 수정 - 휴무일 새로 등록
	public int adminClassUpdateInsertHoliday(HolidayVO holidayVO) throws Exception{
		return classDAO.adminClassUpdateInsertHoliday(holidayVO);
	}
    
	// 관리자 - 클래스 수정 - 기존 휴무일 삭제
	public int adminClassUpdateDeleteHoliday(int holidayId)  throws Exception{
		return classDAO.adminClassUpdateDeleteHoliday(holidayId);
	}
	
	// 관리자 클래스 수정 기능 (휴무일 제외)
	public int adminClassUpdate(ClassVO classVO) throws Exception {
		return classDAO.adminClassUpdate(classVO);

	}
		
		
    // 241101
    // 이미지 등록 테스트
    @Override
    public int saveItem(ImgVO imgVO , MultipartFile imgFile, String savePath) throws Exception{

        String oriImgName = imgFile.getOriginalFilename();
        String imgNm = "";
        
        // 경로 지정
        // String projectPath = System.getProperty("user.dir") + "/src/main/resources/static/files/";
        // 절대경로(테스트)
        String projectPath = "C:/Users/user/git/hobbyNiceDay/hobbyNiceDay/src/main/resources/static/files";
        
        
        System.out.println("다른 경로 : "+ savePath);
        // 파일경로 존재하지 않을 경우 폴더 생성
        
        //File folder = new File(projectPath);
        File folder = new File(savePath);
        
		if (!folder.exists()) {
			folder.mkdirs();
		}
        

        // UUID 를 이용하여 파일명 새로 생성
        // UUID - 서로 다른 객체들을 구별하기 위한 클래스
        UUID uuid = UUID.randomUUID(); // // UUID는 이미지 이름 중복 방지 위해 랜덤하게 생성된 고유값
        String savedFileName = uuid + "_" + oriImgName; // 파일명 -> imgName

        imgNm = savedFileName;

        // File saveFile = new File(projectPath, imgNm);
        File saveFile = new File(savePath, imgNm);
        

        imgFile.transferTo(saveFile);

        imgVO.setImgNm(imgNm);
        imgVO.setImgUrl(savePath + "/" + imgNm); //path // 이걸 불러오면 화면에서 조회됨?????

        return classDAO.saveItem(imgVO);
    }
    
    
    
    // 이미지 조회 테스트
    @Override
    public List<ImgVO> getImagesByClassId(int imgId) throws Exception {
        return classDAO.getImagesByClassId(imgId);
    }
    
    // 관리자 - 클래스 삭제
    @Transactional(timeout = 30) // 트랜잭션 타임아웃 설정
    @Override
    public int deleteClass(int classId) throws Exception {
    	
    	// 0. 관련된 예약 정보 삭제
    	// int deleteReservationId = 
		classDAO.deleteReservationByClassId(classId);
        // System.out.println("클래스 삭제 - 예약정보 삭제 deleteReservationId" + deleteReservationId);

        
        // 1. 관련된 클래스 세부 정보 삭제
        // int deleteClassDetailId = 
		classDAO.deleteClassDetailByClassId(classId);
        // System.out.println("클래스 삭제 - 클래스 세부정보 삭제 deleteClassDetailId" + deleteClassDetailId);
        
        // 2. 관련 이미지 삭제 (img_id가 있을 경우)
        // int deleteImg = 
		classDAO.deleteImageByClassId(classId);
        // System.out.println("클래스 삭제 - 이미지 삭제 deleteImg" + deleteImg);
        

        // 3. 관련 휴일 정보 삭제
        // int deleteHoliday = 
		classDAO.deleteHolidayByClassId(classId);
        // System.out.println("클래스 삭제 - 클래스 세부정보 삭제 deleteHoliday" + deleteHoliday);
    	
        
        // 4. 클래스 삭제
        int deleteClass = classDAO.deleteClassById(classId);
        System.out.println("클래스 삭제 - 클래스 삭제 deleteClass" + deleteClass);
        return deleteClass;
    }
}
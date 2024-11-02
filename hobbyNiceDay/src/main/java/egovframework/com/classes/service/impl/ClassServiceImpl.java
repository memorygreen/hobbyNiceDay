package egovframework.com.classes.service.impl;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;
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
    
    // 클래스 상세보기
    public ClassVO getClassDetails(int classId) throws Exception {
    	return classDAO.getClassDetails(classId);
    }
    
    
    // 241101
    // 이미지 등록 테스트
    @Override
    public int saveItem(int intClassId, ImgVO imgVO , MultipartFile imgFile) throws Exception{

        String oriImgName = imgFile.getOriginalFilename();
        String imgNm = "";
        
        // 경로 지정
        // String projectPath = System.getProperty("user.dir") + "/src/main/resources/static/files/";
        // 절대경로(테스트)
        String projectPath = "C:/Users/user/git/hobbyNiceDay/hobbyNiceDay/src/main/resources/static/files";
        
        // 파일경로 존재하지 않을 경우 폴더 생성
        File folder = new File(projectPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
        

        // UUID 를 이용하여 파일명 새로 생성
        // UUID - 서로 다른 객체들을 구별하기 위한 클래스
        UUID uuid = UUID.randomUUID(); // // UUID는 이미지 이름 중복 방지 위해 랜덤하게 생성된 고유값
        String savedFileName = uuid + "_" + oriImgName; // 파일명 -> imgName

        imgNm = savedFileName;

        File saveFile = new File(projectPath, imgNm);

        imgFile.transferTo(saveFile);

        imgVO.setImgNm(imgNm);
        imgVO.setImgUrl("/files/" + imgNm); //path // 이걸 불러오면 화면에서 조회됨?????

        return classDAO.saveItem(imgVO);
    }
    
    
    
    // 이미지 조회 테스트
    @Override
    public List<ImgVO> getImagesByClassId(int imgId) throws Exception {
        return classDAO.getImagesByClassId(imgId);
    }
    
}
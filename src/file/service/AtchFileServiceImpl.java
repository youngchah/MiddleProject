package file.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import file.dao.AtchFileDaoImpl;
import file.dao.IAtchfileDao;
import file.vo.AtchFileVO;


public class AtchFileServiceImpl implements IAtchFileService{
	
	private static final String UPLOAD_DIR = "upload_files";
	
	private IAtchfileDao fileDao;
	
	private static IAtchFileService fileService;
	
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	//싱글톤 
	public static IAtchFileService getInstance() {
		if(fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		return fileService;
	}
	
	@Override
	public AtchFileVO saveAtchFileList(Collection<Part> parts) {
								
		// 웹애플리케이션 루트 디렉토리를 기준으로 업로드 경로 설정하기
		
		String uploadPath = "E:/D_setting/A_TeachingMaterial/04_MiddelProject/workspace/TripCatch/WebContent/" + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		boolean isFirstFile = true; // 첫번째 파일 여부
		
		AtchFileVO atchFileVO = null;
		
		for(Part part : parts) {
			
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.equals("")) {
				
				if(isFirstFile) {
					isFirstFile = false;
					
					// 파일기본정보 저장하기
					atchFileVO = new AtchFileVO();
					fileDao.insertAtchFile(atchFileVO);
				}
				
				
				String orignFileName = fileName; // 원본파일명
				long fileSize = part.getSize(); // 파일사이즈
				String saveFileName = ""; // 저장파일명
				String saveFilePath = ""; // 저장파일경로 
				// 확장자 추출 
				String fileExt = orignFileName.lastIndexOf(".") < 0 ? "" : 
					orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
				
				saveFileName = UUID.randomUUID().toString().replace("-", "");
				//뒤에 확장자명 붙여주고 저장하기 
				saveFilePath = uploadPath + "/" + saveFileName + "." + fileExt;
				
				try {
					// 업로드 파일 저장하기
					part.write(saveFilePath);
				} catch (IOException ex) {	//RuntimeException은 try/catch 강제화하지않음 
					throw new RuntimeException("업로드 파일 저장중 예외발생!!!", ex);
				}
				
				
				
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(orignFileName);
				atchFileVO.setFileStreCours(saveFilePath);
				atchFileVO.setFileExtsn(fileExt);
				atchFileVO.setFileCn("");
				
				// 파일 세부정보 저장하기 
				fileDao.insertAtchFileDetail(atchFileVO);
				
				try {
					part.delete(); // 임시 업로드 파일 삭제하기 
				} catch (IOException e) {
					throw new RuntimeException("업로드 파일 삭제중 예외발생", e);
					
				}
			}
		}
		
		return atchFileVO;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		List<AtchFileVO> atchFileList = fileDao.getAtchFileList(atchFileVO);
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		return fileDao.getAtchFileDetail(atchFileVO);
	}
	
//	public static void main(String[] args) {
//		System.out.println(UUID.randomUUID().toString().replace("-", ""));
//	}

}

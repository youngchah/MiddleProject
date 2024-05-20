package community.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import city.controller.CityMapper;
import community.service.AtchFileServiceImpl;
import community.service.ComServiceImpl;
import community.service.IAtchFileService;
import community.service.IComService;
import community.vo.AtchFileVO;
import community.vo.ComVO;
import community.vo.CombineComVO;
import member.vo.MemberVO;

@MultipartConfig
@WebServlet("/community/insert.do")
public class InsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
		if (loginUser != null) {
	        // 로그인된 상태
			req.getSession().setAttribute("MEM_ID", loginUser.getMem_Id());
	        req.getRequestDispatcher("/views/community/insert.jsp").forward(req, resp);
	        
	    } else {
	        // 로그인되지 않은 상태
	        // 로그인 페이지로 이동
	    	
	    	// 현재 URL을 세션 속성에 저장 후 로그인페이지로 이동하면 로그인 하고 그 이전 페이지로 바로 이동함
	        String currentURL = req.getRequestURI();
	        req.getSession().setAttribute("redirectURL", currentURL);
	    	
	    	String alertMessage = "로그인이 필요합니다.";
	        String redirectPath = req.getContextPath() + "/login.do";
	        
	        String alertScript = "<script>alert('" + alertMessage + "'); window.location.href='" + redirectPath + "';</script>";

	        resp.setContentType("text/html; charset=UTF-8");
	        resp.getWriter().println(alertScript);
	        
//	        String redirectURL = (String) req.getSession().getAttribute("redirectURL");
	        
	    }
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("LOGIN_USER");
		
		System.out.println("insertCon 멤아이디 : "+mv.getMem_Id());
		
		/**
		 * cityName으로 넘어오는데 CityMapper.getCityNum(cityName)하면 알아서 cityNum으로 바뀜
		 */
		String cityName = req.getParameter("city_name");
		int cityNum = CityMapper.getCityNum(cityName);
		
		String comTitle = req.getParameter("com_title");
		String comCont = req.getParameter("contents");
		
		ComVO commuVO = new ComVO();
		commuVO.setCityNum(cityNum);
		commuVO.setCityName(cityName);
		commuVO.setComTitle(comTitle);
		commuVO.setComCont(comCont);
		commuVO.setMemId(mv.getMem_Id());

		IComService comService = ComServiceImpl.getInstance();
		int cnt = comService.registCom(commuVO);
		
		System.out.println("insertControl 컨트롤러 cnt : "+cnt);
		
		//성공하면 커뮤니티 리스트 페이지로 이동
		resp.sendRedirect(req.getContextPath() + "/community/list.do"); 
	}
		
		
		// `request`에서 폼 데이터 파싱 (Apache Commons FileUpload 라이브러리 사용 권장)
        // 예: FileItemFactory factory = new DiskFileItemFactory();
        // 예: ServletFileUpload upload = new ServletFileUpload(factory);


        // 이미지 파일 처리
		// 여러 파일을 처리합니다.
//		Collection<Part> fileParts = req.getParts().stream()
//		    .filter(part -> "con_cn".equals(part.getName()) && part.getSize() > 0)
//		    .collect(Collectors.toList());
//		
//		System.out.println(fileParts.size());

		// 각 파일에 대해 반복 처리
//		for (Part filePart : fileParts) {
//		    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//		    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
//		    long fileSize = filePart.getSize();
//		    String fileSizeAsString = String.valueOf(fileSize);

		    // 파일 저장 경로 설정
//		    String directoryPath = "C:/uploads/images/";
//		    File directory = new File(directoryPath);
//		    if (!directory.exists()) {
//		        directory.mkdirs();
//		    }
//
//		    String filePath = directoryPath + fileName;
//		    filePart.write(filePath);

		    // 데이터베이스에 저장할 정보 설정
//		    CombineComVO comPhotoVO = new CombineComVO();
//		    comPhotoVO.setComPhotoName(fileName);
//		    comPhotoVO.setComPhotoPath(filePath);
//		    comPhotoVO.setComPhotoEx(fileExtension);
//		    comPhotoVO.setComPhotoSize(fileSizeAsString);
//		    comPhotoVO.setCom_title(com_title);

		    // 데이터베이스에 파일 정보 저장
//		    comService.fileInsert(comPhotoVO);
		    
//		    System.out.println("파일저장 횟수");
//		}

        
        // 사진 정보도 저장 (여러 개일 경우 반복문 사용)

        // 저장 후 처리
        
		
//		System.out.println(com_cn);
//		System.out.println(city_name);
//		System.out.println(com_title);

		// 서비스 객체 생성
//		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
//
//		AtchFileVO atchFileVO = new AtchFileVO();

		// 첨부파일 목록 저장하기(공통기능 사용)
//		atchFileVO = fileService.saveAtchFileList(req.getParts());

		

//		ComVO cv = new ComVO(city_name, com_title, com_cn);
		
	

//		String msg = "";
//
//		if (cnt > 0) {
//			msg = "성공";
//		} else {
//			msg = "실패";
//		}
//
//		req.getSession().setAttribute("msg", msg);


}

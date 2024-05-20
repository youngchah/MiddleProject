package file.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import file.service.AtchFileServiceImpl;
import file.service.IAtchFileService;
import file.vo.AtchFileVO;

@MultipartConfig
@WebServlet("/file/testupload.do")
public class AtchFileTest2 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/file/testupload.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		// 첨부파일 목록 저장하기 (공통기능 사용)
		atchFileVO = fileService.saveAtchFileList(req.getParts());
		
		
		
		
		
		
		
	}
}

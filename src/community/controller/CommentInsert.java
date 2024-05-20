package community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.ComCommentServiceImpl;
import community.vo.ComCommentVO;

@WebServlet("/community/commentinsert.do")
public class CommentInsert extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/community/detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String com_com_cn = req.getParameter("com_com_cn");
		
		ComCommentServiceImpl comcomService = (ComCommentServiceImpl) ComCommentServiceImpl.getInstance();
		
		ComCommentVO ccv= new ComCommentVO(com_com_cn);
		
		comcomService.registComComment(ccv);
		
		resp.sendRedirect(req.getContextPath() + "/community/detail.do");
		
		
	}

}

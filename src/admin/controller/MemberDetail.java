package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/detail.do")
public class MemberDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String memId = req.getParameter("mem_Id");
	IMemberService memberService = MemberServiceImpl.getInstance();
	
	System.out.println(memId + "<<<<<<<<<<<<<<#@$!#@%$@#%!@%");
	
	MemberVO mv = memberService.getMember(memId);
	
	req.setAttribute("mv", mv);
	System.out.println(mv + "<<<<<<<<<<<<<<<<<<!@$@!$$^^%&$^%#@#%@!%#$%@");
	req.getRequestDispatcher("views/admin/memberDetail.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}

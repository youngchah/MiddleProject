package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/memberinfo.do")
public class MemberInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	HttpSession session = req.getSession();	
	
	MemberVO member = (MemberVO)session.getAttribute("LOGIN_USER");
	System.out.println(member + "<<<<<  일단 여기는 오나?? 여기는 멤버 인포");
	
	String memId = member.getMem_Id();
	IMemberService memberService = MemberServiceImpl.getInstance();
	
	System.out.println(memId + "<<<<<<<<<<<<<<#@$!#@%$@#%!@%");
	
	MemberVO mv = memberService.getMember(memId);
	
	req.setAttribute("mv", mv);
	System.out.println(mv + "<<<<<<<<<<<<<<<<<<!@$@!$$^^%&$^%#@#%@!%#$%@");
	req.getRequestDispatcher("views/plan/memberinfo.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}

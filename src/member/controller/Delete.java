package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/Delete.do")
public class Delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO)session.getAttribute("LOGIN_USER");
		
		System.out.println("delete.do 포스트 진입은하나?");
        // 클라이언트로부터 전달받은 비밀번호
        String enteredPassword = req.getParameter("password");
		
		System.out.println(enteredPassword + " 입력받은 비밀번호");
		IMemberService memberService = MemberServiceImpl.getInstance();

		String memId = mv.getMem_Id();
		String memPass = mv.getMem_Pass();	
		System.out.println(memId + " 여기는 Delete.do");
		// DB에서 현재 로그인 중인 회원의 비밀번호를 가져옵니다.
		String storedPassword = memPass;
		
		System.out.println(storedPassword+ "db에 있는 패스워드");
		mv.setMem_Id(memId);
		
		PrintWriter out = resp.getWriter();
		
		
		// 비밀번호 일치 여부 확인
		if (enteredPassword.equals(storedPassword)) {
			// 비밀번호가 일치하면 회원 삭제 또는 처리할 로직을 수행합니다.
			// 여기에서는 간단하게 "success"를 응답으로 보냅니다.
			out.write("success");
			out.flush();
			System.out.println("Delete if문 돌아가나??");
		} else {
			// 비밀번호가 일치하지 않으면 "failure"를 응답으로 보냅니다.
			resp.getWriter().print("failure");
			out.flush();
			System.out.println("Delete elseif문 돌아가나??");
		}
		
		
		int cnt = memberService.deleteMember(mv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		
		req.getSession().setAttribute("msg", msg);
		
		
	
		

	}
	
}

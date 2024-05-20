package member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/join.do")
public class MemberJoin extends HttpServlet {

    private IMemberService memberService;

    public MemberJoin() {
        memberService = MemberServiceImpl.getInstance();
    }

    // 회원가입 폼을 보여주는 GET 요청을 처리하는 메서드
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	req.setCharacterEncoding("UTF-8");
    	resp.setContentType("text/html; charset=UTF-8");
    	
    	 System.out.println("여기까지 오나?");
    	
    	req.getRequestDispatcher("/views/member/join.jsp").forward(req, resp);
    }

    // 회원가입 폼에서 POST 요청을 처리하는 메서드
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	req.setCharacterEncoding("UTF-8");
    	resp.setContentType("text/html; charset=UTF-8");
    	// 폼 데이터 가져오기
        String memId = req.getParameter("mem_Id");
        String memPass = req.getParameter("mem_Pass");
        String memName = req.getParameter("mem_Name");
        String memNick = req.getParameter("mem_Nick");
        String memMail = req.getParameter("mem_Email");
        String memTel = req.getParameter("mem_Tel");
        String memBir = req.getParameter("mem_Bir");
        String memPc = req.getParameter("mem_Pc");
        String memAddr1 = req.getParameter("mem_Addr1");
        String memAddr2 = req.getParameter("mem_Addr2");
        //System.out.println(memName);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date memBirDate = null;
        try {
            memBirDate = dateFormat.parse(memBir);
            
        } catch (ParseException e) {
            e.printStackTrace(); // 날짜 형식이 올바르지 않을 경우의 예외 처리
        }
        
        
        // 회원 정보 객체 생성
        MemberVO mv = new MemberVO();
        mv.setMem_Id(memId);
        mv.setMem_Pass(memPass);
        mv.setMem_Name(memName);
        mv.setMem_Nick(memNick);
        mv.setMem_Email(memMail);
        mv.setMem_Tel(memTel);
        mv.setMem_Bir(memBirDate);
        mv.setMem_Pc(memPc);
        mv.setMem_Addr1(memAddr1);
        mv.setMem_Addr2(memAddr2);

       //System.out.println(mv.getMem_Addr1());
        
        // 회원가입 서비스 호출
        int result = memberService.registMember(mv);

        if (result > 0) {
            // 회원가입 성공시
            req.setAttribute("joinCode", "yes");
            req.setAttribute("message", "회원가입이 완료되었습니다. 로그인해주세요.");
        } else {
            // 회원가입 실패시
            req.setAttribute("joinCode", "no");
            req.setAttribute("message", "회원가입 등록에 실패하였습니다.");
        }

        // 요청을 다른 리소스로 전달
        RequestDispatcher disp = req.getRequestDispatcher("/views/member/loginForm.jsp");
        disp.forward(req, resp);
    }
}

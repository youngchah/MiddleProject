package admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/memberList.do")
public class MemberList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int currentPage = 1; // 현재 페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page").replaceAll("\\D", ""));
	
		
		System.out.println(req.getParameter("page") + "dkfjlsjflsdj;fsjdklfjslj");
		// 전체 글 갯수 얻기 위한 서비스객체 필요
		IMemberService memberService = MemberServiceImpl.getInstance();
		int totalCount = memberService.countMember();
		System.out.println("토탈페이지" + totalCount);
		
		// 화면에 표시될 페이지의 수
		int perPage = 5;
		
		// 한 페이지 당 출력할 글 갯수
		int perList = 10;
		
		
		// 전체 페이지 수 = 전체 글 갯수 / 페이지 당 글 객수
		int totalPage = (int)Math.ceil((double)totalCount / (double)perList);
		
		// 페이지당 출력할 회원목록 범위 값 구하기
		int start = (currentPage -1) * perList +1;
		
		// 전체 회원 목록 갯수를 초과하는 end범위 값 조절
		int end = start + perList -1;
		if(end > totalCount) end = totalCount;
		
		// 화면에 표시될 페이지 범위 구하기
		int startPage = ((currentPage - 1) / perPage * perPage)+1;
		
		int endPage = startPage + perPage -1;
		if (endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		// 범위 별 회원 정보 가져오기 
		List<MemberVO> list = memberService.memberList(map);
		
		// request 객체에 정보담아서 페이지로 전달
		req.setAttribute("list", list);
		
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		
		req.setAttribute("ttPage", totalPage);
		
		System.out.println(totalPage);
		
		req.getRequestDispatcher("/views/admin/memberList.jsp").forward(req, resp);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
	
	
}

package cs.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;

@WebServlet("/mypage/qnalist")
public class QnaList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시판 정보 조회 및 해당 게시글에 대한 페이징 정보 생성하기

		int currentPage = 1; // 현재 페이지
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));

		// 전체 글 갯수 얻기 위한 서비스객체 필요
		ICsService csService = CsServiceImpl.getInstance();
		int totalCount = csService.countList(); // 전체 글갯수

		// 화면에 표시할 페이지의 수
		int perPage = 5;

		// 한 페이지 당 출력할 글 갯수
		int perList = 10;

		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지 당 글 갯수(perList)
		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);

//		System.out.println(totalPage);

		// 페이지 당 출력할 게시글 범위(start ~ end) 값 구하기
		// start = (currentPage - 1) * perList +1;
		// 1페이지 일때 : (1-1) * 5 + 1 =1
		// 2페이지 일때 : (2-1) * 5 + 1 =6
		// 3페이지 일때 : (3-1) * 5 + 1 =11
		// 4페이지 일때 : (4-1) * 5 + 1 =16
		// 5페이지 일때 : (5-1) * 5 + 1 =21
		int start = (currentPage - 1) * perList + 1;

		// end = start + perList -1;
		// 1페이지 일때 : 1 + 5 - 1 = 5
		// 2페이지 일때 : 6 + 5 - 1 = 10
		// 3페이지 일때 : 11 + 5 - 1 = 15
		// 4페이지 일때 : 16 + 5 - 1 = 20
		// 5페이지 일때 : 21 + 5 - 1 = 25

		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount; // 전체 글갯수를 초과하는 end범위 값 조절

		// 화면에 표시될 페이지 범위 구하기 (startPage ~ endPage)
		// startPage = ((currentPage -1) / perPage * perPage) +1;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;

//				for(int i = 1; i < 10; i++) {
//					startPage = ((i -1) / perPage * perPage) +1;
//					System.out.println(i + "페이지 일 때 시작페이지 범위 >>" + startPage);
//				}
		// endPage = startPage + perPage -1;
		int endPage = startPage + perPage - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		//범위 별 게시물 정보 가져오기 
		List<NoticeVO> notiList = csService.displayNotice(map);
		
		//request객체에 정보담아서 페이지로 전달
		req.setAttribute("notiList", notiList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		
		req.setAttribute("ttPage", totalPage);
		
		//jsp를 전달 
//		req.getRequestDispatcher("/views/mypage/cs.jsp").forward(req, resp);
		//faq리스트 객체 생성 
		List<FaqVO> faqList = csService.displayFaq();
		
		
		req.setAttribute("faqList", faqList);
		
		
//		SQL_LOGGER.info("SQL : " + csService.displayFaq());
		//세션객체생성 
		HttpSession session = req.getSession();
		MemberVO memId = (MemberVO) session.getAttribute("LOGIN_USER");
		AdminVO admin = (AdminVO) session.getAttribute("LOGIN_ADMIN");
		
//		String memId = req.getParameter("memId");
//		String memId = "a002";
		
		System.out.println(memId);
		List<QnaVO> qnaCusList = new ArrayList<>();
		
		// 로그인한 사용자가 일반 사용자인 경우
		if (memId != null) {
			qnaCusList = csService.qnaCusList(memId);
		}
		// 관리자 로그인인 경우
		else if( admin != null) {
			try {
				qnaCusList = csService.qnaAllList(admin);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 로그인하지 않은 경우 등에 대한 처리
		else {
		    qnaCusList = new ArrayList<>(); // 예를 들어 빈 리스트로 초기화
		}
		
		req.setAttribute("qnaCusList", qnaCusList);
		
	
		
		req.getRequestDispatcher("/views/mypage/qnalist.jsp").forward(req, resp);
		
	}
	
	
	
	/**
	 * 문의 수정 post
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

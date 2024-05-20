package community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.ComServiceImpl;
import community.service.IComService;
import community.vo.ComVO;

@WebServlet("/community/search.do")
public class SearchController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String com_title = (String) req.getParameter("com_title");

        System.out.println(com_title);

        IComService comService = ComServiceImpl.getInstance();

        List<ComVO> cv = comService.searchCom(com_title);

        req.setAttribute("searchList", cv);

        // 포워드를 완료하는 코드 추가
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/community/searchList.jsp");
        dispatcher.forward(req, resp);
    }
}


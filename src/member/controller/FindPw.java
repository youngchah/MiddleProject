package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/findPw.do")
public class FindPw extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		req.getRequestDispatcher("/views/member/findPw.jsp").forward(req, resp);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");


		// 입력 받은 이름과 휴대폰 번호 가져오기
		String memberId = req.getParameter("mem_Id");
		String memberEmail = req.getParameter("mem_Email");

		if (memberId == null)
			System.out.println("빈값");

		System.out.println(memberId + " FindPw " + memberEmail);

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection("jdbc:oracle:thin:@112.220.114.130:1521:xe", "team3_202310M", "java");
			String sql = "SELECT MEM_PASS, MEM_EMAIL FROM MEMBER WHERE MEM_ID = ? AND MEM_EMAIL = ?";

			// PreparedStatement를 사용하여 동적인 쿼리 생성
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			stmt.setString(2, memberEmail);
			// 쿼리 실행 및 결과 얻기
			rs = stmt.executeQuery();
			System.out.println(rs + " <<<< rs");

			if (rs.next()) {
				System.out.println(rs.getString("MEM_EMAIL")); // 이메일 들어오는거 확인
				System.out.println(rs.getString("MEM_PASS")); //
				// 찾은 경우: 비번 출력
				String mail = rs.getString("MEM_EMAIL"); // 쿼리문 셀렉 이랑 맞춰야함
				req.setAttribute("memEmail", mail);
				String pass = rs.getString("MEM_PASS");
				req.setAttribute("memPw", pass);

				System.out.println(mail);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/passSend.do");
				dispatcher.forward(req, resp);

			} else {
				// 찾지 못한 경우: 실패 메시지 출력
				resp.getWriter().print("failure");
//				RequestDispatcher dispatcher = req.getRequestDispatcher("/views/member/findPw.jsp");
//				dispatcher.forward(req, resp);
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 연결 및 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

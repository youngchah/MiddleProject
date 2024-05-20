<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
	String nick = request.getParameter("nick");

	// JDBC로 DB접근하기   간단한 작업은 마이바티스 보다는 JDBC로 접근이 나을수도?
    Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team3_202310M", "java");
	Statement stmt = conn.createStatement();
	String sql = "select mem_nick from member where mem_nick = '" + nick + "'";
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		// 닉네임 중복되는값 사용 불가  생성
%>	
		{"rst":"fail","msg":"이미 사용중인 닉네임 입니다."}
<% 	
	}else {
		// 사용가능 응답 결과 생성
%>	
		{"rst":"ok","msg":"사용 가능한 닉네임 입니다."}
<%		
	}
%>


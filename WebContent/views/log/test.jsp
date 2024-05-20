<%@page import="log.vo.LogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
	
	List<LogVO> logList = (List<LogVO>)request.getAttribute("logList");
	
	if(logList != null ){
		for(LogVO lgv : logList) {
			
			%>
			
			<%=lgv.getLogCont() %>
			
			<%
		}
		
	}
	
	
	%>
	
	
	
	
</body>
</html>
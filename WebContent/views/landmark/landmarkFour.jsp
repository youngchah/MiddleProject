<%@page import="landmark.vo.LandmarkVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<LandmarkVO> landList = (List<LandmarkVO>)request.getAttribute("landList");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
		</tr>
<%
	if(landList.size() == 0){
%>		
		<tr>
			<td colspan="5">회원 정보가 존재하지 않습니다.</td>
		</tr>
<%
	}else{
		for(LandmarkVO lv: landList){
%>
		<tr>
			<td><%out.print(lv.getLandName()); %></td>
			<td><%=lv.getLandCont() %></td>
		</tr>
<%
		}
	}
%>		
	</table>
</body>
</html>
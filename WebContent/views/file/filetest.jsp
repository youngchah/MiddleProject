<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<HTML>
<HEAD>
   <TITLE>파일업로드</TITLE>
</HEAD>

<BODY>
<div align="center">
<H1> 다중파일 업로드 테스트</H1><br>

<FORM action="upload.jsp" enctype="multipart/form-data" method="post">
<TABLE align=center border=0>
   <TR><td>작성자</td>
       <td><input type="text" name="name"  size=20></td></TR>
   <TR><td>파일명</td>
       <td><input type="file" name="file1" size=20><br>
           <input type="file" name="file2" size=20></td></TR>
   <TR><td colspan=2 align=center>
           <input type="submit" value=" 파일전송 ">
       </td></TR>  
</TABLE>
</FORM>
</BODY>
</HTML>
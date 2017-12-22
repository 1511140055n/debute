<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
  <tr bgcolor=yellow>
   <td>日付</td>
    <td>日記</td>
  </tr>
  <tr>
    <td><%= request.getParameter("date")%></td>
    <td><%= request.getParameter("daily")%></td>
  </tr>
</table>
</body>
<style>
table{
border-collapse: collapse;
border-color:white;
border-style:ridge;
border-width:3px;
}
tr{
border-color:white;
border-style:ridge;
border-width:3px;
}
td{
border-color:white;
border-style:ridge;
border-width:3px;
}
</style>
</html>
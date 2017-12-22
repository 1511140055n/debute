<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage ="error3.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= request.getParameter("A")%>÷<%= request.getParameter("B")%>=
<% int a = Integer.parseInt(request.getParameter("A"));
int b = Integer.parseInt(request.getParameter("B"));
%>
<%= a/b %>
</body>
</html>
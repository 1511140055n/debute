<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="prc3.q3User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = (String)session.getAttribute("id");
if (name != null) {
%>
ログイン成功です。
<% q3User user = (q3User)request.getAttribute("User"); %>
<%= user.getId() %>さん、ようこそ。
<% } else { %>
ログインに失敗しました
<% } %>
</body>
</html>
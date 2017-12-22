<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model2.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id = (String)session.getAttribute("id");
if(id != null){
	%>ログインに成功しました。<br><%
	User user = (User)request.getAttribute("User");%>
	<%=user.getId() %>さん、ようこそ
	<%
}else{
	%>ログインに失敗しました。<%
}
%>
</body>
</html>
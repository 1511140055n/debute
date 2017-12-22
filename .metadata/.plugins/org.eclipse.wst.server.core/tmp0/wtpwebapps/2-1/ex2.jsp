<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
if("登録".equals(btn)){
	application.setAttribute("id", request.getParameter("id"));
	application.setAttribute("pass", request.getParameter("pass"));
	out.println("登録しました。");
}
else{
	String id2 = request.getParameter("id");
	String pass2 = request.getParameter("pass");
	String id3 = (String)application.getAttribute("id");
	String pass3 = (String)application.getAttribute("pass");
	if(id3.equals(id2) && pass3.equals(pass2)){
		out.println("ログインが成功しました。");
	}
	else{
		out.println("ログインに失敗しました。");
	}
}
%>
</body>
</html>
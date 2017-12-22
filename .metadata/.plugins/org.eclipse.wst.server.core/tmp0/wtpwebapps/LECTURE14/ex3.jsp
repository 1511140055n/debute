<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLEncoder" import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
Cookie c1 = new Cookie("shimei",URLEncoder.encode(name));
Cookie c2 = new Cookie("password",URLEncoder.encode(pass));

c1.setMaxAge(60*60*24*3);
response.addCookie(c1);
c2.setMaxAge(60*60*24*3);
response.addCookie(c2);

Cookie[] cs = request.getCookies();

out.print(URLDecoder.decode(c1.getName()) + ":" + URLDecoder.decode(c1.getValue() + "<br>"));
out.print(URLDecoder.decode(c2.getName()) + ":" + URLDecoder.decode(c2.getValue() + "<br>"));
%>
</body>
</html>
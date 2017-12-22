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
	String id = request.getParameter("ID");
	String pass = request.getParameter("Password");
	if ( !id.equals("1511140055")|| !pass.equals("admin")) {
%>
<jsp:forward page="error4.jsp" >
<jsp:param name="ID" value="<%= id%>" />
</jsp:forward>
<%
}
%>
<%= request.getParameter("ID")%>さんようこそ
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import = "java.text.SimpleDateFormat" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
int i = 0;
%>
<%
String btn = request.getParameter("btn");
String name = request.getParameter("name");
if ("登録".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO A (ID,NAME) VALUES ("+i+",\'"+name+"\')";
	System.out.println(sql);
	PreparedStatement stmt = con.prepareStatement(sql);
	int cnt = stmt.executeUpdate();
	stmt.close();
	con.close();
}
%>
<form action="ex1.jsp" method="post">
	<input type="text" name="name"/>
	<input type="submit" name="btn" value="登録"/>
<textarea name="node" rows="5" cols="70"></textarea><br/>
</form>
</body>
</html>
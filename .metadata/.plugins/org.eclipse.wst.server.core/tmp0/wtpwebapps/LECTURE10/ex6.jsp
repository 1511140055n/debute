<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "ex6.jsp" method="post">
<%
request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
String id = request.getParameter("id");
if("削除".equals(btn)){
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con =
	DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DELETE FROM MSG_TBL WHERE ID = " + id;
	PreparedStatement stmt = con.prepareStatement(sql);
	int cnt = stmt.executeUpdate();
	stmt.close();
	con.close();
}
%>
<input type="text"  name="id">
<input type="submit" name="btn" value="削除">
</form>
<%
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM MSG_TBL";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();

while(rest.next())
{
	int id2 = rest.getInt("ID");
	String msg = rest.getString("MSG");
	out.print("ID"+ id2 + "MSG" + msg);
}
rest.close();
stmt.close();
con.close();
%>
</body>
</html>

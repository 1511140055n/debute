<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con =
DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM MSG_TBL";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();

while(rest.next())
{
	int id = rest.getInt("ID");
	String msg = rest.getString("MSG");
	out.print("ID"+ id + "MSG" + msg);
}
rest.close();
stmt.close();
con.close();

%>
</body>
</html>
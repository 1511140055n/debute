<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.User" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	ログイン成功
<%
String name =(String)session.getAttribute("name");
String pass =(String)session.getAttribute("pass");
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM IDTBL";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
     String name_ = rest.getString("NAME");
     String pass_ = rest.getString("PASS");
     System.out.println(name_);
     if(name_.equals(name) && pass_.equals(pass)){
    	 out.print("ID："+name_+"pass："+pass_);
     }
}
rest.close();
stmt.close();
con.close();
%>
さんようこそ

</body>
</html>
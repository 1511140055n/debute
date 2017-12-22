<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid =request.getParameter("id");
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM APP";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
     String uid_ = rest.getString("UID");
     System.out.print(uid);
     if(uid.equals(uid_)){
    	 out.println("登録しました");
    	 break;
     }
}


sql = "DELETE FROM APP WHERE ID = 1";
PreparedStatement stmt2 = con.prepareStatement(sql);
int cnt = stmt2.executeUpdate();
stmt.close();
con.close();
rest.close();

%>
</body>
</html>
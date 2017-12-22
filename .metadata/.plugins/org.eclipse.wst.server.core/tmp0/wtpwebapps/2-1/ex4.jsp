<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import = "java.text.SimpleDateFormat" %>
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
String id = request.getParameter("id");
String pass = request.getParameter("pass");
int i = 0;
if("登録".equals(btn)){
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO id_tbl (id, pass) VALUES (?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1,id);
	stmt.setString(2,pass);
	stmt.executeUpdate();
	stmt.close();
	con.close();
	out.println("登録しました。");
}else{
	boolean x = false;
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "select * from id_tbl";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt = con.prepareStatement(sql);
	ResultSet rest = stmt.executeQuery();
	while(rest.next()){
		String id_ = rest.getString("id");
	   	String pass_ = rest.getString("pass");
	   	if(id_.equals(id) && pass_.equals(pass)){
	   		out.println("ログインが成功しました");
	   		x = true;
			String s = session.getId();
			%>
			<form method="post" action="tax.jsp">
			<input type = "submit" name = "btn" value = "こちらをクリック">
			</form>
			<%
	   		break;
	   	}
	}
	if(x != true){
		out.println("ログインに失敗しました。");
	}
	rest.close();
	stmt.close();
	con.close();
}
%>
</body>
</html>
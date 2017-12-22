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

request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
String name = request.getParameter("name");
String id = request.getParameter("id");
String path = application.getRealPath("node.txt");
String mall = request.getParameter("mall");
String node = request.getParameter("node");
if("".equals(name)){
	name = "ななし";
}
if("書き込む".equals(btn)){
	node = node.replaceAll("\r\n","<br>");
}

Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日(EEE)HH:mm:ss");
String day = sdf.format(d);
//登録
if ("書き込む".equals(btn)) {
	i++;
	if("".equals(node)){
		out.println("書き込みを入力してください");
		return;
	}
	i++;
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO NOTE VALUES (?,?,?,?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1,String.valueOf(i));
	stmt.setString(2,name);
	stmt.setString(3,mall);
	stmt.setString(4,d.toString());
	stmt.setString(5,node);
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("削除".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DELETE FROM NOTE WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("編集".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "SELECT * FROM NOTE WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	ResultSet rest = stmt.executeQuery();
	while(rest.next())
	{
		int id_ = rest.getInt("ID");
	    String name_ = rest.getString("NAME");
	    String emale_ = rest.getString("EMALE");
	    String kakikomidat_ = rest.getString("KAKIKOMIDAT");
	    String kakikomi_ = rest.getString("KAKIKOMI");
	%>
	<form action="name.jsp" method="post">
		<input type="text" name="name" value="<%=name_ %>"/>
		<input type="text" name="mall" value="<%=emale_ %>"/>
		<input type="text" name="node" value="<%=kakikomi_ %>"/>
		<input type="hidden" name="id" value="<%=id_ %>"/>
		<input type="submit" name="btn" value="更新"/>
	</form>
	<%
	}
	return;
} else if ("更新".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "UPDATE NOTE SET NAME = \'"+name+"\',EMALE = \'"+mall+"\',KAKIKOMI = \'"+node+"\' WHERE ID = "+Integer.parseInt(id);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}

//表示
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM NOTE";
PreparedStatement stmt = con.prepareStatement(sql);
sql = "SELECT * FROM NOTE ORDER BY ID DESC";
stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
    int id_ = rest.getInt("ID");
    String name_ = rest.getString("NAME");
    String emale_ = rest.getString("EMALE");
    String kakikomidat_ = rest.getString("KAKIKOMIDAT");
    String kakikomi_ = rest.getString("KAKIKOMI");
%>
<form action= "name.jsp" method="post">
	<p><%= id_ %>&nbsp;名前：<a href= mailto:<%= emale_ %>/><%= name_ %></a>&nbsp;日付：<%= kakikomidat_ %><br>
	<%= kakikomi_ %><br>
	<input type="submit" name="btn" value="削除"/>
	<input type="submit" name="btn" value="編集"/>
	<input type="hidden" name="id" value="<%=id_ %>"/>
	</p>
	</form>
<%
}
rest.close();
stmt.close();
con.close();
%>
<form action= "name.jsp" method="post">
<br><input type="submit" name="btn" value="書き込む">
名前:<input type="text" name="name">
E-Mail(省略可)：
<input type="text" name="mall"><br/>
<textarea name="node" rows="5" cols="70"></textarea><br/>
</form>
</body>
</html>
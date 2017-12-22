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
String day = request.getParameter("day");
String team = request.getParameter("team");
String score = request.getParameter("score");
String btn = request.getParameter("btn");
String id = request.getParameter("id");
String s = request.getParameter("s");

if ("登録".equals(btn)) {
	if("".equals(day) ||"".equals(team) ||"".equals(score)){
		out.println("空欄をなくしてください");
		return;
	}
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO RESULT (DAY, TEAM, SCORE) VALUES (?,?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1,day);
	stmt.setString(2,team);
	stmt.setString(3,score);
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("削除".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DELETE FROM RESULT WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("編集".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "SELECT * FROM RESULT WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	ResultSet rest = stmt.executeQuery();
	while(rest.next())
	{
		int id_ = rest.getInt("ID");
	    String day_ = rest.getString("DAY");
	    String team_ = rest.getString("TEAM");
	    String score_ = rest.getString("SCORE");
	%>
	<form action="sb.jsp" method="post">
		<input type="text" name="day" value="<%= day_ %>"/>
		<input type="text" name="team" value="<%=team_ %>"/>
		<input type="text" name="score" value="<%=score_ %>"/>
		<input type="hidden" name="id" value="<%=id_ %>"/>
		<input type="submit" name="btn" value="更新"/>
	</form>
	<%
	}
	return;
} else if ("更新".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "UPDATE RESULT SET DAY = \'"+day+"\',TEAM = \'"+team+"\',SCORE = \'"+score+"\' WHERE ID = "+Integer.parseInt(id);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}
else if ("検索".equals(btn)){
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "SELECT * FROM RESULT WHERE TEAM = \'"+s+"\'";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt = con.prepareStatement(sql);
	ResultSet rest = stmt.executeQuery();
	while(rest.next())
	{
	    int id_ = rest.getInt("ID");
	    String day_ = rest.getString("DAY");
	    String team_ = rest.getString("TEAM");
	    String score_ = rest.getString("SCORE");
	%>
	<p><%= id_ %>.&nbsp;日付:<%= day_ %>&nbsp;相手チーム：<%= team_ %>&nbsp;スコア：<%= score_ %><br></p>
	<%
	}
	rest.close();
	stmt.close();
	con.close();
	%>
	<form action= "sb.jsp" method="post">
		<input type="submit" name="btn" value="戻る">
		</form>
	<%
	return;
}else if ("初期化".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DROP TABLE RESULT";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	sql = "CREATE TABLE RESULT(ID INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,DAY VARCHAR(50) NOT NULL,TEAM VARCHAR(50),SCORE VARCHAR(50))";
	stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}
//表示
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM RESULT";
PreparedStatement stmt = con.prepareStatement(sql);
sql = "SELECT * FROM RESULT ORDER BY ID DESC";
stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
    int id_ = rest.getInt("ID");
    String day_ = rest.getString("DAY");
    String team_ = rest.getString("TEAM");
    String score_ = rest.getString("SCORE");
%>
<form action= "sb.jsp" method="post">
	<p><%= id_ %>.&nbsp;日付:<%= day_ %>&nbsp;相手チーム：<%= team_ %>&nbsp;スコア：<%= score_ %><br>
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
<form action= "sb.jsp" method="post">
日付:<input type="text" name="day"><br/>
相手チーム：<input type="text" name="team"><br/>
スコア：<input type="text" name="score"><br/>
<input type="submit" name="btn" value="登録"><input type="submit" name="btn" value="初期化"><br/><br/>
相手チーム名から試合結果を検索：<input type="text" name="s"><input type="submit" name="btn" value="検索"><br/>
<br/>
</form>
</body>
</html>
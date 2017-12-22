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
String item = request.getParameter("item");
String price = request.getParameter("price");
String num = request.getParameter("num");
String btn = request.getParameter("btn");
String id = request.getParameter("id");
String s = request.getParameter("s");

if ("登録".equals(btn)) {
	if("".equals(item) ||"".equals(price) ||"".equals(num)){
		out.println("空欄をなくしてください");
		return;
	}
	Pattern pattern = Pattern.compile("^\\d{1,10}");
	Matcher matcher =pattern.matcher(price);
	boolean a = matcher.matches();
	Matcher matcher2 =pattern.matcher(num);
	boolean b = matcher2.matches();
	if(a == false || b == false){
		out.println("数字を入力してください<br>");
		return;
	}
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO ORDERITEM (ITEM, PRICE, NUM) VALUES (?,?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1,item);
	stmt.setString(2,price);
	stmt.setString(3,num);
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("削除".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DELETE FROM ORDERITEM WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	stmt.executeUpdate();
	stmt.close();
	con.close();
} else if ("編集".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "SELECT * FROM ORDERITEM WHERE ID = ?";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(id));
	ResultSet rest = stmt.executeQuery();
	while(rest.next())
	{
		int id_ = rest.getInt("ID");
	    String item_ = rest.getString("ITEM");
	    int price_ = rest.getInt("PRICE");
	    int num_ = rest.getInt("NUM");
	%>
	<form action="ex.jsp" method="post">
		<input type="text" name="item" value="<%= item_ %>"/>
		<input type="text" name="price" value="<%=price_ %>"/>
		<input type="text" name="num" value="<%=num_ %>"/>
		<input type="hidden" name="id" value="<%=id_ %>"/>
		<input type="submit" name="btn" value="更新"/>
	</form>
	<%
	}
	return;
} else if ("更新".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "UPDATE ORDERITEM SET ITEM = \'"+item+"\',PRICE = "+Integer.parseInt(price)+",NUM = "+Integer.parseInt(num)+" WHERE ID = "+Integer.parseInt(id);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}else if ("検索".equals(btn)){
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "SELECT * FROM ORDERITEM WHERE ID = "+Integer.parseInt(s);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt = con.prepareStatement(sql);
	ResultSet rest = stmt.executeQuery();
	while(rest.next())
	{
	    int id_ = rest.getInt("ID");
	    String item_ = rest.getString("ITEM");
	    String price_ = rest.getString("PRICE");
	    String num_ = rest.getString("NUM");
	%>
	<form action= "ex.jsp" method="post">
		<p><%= id_ %>.&nbsp;商品名:<%= item_ %>&nbsp;単価：<%= price_ %>&nbsp;数量：<%= num_ %><br>
		</p>
		<input type="submit" name="btn" value="戻る">
		</form>
	<%
	return;
	}
	rest.close();
	stmt.close();
	con.close();
}else if ("初期化".equals(btn)) {
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "DROP TABLE ORDERITEM";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	sql = "CREATE TABLE ORDERITEM(ID INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,ITEM VARCHAR(50) NOT NULL,PRICE INT,NUM INT)";
	stmt = con.prepareStatement(sql);
	stmt.executeUpdate();
	stmt.close();
	con.close();
}
//表示
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM ORDERITEM";
PreparedStatement stmt = con.prepareStatement(sql);
sql = "SELECT * FROM ORDERITEM ORDER BY ID DESC";
stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
    int id_ = rest.getInt("ID");
    String item_ = rest.getString("ITEM");
    String price_ = rest.getString("PRICE");
    String num_ = rest.getString("NUM");
%>
<form action= "ex.jsp" method="post">
	<p><%= id_ %>.&nbsp;商品名:<%= item_ %>&nbsp;単価：<%= price_ %>&nbsp;数量：<%= num_ %><br>
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
<form action= "ex.jsp" method="post">
商品名:<input type="text" name="item"><br/>
単価：<input type="text" name="price"><br/>
数量：<input type="text" name="num"><br/>
<input type="submit" name="btn" value="登録"><input type="submit" name="btn" value="初期化"><br/><br/>
IDから検索：<input type="text" name="s"><input type="submit" name="btn" value="検索"><br/>
<br/>
</form>
</body>
</html>
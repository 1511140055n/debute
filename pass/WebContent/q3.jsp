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
String item = request.getParameter("item");
String price = request.getParameter("price");
String num = request.getParameter("num");
String btn = request.getParameter("btn");
String id = request.getParameter("id");
//登録

	if ("注文".equals(btn)) {
		if("".equals(item) || "".equals(price) || "".equals(num)){
			out.print("エラー空欄を埋めてください");
			throw new IOException();
		}
		i++;
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
		String sql = "INSERT INTO ORDERITEM VALUES (?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1,String.valueOf(i));
		stmt.setString(2,item);
		stmt.setInt(3,Integer.parseInt(price));
		stmt.setInt(4,Integer.parseInt(num));
		stmt.executeUpdate();
		stmt.close();
		con.close();
	}
Class.forName("org.apache.derby.jdbc.ClientDriver");
%>

<form action= "q3.jsp" method="post">
商品名<input type="text" name="item"><br>
単価<input type="text" name="price"><br>
数量<input type="text" name="num"><br>
<br><input type="submit" name="btn" value="注文">
</form>
</body>
</html>
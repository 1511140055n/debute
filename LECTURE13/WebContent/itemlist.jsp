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
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
String sql = "SELECT * FROM NOTE";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rest = stmt.executeQuery();
while(rest.next())
{
    int item_id = rest.getInt("ITEMID");
    String item_img = rest.getString("ITEMIMG");
    String item_name = rest.getString("ITEMNAME");
    int kakikomidat_ = rest.getInt("PRICE");
}
rest.close();
stmt.close();
con.close();




%>










<table width="150">
  <tr>
    <td><a href="http://localhost:8080/LECTURE13/detail.jsp"><img src="img/water1.jpg"><br></a></td>
  </tr>
  <tr>
    <td><a href="http://localhost:8080/LECTURE13/detail.jsp">San Benedetto ナチュラルスパークリングミネラルウォーター 500ml×24本</a><br></td>
  </tr>
  <tr>
    <td><%
int i;
for(i = 0; i < 3 ; i++){
	out.print("★");
}
for(i = i; i < 5 ; i++){
	out.print("☆");
}
%></td>
  </tr>
   <tr>
    <td><font color="#EEC627">￥1,830</font></td>
  </tr>
</table>
</body>
</html>
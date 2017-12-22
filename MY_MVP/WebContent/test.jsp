<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import="java.security.MessageDigest" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "test.jsp" method="post">
<%!
String getMessageDigest(String data) throws Exception{
	StringBuffer sb = new StringBuffer();
	MessageDigest md5 = MessageDigest.getInstance("MD5");
	byte[] result = md5.digest(data.getBytes());
	for(byte b : result){
		int b2 = b & 0xff;
		if(b2 < 16) sb.append("0");
		sb.append(Integer.toHexString(b2));
	}
	return sb.toString();
}
%>

<%
request.setCharacterEncoding("UTF-8");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String pass = request.getParameter("pass");
ArrayList<String> list = new ArrayList<String>();
if(session.isNew())session.setAttribute("a","true");
if("登録".equals(btn)){
	pass = getMessageDigest(pass);
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql = "INSERT INTO TEST(NAME,PASS) VALUES(?,?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, name);
	stmt.setString(2, pass);
	int cnt = stmt.executeUpdate();
	stmt.close();
	con.close();
}
if("ログイン".equals(btn)){
	pass = (String)getMessageDigest(pass);
	Connection con = null;
	try {
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");

		String sql = "SELECT * FROM TEST NAME = ? AND PASS = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, pass);
		ResultSet rest = stmt.executeQuery();
		while (rest.next()) {
			out.print("ログインに成功しました");
			break;
		}
	} catch(SQLException e) {
		e.printStackTrace();
	} catch(ClassNotFoundException e) {
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
				con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
	/*Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
	String sql2 = "SELECT * FROM TEST";
	PreparedStatement stmt2 = con.prepareStatement(sql2);
	ResultSet rest = stmt2.executeQuery();
	out.println(name+"\t,"+pass);
	while(rest.next())
	{
	    String _name = rest.getString("NAME");
	    String _pass = rest.getString("PASS");
	    out.println(_name+","+_pass);

	    if((name).equals(_name)){
	    	out.print("ログインしました");
	    	break;
	    }
	}
	rest.close();
	stmt2.close();
	con.close();
	try{
		String str = "";
		FileReader fr = new FileReader(application.getRealPath("info.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str = br.readLine()) != null) {
			String[] str2 = str.split(",");
			list.add(str2[0]);
			list.add(str2[1]);
		}

		br.close();
	} catch(IOException e) {
		out.print("");
	}
	int i = 0;
	while(true){
		if(list.get(i).equals(id) && list.get(i+1).equals(pass)){
			session.setAttribute("a","false");
		}
		i += 2;
		if(i == list.size()){
			break;
		}
	}
*/

/*
String a = (String)session.getAttribute("a");
if("false".equals(a)){
	out.print("ログインしました");
}
else if("true".equals(a)){
	out.print("ログインに失敗しました");

}*/
%>
<table>
        <tr>
            <th>NAME</th>
            <td><input type="text"  name="name"></td>
        </tr>
        <tr>
            <th>パスワード</th>
            <td><input type="text"  name="pass"></td>
        </tr>
</table>
<input type="submit" name="btn" value="ログイン">
<input type="submit" name="btn" value="登録">
</form>
</body>
</html>
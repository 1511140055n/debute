<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import="java.security.MessageDigest" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "ex4.jsp" method="post">
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
String path = application.getRealPath("info.txt");
String btn = request.getParameter("btn");
String id =  request.getParameter("id");
String pass = request.getParameter("pass");
ArrayList<String> list = new ArrayList<String>();
if(session.isNew())session.setAttribute("a","true");
if("登録".equals(btn)){
	pass = getMessageDigest(pass);
	try {
			out.println("<br>");
			FileWriter fw = new FileWriter(path, true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(id);
			bw.write(",");
			bw.write(pass);
			bw.newLine();
			bw.close();
			fw.close();
	} catch(IOException e) {
	out.print("");
	}
}
if("ログイン".equals(btn)){
	pass = getMessageDigest(pass);
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

}
String a = (String)session.getAttribute("a");
if("false".equals(a)){
	out.print("ログインしました");
}
else if("true".equals(a)){
	out.print("ログインに失敗しました");
}
%>
<table>
        <tr>
            <th>ID</th>
            <td><input type="text"  name="id"></td>
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
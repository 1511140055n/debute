<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String path = application.getRealPath("name.txt");
String btn = request.getParameter("btn");

try {
	if("登録".equals(btn)){
		if(request.getParameter("name").equals("")){%>
		<jsp:forward page="error1.jsp" >
		<jsp:param name="btn" value="<%= btn %>" />
		</jsp:forward>
	<%}
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(request.getParameter("name"));
		bw.newLine();
		bw.close();
		fw.close();
	}
} catch(IOException e) {
out.print("ファイル書き込みエラー" + e);
}
try {
	if("登録".equals(btn)){
		String str1;
		FileReader fr = new FileReader(application.getRealPath("name.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str1 = br.readLine()) != null) {
		out.print(str1 + "<br>");
		}
		br.close();
		fr.close();
	}
} catch(IOException e) {
out.print("エラーです" + e);
}
request.setCharacterEncoding("UTF-8");

if ("初期化".equals(btn)) {
	try {
		FileWriter fw = new FileWriter(path, false);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write("");
		bw.newLine();
		bw.close();
		fw.close();
	} catch(IOException e) {
	out.print("ファイル書き込みエラー" + e);
	}
	try {
		String str;
		FileReader fr = new FileReader(application.getRealPath("name.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str = br.readLine()) != null) {
		out.print(str + "<br>");
		}
		br.close();
		fr.close();
	} catch(IOException e) {
	out.print("エラーです" + e);
	}
}
%>
<form method="post" action="ex1.jsp">
<input type="submit" name="btn" value="初期化">
</form>
<%= path %>
</body>
</html>
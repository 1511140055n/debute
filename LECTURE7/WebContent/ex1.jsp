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
String path = application.getRealPath("info.txt");
String btn = request.getParameter("btn");

try {
	if("登録".equals(btn)){
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(request.getParameter("name"));
		bw.write(",");
		bw.write(request.getParameter("tosi"));
		bw.write(",");
		bw.write(request.getParameter("tel"));
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
		FileReader fr = new FileReader(application.getRealPath("info.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str1 = br.readLine()) != null) {
			String[] str2 = str1.split(",");
			out.print("氏名："+ str2[0] +"<br>");
			out.print("年齢："+ str2[1] +"<br>");
			out.print("電話番号："+ str2[2] +"<br>");
		}
		br.close();
		fr.close();
	}
} catch(IOException e) {
out.print("エラーです" + e);
}
request.setCharacterEncoding("UTF-8");

if ("初期化".equals(btn) || "リセット".equals(btn)) {
	try {
		FileWriter fw = new FileWriter(path, false);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write("");
		bw.close();
		fw.close();
	} catch(IOException e) {
	out.print("ファイル書き込みエラー" + e);
	}
	try {
		String str;
		FileReader fr = new FileReader(application.getRealPath("info.txt"));
		BufferedReader br = new BufferedReader(fr);
		while ((str = br.readLine()) != null) {
		out.print(str + "<br>");
		}
		br.close();
		fr.close();
	} catch(IOException e) {
	out.print("エラーですnn" + e);
	}
}
%>
<form method="post" action="ex1.jsp">
<input type="submit" name="btn" value="初期化">
</form>
</body>
</html>
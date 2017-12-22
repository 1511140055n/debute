<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import = "java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "ex1.jsp" method="post">

<%
request.setCharacterEncoding("UTF-8");
String path = application.getRealPath("node.txt");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String mall = request.getParameter("mall");
String node = request.getParameter("node");
Date d = new Date();
try {
	if("書き込む".equals(btn)){
		out.println("<br>");
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(name);
		bw.write(",");
		bw.write(mall);
		bw.write(",");
		bw.write(d.toString());
		bw.write(",");
		bw.write(node);
		bw.newLine();
		bw.close();
		fw.close();
	}
	try {
		if("書き込む".equals(btn)){
			String str1;
			FileReader fr = new FileReader(application.getRealPath("node.txt"));
			BufferedReader br = new BufferedReader(fr);
			while ((str1 = br.readLine()) != null) {
				String[] str2 = str1.split(",");
				out.print("名前：<a href= \"mailto:"+str2[1]+"\">"+ str2[0]+" </a>");

				out.print(str2[2] +"<br>");
				out.print(str2[3] +"<br>");
			}
			br.close();
			fr.close();
		}
	} catch(IOException e) {
	out.print("");
	}
} catch(IOException e) {
out.print("");
}



if ("初期化".equals(btn)) {
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
		FileReader fr = new FileReader(application.getRealPath("node.txt"));
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
<br>
<input type="text" name="mall"><br/>
<textarea name="node" rows="5" cols="70"></textarea><br/>
<input type ="reset" name="btn" value="リセット">
<input type ="submit" name="btn" value="初期化">
</form>
</body>
</html>
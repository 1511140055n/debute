<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*" import = "java.util.regex.*" import = "java.util.Date" import = "java.text.SimpleDateFormat" import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action= "ex2.jsp" method="post">
<%
int i = 0;
request.setCharacterEncoding("UTF-8");
String path = application.getRealPath("node.txt");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String mall = request.getParameter("mall");
String node = request.getParameter("node");
ArrayList<String> list = new ArrayList<String>();
if("".equals(name)){
	name = "ななし";
}
if("書き込む".equals(btn)){
	node = node.replaceAll("\r\n","<br>");
}

Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日(EEE)HH:mm:ss");
String day = sdf.format(d);
try {
	if("書き込む".equals(btn)){
		if("".equals(node)){
			out.println("書き込みを入力してください");
			return;
		}
		out.println("<br>");
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(name);
		bw.write(",");
		bw.write(mall);
		bw.write(",");
		bw.write(day);
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
				list.add(str2[0]);
				list.add(str2[1]);
				list.add(str2[2]);
				list.add(str2[3]);
			}
			br.close();
			fr.close();
			System.out.println(list.size());
			i = list.size()/4;
			for(int j = list.size() -1; j  > 0; j-=4){
				out.print(i + ":名前：<a href= mailto:"+list.get(j-2)+">"+ list.get(j-3) +" </a>");
				out.print(list.get(j-1) +"<br>");
				out.print(list.get(j) +"<br>");
				i--;
			}
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
	out.print("エラーです" + e);
	}
}
%>

<br><input type="submit" name="btn" value="書き込む">
名前:<input type="text" name="name">
E-Mail(省略可)：
<input type="text" name="mall"><br/>
<textarea name="node" rows="5" cols="70"></textarea><br/>
<input type ="reset" name="btn" value="リセット">
<input type ="submit" name="btn" value="初期化">
</form>
</body>
</html>

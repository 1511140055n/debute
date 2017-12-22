<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*" import = "java.util.regex.*"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String path = application.getRealPath("quetion.txt");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String num = request.getParameter("num");
String add = request.getParameter("add");
String s = request.getParameter("s");
String te = request.getParameter("te");
String ta = request.getParameter("ta");
String w = request.getParameter("w");
String a = request.getParameter("a");
String p = request.getParameter("p");
String f = request.getParameter("t_name3");
try {
	if("送信".equals(btn)){
		if(s == null || te == null || ta == null || w == null || a == null){
			out.print("すべての項目に回答してください<br>");
			throw new IOException();
		}


		if(name.equals("") ){
			out.println("名前を入力してください<br>");
			throw new IOException();
		}
		if(num.equals("") ){
			out.println("学籍番号を入力してください<br>");
			throw new IOException();
		}
		if(add.equals("") ){
			out.println("メールアドレスを入力してください<br>");
			throw new IOException();
		}
		Pattern pattern = Pattern.compile("\\d{10}");
		Matcher matcher =pattern.matcher(num);
		boolean b = matcher.matches();
		if(b == false){
			out.println("学籍番号が正しくありません<br>");
			throw new IOException();
		}
		pattern = Pattern.compile("\\w+@\\w+");
		matcher =pattern.matcher(add);
		b = matcher.matches();
		if(b == false){
			out.println("アドレスが正しくありません<br>");
			throw new IOException();
		}
		out.println("<br>");
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(num);
		bw.write(",");
		bw.write(name);
		bw.write(",");
		bw.write(add);
		bw.write(",");
		bw.write(s);
		bw.write(",");
		bw.write(te);
		bw.write(",");
		bw.write(ta);
		bw.write(",");
		bw.write(w);
		bw.write(",");
		bw.write(a);
		bw.write(",");
		bw.write(p);
		bw.write(",");
		bw.write(f);
		bw.newLine();
		bw.close();
		fw.close();
	}
	try {
		if("送信".equals(btn)){
			String str1;
			FileReader fr = new FileReader(application.getRealPath("quetion.txt"));
			BufferedReader br = new BufferedReader(fr);
			while ((str1 = br.readLine()) != null) {
				String[] str2 = str1.split(",");
				out.print("学籍番号："+ str2[0] +"<br>");
				out.print("氏名："+ str2[1] +"<br>");
				out.print("メールアドレス："+ str2[2] +"<br>");
				out.print("設問1："+ str2[3] +"<br>");
				out.print("設問2："+ str2[4] +"<br>");
				out.print("設問3："+ str2[5] +"<br>");
				out.print("設問4："+ str2[6] +"<br>");
				out.print("設問5："+ str2[7] +"<br>");
				out.print("設問6："+ str2[8] +"<br>");
				out.print("設問7："+ str2[9] +"<br>");
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

request.setCharacterEncoding("UTF-8");

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
		FileReader fr = new FileReader(application.getRealPath("quetion.txt"));
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
<a href="http://localhost:8080/LECTURE7/ex3.html">アンケートページに戻る</a>
<form method="post" action="ex3.jsp">
<input type="submit" name="btn" value="初期化">
</form>
</body>
<style>
body {
	line-height: 20px;
}
</style>
</html>
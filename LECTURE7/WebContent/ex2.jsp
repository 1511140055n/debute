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
String path = application.getRealPath("info.txt");
String btn = request.getParameter("btn");
String name =  request.getParameter("name");
String tosi = request.getParameter("tosi");
String tel = request.getParameter("tel");
try {
	if("登録".equals(btn)){
		if(name.equals("") ){
			out.println("名前を入力してください<br>");
			throw new IOException();
		}
		else if(tosi.equals("") ){
			out.println("年齢を入力してください<br>");
			throw new IOException();
		}
		else if(tel.equals("") ){
			out.println("電話を入力してください<br>");
			throw new IOException();
		}
		try {
			int i = Integer.parseInt(tosi);
		} catch (NumberFormatException e) {
		    out.println("年齢が正しくありません<br>");
		    throw new IOException();
		}
		Pattern pattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
		Matcher matcher =pattern.matcher(tel);
		boolean b = matcher.matches();
		if(b == false){
			out.println("電話が正しくありません");
			throw new IOException();
		}
		out.println("<br>");
		FileWriter fw = new FileWriter(path, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(name);
		bw.write(",");
		bw.write(tosi);
		bw.write(",");
		bw.write(tel);
		bw.newLine();
		bw.close();
		fw.close();
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
				out.print("電話："+ str2[2] +"<br>");
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
<form method="post" action="ex2.jsp">
<input type="submit" name="btn" value="初期化">
</form>
</body>
</html>
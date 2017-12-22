<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
File file = new File("H:sw\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\2-4-4\\data");
File files[] = file.listFiles();

//取得した一覧を表示する
for (int i=0; i<files.length; i++) {
    %><img src="<%= files[i]%>"><%
    System.out.println(files[i]);
}

%>

</body>
</html>
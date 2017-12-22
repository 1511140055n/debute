<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.security.MessageDigest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
out.print(getMessageDigest(request.getParameter("x")));
%>
</body>
</html>
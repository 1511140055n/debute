<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<form method="post" action="ex4.jsp">
<%request.setCharacterEncoding("UTF-8");%>

<%
String color = request.getParameter("color");
int flg = 0;
Cookie ck[] = request.getCookies();
String bc = "";

if(ck == null){

}else{
	for(Cookie c : ck){
		if("bc".equals(c.getName())){
			flg = 1;
		}
	}
}

if(flg==0){
	bc = "ffffff";
	Cookie c = new Cookie("bc",bc);
	c.setMaxAge(3*60*60*24);
	response.addCookie(c);
}

if("青".equals(color)){
	bc = "0000ff";
	Cookie c = new Cookie("bc",bc);
	c.setMaxAge(3*60*60*24);
	response.addCookie(c);
	flg = 2;
}
else if("赤".equals(color)){
	bc = "ff0000";
	Cookie c = new Cookie("bc",bc);
	c.setMaxAge(3*60*60*24);
	response.addCookie(c);
	flg = 2;
}
else if("黄".equals(color)){
	bc = "ffff00";
	Cookie c = new Cookie("bc",bc);
	c.setMaxAge(3*60*60*24);
	response.addCookie(c);
	flg = 2;
}

if(flg==1){
	for(Cookie c : ck)
		if("bc".equals(c.getName())){
			bc = c.getValue();
		}
}
%>

<body bgcolor ="#<%=bc %>">

	背景色を選んでください：<select name="color">
		<option value="青">青
		<option value="赤">赤
		<option value="黄">黄
	</select><br>
	<input type="submit"value="変更">
</form>
</body>
</html>
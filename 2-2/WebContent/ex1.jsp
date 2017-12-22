<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String r =  request.getParameter("r");
String btn =  request.getParameter("btn");
if("計算".equals(btn)){
	double areas = Integer.parseInt(r)*Integer.parseInt(r)*Math.PI;
	out.println("半径"+ r +"の円の面積は"+areas+"です");
}
%>
<form method="post" action="ex1.jsp">
半径：<input type="text"  name="r">
<input type="submit"  name="btn" value="計算">
</form>
</body>
</html>
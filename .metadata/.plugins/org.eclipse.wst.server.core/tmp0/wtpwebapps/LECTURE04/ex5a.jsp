<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="ex5b.jsp">
<form>
<input type="hidden" name="product" value="<%=request.getParameter("product")%>">
<input type="hidden" name="quantity" value="<%=request.getParameter("quantity")%>">
品名：<%= request.getParameter("product")%><br>
数量：<%= request.getParameter("quantity")%><br>
で注文を確定していいですか？<br>
<input type="submit" name="btn3" value="確定">
</form>
</body>
</html>
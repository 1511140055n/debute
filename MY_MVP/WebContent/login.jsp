<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="login.css">
<link rel="stylesheet" type="text/css" href="common.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
	 	<form class="user-info" action = "/MY_MVP/q3Login" method = "post">
	 		<div class="alert">ユーザー名またはパスワードが間違っています</div>
	 		ユーザー名
			<input type="text" name="name">
	  	  	パスワード
	      	<input type="password"  name="pass">
	      	<input class="determine" type="submit" name="btn" value="ログイン">
	    </form>
		<a href="add_user.jsp">初めての方はこちら</a>
	</div>
</body>
</html>
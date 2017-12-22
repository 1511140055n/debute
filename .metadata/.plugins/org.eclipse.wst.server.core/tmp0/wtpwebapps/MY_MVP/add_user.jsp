<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="add_user.css">
<link rel="stylesheet" type="text/css" href="common.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
	    <form class="user-info" action="/MY_MVP/q3Login" method="post">
	    	ユーザー名<input type="text" name="name">
	    	パスワード<input type="password"  name="pass">
	    	パスワード再確認<input type="password"  name="re_pass">
	    	応援する球団
	      	<ul class="pacific">
	        	<li><input type="checkbox" name="team" value="ソフトバンク">ソフトバンク</li>
	        	<li><input type="checkbox" name="team" value="西武">西武</li>
	        	<li><input type="checkbox" name="team" value="楽天">楽天</li>
		        <li><input type="checkbox" name="team" value="オリックス">オリックス</li>
		        <li><input type="checkbox" name="team" value="日ハム">日ハム</li>
		        <li><input type="checkbox" name="team" value="ロッテ">ロッテ</li>
			</ul>
			<ul class="central">
	        	<li><input type="checkbox" name="team" value="広島">広島</li>
	        	<li><input type="checkbox" name="team" value="阪神">阪神</li>
		        <li><input type="checkbox" name="team" value="DeNA">DeNA</li>
		        <li><input type="checkbox" name="team" value="巨人">巨人</li>
		        <li><input type="checkbox" name="team" value="中日">中日</li>
		        <li><input type="checkbox" name="team" value="ヤクルト">ヤクルト</li>
	      	</ul>
	    	<input type="submit" name="btn" value="確定">
	    </form>
	</div>
</body>
</html>
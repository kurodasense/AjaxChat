<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regist</title>
</head>
<body>
<h1>regist</h1>
<div>${msg}</div>
<form action="${ pageContext.request.contextPath }/user/regist" method="POST">
	用户名：<input type="text" name="username"/><br>
	密码：<input type="text" name="password"/><br>
	年龄：<input type="text" name="age"/><br>
	性别：<input type="text" name="sex"/><br>
	兴趣爱好：<input type="text" name="hobby"/><br>
<input type="submit" value="注册"/>
</form>
</body>
</html>
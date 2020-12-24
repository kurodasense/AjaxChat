<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<h1>login</h1>
<form action="${ pageContext.request.contextPath }/user/login?chatid=1" method="POST">
用户名：<input type="text" name="username"/><br>
密码：<input type="password" name="password"/><br>
<input type="submit" value="登录"/>
</form>
</body>
</html>
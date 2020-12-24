<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
</head>
<body>
<h1>Ajax聊天室</h1>
<div>${msg }</div>
<a href="${ pageContext.request.contextPath }/user/gotoregist">注册</a>
<a href="${ pageContext.request.contextPath }/user/gotologin">登录</a>
</body>
</html>
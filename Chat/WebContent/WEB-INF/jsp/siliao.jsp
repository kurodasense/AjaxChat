<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css">
<script src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/popper.min.js"></script>
<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#send").click(function() {
			var text = $(mytext).val();
			var url = "${ pageContext.request.contextPath }/user/send";
			var chatid = ""+${sessionScope.user.id}+${anouser.id};
			$.post(url, {
				"content" : text,
				"chatid": chatid
			}, function(data) {
				var ul = document.getElementById("contentul");
				var li = document.createElement("li");
				li.innerHTML = data;
				ul.appendChild(li);
				$("#mytext").val("");
			});
		});
		
		setInterval(function(){
			$.ajax({
				type: 'post',
				url: '${ pageContext.request.contextPath }/user/showcontent?chatid=${sessionScope.user.id}${anouser.id}',
				success: function(data){
					var ul = document.getElementById("contentul");
					ul.innerHTML = data;
				},
				error: function(data){
					var arr = data.contents;
					alert("服务器已断开");
				}
			});
		},"1000");
		
	});
</script>

<title>chat</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<div class="container">
		<h1>欢迎进入${sessionScope.user.username }和${anouser.username }的私人聊天室</h1>
		<a href="${ pageContext.request.contextPath }/user/logout">退出登录</a>&nbsp;&nbsp;
		<a href="${ pageContext.request.contextPath }/user/gotopublicchat?chatid=1">回到公共聊天室</a>
		<hr>

		<div class="row">
			<div id="memberlist" class="col-3 border rounded border-danger" style="height: 300px">
				<h3>用户信息</h3>
				<ul>
					<li>姓名：${anouser.username }</li>
					<li>年龄：${anouser.age }</li>
					<li>性别：${anouser.sex }</li>
					<li>兴趣爱好：${anouser.hobby }</li>
				</ul>
			</div>
			<div id="content" class="col-9 left border rounded border-primary">
				<div class="border border-second pre-scrollable" style="height: 300px">
					<ul id="contentul" class="unstyled">
						<c:forEach items="${contents}" var="c">
							<li>${c.username }:${c.content }</li>
						</c:forEach>
					</ul>
				</div>
				<h4>请输入聊天信息:</h4>
				<textarea id="mytext" rows="5" cols="100"></textarea>
				<input type="submit" value="发送" id="send" />
			</div>
		</div>
	</div>
</body>
</html>
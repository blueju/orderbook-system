<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>

<%--<%--%>
	<%--if (session.getAttribute("actualuser") == null) {--%>
		<%--out.println("<script>alert('登录超时，重新登录！');window.location.href='" + request.getContextPath() + "/index.jsp'</script>");--%>
		<%--return;--%>
	<%--}--%>
<%--%>--%>

<!DOCTYPE html>
<html >
<head >
	<!--定义 字符编码-->
	<meta charset = "utf-8" >
	<!--定义 渲染模式-->
	<meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" >
	<!--定义 关键词-->
	<meta name = "keywords" content = "订书系统,orderBook" >
	<!--定义 作者-->
	<meta name = "author" content = "LanJu" >
	<!--定义 页面描述-->
	<meta name = "description" content = "订书系统" >
	<!--定义 viewport-->
	<!--
			width=device-width 宽度等于设备宽度
			initial-scale=1.0 页面初始缩放值为1
			maximum-scale=1.0 允许用户的最大缩放值为1
			minimum-scale=1.0 允许用户的最小缩放值为1
			user-scalable=0 不允许用户进行缩放
		-->
	<meta name = "viewport"
	      content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" >
	<!--标题-->
	<title >订书系统</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/index.css" />
</head >
<body >

<nav class = "navbar navbar-default navbar-fixed-top" role = "navigation" >
	<div class = "container-fluid" >
		<%--三条杠--%>
		<div class = "navbar-header" >
			<button type = "button" class = "navbar-toggle" data-toggle = "collapse"
			        data-target = "#example-navbar-collapse" >
				<span class = "sr-only" >切换导航</span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
			</button >
			<a class = "navbar-brand" href = "#" >订书系统</a >
		</div >
		<%--导航栏--%>
		<div class = "collapse navbar-collapse" >
			<ul class = "nav navbar-nav" >
				<li class = "active" ><a href = "#" >订书详情</a ></li >
				<li ><a href = "#" >订书中心</a ></li >
				<li ><a href = "#" >支付中心</a ></li >
				<li ><a href = "#" >注销退出</a ></li >
			</ul >
		</div >

	</div >
</nav >

<!--JavaScript-->
<!--外部 JavaScript-->
<script src = "https://lib.baomitu.com/jquery/3.3.1/jquery.js" ></script >
<script src = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/js/bootstrap.js" ></script >
<!--自定义 JavaScript-->
<script >
    $(function () {
        $('.navbar-nav li').click(function (e) {
            e.preventDefault();
            $(this).addClass('active').siblings().removeClass('active');
        });
    });
</script >
</body >
</html >
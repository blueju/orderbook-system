<%@ page language = "java" import = "java.util.*" pageEncoding = "utf-8" %>
<%@ page contentType = "text/html; charset=utf-8" %>

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
	<title >订书系统→支付中心</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/common.css" >
	<link rel = "stylesheet" href = "../assets/css/pay.css" >
</head >
<body >
<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >


<div class = "container-fluid pay" >
	<div class = "row" >
		<div class = "col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-3 col-sm-5 col-sm-offset-1 col-xs-10 col-xs-offset-1" >
			<figure >
				<figcaption >支付宝</figcaption >
				<img src = "../assets/img/Alipay.png" class = "img-thumbnail" alt = "支付宝" width = "300px" >
			</figure >
		</div >
		<div class = "col-lg-3 col-md-3 col-sm-5 col-xs-10" >
			<figure >
				<figcaption >微信</figcaption >
				<img src = "../assets/img/WeChatPay.png" class = "img-thumbnail" alt = "微信" width = "300px" >
			</figure >
		</div >
	</div >
</div >

<br >

<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>


<%--引入 网站页脚--%>
<%@ include file = "../common/footer.jsp" %>

<!--JavaScript-->
<!--外部 JavaScript-->
<%--全局--%>
<script src = "https://lib.baomitu.com/jquery/3.3.1/jquery.js" ></script >
<script src = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/js/bootstrap.js" ></script >

<!--自定义 JavaScript-->


</body >
</html >
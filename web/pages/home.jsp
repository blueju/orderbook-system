<%@page import = "java.text.DecimalFormat" %>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.DriverManager" %>

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
	<style >
		/*订单详情表格*/
		.orderDetailTable{
			margin-top: 50px;
		}
	</style >

</head >

<body >
<%--引入 头部导航栏 --%>
<%@ include file = "../common/header.jsp" %>

<div class = "container-fluid orderDetailTable" >
	<div class = "row" >
		<table class = "table table-hover" >
			<thead >
			<tr >
				<th >学号</th >
				<th >姓名</th >
				<th >计算机网络</th >
				<th >ERP</th >
				<th >决策支持系统</th >
				<th >IT项目管理</th >
				<th >数据库应用系统设计</th >
				<th >总量</th >
				<th >总价</th >
				<th >是否支付</th >
			</tr >
			</thead >
			<tbody >
			<tr >
				<td >Tanmay</td >
				<td >Bangalore</td >
				<td >560001</td >
			</tr >
			<tr >
				<td >Sachin</td >
				<td >Mumbai</td >
				<td >400003</td >
			</tr >
			<tr >
				<td >Uma</td >
				<td >Pune</td >
				<td >411027</td >
			</tr >
			</tbody >
		</table >
	</div >

</div >


</body >
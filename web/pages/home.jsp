<%@page import = "java.text.DecimalFormat" %>
<%@ page language = "java" import = "java.util.*" pageEncoding = "utf-8" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.DriverManager, javax.swing.*" %>

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
	<link rel = "stylesheet" href = "../assets/css/home.css" >

</head >

<body >
<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%--全局定义--%>
<%
	int columnCount = 0;
	String columnName;
%>

<%--预处理--%>
<%
	db.createDataBaseConnection();
	String sql = "SELECT * FROM tb_order";
	ResultSet rs = db.executeQuery(sql);
	if(rs==null){
	    System.out.println("结果集为空！");
	}
	ResultSetMetaData data = rs.getMetaData();
	columnCount = data.getColumnCount();
%>

<div class = "container-fluid orderDetailTable" >
	<div class = "row" >
		<table class = "table table-hover" >
			<thead >
			<tr >
				<%
					for(int i = 1;i <= columnCount;i++){
						out.print("<th>"+data.getColumnName(i)+"</th>");
					}
				%>
			</tr >
			</thead >
			<tbody >
			<tr >
				<td ><%=rs.getString("学号")%></td >
				<td ><%=rs.getString("姓名")%></td >

			</tr >
			</tbody >
		</table >
	</div >

</div >

<%--引入 网站页脚--%>
<%@ include file = "../common/footer.jsp" %>

<!--JavaScript-->
	<!--外部 JavaScript-->
		<%--全局--%>
		<script src = "https://lib.baomitu.com/jquery/3.3.1/jquery.js" ></script >
		<script src = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/js/bootstrap.js" ></script >
		<%--header.jsp--%>
		<script src="../assets/js/header.js"></script>

	<!--自定义 JavaScript-->


</body >
</html >
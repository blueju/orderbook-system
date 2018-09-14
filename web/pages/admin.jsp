<%@ page language = "java" import = "java.util.*, java.sql.ResultSetMetaData" pageEncoding = "utf-8" %>
<%@ page contentType = "text/html; charset=utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
%>

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
	<title >订书系统→后台管理</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/common.css" >
	<link rel = "stylesheet" href = "../assets/css/admin.css" >
</head >
<body >

<%--引入Javabean--%>
<%--<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >--%>

<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>


<div class = "container-fluid manage" >
	<div class = "row" >
		<div class = "col-lg-8 col-lg-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-sm-offset-2" >
			<h2 >价格录入</h2 >
			<form action = "../controller/admin/price_update.jsp" method = "post"  >
				<table class = "table table-bordered price_update" >
					<thead >
					<tr >
						<th >课本名称</th >
						<th >课程名称</th >
						<th >正版书</th >
						<th >二手书</th >
						<th >复印书</th >
					</tr >
					</thead >
					<tbody >
					<%
						db.createDataBaseConnection();
						sql = "SELECT * FROM tb_book";
						rs = db.executeQuery(sql);
						while (rs.next()) {
							out.print("<tr>");
							out.print("<td class = 'book_name'><p>" + rs.getString(2) + "</p></td>");
							out.print("<td class = 'course_name'><p>" + rs.getString(3) + "</p></td>");
							out.print("<td class = 'first_book'><input type = 'text' class = 'form-control' name='price"+rs.getString(1)+"' value='" + rs.getString(4) + "'></td>");
							out.print("<td class = 'second_book'><input type = 'text' class = 'form-control' name='price"+rs.getString(1)+"' value='" + rs.getString(5) + "'></td>");
							out.print("<td class = 'third_book'><input type = 'text' class = 'form-control' name='price"+rs.getString(1)+"' value='" + rs.getString(6) + "'></td>");
							out.print("</tr>");
						}
						db.closeDataBaseConnection();
					%>
					</tbody >
				</table >
				<button class = "btn btn-primary" type = "submit" >提交修改</button >
			</form >

			<%
				String allow_content;
				String deny_content;

				db.createDataBaseConnection();
				sql = "SELECT jurisdiction FROM tb_jurisdiction WHERE name = 'all';";
				rs = db.executeQuery(sql);
				if (rs.next() == false) {

				}
				jurisdiction = rs.getInt("jurisdiction");
				db.closeDataBaseConnection();
			%>
			<h2 >订书权限</h2 >
			<form role = "form" method = "post" action = "../controller/admin/jurisdiction_update.jsp" >
				<div class = "form-group" >
					<select class = "form-control" name="jurisdiction">
						<%
							if (jurisdiction == 1) {
								out.print("<option value = \"1\" selected>允许订书操作</option >");
								out.print("<option value = \"0\" >禁止订书操作</option >");
							} else {
								out.print("<option value = \"1\" >允许订书操作</option >");
								out.print("<option value = \"0\" selected>禁止订书操作</option >");
							}
						%>
					</select >
				</div >
				<div class = "form-group" >
					<div class = "" >
						<button type = "submit" class = "btn btn-primary" >提交修改</button >
					</div >
				</div >
			</form >


			<%
				db.createDataBaseConnection();
				String notice = null;
				sql = "SELECT * FROM tb_notice;";
				rs = db.executeQuery(sql);
				if (rs.next()) {
					notice = rs.getString("content");
				}
				db.closeDataBaseConnection();
			%>

			<h2 >通知</h2 >
			<form role = "form" method = "post" action = "../controller/admin/notice_update.jsp" >
				<div class = "form-group" >
					<textarea class = "form-control" rows = "4" name = "notice" ><%=notice%></textarea >
				</div >
				<div class = "form-group" >
					<button type = "submit" class = "btn btn-primary" >发布通知</button >
				</div >
			</form >
		</div >
	</div >
</div >


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
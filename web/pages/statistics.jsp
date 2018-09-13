<%@ page language = "java" import = "java.util.*, java.sql.ResultSetMetaData" pageEncoding = "utf-8" %>
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
	<title >订书系统→后台统计</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/common.css" >
	<link rel = "stylesheet" href = "../assets/css/statistics.css" >
</head >
<body >

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>

<div class = "container-fluid statistics" >
	<div class = "row" >
		<div class = "col-lg-8 col-lg-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-sm-offset-2" >
			<h2 >订书统计</h2 >
			<form action = "" method = "post" >
				<table class = "table table-bordered" >
					<thead >
					<tr >
						<th >课本类型</th >
						<th >计算机网络</th >
						<th >ERP原理、实施与管理</th >
						<th >移动开发技术与应用</th >
						<th >决策支持系统</th >
						<th >IT项目管理</th >
						<th >信息安全</th >
						<th >数据库应用系统设计</th >
						<th >数据处理技术与SPSS</th >
					</tr >
					</thead >
					<tbody >
					<%
						db.createDataBaseConnection();
						String book[] = {"firstbook", "secondbook", "thirdbook", "fourthbook", "fifthbook", "sixthbook", "seventhbook", "eighthbook"};
						String bootype[] = {"正版书", "二手书", "复印书"};
						int i = 0;
						for (i = 1; i <= 3; i++) {
							out.print("<tr >");
							switch (i - 1) {
								case 0:
									out.print("<td >正版书</td >");
									break;
								case 1:
									out.print("<td >二手书</td >");
									break;
								case 2:
									out.print("<td >复印书</td >");
									break;
							}
							for (int j = 0; j <= 7; j++) {
								String sql = "SELECT count(*) FROM tb_order WHERE " + book[j] + " = " + i;
								ResultSet rs = db.executeQuery(sql);
								if (rs.next()) {
									out.print("<td>" + rs.getString(1) + "</td>");
								}
							}
							out.print("</tr >");
						}
					%>
					</tbody >
				</table >
			</form >

			<h2 >支付状态</h2 >
			<button class = "btn btn-success" type = "submit" name = "type" value = "already" formmethod = "post" form = "paystatus" formaction = "../controller/batch_update_paystatus.jsp" >批量 已支付
			</button >
			<button class = "btn btn-warning" type = "submit" name = "type" value = "never" formmethod = "post" form = "paystatus" formaction = "../controller/batch_update_paystatus.jsp" >批量 未支付
			</button >
			<br >
			<br >
			<form role = "form" action = "../controller/update_paystatus.jsp" id = "paystatus" >
				<table class = "table table-bordered" >
					<thead >
					<tr >
						<th class = "text-center" ></th >
						<th class = "text-center" >学号</th >
						<th class = "text-center" >姓名</th >
						<th class = "text-center" >支付状态</th >
						<th class = "text-center" >操作（切换状态）</th >
					</tr >
					</thead >
					<tbody class = "text-center" >
					<%--<input type = "checkbox" >--%>
					<%
						db.createDataBaseConnection();
						String sql = "SELECT id,name,paystatus FROM tb_order";
						ResultSet rs = db.executeQuery(sql);
						while (rs.next()) {
							out.print("<tr >");
							out.print("<td><input type='checkbox' name='batch_update_paystatus' value='" + rs.getString("id") + "'/></td>");
							out.print("<td>" + rs.getString("id") + "</td>");
							out.print("<td>" + rs.getString("name") + "</td>");
							if (rs.getInt("paystatus") == 1) {
								out.print("<td class='success'>已支付</td>");
//								out.print("<td><button name='" + rs.getString("id") + "' class='btn btn-warning' value = '" + rs.getString("id") + "' type='submit'>并未支付</button></td>");
								out.print("<td><button name='update_paystatus' class='btn btn-warning' value = '" + rs.getString("id") + "' type='submit'>并未支付</button></td>");
							} else {
								out.print("<td class='danger'>未支付</td>");
//								out.print("<td><button name='" + rs.getString("id") + "' class='btn btn-success' value = '" + rs.getString("id") + "' type='submit'>确认支付</button></td>");
								out.print("<td><button name='update_paystatus' class='btn btn-success' value = '" + rs.getString("id") + "' type='submit'>确认支付</button></td>");
							}
							out.print("</tr >");
						}
					%>
					</tbody >
				</table >
				<button class = "btn btn-success" type = "submit" name = "type" value = "already" formmethod = "post" form = "paystatus" formaction = "../controller/batch_update_paystatus.jsp" >批量 已支付
				</button >
				<button class = "btn btn-warning" type = "submit" name = "type" value = "never" formmethod = "post" form = "paystatus" formaction = "../controller/batch_update_paystatus.jsp" >批量 未支付
				</button >
			</form >
		</div >
	</div >
</div >

<br >

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
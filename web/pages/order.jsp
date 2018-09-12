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
	<title >订书系统→订书中心</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/common.css" >
	<link rel = "stylesheet" href = "../assets/css/order.css" >
</head >
<body >

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>

<div class = "container-fluid order" >
	<div class = "col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" >
		<h4 style = "text-align: center;font-weight: bold" >订书中心</h4 >
		<form class = "form-horizontal" role = "form" action = "../controller/order-alter-save.jsp" method = "post" >
			<%--学号--%>
			<div class = "form-group" >
				<label class = "col-lg-6 col-md-6 col-sm-6 control-label course-name" >学号</label >
				<div class = "col-lg-6 col-md-6 col-sm-6" >
					<p class = "form-control-static" ><%=studentId%>
					</p >
				</div >
			</div >
			<%--姓名--%>
			<div class = "form-group" >
				<label class = "col-lg-6 col-md-6 col-sm-6 control-label course-name" >姓名</label >
				<div class = "col-lg-6 col-md-6 col-sm-6" >
					<p class = "form-control-static" ><%=studentName%>
					</p >
				</div >
			</div >

			<%
				String sql;
				ResultSet rs;
				ResultSetMetaData data;
				int columnCount;
				int usableColumnCount;
				studentId = session.getAttribute("studentId");
				studentName = session.getAttribute("studentName");
				db.createDataBaseConnection();
				sql = "SELECT * FROM tb_order WHERE id = '" + studentId + "' AND name = '" + studentName + "';";
				//System.out.print(sql + "\n");
				rs = db.executeQuery(sql);
				data = rs.getMetaData();
				columnCount = data.getColumnCount();
				usableColumnCount = columnCount - 3;
				if (rs.next()) {
					for (int i = 3; i <= usableColumnCount; i++) {
						out.print("<div class = \"form-group\" >");
						out.print("<label class = \"col-lg-6 col-md-6 col-sm-6 control-label course-name\" >");
						//out.print(data.getColumnName(i));
						switch (i) {
							case 3:
								out.print("计算机网络");
								break;
							case 4:
								out.print("ERP原理、实施与管理");
								break;
							case 5:
								out.print("移动开发技术与应用");
								break;
							case 6:
								out.print("决策支持系统");
								break;
							case 7:
								out.print("IT项目管理");
								break;
							case 8:
								out.print("信息安全");
								break;
							case 9:
								out.print("数据库应用系统设计");
								break;
							case 10:
								out.print("数据处理技术与SPSS");
								break;
						}
						out.print("</label >");
						out.print("<div class = \"col-lg-6 col-md-6 col-sm-6\" >");
						out.print("<select class = 'form-control' name = '" + data.getColumnName(i) + "' >");

//						System.out.print("书对应号:" + rs.getInt(i) + "\n");
						switch (rs.getInt(i)) {
							case 0:
								out.print("<option selected value='0'>不订</option >");
								out.print("<option value='1'>正版书</option >");
								out.print("<option value='2'>二手书</option >");
								out.print("<option value='3'>复印书</option >");
								break;
							case 1:
								out.print("<option value='0'>不订</option >");
								out.print("<option selected value='1'>正版书</option >");
								out.print("<option value='2'>二手书</option >");
								out.print("<option value='3'>复印书</option >");
								break;
							case 2:
								out.print("<option value='0'>不订</option >");
								out.print("<option value='1'>正版书</option >");
								out.print("<option selected value='2'>二手书</option >");
								out.print("<option value='3'>复印书</option >");
								break;
							case 3:
								out.print("<option value='0'>不订</option >");
								out.print("<option value='1'>正版书</option >");
								out.print("<option value='2'>二手书</option >");
								out.print("<option selected value='3'>复印书</option >");
								break;
						}
						out.print("</select >");
						out.print("</div >");
						out.print("</div >");
					}
				}
			%>
			<%--保存--%>
			<div class = "form-group" >
				<div class = "col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4" >
					<button type = "submit" class = "btn btn-primary btn-block" >保存</button >
				</div >
			</div >

		</form >
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
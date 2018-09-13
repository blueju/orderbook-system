<%@ page language = "java" import = "java.util.*,java.util.List, java.util.ArrayList" pageEncoding = "utf-8" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@page import = "java.sql.*" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.text.DecimalFormat" %>
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
	<title >订书系统→订单详情</title >
	<!--CSS-->
	<%--外部CSS--%>
	<link rel = "stylesheet" href = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/css/bootstrap.css" >
	<%--自定义CSS--%>
	<link rel = "stylesheet" href = "../assets/css/common.css" >
	<link rel = "stylesheet" href = "../assets/css/home.css" >

</head >

<body >

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%--引入网站页头 --%>
<%@ include file = "../common/header.jsp" %>

<%--全局定义--%>
<%
	int columnCount = 0;
	String sql;
	ResultSet rs;
	String columnName;
	int howManyTypeBook = 0;
	float bookPrice[][];
	ResultSetMetaData data;
	//定义 每门教材有多少种选择（正版、二手、复印）
	int eachTypeHowManyChoice;
%>

<%--预处理--%>
<%
	request.setCharacterEncoding("utf-8");

	db.createDataBaseConnection();


	sql = "SELECT count(*) FROM tb_book";
	rs = db.executeQuery(sql);
	if (rs.next()) {
		//获取 总共有多少门教材 8
		howManyTypeBook = rs.getInt("count(*)");
	}

	//存入session 多少门课/多少门教材
	session.setAttribute("howManyTypeBook", howManyTypeBook);

	sql = "SELECT * FROM tb_book";
	rs = db.executeQuery(sql);
	data = rs.getMetaData();
	//获取 每门教材有几种选择（正版、二手、复印）（后面三列分别是正版，二手和复印的价格列 = 总共有多少列 - 前面无关紧要的3列）
	eachTypeHowManyChoice = data.getColumnCount() - 3;

	bookPrice = new float[howManyTypeBook][eachTypeHowManyChoice];

	// →howManyTypeBook
	int i = 0;
	while (rs.next()) {
		//→howManyTypeBook
		int j;
		for (j = 0; j <= eachTypeHowManyChoice - 1; j++) {
			bookPrice[i][j] = rs.getFloat(j + 4);
		}
		i++;
	}

	sql = "SELECT * FROM tb_order";
	rs = db.executeQuery(sql);
	data = rs.getMetaData();
	//获取 订单表共有多少列 13
	columnCount = data.getColumnCount();
%>

<%--<%@include file = "../controller/comments.jsp" %>--%>

<div class = "container-fluid orderDetailTable" >
	<div class = "row" >
		<table class = "table table-hover orderbook" >
			<thead >
			<tr >

				<%--<%--%>
					<%--int j = 0;--%>
					<%--for (i = 1; i <= columnCount; i++, j++) {--%>
						<%--out.print("<th>" + columnComments[j] + "</th>");--%>
					<%--}--%>
				<%--%>--%>

					<th>学号</th>
					<th>姓名</th>
					<th>计算机网络</th>
					<th>ERP原理、实施与管理</th>
					<th>移动开发技术与应用</th>
					<th>决策支持系统</th>
					<th>IT项目管理</th>
					<th>信息安全</th>
					<th>数据库应用系统设计</th>
					<th>数据处理技术与SPSS</th>
					<th>总量</th>
					<th>总价</th>
					<th>支付状态</th>
			</tr >
			</thead >
			<tbody >
			<%
				while (rs.next()) {
					//定义 书本总量
					int bookNumberTotal = 0;
					//定义 书本总价
					float bookPriceTotal = 0;
					//定义 支付状态
					int payStatus;
					int j = 0;
					out.print("<tr>");
					out.print("<td class=\"student_id\"><p>" + rs.getString("id") + "</p></td>");
					out.print("<td class=\"name\"><p>" + rs.getString("name") + "</p></td>");
					//从第3列开始，到第10列
					for (i = 3; i <= (columnCount - 3); i++, j++) {
						switch (rs.getInt(i)) {
							case 0:
								out.print("<td></td>");
								break;
							case 1:
								out.print("<td class='info'><p>正版书</p></td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][0];
								break;
							case 2:
								out.print("<td class='info'><p>二手书</p></td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][1];
								break;
							case 3:
								out.print("<td class='info'><p>复印书</p></td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][2];
								break;
							default:
								out.print("<td></td>");
						}
					}
					out.print("<td><p>" + bookNumberTotal + "</p></td>");
					//四舍五入 取整
//					out.print("<td>" + (int) (bookPriceTotal + 0.5f) + "</td>");
					//四舍五入 到小数点2位
					out.print("<td><p>" + (float) (Math.round(bookPriceTotal * 100)) / 100 + "</p></td>");

					payStatus = rs.getInt("paystatus");
					if (payStatus == 1) {
						out.print("<td class='success'><p>已支付</p></td>");
					} else {
						out.print("<td class='danger'><p>未支付&emsp;<a href='pay.jsp'>→</a></p></td>");
					}
				}
			%>
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


<!--自定义 JavaScript-->


</body >
</html >
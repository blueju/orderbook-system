<%@ page language = "java" import = "java.util.*" pageEncoding = "utf-8" %>
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

<div class = "container-fluid orderDetailTable" >
	<div class = "row" >
		<table class = "table table-hover" >
			<thead >
			<tr >
				<%
					for (i = 1; i <= columnCount; i++) {
						out.print("<th>" + data.getColumnName(i) + "</th>");
					}
				%>
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
					out.print("<td>" + rs.getString("学号") + "</td>");
					out.print("<td>" + rs.getString("姓名") + "</td>");
					//从第3列开始，到第10列
					for (i = 3; i <= (columnCount - 3); i++, j++) {
						System.out.print(i + "\n");
//					    j=i;
//					    System.out.print("\n"+(columnCount-3));
//						for (int j = 0; j <= i; j++) {
//							System.out.print("\n"+(howManyTypeBook-1));
						switch (rs.getInt(i)) {
//							System.out.print(rs.getInt(i) + "\n");
							case 0:
								out.print("<td></td>");
								break;
							case 1:
								out.print("<td class='info'>正版书</td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][0];
								break;
							case 2:
								out.print("<td class='info'>二手书</td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][1];
								break;
							case 3:
								out.print("<td class='info'>复印书</td>");
								bookNumberTotal++;
								bookPriceTotal = bookPriceTotal + bookPrice[j][2];
								break;
							default:
								out.print("<td></td>");
						}
//						}
					}
					out.print("<td>" + bookNumberTotal + "</td>");
					//四舍五入 取整
//					out.print("<td>" + (int) (bookPriceTotal + 0.5f) + "</td>");
					//四舍五入 到小数点2位
					out.print("<td>" + (float) (Math.round(bookPriceTotal * 100)) / 100 + "</td>");

					payStatus = rs.getInt("支付状态");
					if (payStatus == 1) {
						out.print("<td class='success'>已支付</td>");
					} else {
						out.print("<td class='danger'>未支付</td>");
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
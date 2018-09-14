<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%

	if (session.getAttribute("studentId") == null) {
		out.println("<script>alert('登录已超时，请重新登录！');");
		response.sendRedirect("../pages/login.html");
		return;
	}
	Object studentName = session.getAttribute("studentName");
	Object studentId = session.getAttribute("studentId");
	Object canIEdit = session.getAttribute("canIEdit");
%>

<%
	request.setCharacterEncoding("utf-8");
	boolean first;
	if (session.getAttribute("first") == null) {
		first = true;
	} else {
		first = (boolean) session.getAttribute("first");
	}
//	System.out.print(first + "\n");

	int jurisdiction = 0;
	String sql;
	ResultSet rs;

	db.createDataBaseConnection();
	sql = "SELECT jurisdiction FROM tb_jurisdiction WHERE name = 'all';";
	rs = db.executeQuery(sql);
	if (rs.next()) {
		jurisdiction = rs.getInt("jurisdiction");
	}
	db.closeDataBaseConnection();
%>

<nav class = "navbar navbar-default navbar-fixed-top" role = "navigation" >
	<div class = "container-fluid" >
		<%--三条杠--%>
		<div class = "navbar-header" >
			<button type = "button" class = "navbar-toggle" data-toggle = "collapse"
			        data-target = "#navbar-collapse" >
				<span class = "sr-only" >响应式导航</span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
			</button >
			<a class = "navbar-brand" href = "http://localhost:8080/OrderBook/pages/home.jsp" ><strong >订书系统</strong ></a >
		</div >
		<%--导航栏--%>
		<div class = "collapse navbar-collapse" id = "navbar-collapse" >
			<ul class = "nav navbar-nav" >
				<li ><a href = "../pages/home.jsp" >订书详情</a ></li >
				<%
					if (jurisdiction == 1) {
						out.print("<li ><a href = '../pages/order.jsp' >订书中心</a ></li >");
					} else if (canIEdit.equals("管理员")) {

					} else if (first) {
						out.print("<script>alert('已停止订书！');</script>");
						first = false;
						session.setAttribute("first", first);
					}
				%>
				<li ><a href = "../pages/pay.jsp" >支付</a ></li >
				<li ><a href = "" data-toggle = "modal" data-target = "#myModal" >通知</a ></li >
				<%
					if (canIEdit.equals("管理员")) {
						out.print("<li><a href='../pages/admin.jsp'>后台管理</a></li>");
						out.print("<li><a href='../pages/statistics.jsp'>后台统计</a></li>");
					}
				%>
			</ul >
			<div class = "navbar-right" >
				<p class = "navbar-text" ><span class = "glyphicon glyphicon-user" ></span > <%=studentId%> <%=studentName%>
				</p >
				<p class = "navbar-text" ><a href = "../controller/logout.jsp" ><span class = "glyphicon glyphicon-log-in" ></span > 注销 </a ></p >
			</div >
		</div >
	</div >
</nav >


<%--引入通知弹窗 --%>
<%@ include file = "modal/notice.jsp" %>
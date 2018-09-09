<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>

<%--<%

	if (session.getAttribute("studentId") == null) {
		out.println("<script>alert('登录已超时，请重新登录！');");
		response.sendRedirect("../pages/login.html");
		return;
	}
%>--%>

<%
	Object studentName = session.getAttribute("studentName");
	Object studentId = session.getAttribute("studentId");
%>

<%--CSS--%>

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
			<a class = "navbar-brand" href = "#" ><strong>订书系统</strong></a >
		</div >
		<%--导航栏--%>
		<div class = "collapse navbar-collapse"  id="navbar-collapse">
			<ul class = "nav navbar-nav" >
				<li ><a href = "../pages/home.jsp" >订书详情</a ></li >
				<li ><a href = "../pages/order.jsp" >订书中心</a ></li >
				<li ><a href = "../pages/pay.jsp" >支付中心</a ></li >
				<li ><a href = "" data-toggle="modal" data-target="#myModal"><strong>通知</strong></a ></li >
			</ul >
			<div class="navbar-right">
				<p class="navbar-text"><span class="glyphicon glyphicon-user"></span> <%=studentId%> <%=studentName%></p>
				<p class="navbar-text"><a href = "../controller/logout.jsp" ><span class="glyphicon glyphicon-log-in"></span> 注销 </a ></p>
			</div>
		</div >
	</div >
</nav >


<%--引入通知弹窗 --%>
<%@ include file = "modal/notice.jsp" %>
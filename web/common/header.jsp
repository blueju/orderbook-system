<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>

<%

	if (session.getAttribute("studentId") == null) {
		out.println("<script>alert('登录已超时，请重新登录！');");
		response.sendRedirect("../pages/login.html");
		return;
	}
%>

<%
	Object studentName = session.getAttribute("studentName");
	Object studentId = session.getAttribute("studentId");
%>

<nav class = "navbar navbar-default navbar-fixed-top" role = "navigation" >
	<div class = "container-fluid" >
		<%--三条杠--%>
		<div class = "navbar-header" >
			<button type = "button" class = "navbar-toggle" data-toggle = "collapse"
			        data-target = "#example-navbar-collapse" >
				<span class = "sr-only" >切换导航</span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
				<span class = "icon-bar" ></span >
			</button >
			<a class = "navbar-brand" href = "#" ><strong>订书系统</strong></a >
		</div >
		<%--导航栏--%>
		<div class = "collapse navbar-collapse" >
			<ul class = "nav navbar-nav" >
				<li class = "active" ><a href = "#" >订书详情</a ></li >
				<li ><a href = "#" >订书中心</a ></li >
				<li ><a href = "#" >支付中心</a ></li >
			</ul >
			<ul class="nav navbar-nav navbar-right">
				<li ><a href = "#" ><span class="glyphicon glyphicon-user"></span> <%=studentId%> <%=studentName%> </a ></li >
				<li ><a href = "#" ><span class="glyphicon glyphicon-log-in"></span> 注销 </a ></li >
			</ul >
		</div >

	</div >
</nav >

<!--JavaScript-->
<!--外部 JavaScript-->
<script src = "https://lib.baomitu.com/jquery/3.3.1/jquery.js" ></script >
<script src = "https://lib.baomitu.com/twitter-bootstrap/3.3.7/js/bootstrap.js" ></script >
<!--自定义 JavaScript-->
<script >
    $(function () {
        $('.navbar-nav li').click(function (e) {
            e.preventDefault();
            $(this).addClass('active').siblings().removeClass('active');
        });
    });
</script >
</body >
</html >
<%@ page language = "java" import = "java.sql.*" pageEncoding = "UTF-8" %>

<%
	//	设置 字符集
	request.setCharacterEncoding("utf-8");
	//	获取 登录学号
	String studentId = request.getParameter("studentId");
	//	获取 登录密码
	String studentPassword = request.getParameter("password");
	//	缓存超时时间
	session.setMaxInactiveInterval(1440);
	//
	boolean isExist = false;
%>

<%--数据库配置--%>
<%@include file = "../common/databaseConfig.jsp" %>

<%--日志--%>
<%
	//	猜测 日志
	//String currenttime = formatDate.format(currentTime).toString();
%>

<%--登录验证--%>
<%
	try {
		//  建立连接
		conn = DriverManager.getConnection(url, user, password);

		//  SQL语句
		sql = conn.prepareStatement("SELECT * FROM tb_user WHERE id=? and password=?");
		sql.setString(1, studentId);
		sql.setString(2, studentPassword);
		//  查询 是否存在该学生，并返回 结果集
		rs = sql.executeQuery();
		//  判断，如果存在，标识符have为true
		if (rs.next()) {
			isExist = true;
		}

		//  定义 是否可编辑
		int canEdit = 0;
		//  SQL语句
		sql = conn.prepareStatement("SELECT * FROM tb_edistatus WHERE col_name = 'editStatus'");
		//  查询 是否可编辑，并返回 结果集，0→不可编辑，1→可编辑
		rs = sql.executeQuery();
		//  判断，如果可以，
		if (rs.next()) {
			canEdit = rs.getInt("status");
		}

		//  定义  修改截止日期
		String alterDeadline = null;
		//  SQL语句
		sql = conn.prepareStatement("SELECT * FROM tb_edistatus WHERE col_name = 'editStatus'");
		//  查询 修改截止日期
		rs = sql.executeQuery();
		//  判断，如果截止日期
		while (rs.next()) {
			alterDeadline = rs.getString("col_info");
		}
		//  获取 目前时间
		java.text.SimpleDateFormat formatDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();
		//
		long targetTime = formatDate.parse(alterDeadline).getTime();
		//  如果
		if (currentTime.getTime() > targetTime) {
			canEdit = 1;
		}

		session.setAttribute("status", canEdit);
		//  销毁 结果集
		rs.close();
		//  销毁 SQL语句
		sql.close();
		//  销毁 数据库连接
		conn.close();

	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<%--检查 权限--%>
<%
	try {
		//  建立 连接
		conn = DriverManager.getConnection(url, user, password);

		//  SQL语句
		sql = conn.prepareStatement("SELECT permission FROM tb_user WHERE id=?");
		sql.setString(1, studentId);
		//  查询 权限，并返回结果集
		rs = sql.executeQuery();
		//  判断，如果权限存在，将值赋予info
		while (rs.next()) {
			String info = rs.getString("permission");
			session.setAttribute("userInfo", info);
		}

		//  销毁 结果集
		rs.close();
		//  销毁 SQL语句
		sql.close();
		//  销毁 数据库连接
		conn.close();
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
<%
	out.println(isExist);
	if (isExist) {
//		session.setAttribute("actualuser", studentName);
		session.setAttribute("actualsno", studentId);
//		application.setAttribute("ul", studentName);
//		out.println("<script>alert('这里')</script>");
//		前往 主页
//		response.sendRedirect("../pages/home.jsp");
//		return;
		out.println("<script>alert('登录成功！')</script>");
		response.setHeader("Refresh","1;url=../pages/home.jsp");
	} else {
		//前往 登录页
		out.println("<script>alert('学号或密码错误，请重新登录！')</script>");
		response.setHeader("Refresh","1;url=../pages/login.html");
	}
%>


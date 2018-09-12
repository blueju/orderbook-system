<%@ page language = "java" import = "java.sql.*" pageEncoding = "UTF-8" %>

<%--负责 获取页面传来的值 和 预处理操作--%>
<%
	//	设置 字符集
	request.setCharacterEncoding("utf-8");
	//	获取 登录学号
	String studentId = request.getParameter("studentId");
	//	获取 登录密码
	String studentPassword = request.getParameter("password");
	//	缓存超时时间
	session.setMaxInactiveInterval(1440);
	//  预定义
	//  布尔值 是否存在
	boolean isExist = false;
	//  字符串 SQL语句 入参 实参
	String sql;
	//  结果集 用于装javabean传出的结果集
	ResultSet rs;
	//  int整型 是否可修改，0→不可编辑，1→可编辑
	int canAlter = 0;
	//  字符串  截止日期
	String deadline = null;
	//  姓名
	String name = null;
%>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >


<%
	//登录验证
	try {
		// 建立连接
		db.createDataBaseConnection();
		// 数据库操作（验证学号、密码）
		sql = "SELECT * FROM tb_user WHERE id = '" + studentId + "' and password = '" + studentPassword + "';";
		rs = db.executeQuery(sql);
		//  判断是否存在，如果存在标识符isExist为true
		if (rs.next()) {
			//标识符isExist为true
			isExist = true;
			//获取姓名
			name = rs.getString("name");
		}
		//关闭连接
		db.closeDataBaseConnection();
	}catch (Exception e){
		System.out.print("登录验证时发生错误！");
		response.sendRedirect("../pages/login.html");return;
	}
%>

<%--<%
	//检查目前是否可修改
	try {
		// 建立连接
		db.createDataBaseConnection();
		// 数据库操作
		sql = "SELECT * FROM tb_edistatus WHERE col_name = 'editStatus'";
		rs = db.executeQuery(sql);
		//  判断是否可以编辑
		if (rs.next()) {
		    //获取 是否能够修改 标识符
			canAlter = rs.getInt("status");
			deadline = rs.getString("col_info");
		}
		//  获取 当前时间
		java.text.SimpleDateFormat formatDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();
		//
		long targetTime = formatDate.parse(deadline).getTime();
		//  如果 当前时间 > 目标时间，则仍可修改
		if (currentTime.getTime() > targetTime) {
			canAlter = 1;
		}
		//加入session
		session.setAttribute("status", canAlter);
	} catch (Exception e) {
		System.out.print("检查目前是否可修改时发生错误！");
		response.sendRedirect("../pages/login.html");
		return;
	}
%>--%>

<%
	//检查权限
	try {
		//建立连接
		db.createDataBaseConnection();
		//数据库操作
		sql="SELECT * FROM tb_user WHERE id='" + studentId+"';";
		rs = db.executeQuery(sql);
		//  判断是否拥有权限
		while (rs.next()) {
			String canIEdit = rs.getString("permission");
			session.setAttribute("canIEdit", canIEdit);
		}
		//关闭数据库连接
		db.closeDataBaseConnection();
	} catch (Exception e) {
		System.out.print("检查权限时发生错误！");
		response.sendRedirect("../pages/login.html");return;
	}
%>

<%
	//判断用户是否存在
	if (isExist) {
		//姓名加入session
		session.setAttribute("studentName", name);
		//学号加入session
		session.setAttribute("studentId", studentId);
		//前往主页
		response.setHeader("Refresh", "0;url=../pages/home.jsp");
	} else {
		//前往 登录页
		out.println("<script>alert('学号或密码错误，请重新登录！')</script>");
		response.setHeader("Refresh", "0;url=../pages/login.html");
	}
%>


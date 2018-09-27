<%@ page language = "java" import = "java.sql.*, java.util.Base64" pageEncoding = "UTF-8" %>

<%--负责 获取页面传来的值 和 预处理操作--%>
<%
	//	设置 字符集
	request.setCharacterEncoding("utf-8");
	//	获取 获取学号
	Object studentId = session.getAttribute("studentId");
	//	获取 获取旧密码
	String oldPassword = request.getParameter("oldPassword");
	//	获取 获取新密码
	String newPassword = request.getParameter("newPassword");
	//  字符串 SQL语句 入参 实参
	String sql;
	//  结果集 用于装javabean传出的结果集
	ResultSet rs;
	//  数据库中的用户密码
	String databaseUserPassword;
	//  前端MD5加密后的密码
	String afterMD5_password_frontend;
	//  将上面的密码再次MD5加密
	String afterMD5_password_backend;
%>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >
<jsp:useBean id = "md5" class = "MD5.MD5" scope = "page" ></jsp:useBean >


<%
	//登录验证
	try {
		// 建立连接
		db.createDataBaseConnection();
		afterMD5_password_frontend = newPassword;
		afterMD5_password_backend = md5.MD5(afterMD5_password_frontend);

		sql = "UPDATE tb_user SET password = '" + afterMD5_password_backend + "' WHERE id = '" + studentId + "';";
//		System.out.print(sql);
		db.executeUpdate(sql);
//		System.out.print("前端送过来的密码:" + afterMD5_password_frontend);
//		System.out.print("\n后端将其加密后的密码:" + afterMD5_password_frontend);
		//关闭连接
		db.closeDataBaseConnection();
		out.print("<script>alert('密码修改成功！')</script>");
		response.setHeader("refresh", "0,../pages/home.jsp");
	} catch (Exception e) {
		System.out.print("修改密码时发生错误！");
		response.sendRedirect("../pages/home.jsp");
		return;
	}
%>
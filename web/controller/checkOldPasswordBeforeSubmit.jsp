<%@ page language = "java" import = "java.sql.*, java.util.Base64" pageEncoding = "UTF-8" %>

<%--负责 获取页面传来的值 和 预处理操作--%>
<%
	//	设置 字符集
	request.setCharacterEncoding("utf-8");
	//	获取 获取学号
	Object studentId = session.getAttribute("studentId");
	//	获取 获取旧密码
	String oldPassword = request.getParameter("oldPassword");
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
	//  数据库里的密码
	String passwordFromDatabase = null;
	//  标识
	//  String how;
%>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >
<jsp:useBean id = "md5" class = "MD5.MD5" scope = "page" ></jsp:useBean >


<%
	//登录验证
	try {
		// 建立连接
		db.createDataBaseConnection();
		afterMD5_password_frontend = oldPassword;
		afterMD5_password_backend = md5.MD5(afterMD5_password_frontend);

		sql = "SELECT * FROM tb_user WHERE id = '" + studentId + "';";
		rs = db.executeQuery(sql);
		if (rs.next()) {
			passwordFromDatabase = rs.getString("password");
			if (passwordFromDatabase.equals(afterMD5_password_backend)) {
				// 相同
return ;
			} else {
				// 不同

			}
		}
		//关闭连接
		db.closeDataBaseConnection();
	} catch (Exception e) {
		System.out.print("修改密码时发生错误！");
		response.sendRedirect("../pages/home.jsp");
		return;
	}
%>
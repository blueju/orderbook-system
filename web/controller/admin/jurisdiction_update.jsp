<%@ page import = "java.sql.ResultSet" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page language = "java" import = "java.util.*, java.sql.ResultSetMetaData" pageEncoding = "utf-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	request.setCharacterEncoding("utf-8");

	String selected_jurisdiction = request.getParameter("jurisdiction");

	db.createDataBaseConnection();
	String sql;
	sql = "UPDATE tb_jurisdiction SET jurisdiction ='" + selected_jurisdiction + "';";
	db.executeUpdate(sql);
	db.closeDataBaseConnection();
	out.print("<script>alert('订书权限修改成功！')</script>");
	response.setHeader("refresh", "0,../../pages/admin.jsp");
//	response.sendRedirect("../../pages/admin.jsp");
%>



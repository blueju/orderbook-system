<%@ page import = "java.sql.ResultSet" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page language = "java" import = "java.util.*, java.sql.ResultSetMetaData" pageEncoding = "utf-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	request.setCharacterEncoding("utf-8");

	String notice = request.getParameter("notice");

	db.createDataBaseConnection();
	String sql;
	sql = "UPDATE tb_notice SET content ='" + notice + "';";
	db.executeUpdate(sql);
	db.closeDataBaseConnection();
	out.print("<script>alert('通知发布成功！')</script>");
	response.setHeader("refresh", "0,../../pages/admin.jsp");
//	response.sendRedirect("../../pages/admin.jsp");
%>



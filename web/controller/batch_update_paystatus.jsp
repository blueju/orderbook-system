<%@ page language = "java" import = "java.util.*, java.sql.ResultSet" pageEncoding = "UTF-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	String result[] = request.getParameterValues("batch_update_paystatus");
	String type = request.getParameter("type");
//	System.out.print(result.length + "\n");

	if (result == null) {
		out.print("<script>alert('未选中任何一项，请选中后重试！')</script>");
		response.setHeader("refresh", "0,../pages/statistics.jsp");
	} else {
		db.createDataBaseConnection();
		String sql;
		if (type.equals("already")) {
			for (int i = 0; i < result.length; i++) {
//				System.out.print(result[0] + "\n");
				sql = "UPDATE tb_order SET paystatus = 1 WHERE id ='" + result[i] + "';";
				db.executeUpdate(sql);
//				System.out.print(sql + "\n");
			}
			db.closeDataBaseConnection();
			response.sendRedirect("../pages/statistics.jsp");
		} else {
			for (int i = 0; i < result.length; i++) {
				sql = "UPDATE tb_order SET paystatus= 0 WHERE id='" + result[i] + "';";
				db.executeUpdate(sql);
			}
			db.closeDataBaseConnection();
			response.sendRedirect("../pages/statistics.jsp");
		}
	}
%>
<%@ page language = "java" import = "java.util.*, java.sql.ResultSet" pageEncoding = "UTF-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	String result = request.getParameter("update_paystatus");
//	if (result == null) {
//		System.out.print("空");
//	} else {
//		System.out.print("不是空");
//		System.out.print(result);
//	}

	db.createDataBaseConnection();
	String sql = "SELECT id,paystatus FROM tb_order WHERE id = '" + result + "';";
	System.out.print(sql);
	ResultSet rs = db.executeQuery(sql);
	if (rs.next()) {
		int old_paystatus = rs.getInt("paystatus");
		if (old_paystatus == 1) {
			sql = "UPDATE tb_order SET paystatus = 0 WHERE id = '" + result + "';";
//			System.out.print(sql);
			db.executeUpdate(sql);
//			System.out.print("已改为→未支付状态");
//			response.setHeader("Refresh", "0,../pages/statistics.jsp");
			response.sendRedirect("../pages/statistics.jsp");
		} else {
			sql = "UPDATE tb_order SET paystatus = 1 WHERE id = '" + result + "';";
			db.executeUpdate(sql);
//			System.out.print("已改为→已支付状态");
			response.sendRedirect("../pages/statistics.jsp");
		}
	}
%>
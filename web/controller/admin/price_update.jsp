<%@ page import = "java.sql.ResultSet" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page language = "java" import = "java.util.*, java.sql.ResultSetMetaData" pageEncoding = "utf-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	request.setCharacterEncoding("utf-8");

	db.createDataBaseConnection();
	String sql = "SELECT id FROM tb_book";
	ResultSet rs = db.executeQuery(sql);
	try {
		while (rs.next()) {
				String price[] = request.getParameterValues("price" + rs.getString("id"));
				sql = "UPDATE tb_book SET one_price = '" + price[0] + "',two_price='" + price[1] + "',three_price='" + price[2] + "' WHERE id = '" + rs.getString("id") + "';";
				db.executeUpdate(sql);
		}
		out.print("<script>alert('已更新全部书本价格！');</script>");
		response.setHeader("Refresh", "0,../../pages/admin.jsp");
	}catch (Exception e){
	    out.print("<script>alert('出现了错误，请检查！');</script>");
	}
%>



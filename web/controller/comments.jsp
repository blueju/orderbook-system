<%@ page import = "java.sql.ResultSet, java.util.List, java.util.ArrayList, java.sql.Array" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%
	db.createDataBaseConnection();
	String[] columnComments = new String[7];
	String sql;
	String content;
//	sql = "select * from COLUMNS where TABLE_SCHEMA = \"db_orderbooks\" and TABLE_NAME = \"tb_order\";";
	sql = "show full fields from tb_order;";
	ResultSet rs;
	rs = db.executeQuery(sql);
	System.out.print(rs);
	if (rs==null) {
		System.out.print("空");
	     content = rs.getString("Comment");
	    if("".equals(content)){

	    }
	    else {
	        for (int i = 0;i<7;i++){
		        columnComments[i]=rs.getString("Comment");
	        }
	    }
	}
	System.out.print(columnComments[1]);
%>
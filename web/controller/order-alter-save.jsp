<%@ page language = "java" import = "java.sql.*" pageEncoding = "UTF-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%--负责 获取页面传来的值 和 预处理操作--%>
<%
	//设置 字符集
	request.setCharacterEncoding("utf-8");
	//从session获取学号
	Object studentId = session.getAttribute("studentId");
	//从session获取姓名
	Object studentName = session.getAttribute("studentName");

	String sql;
	Connection conn = null;
	Statement stmt;
	ResultSet rs;
	ResultSetMetaData data;

	int columnCount;
	int usableColumnCount;
	String columnName;


	db.createDataBaseConnection();
	sql = "SELECT * FROM tb_order WHERE id = '" + studentId + "' AND name = '" + studentName + "';";
	rs = db.executeQuery(sql);
	data = rs.getMetaData();
	columnCount = data.getColumnCount();
	usableColumnCount = columnCount - 3;
	String firstBook = null;
	String secondBook = null;
	String thirdBook = null;
	String fourthBook = null;
	String fifthBook = null;
	String sixthBook = null;
	String seventhBook = null;
	String eighthBook = null;

	if (rs.next()) {
		for (int i = 3; i <= usableColumnCount; i++) {
			columnName = data.getColumnName(i);
			switch (i) {
				case 3:
					firstBook = request.getParameter(columnName);
					break;
				case 4:
					secondBook = request.getParameter(columnName);
					break;
				case 5:
					thirdBook = request.getParameter(columnName);
					break;
				case 6:
					fourthBook = request.getParameter(columnName);
					break;
				case 7:
					fifthBook = request.getParameter(columnName);
					break;
				case 8:
					sixthBook = request.getParameter(columnName);
					break;
				case 9:
					seventhBook = request.getParameter(columnName);
					break;
				case 10:
					eighthBook = request.getParameter(columnName);
					break;
			}
		}
	}

//	System.out.print(firstBook);
//	System.out.print(secondBook);
//	System.out.print(thirdBook);
//	System.out.print(fourthBook);
//	System.out.print(fifthBook);
//	System.out.print(sixthBook);
//	System.out.print(seventhBook);
//	System.out.print(eighthBook);

	//String bookCode[] = {firstBook, secondBook, thirdBook, fourthBook, fifthBook, sixthBook, seventhBook, eighthBook};

	db.closeDataBaseConnection();

	String dbDriver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/";
	String dbName = "db_orderbooks";
	String dbUser = "root";
	String dbPassword = "root";

	PreparedStatement batch_sql;

	Class.forName(dbDriver);

	conn = DriverManager.getConnection(url + dbName + "?user=" + dbUser
			+ "&password=" + dbPassword + "&useUnicode=true&characterEncoding=utf-8");

	//stmt = conn.createStatement();
	batch_sql = conn.prepareStatement(
			"update tb_order set firstbook=?,secondbook=?,thirdbook=?,fourthbook=?,fifthbook=?,sixthbook=?,seventhbook=?,eighthbook=? where id='"
					+ studentId + "';");

	batch_sql.setString(1,firstBook);
	batch_sql.setString(2,secondBook);
	batch_sql.setString(3,thirdBook);
	batch_sql.setString(4,fourthBook);
	batch_sql.setString(5,fifthBook);
	batch_sql.setString(6,sixthBook);
	batch_sql.setString(7,seventhBook);
	batch_sql.setString(8,eighthBook);

	//System.out.print(batch_sql);

	// 定义 标识符
	int isOK;

	isOK = batch_sql.executeUpdate();

	if(isOK!=0){
		out.print("<script>alert('修改保存成功！')</script>");
		response.setHeader("Refresh", "0;url=../pages/home.jsp");
	}else {
		out.print("<script>alert('抱歉，出了点问题！')</script>");
		response.setHeader("Refresh", "0;url=../pages/order.jsp");
	}
%>
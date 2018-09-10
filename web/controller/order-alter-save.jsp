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


	String bookCode[] = {firstBook, secondBook, thirdBook, fourthBook, fifthBook, sixthBook, seventhBook, eighthBook};

	sql = "UPDATE tb_user SET firstbook=?,secondbook=?,thirdbook=?,fourthbook=?,fifthbook=?,sixthbook=?,seventhbook=?,eighthbook=? " +
			"WHERE id = '" + studentId + "';";
	//firstbook     计算机网络
	//secondbook    ERP原理、实施与管理
	//thirdbook     移动开发技术与应用
	//fourthbook    决策支持系统
	//fifthbook     IT项目管理
	//sixthbook     信息安全
	//seventhbook   数据库应用系统设计
	//eighthbook    数据处理技术与SPSS
	db.executeUpdateMany(sql, bookCode);

	System.out.print(firstBook);
	System.out.print(secondBook);
	System.out.print(thirdBook);
	System.out.print(fourthBook);
	System.out.print(fifthBook);
	System.out.print(sixthBook);
	System.out.print(seventhBook);
	System.out.print(eighthBook);

	//	获取 登录
	String oneBook = request.getParameter("");

%>




<%
	//	数据库驱动
	String driver = "com.mysql.jdbc.Driver";

	//	数据库地址
	String url = "jdbc:mysql://localhost:3306/db_orderbooks?useUnicode=true&characterEncoding=utf-8&useSSL=true";

	//	数据库用户
	String user = "root";

	//	数据库密码
	String password = "root";

	//	加载驱动
	Class.forName(driver);

	//	定义 SQL语句
	PreparedStatement sql;

	//  定义 连接状态
	Connection conn;

	//	定义 返回结果集
	ResultSet rs;
%>
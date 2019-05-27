package DataBase;

import java.sql.*;

public class DataBaseBean {

    // 定义 标识符
    int isOK;
    // 定义 驱动
    private String dbDriver = "com.mysql.jdbc.Driver";
    // 定义 URL
    private String url = "jdbc:mysql://localhost:3306/";
    // 定义 数据库名称
    private String dbName = "db_orderbook";
    // 定义 数据库登录用户名
    private String dbUser = "root";
    // 定义 数据库登录密码
    private String dbPassword = "root";
    //  定义 数据库连接
    private Connection conn;
    //  定义 ？？（类似中转对象，其中可能包含了具体如何查询数据库信息）
    private Statement stmt;
    //  定义 返回集
    private ResultSet rs;
    private Array[] bookCode;

    //	建立数据库连接
    public Connection createDataBaseConnection() {
        try {
            //  加载数据库驱动
            System.out.print("\n准备加载驱动！");
            Class.forName(dbDriver);
            //  启动连接
              conn = DriverManager.getConnection(url + dbName + "?user=" + dbUser + "&password=" + dbPassword + "&useUnicode=true&characterEncoding=utf-8");
//            conn = DriverManager.getConnection(url, dbUser, dbPassword);
        } catch (Exception e) {
            System.out.print(e);
            System.out.print("\n建立数据库连接出错！");
        }
        return conn;
    }

    //  关闭数据库连接
    public void closeDataBaseConnection() {
        try {
            if (conn != null)
                conn.close();
            if (rs != null)
                rs.close();
        } catch (Exception e) {
            System.out.print("关闭数据库连接出错！");
        }
    }

    //  数据库查询操作
    public ResultSet executeQuery(String sql) {
        try {
            //  建立对象
            stmt = conn.createStatement();
            //  将查询所得结果 赋予 结果集（两步操作合二为一）
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            System.out.print("数据库查询操作出错！");
        }
        return rs;
    }

    //  数据库更新操作（增加、删除、修改）
    public int executeUpdate(String sql) {
        try {
            //  建立对象
            stmt = conn.createStatement();
            //  将更新结果返回值int 赋予 isOK（两步操作合二为一）
            isOK = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.print("数据库更新操作出错！");
        }
        return isOK;
    }

    //  数据库批量更新操作（增加、删除、修改）
    public int executeUpdateMany(String sql, String[] bookCode) {
        try {
            stmt = conn.prepareStatement(sql);
            System.out.print(bookCode[0] + "\n");
            ((PreparedStatement) stmt).setString(1, bookCode[0]);
            ((PreparedStatement) stmt).setString(2, bookCode[1]);
            ((PreparedStatement) stmt).setString(3, bookCode[2]);
            ((PreparedStatement) stmt).setString(4, bookCode[3]);
            ((PreparedStatement) stmt).setString(5, bookCode[4]);
            ((PreparedStatement) stmt).setString(6, bookCode[5]);
            ((PreparedStatement) stmt).setString(7, bookCode[6]);
            ((PreparedStatement) stmt).setString(8, bookCode[7]);
            System.out.print(sql + "\n");
//            isOK = ((PreparedStatement) stmt).executeUpdate(sql);
//            stmt = conn.createStatement();
//            stmt.executeUpdate(sql);
//            sql =sql;
//            PreparedStatement sqlMany = new abstract
//            sqlMany = sql;
//            //  建立对象
//            stmt = conn.createStatement();
//            sql = conn.prepareStatement();
//            sql.setString(1, bookCode[0]);
            //  将更新结果返回值int 赋予 isOK（两步操作合二为一）
//            isOK = sql.executeUpdate();
        } catch (SQLException e) {
            System.out.print("数据库更新操作出错！");
        }
        return isOK;
    }
}

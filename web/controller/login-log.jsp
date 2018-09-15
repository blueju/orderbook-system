<%@ page language = "java" import = "java.sql.*" pageEncoding = "UTF-8" %>

<%--引入Javabean--%>
<jsp:useBean id = "db" class = "DataBase.DataBaseBean" scope = "page" ></jsp:useBean >

<%!
	public String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
%>

<%!
	public static String getBrowser(String userAgent) {
		if (userAgent == null || userAgent.trim().length() < 1) {
			return "Unknown";
		}
		String[] brorserEN = new String[]{
				"rv:11.0",//IE 11.0
				"Firefox",//火狐
				"iPhone",//苹果
				"Android",//安卓
				"Chrome",
		};
		String[] brorserCN = new String[]{
				"IE 11.0",
				"Firefox",
				"iPhone",
				"Android",
				"Chrome",
		};
		for (int i = 0; i < brorserEN.length; i++) {
			if (userAgent.indexOf(brorserEN[i]) > -1) {
				return brorserCN[i];
			}
		}
		if (userAgent.indexOf("MSIE") > -1) {
			if (userAgent.indexOf("MSIE 9.0") > -1) {
				return "IE 9.0";
			} else if (userAgent.indexOf("MSIE 10.0") > -1) {
				return "IE 10.0";
			} else if (userAgent.indexOf("MSIE 8.0") > -1) {
				return "IE 8.0";
			} else if (userAgent.indexOf("MSIE 7.0") > -1) {
				return "IE 7.0";
			} else if (userAgent.indexOf("MSIE 6.0") > -1) {
				return "IE 6.0";
			}
			return "IE";
		}
		return "Other Browser";
	}
%>

<%
	request.setCharacterEncoding("utf-8");

	Object studentName = session.getAttribute("studentName");
	String UserAgent = request.getHeader("User-Agent");
	String ip = getIpAddress(request);
	String browser = getBrowser(UserAgent);


	String sql = "insert into tb_login_log(ip,name,browser,user_agent)values('" + ip + "','" + (String) studentName + "','" + browser + "','" + UserAgent + "');";
	db.createDataBaseConnection();
	db.executeUpdate(sql);
	db.closeDataBaseConnection();
	response.setHeader("Refresh", "0;url=../pages/home.jsp");
%>




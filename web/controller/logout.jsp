<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>

<%
	session.removeAttribute("studentId");
	session.removeAttribute("studentName");
	session.invalidate();
	response.sendRedirect("../pages/login.html");
%>

<%@ page language = "java" import = "java.util.*, java.sql.ResultSet, DataBase.DataBaseBean, java.text.DateFormat, java.sql.Time, java.sql.Date" pageEncoding = "utf-8" %>
<%@ page contentType = "text/html; charset=utf-8" %>

<%!
//	private DataBaseBean db;
%>
<%
	String notice_sql;
	ResultSet notice_rs;
	String notice_noticeContent = null;
	Date notice_date = null;
	Time notice_time = null;

	db.createDataBaseConnection();
	notice_sql = "SELECT * FROM tb_notice;";
	notice_rs = db.executeQuery(notice_sql);
	if (notice_rs.next()) {
		notice_noticeContent = notice_rs.getString("content");
		notice_date = notice_rs.getDate("time");
		notice_time = notice_rs.getTime("time");
	}
%>

<div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true" >
	<div class = "modal-dialog" >
		<div class = "modal-content" >
			<div class = "modal-header" >
				<button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" >&times;</button >
				<h4 class = "modal-title" id = "myModalLabel" >通知</h4 >
			</div >
			<div class = "modal-body" >
				<p ><%=notice_noticeContent%>
				</p >
				<p style = "text-align: right" ><%=notice_date%>&nbsp;<%=notice_time%>
				</p >
			</div >
			<div class = "modal-footer" >
				<button type = "button" class = "btn btn-default" data-dismiss = "modal" >关闭</button >
			</div >
		</div >
	</div >
</div >

<%
	db.closeDataBaseConnection();
%>
<%@ page language="java" import="java.util.*,javabean.ClassMessage,javabean.SClass,java.util.ArrayList" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息管理系统子模块</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%  
 	 String sclass = request.getParameter("class");
  	 sclass = new String(sclass.getBytes("ISO-8859-1"),"utf-8");
  	 System.out.print(sclass);
  	 SClass sc = new SClass();
  	 List<ClassMessage> clist = sc.query(sclass);
  	 pageContext.setAttribute("cuslist",clist);
   %>
	<center>
    <form action="servlet/UpdateclassServlet" method="post">
		<table  border="1" align="center" cellpadding="0" cellspacing="0">
			<caption><font color="blue" size="5">班级信息</font></caption>
			<c:forEach var="cus" items="${cuslist}" varStatus="item">
			<tr>
				<td height="50" width="100" align="center" valign="middle">班级：</td>
				<td height="50" width="100" align="center" valign="middle">年级：</td>
				<td height="50" width="100" align="center" valign="middle">学生人数：</td>
				<td height="50" width="100" align="center" valign="middle">学生宿舍：</td>
				<td height="50" width="100" align="center" valign="middle">班主任：</td>
				<td height="50" width="100" align="center" valign="middle">辅导员：</td>
			</tr>
			<tr>
				<td height="50" width="100" valign="middle">${cus.sclass}</td>
				<td height="50" width="100" valign="middle">${cus.grade}</td>
				<td height="50" width="100" valign="middle">${cus.scount}</td>
				<td height="50" width="100" valign="middle">${cus.sroom}</td>
				<td height="50" width="100" valign="middle">${cus.banzhuren}</td>
				<td height="50" width="100" valign="middle">${cus.fudaoyuan}</td>
			</tr>
			</c:forEach>
		</table>
		<table  border="1" align="center" cellpadding="0" cellspacing="0">
			<caption><font color="red" size="5">${ requestScope.message }</font></caption>
			<caption><font color="blue" size="5">修改班级信息</font></caption>
			<tr>
				<td height="50" width="100" align="right" valign="middle">班级：</td>
				<td height="50" colspan="2"><input type="text" name="class" id="class"/></td>
				<td height="50" width="100" align="right" valign="middle">年级：</td>
				<td height="50" colspan="2"><input type="text" name="grade" id="grade"/></td>
			</tr>
			<tr>
				<td height="50" width="100" align="right" valign="middle">学生人数：</td>
				<td height="50" colspan="2"><input type="text" name="scount" id="scount"/></td>
				<td height="50" width="100" align="right" valign="middle">学生宿舍：</td>
				<td height="50" colspan="2"><input type="text" name="sroom" id="sroom"/></td>
			</tr>
			<tr>
				<td height="50" width="100" align="right" valign="middle">班主任：</td>
				<td height="50" colspan="2"><input type="text" name="banzhuren" id="banzhuren"/></td>
				<td height="50" width="100" align="right" valign="middle">辅导员：</td>
				<td height="50" colspan="2"><input type="text" name="fudaoyuan" id="fudaoyuan"/></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><input type="submit" name="update" id="update" value="修改" /></td>
				<td><input type="reset" name="reset" id="reset" value="重置" /></td>
			</tr>    
    	</table>
    </form> 
    </center>
    <a href="javascript:history.go(-1);">返回上一页</a>
  </body>
</html>

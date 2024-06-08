<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.DBConnections.DatabaseCon"%>
<%@ page import="com.crypto.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File | Re-Encryption</title>
</head>
<body>
<%
String filename = request.getParameter("fname");
HttpSession session1 = request.getSession();
session.setAttribute("filename", filename);
String size = request.getParameter("fsize");

String encrypt = request.getParameter("fencrypt");
String req = request.getParameter("frequest");
String authority = session.getAttribute("authority").toString();

String encontent1 = AES.encrypt99(encrypt);

System.out.println(filename+" "+size+" "+encrypt+" "+authority+" "+encontent1);

int ans=0;
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/honeypotserver","root","root");
	PreparedStatement ps = con.prepareStatement("INSERT INTO reencryption(authority,filename,requestby,filesize,encrypt,reencrypt) VALUES(?,?,?,?,?,?)");
	ps.setString(1, authority);
	ps.setString(2, filename);
	ps.setString(3, req);
	ps.setString(4, size);
	ps.setString(5, encrypt);
	ps.setString(6, encontent1);
	
	ans = ps.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
if(ans==1) {
	response.sendRedirect("FileReencryptSuccess.jsp");
} else {
	response.sendRedirect("Error.jsp");
}
%>
</body>
</html>
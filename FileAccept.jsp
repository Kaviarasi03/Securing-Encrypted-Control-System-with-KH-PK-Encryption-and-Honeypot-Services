<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="com.DBConnections.DatabaseCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>

<%@page import="java.sql.*" %> 
    <%@page import="com.Servlet.*" %>
<%@page import="com.Implementation.*" %>
<%@page import="com.Bean.*" %>
<%@page import="com.Interface.*" %>
<%@page import="java.time.*" %>
<%@page import="java.time.format.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Accept | Success</title>
</head>
<body>
<%
String downer=session.getAttribute("downer").toString();
session.setAttribute("downer", downer);

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

String pro_name="do_file_response";
String req_ip=request.getRemoteAddr();
String time_req=dtf.format(now);
String req_url=request.getRequestURL().toString();
String browser_used = request.getHeader("User-Agent");
String username=downer;
String portno=String.valueOf(request.getLocalPort());
String issecure=String.valueOf(request.isSecure());
String pro_status="response";

LogBean LB=new LogBean();
LB.setpname(pro_name);
LB.setreqip(req_ip);
LB.setreqtime(time_req);
LB.setrequrl(req_url);
LB.setbrowsername(browser_used);
LB.setusername(username);
LB.setportno(portno);
LB.setissecure(issecure);
LB.setprostatus(pro_status);


SSInterface SSILB=new SSImplementation();
SSILB.doLogdata(LB);




String filename=request.getParameter("fname");


String requestby=request.getParameter("reqby");


System.out.println("File Accept-"+filename+requestby);

String filekey="";


try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/honeypotserver","root","root");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from uploadfile where filename='"+filename+"' and username='"+downer+"'");

   while(rs.next())
    {
        
  			filekey=rs.getString("filekey");
  }
    }
catch(Exception e){
  //  out.print(e.getMessage());
}

System.out.println(downer);

int ans=0;
try
{
	Connection con=(Connection)DriverManager.getConnection(
	        "jdbc:mysql://localhost:3306/honeypotserver","root","root");
	PreparedStatement ps=con.prepareStatement("update filerequest set filekey='"+filekey+"',acceptby='"+downer+"',status='Allowed' where requestby='"+requestby+"' and filename='"+filename+"'");
	ans=ps.executeUpdate();
	if(ans==1)
	{
		response.sendRedirect("FileAcceptSuccess.jsp");
		
	}

	else
	{
		response.sendRedirect("DO_Home.jsp");
	}

}
catch(Exception e)
{
	e.printStackTrace();
}






%>
</body>
</html>
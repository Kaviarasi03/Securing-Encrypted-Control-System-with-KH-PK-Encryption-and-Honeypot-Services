<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.DBConnections.DatabaseCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>

<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Request | Success</title>
</head>
<body>
<%






String filename=request.getParameter("fname");

String filesize=request.getParameter("fsize");

String encrypt = request.getParameter("fencrypt");

String duser=session.getAttribute("duser").toString();


String downer="";

System.out.println("Data Request:"+filename+" - "+filesize+" - "+duser);


try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/honeypotserver","root","root");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from uploadfile where filename='"+filename+"' and size='"+filesize+"'");

   while(rs.next())
    {
        
  			downer=rs.getString("username");
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
	PreparedStatement ps=con.prepareStatement("INSERT INTO filerequest(fileowner,filename,filesize,requestby,status,encrypt) VALUES(?,?,?,?,?,?)");
	ps.setString(1,downer);
	ps.setString(2, filename);
	ps.setString(3, filesize);
	ps.setString(4, duser);
	ps.setString(5, "Waiting");
	ps.setString(6, encrypt);
	ans=ps.executeUpdate();
	
}
catch(Exception e)
{
	e.printStackTrace();
}


if(ans==1)
{
	response.sendRedirect("FileReqSuccess.jsp");
	
}

else
{
	response.sendRedirect("DU_Home.jsp");
}


%>
</body>
</html>
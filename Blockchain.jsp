<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.DBConnections.DatabaseCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %> 
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Block Chain | Hash Values</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

</head>
<body style="background: #f0f5f5">


<div class="container">
	<div class="row">
       <div class="col-md-12">
       <a class="btn btn-primary mb-3" href="AuthorityHome.jsp">Back</a>
        <h4>Block Chain Hash values </h4> <br> 
        <div class="table-responsive">
              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                   <tr>
                    <th>S.no</th>
                    <th>Current Date</th>
             		<th>Block1</th>
             		<th>Block2</th>
             		<th>Block3</th>
              		<th>Block4</th>
                    <th>Block5</th>
                    <th>Block6</th>
                     </tr>
                   </thead>
 
 <%
 try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/honeypotserver","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from blockchain");
%>
	
    <tbody>
     <%
     int ii=1;
              
        while(rs.next())
        {
            %>
    <tr>
    <td><%=ii%></td>
   
   
    <td><%=rs.getString("date") %></td>
    <td><%=rs.getString("block1") %></td>
    <td><%=rs.getString("block2") %></td>
    <td><%=rs.getString("block3") %></td>
    <td><%=rs.getString("block4") %></td>
    <td><%=rs.getString("block5") %></td>
    <td><%=rs.getString("block6") %></td>
    </tr>
    <%
            ii++;
        }
        %>
   
    </tbody>
        
</table>

 <%con.close();
    
        %><br><%
}
    catch(Exception e){
    	  e.printStackTrace();
    	}
    		
    %>
    </div>
    </div>
	</div>
</div>


</body>
</html>
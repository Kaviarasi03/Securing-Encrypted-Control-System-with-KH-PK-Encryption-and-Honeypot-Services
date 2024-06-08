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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>HoneyPot Service Monitoring </title>

<link rel="stylesheet" href="css/navbar.css">

<style>



h2{
	text-align: center; 
	color: rgb(12, 129, 149);
    font-family: cursive;
    font-weight: bolder;
    margin-top: 20px;

}


img {
	height: 50em;
	position: absolute;
	width: 100vw;
	filter: blur(5px);
	-webkit-filter: blur(5px);
}

.col-md-12 {

	background-color: white;
	margin-top: 50px;
	border-radius: 20px;


}

.table-responsive{

	color: black;
    font-family: cursive;
    font-weight: bold;

	}

body{

  	background: linear-gradient(to right, #3a7bd5, #3a6073); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}




</style>

</head>
<body>
<%
// Set refresh, autoload time as 5 seconds
response.setIntHeader("Refresh", 5);

// Get current time
Calendar calendar = new GregorianCalendar();
String am_pm;

int hour = calendar.get(Calendar.HOUR);
int minute = calendar.get(Calendar.MINUTE);
int second = calendar.get(Calendar.SECOND);

if(calendar.get(Calendar.AM_PM) == 0)
   am_pm = "AM";
else
   am_pm = "PM";
String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
//out.println("Crrent Time: " + CT + "\n");

 {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/honeypotserver","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT pid,username FROM honeypotserver.logdata where pname='usr_log' group by time_req");
		String pid="0",username;
        while(rs.next())
        {
        	pid=rs.getString(1);
        	username=rs.getString(2);   	
        }
        
        int idv=Integer.valueOf(pid);
        idv=idv-1;
        ResultSet rs1=st.executeQuery("SELECT sessionid FROM honeypotserver.logdata where pid='"+idv+"'");
		String pid1="NoID";
        while(rs1.next())
        {
        	pid1=rs1.getString(1);
        	
        }
        System.out.println(pid1);
        
        if(!pid1.equals("NoID")&&pid1!=null)
        {
        	
        	PreparedStatement ps=con.prepareStatement("update sessiontable set status='Block' where sessionid='"+pid1+"'");
        	ps.executeUpdate();
        	
        }
        
        
        //
        
 }



%>
<div class="container ">

		<div class="row">
			<div class="col-md-12">
			<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="CloudServer_Home.jsp">BACK</a>
        </div>
        
      
				<h2 ><span>HoneyPot Service Montoring</span></h2>
				<br>
				<div class="table-responsive">
					<table id="myTable" class="table table-bordred table-striped">
						<thead>
							<tr class="strikeout">
							
								<th>Process ID</th>
             					<th>Process Name</th>
            					<th>Time Of Request</th>
             					<th>Request URL</th>
             					<th>Brower Used</th>
             					<th>User Name</th>
             					<th>Status</th>
             
								
							</tr>
						</thead>

						 <%                           
                                 try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/honeypotserver","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from logdata order by pid desc");
    %>




						<tbody>
							<%
							
							int ii = 1;
								while (rs.next())
								{
							%>

							<tr>
							
								<td><%=rs.getString("pid")%></td>
                				<td><%=rs.getString("pname")%></td>
                				<td><%=rs.getString("time_req") %></td>
                				<td><%=rs.getString("req_url") %></td>
                				<td><%=rs.getString("browser_used") %></td>
                				<td><%=rs.getString("username") %></td>
                				<td><%=rs.getString("pro_status") %></td>
								
							</tr>

							<%
							ii++;
								}
							%>

						</tbody>

					</table>

					<%
						con.close();
					%><br>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		</div>
	</div>

	



</body>
</html>
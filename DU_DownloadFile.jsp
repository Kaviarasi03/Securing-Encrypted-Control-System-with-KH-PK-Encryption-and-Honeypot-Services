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
<%@page import="java.time.format.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Owner | File Request</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400"> 
    <link rel="stylesheet" href="css/bootstrap.min.css">                                      
    <link rel="stylesheet" href="css/magnific-popup.css">                                
    <link rel="stylesheet" href="css/templatemo-style.css">
    
    
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<link  rel="stylesheet" type="text/css" href="//table/table.css"></link>
</head>
<body style = "background: linear-gradient(to right,#4b6cb7, #182848);">
<%

String duser=session.getAttribute("duser").toString();
session.setAttribute("duser", duser);
String sessionid=request.getSession().getId();


{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/honeypotserver","root","root");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from sessiontable where sessionid='"+sessionid+"' and status='Block'");
    
    while(rs.next())
    {
    	
    	//response.sendRedirect("");
    	RequestDispatcher dd = request.getRequestDispatcher("Blocked.jsp");

    	dd.forward(request, response);
    	
    }
    
    
}

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

String pro_name="du_file_download";
String req_ip=request.getRemoteAddr();
String time_req=dtf.format(now);
String req_url=request.getRequestURL().toString();
String browser_used = request.getHeader("User-Agent");
String username=duser;
String portno=String.valueOf(request.getLocalPort());
String issecure=String.valueOf(request.isSecure());
String pro_status="response";

LogBean LB=new LogBean();
LB.setsessionid(sessionid);
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

%>
<div class="container">
   <h1 class="tm-blue-text tm-welcome-title tm-margin-b-35" style="color: white;">Download Requested File</h1>
    	<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary" >
					<div class="panel-heading" style = "background: linear-gradient(to right, #ad5389, #3c1053);">
						<h3 class="panel-title">List of File to Request</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter" style = "Top: -14px";></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Files" />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
						<th><input type="text" class="form-control" placeholder="File Number" disabled></th>
                        <th><input type="text" class="form-control" placeholder="File Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Secret Key" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Request By" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Accept By" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Start Time" disabled></th>
                        <th><input type="text" class="form-control" placeholder="End Time" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Action" disabled></th>
							</tr>
						</thead>
						<%
 try
    {
	 	Connection con1 = null;

		con1 = DatabaseCon.createConnection();
		PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM honeypotserver.timecontrol");

		ResultSet rs = ps1.executeQuery();
		
		String filename = "";
%>
						<tbody>
							 <%
							
								
								int ii = 1;
					 
				        {
									while (rs.next())
									{
										
										filename = rs.getString("filename");
								%>
            <tr>
             
                <td><%=ii%></td>
                <td><%=rs.getString("filename") %></td>
                <td><%=rs.getString("key") %></td>
                <td><%=rs.getString("requestby") %></td>
                <td><%=rs.getString("acceptby") %></td>
                <td><%=rs.getString("Start_Time") %></td>
                <td><%=rs.getString("End_Time") %></td>
                <td><a class="btn btn-primary btn-sm" href="Download?Filename=<%=rs.getString("filename")%>&&st=<%=rs.getString("Start_Time")%>&&et=<%=rs.getString("End_Time")%>">Download</a></td>
                
             </tr>
           <%
                
               }
               %>
				<%
							ii++;
								}
							
							%>

				<%
						con1.close();
					%>
				<%

						} catch (Exception e) {
							e.printStackTrace();
						}
							
							

						
					%>
        
						</tbody>
					</table>
					 
				</div>
			</div>
		
		</div>
	</div>

<script src="js/jquery-1.11.3.min.js"></script>            
<script src="js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="table/table.js"></script>
<script>
/**
*   I don't recommend using this plugin on large tables, I just wrote it to make the demo useable. It will work fine for smaller tables 
*   but will likely encounter performance issues on larger tables.
*
*		<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
*		$(input-element).filterTable()
*		
*	The important attributes are 'data-action="filter"' and 'data-filters="#table-selector"'
*/
(function(){
    'use strict';
	var $ = jQuery;
	$.fn.extend({
		filterTable: function(){
			return this.each(function(){
				$(this).on('keyup', function(e){
					$('.filterTable_no_results').remove();
					var $this = $(this), 
                        search = $this.val().toLowerCase(), 
                        target = $this.attr('data-filters'), 
                        $target = $(target), 
                        $rows = $target.find('tbody tr');
                        
					if(search == '') {
						$rows.show(); 
					} else {
						$rows.each(function(){
							var $this = $(this);
							$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
						})
						if($target.find('tbody tr:visible').size() === 0) {
							var col_count = $target.find('tr').first().find('td').size();
							var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
							$target.find('tbody').append(no_results);
						}
					}
				});
			});
		}
	});
	$('[data-action="filter"]').filterTable();
})(jQuery);

$(function(){
    // attach table filter plugin to inputs
	$('[data-action="filter"]').filterTable();
	
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	$('[data-toggle="tooltip"]').tooltip();
})

</script>
</body>
</html>
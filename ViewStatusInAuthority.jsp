<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DBConnections.DatabaseCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<title>Insert title here</title>

<style type="text/css">
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

body {
	font-family: Helvetica;
	-webkit-font-smoothing: antialiased;
	background: rgba(71, 147, 227, 1);
}

h1 {
	text-align: center;
	font-size: 30px;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: white;
	padding: 30px 0;
}

/* Table Styles */
.table-wrapper {
	margin: 10px 70px 70px;
	box-shadow: 0px 35px 50px rgba(0, 0, 0, 0.2);
}

.fl-table {
	border-radius: 5px;
	font-size: 12px;
	font-weight: normal;
	border: none;
	border-collapse: collapse;
	width: 100%;
	max-width: 100%;
	white-space: nowrap;
	background-color: white;
}

.fl-table td, .fl-table th {
	text-align: center;
	padding: 8px;
}

.fl-table td {
	border-right: 1px solid #f8f8f8;
	font-size: 12px;
}

.fl-table thead th {
	color: #ffffff;
	background: #4FC3A1;
}

.fl-table thead th:nth-child(odd) {
	color: #ffffff;
	background: #324960;
}

.fl-table tr:nth-child(even) {
	background: #F8F8F8;
}

/* Responsive */
@media ( max-width : 767px) {
	.fl-table {
		display: block;
		width: 100%;
	}
	.table-wrapper:before {
		content: "Scroll horizontally >";
		display: block;
		text-align: right;
		font-size: 11px;
		color: white;
		padding: 0 0 10px;
	}
	.fl-table thead, .fl-table tbody, .fl-table thead th {
		display: block;
	}
	.fl-table thead th:last-child {
		border-bottom: none;
	}
	.fl-table thead {
		float: left;
	}
	.fl-table tbody {
		width: auto;
		position: relative;
		overflow-x: auto;
	}
	.fl-table td, .fl-table th {
		padding: 20px .625em .625em .625em;
		height: 60px;
		vertical-align: middle;
		box-sizing: border-box;
		overflow-x: hidden;
		overflow-y: auto;
		width: 120px;
		font-size: 13px;
		text-overflow: ellipsis;
	}
	.fl-table thead th {
		text-align: left;
		border-bottom: 1px solid #f7f7f9;
	}
	.fl-table tbody tr {
		display: table-cell;
	}
	.fl-table tbody tr:nth-child(odd) {
		background: none;
	}
	.fl-table tr:nth-child(even) {
		background: transparent;
	}
	.fl-table tr td:nth-child(odd) {
		background: #F8F8F8;
		border-right: 1px solid #E6E4E4;
	}
	.fl-table tr td:nth-child(even) {
		border-right: 1px solid #E6E4E4;
	}
	.fl-table tbody td {
		display: block;
		text-align: center;
	}
}
</style>
</head>
<body>

	<%

%>

	<h1>DATA IN CLOUD</h1>
	<div class="table-wrapper" style="overflow: scroll;">
		<table class="fl-table" style="height: 50vh">
			<thead>
				<tr>
					<th>SR.NO</th>
					<th>Filename</th>
					<th>Key</th>
					<th>RequestBy</th>
					<th>AcceptBy</th>
				
					<th>Action</th>
					
				</tr>
			</thead>
			<%
						
							try {
								
								
								Connection con1 = null;

								con1 = DatabaseCon.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `filerequest`");

								ResultSet rs = ps1.executeQuery();
								
								String filename = "";
								
						%>

			<tbody>
				<%
							
							int ii = 1;
								while (rs.next())
								{
									
									filename = rs.getString("filename");
							%>
				<tr>
					<td><%=ii %></td>
					<td><%=rs.getString("filename") %></td>
					<td><%=rs.getString("filekey") %></td>
					<td><%=rs.getString("requestBy") %></td>
					<td><%=rs.getString("acceptby") %></td>
					
					
					
					<td><a class="btn btn-success btn-sm"
						href="TimeControl.jsp?ffilename=<%=rs.getString("fileName")%>&ffilekey=<%=rs.getString("filekey")%>&requestedBy=<%=rs.getString("requestBy")%> &acceptBy=<%=rs.getString("acceptby") %>">Validate</a>
					</td>
				</tr>

				<%
							ii++;
								}
							
							%>

				<%
						con1.close();
					%><br>
				<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
			
			<tbody>
		</table>
	</div>

	<script type="text/javascript">

if(test=${param.success==1}){
	console.log("success");
	swal("Success!", "Request Has Been Sent SuccessFully!", "success");
	
}
if(test=${param.error==1}){
	console.log("success");
	swal("Error!", "Wait for DataSender will Accepted!", "error");
	
}

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
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

<title>Data Owner | File Upload</title>
<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/File.css">
</head>
<body>
<%

String downer=session.getAttribute("downer").toString();
session.setAttribute("downer", downer);


DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

String pro_name="do_file_upload";
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




Random r= new Random(); 

String key="ABCDEF123456789";
char c=key.charAt(r.nextInt(key.length()));
char c1=key.charAt(r.nextInt(key.length()));
char c2=key.charAt(r.nextInt(key.length()));
char c3=key.charAt(r.nextInt(key.length()));
char c4=key.charAt(r.nextInt(key.length()));
char c5=key.charAt(r.nextInt(key.length()));

String Secretkey=""+c+""+c1+""+c2+""+c3+""+c4+""+c5;
System.out.print(Secretkey);


%>

<div class="frame">
	<form action="FileuploadServlet" method="post" enctype="multipart/form-data">
	<div class="center">
		<div class="title">
			
			<h1>Drop the file to upload</h1>
			
		</div>

		<div class="dropzone">
			<img src="http://100dayscss.com/codepen/upload.svg" class="upload-icon" />
			<input type="file" name="filename" value="Choose" class="upload-input" multiple  multiple >
			
		</div> 
		
	Secret key:<input type="text"  name="key" value="<%=Secretkey%>"  readonly style="text-align:center"/>

		<input type="submit" class="btn" name="uploadbutton" value="Upload file">

	</div>
	</form>
</div>

</body>

</html>
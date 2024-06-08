<%@page import="com.crypto.AES"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Token | Decrypt</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
	}
	
	body{
		background-color:   #004085;
		
	}
</style>
</head>
<body>

<%             
	String filename = request.getParameter("ffilename");
	String key = request.getParameter("ffilekey");
	String requestby = request.getParameter("requestedBy");
	String acceptby = request.getParameter("acceptBy");

	
	
	
	System.out.println("Filename::"+filename+":key::"+key+":requestby::"+requestby+"::acceptBy::"+acceptby);


%>
<div class="container px-4 py-5 mx-auto">
    <div class="card card0">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1">
             <form action="TimeTokenServlet" method="post">
                <div class="row justify-content-center my-auto" style="width: 25vw">
                    <div class="col-md-8 col-10 my-5">
                   <input type="hidden" value=<%=filename%> name="fvfilename" >
                   <input type="hidden" value="<%=key%>" name="key"> 
                   <input type="hidden" value="<%=requestby%>" name="requestby">
                   <input type="hidden" value="<%=acceptby%>" name="acceptby">
                   
                        <div class="row justify-content-center px-3 mb-3"> <img > </div>
                        <h3 class="mb-5 text-center heading">Time Token Controller</h3>
                        <h6 class="msg-info">Please set your time for Download</h6>
                        <div class="form-group"> <label class="form-control-label text-muted">Start Time</label> <input type="text" id="email" name="ftime" placeholder="Time Format (10.00)" class="form-control" required> </div>
                        <div class="form-group"> <label class="form-control-label text-muted">End Time</label> <input type="text" id="psw" name="ttime" placeholder="Time Format (02.00)" class="form-control" required> </div>
                        <div class="form-group"><label class="form-control-label text-muted" style="font-size : 18px;">File for set time : <%=filename %></label></div>
                        <div class="form-group"> <label class="form-control-label text-muted">Enter File Name</label> <input type="text" id="psw" name="fffilename" placeholder="Enter the file name" class="form-control" required> </div>
                        <div class="row justify-content-center my-3 px-3"> <button type="submit" class="btn-block btn-color">Set Time</button> </div>
               
                    </div>
                </div>
                
           </form>
            </div>
             <div >
               
                
            </div> 
            <div class="my-auto">
                <img alt="" src="assets/img/timecontrol.gif" style="width:750px;height: 700px;">
                  <!--  <h3 class="text-white"> Group_Data_Sharing</h3> <small class="text-white">Secure Data Group Sharing and Dissemination with Attribute and Time Conditions in Public Cloud.</small>
                -->
                </div> 
        </div>
        
    </div>
     
</div>
</body>
</html>
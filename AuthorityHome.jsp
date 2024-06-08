<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Implementation.*" %>
<%@page import="com.Bean.*" %>
<%@page import="com.Interface.*" %>
<%@page import="java.time.*" %>
<%@page import="java.time.format.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Authority| Home</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<%

String authority=session.getAttribute("authority").toString();
session.setAttribute("authority", authority);

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

String pro_name="do_home_response";
String req_ip=request.getRemoteAddr();
String time_req=dtf.format(now);
String req_url=request.getRequestURL().toString();
String browser_used = request.getHeader("User-Agent");
String username=authority;
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



%>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">HoneyPot_Detection</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#"><%=authority.toUpperCase() %></a></li>
          <li><a class="nav-link scrollto" href="DO_Home.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="ViewFiles.jsp">View Files</a></li>
          <li><a class="nav-link scrollto" href="DO_FileRequest.jsp">File Response</a></li>
          <li><a class="nav-link scrollto" href="ReEncrypt.jsp">Re-encrypt</a></li>
          <li><a class="nav-link scrollto" href="ViewStatusInAuthority.jsp">Time Validate</a></li>
          <li><a class="nav-link scrollto" href="index.jsp">Logout</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>Intrusion Detection and Prevention using Honeypot Network for Cloud Security</h1>
          <h2>Network security consists of the policies, processes and practices adopted to prevent, detect and monitor unauthorized access</h2>
         
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

   
   

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>


</body>
</html>
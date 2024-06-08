<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attacker | Page</title>
    <link rel="stylesheet" href="mcss/bootstrap.min.css">
    <link rel="stylesheet" href="mfontawesome/css/all.min.css">
    <link rel="stylesheet" href="mcss/templatemo-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">

</head>
<body>

    <!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
            <i class="fa-solid fa-network-wired"></i>
                Honey Pot Attacker 
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="mimg/Attack2.webp"></div>

    <div class="container-fluid tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary">
                
            </h2>
        </div>
        <div class="row tm-mb-74 tm-row-1640">            
            <div class="col-lg-5 col-md-6 col-12 mb-3">
                <img src="mimg/about1.jpg" alt="Image" class="img-fluid">
            </div>
            <div class="col-lg-7 col-md-6 col-12">
                <div class="tm-about-img-text">
                <h2 class="col-12 tm-text-primary">
                ATTACK
           		 </h2>
				<div class="login-form">	
				<form action="AttackerServlet" method="post">
				<header><h2 class="tm-blue-text tm-section-title tm-margin-b-30">Link:</h2></header>
				<input type="text" name="urllink" value="" placeholder="Enter the URL here" class="form-control" >
				<br>
				Username:<br><input type="text"  name="uname" value="" placeholder="Enter the username" class="form-control"/></br>
				Password:<br><input type="password"  name="upass" value="" placeholder="Enter the password" class="form-control"/></br>
				<br>
				<input type="Submit" value="Submit" class="btn btn-primary mb-3">
				</br>
				</form>	
			
				</div>
                </div>                
            </div>
        </div>
    </div> <!-- container-fluid, tm-container-content -->

    <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">

            <div class="row">
                <div class="col-lg-8 col-md-7 col-12 px-5 mb-3">
                    Copyright 2023 Honey Pot Attacker. All rights reserved.
                </div>
                <div class="col-lg-4 col-md-5 col-12 px-5 text-right">
                    Designed by <a href="#" class="tm-text-gray" rel="sponsored" target="_parent">Honeypot Attacker</a>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="mjs/plugins.js"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>

</body>
</html>
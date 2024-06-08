<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Owner | Login</title>
<link rel="stylesheet" href="css1/style.css">
</head>
<body>
<div class="container">
	<div class="screen">
		<div class="screen__content">
			<form class="login" action="AuthorityLogServlet" method="post">
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
					<input type="text" class="login__input" name="username" placeholder="User name" required>
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="password" class="login__input" name="pass" placeholder="Password" required>
				</div>
				<button class="button login__submit">
					<span class="button__text">Log In</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>	
				<br> 
			 <a class="button login__submit" type="submit" href="AuthorityReg.jsp" style="margin-left:0px; margin-top:3.5px">Sign up here</a>
						
			</form>
		
		</div>
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div>
</body>
</html>
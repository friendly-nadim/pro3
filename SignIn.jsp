<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="Images/icon4.png">
<title>!ntegratOR Sign In</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Black background effect */
#overlay1, #overlay2 {
	position: fixed;
	display: none;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	background-color: rgba(0,0,0,0.7);
	z-index: 2;
}

/* Editing body background */
body {
	background-image: url("Images/registrationBackground.jpg");
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

/* Editing side links */
#sidenavId a {
	position: fixed;
	left: -60px;
	transition: 1s;
	padding: 15px;
	width: 100px;
	font-size: 20px;
	color: white;
	border-radius: 0 5px 5px 0;
}
#sidenavId a:hover {
	left: 0px;
}

/* Editing registration form */
#registrationForm {
	border: 2px solid gray;
	border-radius: 5px;
	padding: 50px;
}

label {
	color: #0E3775;
	font-family: garamond;
	font-style: italic;
	font-size: 18px;
	padding-top: 10px;
}

button {
	background-color: #f1f1f1;
	color: black;
	font-size: 18px;
	font-family: garamond;
	border: none;
	text-align: center;
	border-radius: 8px;
}
button:hover {
	background-color: #717271;
}

/* Adding a gray background color and some padding to the footer */
footer {
	background-color: #FAE5C0;
	padding: 25px;
}
#footerSpan {
	font-family: Buenard;
	font-size: 17px;
	color: #2B5670;
}
</style>
</head>

<body>

<% if (request.getAttribute("userNameValid")!=null || request.getAttribute("emailValid")!=null) { %>

<!-- Overlay 2 -->
<div id="overlay2" class="container-fluid text-center" style="display: block;">
	<div class="row-content">
		<div style="height: 175px;"></div>
		<div class="col-sm-4"></div>
		<% if (request.getAttribute("userNameValid")!=null) { %>
		<div id="emailDiv" class="col-sm-4 text-left">
			<div id="registrationForm" style="background-color: black;">
				<form method="post" action="LoginS?requestType=forgotEmail" autocomplete="off">
					<div class="form-group">
						<label style="font-family: garamond; font-style: normal; color: #8795FC; font-size: 26px; padding-bottom: 20px;"><%= request.getAttribute("userNameValid") %></label><br><br>
						<label style="color: white;">Enter Email Id correctly</label>
						<input name="userName" type="hidden" value="<%= request.getAttribute("userName") %>">
						<input name="email" type="text" class="form-control" style="border: 1px solid red;" required><br>
						<button type="submit" class="btn btn-lg btn-block">Submit</button>
					</div>
				</form>
			</div>
		</div>
		
		<% request.setAttribute("userNameValid", null);
		} else if (request.getAttribute("emailValid")!=null) { %>
		<div class="col-sm-4"></div>
		<div id="OTPDiv" class="col-sm-4 text-left">
			<div id="registrationForm" style="background-color: black;">
				<form method="post" action="LoginS?requestType=checkOTP" autocomplete="off">
					<div class="form-group">
						<label style="font-family: garamond; font-style: normal; color: #8795FC; font-size: 26px; padding-bottom: 20px;"><%= request.getAttribute("emailValid") %></label><br><br>
						<label style="color: white;">Enter 6-digit OTP sent to your Email</label>
						<input name="userName" type="hidden" value="<%= request.getAttribute("userName") %>">
						<input name="otp" type="text" class="form-control" style="border: 1px solid red;" required><br>
						<button type="submit" class="btn btn-lg btn-block">Submit</button>
					</div>
				</form>
			</div>
		</div>
		<% request.setAttribute("emailValid", null);
		} %>
	</div>
</div>
<% } else { %>

<!-- Overlay 1 -->
<div id="overlay1" class="container-fluid text-center">
	<div class="row-content">
		<div style="height: 175px;"></div>
		<div id="userNameDiv" class="col-sm-4 text-left">
			<div id="registrationForm" style="background-color: black;">
				<form method="post" action="LoginS?requestType=forgotUserName" autocomplete="off">
					<div class="form-group">
						<label style="font-family: garamond; font-style: normal; color: #FD0303; font-size: 26px; padding-bottom: 20px;">Cooperate with us...</label><br><br>
						<label style="color: white;">Enter Username correctly</label>
						<input name="userName" type="text" class="form-control" style="border: 1px solid red;" required><br>
						<button type="submit" class="btn btn-lg btn-block">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid text-center">
	<div class="row-content">
	
		<!-- 5 links -->
		<div class="col-sm-4">
			<div id="sidenavId" class="sidenav">
				<a href="https://accounts.google.com/signin" target="_blank" style="top: 200px; background-color: aqua;"><img src="Images/gmailLogo.png" height="20" width="30" align="left">
				<span class="glyphicon glyphicon-hand-left" style="float: right;"></span></a>
				
				<a href="https://www.facebook.com/login/" target="_blank" style="top: 260px; background-color: aqua;"><img src="Images/fbLogo.png" height="20" width="20" align="left">
				<span class="glyphicon glyphicon-hand-left" style="float: right;"></span></a>
				
				<a href="https://twitter.com/login" target="_blank" style="top: 320px; background-color: aqua;"><img src="Images/twitterLogo.png" height="20" width="30" align="left">
				<span class="glyphicon glyphicon-hand-left" style="float: right;"></span></a>
				
				<a href="https://plus.google.com/discover" target="_blank" style="top: 380px; background-color: aqua;"><img src="Images/googlePlusLogo.png" height="20" width="20" align="left">
				<span class="glyphicon glyphicon-hand-left" style="float: right;"></span></a>
				
				<a href="https://www.instagram.com/accounts/login/" style="top: 440px; background-color: aqua;"><img src="Images/instagramLogo.png" height="20" width="20" align="left">
				<span class="glyphicon glyphicon-hand-left" target="_blank" style="float: right;"></span></a>
			</div>
		</div>
		
		<!-- Sign In form -->
		<div class="col-sm-4 text-left">
			<a href="Home.jsp"><img src="Images/logo3.png" height="140" width="315" style="margin:0px auto; display:block; padding: 20px;"></a>
			<div id="registrationForm">
				<form method="post" action="LoginS?requestType=signIn" autocomplete="off">
					<div class="form-group">
						<% if(request.getAttribute("noActiveSession")!=null) { %>
						<label style="font-family: garamond; font-style: normal; color: #FD0303; font-size: 26px; padding-bottom: 20px;"><%= request.getAttribute("noActiveSession") %></label><br>
						<% } else { %>
						<label style="font-family: garamond; font-style: normal; font-size: 26px; padding-bottom: 20px;">Login...</label><br>
						<% } %>
						
						<script>
						$(document).ready(function(){
							$('[data-toggle="tooltip"]').tooltip();
						});
						</script>
						<label>User Name</label>
						<input name="userName" type="text" class="form-control" placeholder="Enter username" required
						<% if(request.getAttribute("userNameNotFound")!=null) { %>
						value="<%= request.getParameter("userName") %>"  data-toggle="tooltip" data-placement="right" title="<%= request.getAttribute("userNameNotFound") %>" autofocus
						<% } else if(request.getAttribute("passwordMismatch")!=null) { %>
						value="<%= request.getParameter("userName") %>" 
						<% } %> >
						
						<label>Password</label>
						<input name="password" type="password" class="form-control" placeholder="Enter password" required
						<% if(request.getAttribute("passwordMismatch")!=null) { %>
						value="" data-toggle="tooltip" data-placement="right" title="<%= request.getAttribute("passwordMismatch") %>" autofocus
						<% } %> >
						
						<input name="goToCart" type="hidden" value="<%= request.getAttribute("goToCart") %>">
						
						<label style="padding: 0px; font-size: 14px;"><a onclick="overlayOn()" style="text-decoration:none; cursor: pointer;">Forgot Password?</a></label>
						<script>
							function overlayOn() {
								document.getElementById("overlay1").style.display="block";
							}
						</script>
						
						<button type="submit" class="btn btn-lg btn-block">Sign In</button><br>
						<a href="SignUp.jsp" style="text-decoration:none"><button type="button" class="btn btn-lg btn-block">Or Sign Up</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<p><p>

<!-- Footer -->
<footer class="container-fluid text-center">
<div class="container-fluid text-center">
	<div class="row-content">
		<div class="col-sm-4 text-left">
				<div class="col-sm-2 text-right" style="border: 2px solid none; padding: 3px;"><img src="Images/originalLogo.png" height="36" width="45"></div>
				<div class="col-sm-10" style="border: 2px solid none; padding: 8.5px;"><span id="footerSpan">Well, 98% to be honest</span></div>
				
				<div class="col-sm-8 text-right" style="border: 2px solid none; padding: 8px;"><span id="footerSpan">On every Holidays</span></div>
				<div class="col-sm-2" style="border: 2px solid none; padding: 3px;"><img src="Images/freeDeliveryLogo.png" height="40" width="40"></div>
				
				<div class="col-sm-2 text-right" style="border: 2px solid none; padding: 3px;"><img src="Images/warrantyLogo.png" height="40" width="55"></div>
				<div class="col-sm-10" style="border: 2px solid none; padding: 10.5px;"><span id="footerSpan">Irrespective of Items</span></div>
				
				<div class="col-sm-8 text-right" style="border: 2px solid none; padding: 10.5px;"><span id="footerSpan">Easy Peasy Returns</span></div>
				<div class="col-sm-2" style="border: 2px solid none; padding: 3px;"><img src="Images/returnLogo.png" height="50" width="50"></div>
		</div>
		
		<div class="col-sm-3 text-left">
			<div><span id="footerSpan" style="font-size: 18px;">Let us help you :-)</span></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">User Agreement</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">Friendly policy</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">Payments</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">Returns</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">Your Account</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">FAQ</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">Contact Us</span></a></div>
			<div><a href=""><span id="footerSpan" style="font-size: 14px;">About Us</span></a></div>
		</div>
		
		<div class="col-sm-5">
			<div class="row-content">
				<div><span id="footerSpan" style="font-size: 18px;">Experience !ntegratOR App</span></div>
				<div class="col-sm-4" style="border: 2px solid none; padding: 8px;"><a href="https://play.google.com/store" target="_blank"><img src="Images/googlePlay.png" height="60" width="135"></a></div>
				<div class="col-sm-4" style="border: 2px solid none; padding: 18px;"><a href="https://www.microsoft.com/en-us" target="_blank"><img src="Images/store.png" height="40" width="120"></a></div>
				<div class="col-sm-4" style="border: 2px solid none; padding: 18px;"><a href="https://www.apple.com/" target="_blank"><img src="Images/appStore.png" height="40" width="120"></a></div>
				
				<div>
					<span id="footerSpan" style="font-size: 18px;">Be in touch with </span>
				</div>
				<div>
					<a href="https://www.facebook.com/login/" target="_blank"><img src="Images/fbLogo.png"  height="20" width="20"></a>
					<a href="https://twitter.com/login" target="_blank"><img src="Images/twitterLogo.png"  height="20" width="30"></a>
					<a href="https://plus.google.com/discover" target="_blank"><img src="Images/googlePlusLogo.png"  height="20" width="20"></a>
					<a href="https://www.instagram.com/accounts/login/" target="_blank"><img src="Images/instagramLogo.png"  height="20" width="20"></a>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>	
</footer>
</body>
</html>
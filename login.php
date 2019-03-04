<!DOCTYPE html>
<html lang="en US">
<head>
	<title>Login page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="main.css">


	<script>
		function validateForm() {
	    	var x = document.forms["loginForm"]["UserName"].value;
	    	var y = document.forms["loginForm"]["password"].value;
	    	if (x == "" || y == ""){
	        	alert("All fields are required");
	        	return false;
	    	}
		}
	</script>
	
</head>
<body>
	<h1>Bugema University Online Voting System</h1>
	<hr>
	<div id="MainFrame">
		<fieldset>
			<legend>Login Form</legend>
				<form name = "loginForm" method="POST" onsubmit="return validateForm()" action="panel.php">
					<div id="userId">
						<label>User Name: </label>
						<input type="email" name="UserName" placeholder="Enter your Email Id" ><br>
					</div>

					<div id = "UserPassword">
						<label>Password:</label>
						<input type="password" name="password" placeholder="Enter your Password"><br>
					</div>
					<div id="signIN">
						<input type="submit" name="Login" value="Sign In">
					</div>			
				</form>

				<?php  

				require 'connect.php';
				require 'core.php';

				if (isset($_POST['UserName']) && isset($_POST['password'])) {
					$UserName = $_POST['UserName'];
					$passwd = $_POST['password'];
					$Password = md5($passwd);

					if (!empty($UserName) && !empty($Password)) {
						$sql = "SELECT Email FROM voter WHERE Email = '$UserName' AND Password = '$Password'";
						if ($sql_run = mysql_query($sql)) {
						

							# code...
						} else{
							
						}
						# code...
					}
					
					# code...
				}

				?>

				<div id="signUp">
					<form method = "POST" action="registration.php">
						<input type="submit" name="SignUp" value="Sign Up">
					</form>

					
				</div>
				
				<div id = "Forgot_password"> 
					<form method="post" action="recover.php">
						<input type="submit" name="fPASSWORD" value="Forgot Password">
					</form>
					
				</div>
				<div id = "canel">
					<form method="post" action="flash.php">
						<input type="submit" name="Cancel" value="Cancel">
					</form>
				</div>
					
		</fieldset>
		
	</div>
</body>
</html>
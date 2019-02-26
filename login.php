<!DOCTYPE html>
<html lang="en US">
<head>
	<title>Login page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="main.css">
	<script>
		def validateInput{
			var Uname = docment.forms["loginForm"]["UserName"].value;
			if (Uname == null || Uname == ""){
				alert("Please note the User Name is required");
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
				<form name = "loginForm" method="post" action="panel.php" onsubmit=" return validateInput()">
					<div id="userId">
						<label>User Name: </label>
						<input type="email" name="UserName" placeholder="Enter your Email Id" ><br>
					</div>
					<div id = "UserPassword">
						<label>Password:</label>
						<input type="password" name="password" placeholder="Enter your Password" required=""><br>
					</div>
						<input type="submit" name="Login" value="Sign In">		
				</form>
				<form action="registration.php">
					<button>Sign Up</button>
				</form>

				<form>
					<button onclick="panel.php">Forgot Password</button>
				</form>
				<form>
					<button>Cancel</button>
				</form>	
				<form>
					<button>Back</button>
				</form>					
				
		</fieldset>
		
	</div>


	 <samp>
		Voting reults
	</samp>

</body>
</html>
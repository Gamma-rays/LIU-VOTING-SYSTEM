<!DOCTYPE html>
<html lang="en US">
<head>
	<title>Login page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>

	<h1>Bugema University Online Voting System</h1>
	<hr>
	<div id="MainFrame">
		<fieldset>
			<legend>Create Account in order to vote</legend>
			<form method="post" action="login.php">
				<div id = Fname>
					<label>First Name</label>
					<input type="text" name="Fname"><br>
				</div>

				<div id = Lname>
					<label>Last Name</label>
					<input type="text" name="Lname"><br>
				</div>

				<div id = "UserPassword">
						<label>Falculty:</label>
						<input type="text" name="falculty" placeholder="Choose your faculty" required=""><br>
				</div>

				<div id = mail>

					<label>Email Address</label>
					<input type="Email" name="Email" placeholder="Enter  valid Email please" required="This filed is required"><br>
				</div>
				
				<div id = crePword>
					<label>Create Password</label>
					<input type="Password" name="Pword" placeholder="Atlease 8 character of Length"><br>
				</div>

				<div id = ConPword >
					<label>Confirm Password</label>
					<input type="Password" name="ConPword">
				</div>

				<input type="submit" name="Ok" value="Sign Up">
				<button>Back</button>
			</form>
			

	
		</fieldset>
		
	</div>

</body>
</html>
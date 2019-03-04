<!DOCTYPE html>
<html lang="en US">
<head>
	<title>Registration Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="main.css">

	<script>
		function validateForm() {
	    	var a = document.forms["Register"]["Fname"].value;
	    	var b = document.forms["Register"]["Lname"].value;
	    	var c = document.forms["Register"]["Tel"].value;
	    	var d = document.forms["Register"]["Email"].value;
	    	var e = document.forms["Register"]["Pword"].value;
	    	var f = document.forms["Register"]["ConPword"].value;
	    	if (a == null || a == "" || b == null || b == "" || c == null || c == "" || d== null || d == "" || e == null || e == "" || f == null || f == ""){
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
			<legend>Create Account in order to vote</legend>
			<form method="GET" action="registration.php" name="Register" onsubmit="return validateForm()">
				<div id = Fname>
					<label>First Name</label>
					<input type="text" name="Fname"><br>
				</div>

				<div id = Lname>
					<label>Last Name</label>
					<input type="text" name="Lname"><br>
				</div>

				<div id = Telepnoe>
					<label>Telephone</label>
					<input type="text" name="Tel"><br>
				</div>

				<div id = "UserPassword">
						Faculty:
						<select name="Falculty">
							<option>Business</option>
							<option>Health Science</option>
							<option>Natural Science</option>
							<option>Theology</option>
							<option>Education</option>
							<option>Social Work</option>
							<option>Computer Science</option>
							<option>Political Science</option>
						</select>
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
				<div id="Sgining">
					<input type="submit" name="Ok" value="Sign Up">
					
				</div>
			</form>


			<?php 
				require 'connect.php';

				$Fname = $_GET['Fname'];
				$Lname = $_GET['Lname'];
				$Email = $_GET['Email'];
				$Telephone = $_GET['Tel'];
				$Falculty = $_GET['Falculty'];
				$Passwd = $_GET['Pword'];
				$Password = md5($Passwd);

				$Confirm_Passwd = $_GET['ConPword'];

				if (strlen($Passwd) >= 8) {
					$query = "INSERT INTO `Voting_system_db`.`Voter` (`Email`, `fName`,`lName`, `Telephone`, `Password`, `Falculty`) 
						VALUES ('$Email', '$Fname', '$Lname', '$Telephone', '$Password', '$Falculty')";

					if ($query_run = mysql_query($query)) {
					# code...
					}
					# code...
				}

			 ?>



			<form method="post" action="login.php">
				<div id="backy">
					<input type="submit" name="pre" value="Previous">
				</div>
				
			</form>
			

	
		</fieldset>
		
	</div>

</body>
</html>
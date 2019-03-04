<?php 
				require 'connect.php';
				
				if (isset($_POST['UserName']) && isset($_POST['password'])) {
					$UserName = $_POST['UserName'];
					$Password = $_POST['password'];
					if (!empty($UserName) && !empty($Password)) {
						$query = "SELECT Email FROM voters WHERE Email = '$UserName' AND Password = '$Password'";
						if ($query_run = mysql_query($query)) {
							$mysql_num_row = mysql_num_rows($query_run);
							if ($mysql_num_row == 0) {
								echo "Invalid login";
								# code...
							} elseif ($mysql_num_row == 1) {
								echo $userID = mysql_result($query_run, 0, 'Email');
								//ended up when starting to established seesion for login voter



						} else{
							echo "Wrong Username or Password";
						
				
					} 
				}

				$query = "SELECT Email FROM voters where Password = 'Voter@2019'";
				if ($query_run = mysql_query($query)) {
					# code...
				}
				
				?>



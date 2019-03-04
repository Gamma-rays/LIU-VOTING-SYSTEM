
<?php
$mysql_host = 'localhost';
$mysql_users = 'root';
$mydql_passwd = '';
$mysql_db = 'Voting_system_db';
$conn_error = 'Could not connect to mysql database due to wrong username and password';

if (mysql_connect($mysql_host, $mysql_users, $mydql_passwd) or die($conn_error)) {
	if (mysql_select_db($mysql_db)or die('No database of that Name found')) {
	}else{
		echo "Database not found";
	}
	
}else{
	echo "Connection Failed";
}

?>
	

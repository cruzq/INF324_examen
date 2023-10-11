<?php 
	session_start();
	if ($_SESSION['ingreso']!='si') {
		header("location:login.php?error=2");
	}
?>
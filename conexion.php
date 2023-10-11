<?php 

	$con=mysqli_connect("localhost","rcruz","123456","mibd_cruz");
	if ($con) {
			mysqli_get_host_info($con);
	}
	else{
		echo "error de conexion";
		echo "error".mysqli_connect_error();
	}
		
?>
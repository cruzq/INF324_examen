<?php 
include("conexion.php");
$usr = $_POST['usr'];
$pwd = $_POST['pwd'];

$query = "SELECT * FROM usuario WHERE (username='$usr' and pass='$pwd')";
$resultado = mysqli_query($con, $query);

if (mysqli_num_rows($resultado) != 0) {
    session_start();
    $_SESSION['ingreso'] = 'si';        
    $_SESSION['estilo'] = 'estilos/estiloswhite.css';
    if ($r = mysqli_fetch_array($resultado)) {
        $_SESSION['nombre'] = $r[1];
        $_SESSION['rol'] = $r[4];
    }
    header("location:../inicio.php");
} else {
    header("location:../login.php?error=1");
}
?>
 
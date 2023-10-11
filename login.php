<html>
	<head>
		<title>login</title>
	</head>
	<body>
<header>
	<div class="contenedor-form">
        
        <div class="formulario">
            <h2>Iniciar Sesión</h2>
            <?php require('menunavegacion.php') ?>
            <form action="next.php" method="post" id="formulario">
                <input type="text" placeholder="Usuario" required name="usr">
                <input type="password" placeholder="Contraseña" required name="pwd">
                <input type="submit" value="Iniciar Sesión">
                <?php 
					if (isset($_GET['error'])) {
						$e=$_GET['error'];
						if ($e==1) {
							echo "Usuario o contraseña incorrecta";
						}
						if ($e==2) {
							echo "Debe Ingresar un Usuario o Contraseña Validos";
						}
					}
				?>
            </form>
        </div>

    </div>
	</body>
</html>
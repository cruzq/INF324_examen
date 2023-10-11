<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Inicio</title>
	 <link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
	<header>
	<h1>INFORMACION KARDEX</h1>
		<?php require('menunavegacion.php') ?>
	</header>
	<main>
		<h1>Kardex</h1>
		<section id="kardex">
        <?php
        echo "El Kardex Académico se encuentra en el 2do patio del Monoblock, edif. de Informática, Piso 2, cerca a la entrada de la calle Federico Zuazo.";

		 echo "
        ATENCIÓN Y CONSULTAS:
		Telf. WhatsApp: 67043390 – 76241931
		HORARIO DE ATENCIÓN:
		HRS. 8:00 a 14:00 (LUNES A VIERNES)";


		$imagen = "imagen2.jpg";
    	$altTexto = "Girl in a jacket";
    	$ancho = 500;
    	$alto = 500;
    
    	// Luego, puedes incluir la etiqueta <img> dentro del bloque PHP
    	echo '<img src="' . $imagen . '" alt="' . $altTexto . '" width="' . $ancho . '" height="' . $alto . '">';
        ?>
		</section>
	</main>
</body>
</html>
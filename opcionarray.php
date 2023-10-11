<?php
include("next1.php");
require 'conexion.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <?php include('elige.php'); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo $estiloActual; ?>">
</head>
<body>
    <header>
        <h1>Inicio</h1>
        <nav>
            <?php
            if ($_SESSION['rol'] == "docente") {
            ?>
                <a href="inicio.php">Listado</a>
            <?php } ?>

            <!-- FORMULARIO PARA CAMBIAR LOS ESTILOS -->
            <form method="post" action="estilos.php">
                <label for="estilo">Estilo:</label>
                <select id="estilo" name="estilo">
                    <?php
                    foreach ($estilosDisponibles as $archivo => $nombre) {
                        echo '<option value="' . $archivo . '"';
                        if ($archivo == $estiloActual) {
                            echo ' selected';
                        }
                        echo '>' . $nombre . '</option>';
                    }
                    ?>
                </select>
                <button type="submit">Aplica Color</button>
            </form>
        </nav>
    </header>
    <main>
        <h1>S.A.</h1>
        <h2>Soy un <?php echo $_SESSION['rol'] ?> </h2>
        <?php
        if ($_SESSION['rol'] == "estudiante") {
            echo "visualiza notas ";
        } else {
        ?>
            <h1>Notas</h1>
            <table>
                <tr>
                    <td>Departamento</td>
                    <td>Notas</td>
                </tr>
                <?php
                $query = "SELECT a.departamento, 
                                AVG(CASE WHEN s.estudiante_ci_est = a.ci_est THEN s.nota ELSE NULL END) AS promedio_de_notas
                                FROM estudiante a
                                LEFT JOIN semestre s ON a.ci_est = s.estudiante_ci_est
                                GROUP BY a.departamento";
                $consulta = mysqli_query($con, $query);

                $resultados = array();

                if ($consulta) {
                    while ($dato = mysqli_fetch_array($consulta)) {
                        $resultados[] = array(
                            'departamento' => $dato[0],
                            'promedio_de_notas' => $dato[1]
                        );
                    }
                }

                foreach ($resultados as $resultado) {
                ?>
                    <tr>
                        <td><?php echo $resultado['departamento']; ?></td>
                        <td><?php echo $resultado['promedio_de_notas']; ?></td>
                    </tr>
                <?php
                }
                ?>
        <?php
        }
        ?>
        </table>
    </main>
</body>

</html>
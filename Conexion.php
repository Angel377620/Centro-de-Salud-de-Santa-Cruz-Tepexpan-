<?php
$conexion = new mysqli("localhost", "root", "", "agenda Citas");

if ($conexion->connect_error) {
    die("<script>alert('Fallo la conexión: " . $conexion->connect_error . "');</script>");
}

$conexion->set_charset("utf8");

// Si se presionó el botón "Insertar"
if (isset($_GET['Insertar'])) {
    if (isset($_GET['AP'], $_GET['AM'], $_GET['Nombre'], $_GET['Identificador'], $_GET['FechaNacimiento'],
              $_GET['NombreMedico'], $_GET['Cedula'], $_GET['Especialidad'],
              $_GET['nocita'], $_GET['Fechacita'], $_GET['Horacita'], $_GET['Motivocita'])) {

        $AP = $conexion->real_escape_string($_GET['AP']);
        $AM = $conexion->real_escape_string($_GET['AM']);
        $Nombre = $conexion->real_escape_string($_GET['Nombre']);
        $Identificador = $conexion->real_escape_string($_GET['Identificador']);
        $FechaNacimiento = $conexion->real_escape_string($_GET['FechaNacimiento']);

        $NombreMedico = $conexion->real_escape_string($_GET['NombreMedico']);
        $Cedula = $conexion->real_escape_string($_GET['Cedula']);
        $Especialidad = $conexion->real_escape_string($_GET['Especialidad']);

        $nocita = $conexion->real_escape_string($_GET['nocita']);
        $Fechacita = $conexion->real_escape_string($_GET['Fechacita']);
        $Horacita = $conexion->real_escape_string($_GET['Horacita']);
        $Motivocita = $conexion->real_escape_string($_GET['Motivocita']);

        $sql1 = "INSERT INTO datospaciente (AP, AM, Nombre, Identificador, FechaNacimiento)
                 VALUES ('$AP', '$AM', '$Nombre', '$Identificador', '$FechaNacimiento')";

        $sql2 = "INSERT INTO datosmedico (NombreMedico, Cedula, Especialidad)
                 VALUES ('$NombreMedico', '$Cedula', '$Especialidad')";

        $sql3 = "INSERT INTO datoscitas (nocita, Fechacita, Horacita, Motivocita)
                 VALUES ('$nocita', '$Fechacita', '$Horacita', '$Motivocita')";

        if ($conexion->query($sql1) && $conexion->query($sql2) && $conexion->query($sql3)) {
            echo "<script>alert('Datos guardados correctamente'); window.location.href='Agendar Cita.html';</script>";
        } else {
            echo "<script>alert('Error al ingresar los datos: " . $conexion->error . "'); window.location.href='Agendar Cita.html';</script>";
        }
    } else {
        echo "<script>alert('Faltan datos del formulario.'); window.location.href='Agendar Cita.html';</script>";
    }
}

// Si se presionó el botón "Eliminar"
if (isset($_GET['Eliminar']) && isset($_GET['nocita'])) {
    $nocita = $conexion->real_escape_string($_GET['nocita']);

    $consulta = "DELETE FROM datoscitas WHERE nocita = '$nocita'";
    $resultado = $conexion->query($consulta);

    if (!$resultado) {
        echo "<script>alert('Error al eliminar la cita: " . $conexion->error . "'); window.location.href='Agendar Cita.html';</script>";
    } else {
        if ($conexion->affected_rows > 0) {
            echo "<script>alert('Se eliminó la cita correctamente.'); window.location.href='Agendar Cita.html';</script>";
        } else {
            echo "<script>alert('No se encontró una cita con ese número.'); window.location.href='Agendar Cita.html';</script>";
        }
    }
}

$conexion->close();
?>

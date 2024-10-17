<?php
$conexion= mysqli_connect("localhost", "root", "", "r_user");

if(isset($_POST['registrar'])){

    if(strlen($_POST['nombre']) >=1 && strlen($_POST['correo'])  >=1 && strlen($_POST['servicios'])  >=1 
    && strlen($_POST['password'])  >=1 && strlen($_POST['rol']) >= 1 ){

    $nombre = trim($_POST['nombre']);
    $correo = trim($_POST['correo']);
    $servicios = trim($_POST['servicios']);
    $password = trim($_POST['password']);
    $rol = trim($_POST['rol']);

    $consulta= "INSERT INTO user (nombre, correo, servicios, password, rol)
    VALUES ('$nombre', '$correo','$servicios','$password', '$rol' )";

    mysqli_query($conexion, $consulta);
    mysqli_close($conexion);

    header('Location: ../views/user.php');
  }
}









?>
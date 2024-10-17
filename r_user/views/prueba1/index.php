<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Comentarios</title>

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/es.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Comentario section-->
        <form method="POST" action="./php/enviarcomentario.php">
            <section id="contact">
                <div class="container px-4">
                    <div class="row gx-4 justify-content-center">
                        <div class="col-lg-8">
                            <h2>Comentarios</h2>
                            <br>
                            <p class="lead">Realiza tus observaciones
                            </p>
                                <br>
    
                                <div class="col-xs-12">
                                    <h3>¡Haz un Comentario!</h3>

                                    <br>
                                    
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Usuario</label>
                                    <input class="form-control" name="nombre" type="text" id="nombre" placeholder="Encargado quien reporta la información." required >
                                    </div>
                            
                                    
                            <br>
                                    <div class="form-group">
                                    <label for="comentario" class="form-label"></label>
                                    <textarea class="form-control" name="comentario" cols="30" rows="5" type="text" id="comentario" 
                                    placeholder="Escribe tu comentario......"></textarea>
                                    </div>
                            <br>
                            <input class="btn btn-primary" type="submit"  value="Enviar Comentario"></input>
                            <a class="btn btn-warning" href="/gestion/r_user/views/prueba1/Views/admin/home.php">Log Out
      <i class="fa fa-power-off" aria-hidden="true"></i>
       </a>
                            <br>
                            <br>
                            <br>
                                    <?php

$conexion=mysqli_connect("localhost","root","","r_user"); 
$resultado= mysqli_query($conexion, 'SELECT * FROM comentarios');

while($comentario = mysqli_fetch_object($resultado)){

    ?>

    <b><?php echo($comentario->nombre);  ?></b>  dijo: 
    <br />
    <?php echo ($comentario->comentario);?>    <br />
    <hr />




     <?php
}

?>
                            
                                </form>
                          
                </div>
                
            </section>

     


    </body>
</html>

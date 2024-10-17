<?php include_once 'Views/template/header.php'; ?>

<div class="app-content">
<?php include_once 'Views/components/menus.php'; ?>
    <div class="content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="page-description d-flex align-items-center">
                        <div class="page-description-content flex-grow-1">
                            <h1>Administrador de Archivos</h1>
                        </div>
                        <div class="page-description-actions">
                            <a href="#" class="btn btn-primary" id="btnUpload"><i class="material-icons">add</i>Upload File</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="container_progress" class="mb-3"></div>
            <div class="row">
                <?php foreach ($data['carpetas'] as $carpeta) { ?>
                    <div class="col-md-4">
                        <div class="card file-manager-group">
                            <div class="card-body d-flex align-items-center">
                                <i class="material-icons" style="color: #<?php echo $carpeta['color']; ?>;">folder</i>
                                <div class="file-manager-group-info flex-fill">
                                    <a href="#" id="<?php echo $carpeta['id']; ?>" class="file-manager-group-title carpetas"><?php echo $carpeta['nombre']; ?></a>
                                    <span class="file-manager-group-about"><?php echo $carpeta['fecha']; ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <div class="section-description">
                <h1>Archivos Recientes</h1>
            </div>
            <div class="row">
                <?php foreach ($data['archivos'] as $archivo) { ?>
                    <div class="col-md-6">
                        <div class="card file-manager-recent-item">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <i class="material-icons-outlined text-danger align-middle m-r-sm">description</i>
                                    <a href="#" class="file-manager-recent-item-title flex-fill"><?php echo $archivo['nombre']; ?></a>
                                    <span class="p-h-sm">167kb</span>
                                    <span class="p-h-sm text-muted">09.14.21</span>
                                    <a href="#" class="dropdown-toggle file-manager-recent-file-actions" id="file-manager-recent-<?php echo $archivo['id']; ?>" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="file-manager-recent-<?php echo $archivo['id']; ?>">
                                        <li><a class="dropdown-item compartir" href="#" id="<?php echo $archivo['id']; ?>">Compartir</a></li>
                                        <li><a class="dropdown-item" href="<?php echo BASE_URL . 'Assets/archivos/' . $archivo['id_carpeta'] . '/' . $archivo['nombre']; ?>" download="<?php echo $archivo['nombre']; ?>">Download</a></li>
                                        <li><a class="dropdown-item eliminar" href="#" data-id="<?php echo $archivo['id']; ?>">Eliminar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <div class="section-description">
                <h1>Tabla Archivos</h1>
            </div>
             <div class="card">
                <div class="card-body">
                    
                    <div class="table-responsive">
                        <table class="table table-striped table-hover display nowrap" style="width:100%" id="tblcomentario">
      
                   
<thead>    
<tr>
<th>ID</th>
<th>Nombre Archivo</th>
<th>Fecha Creacion</th>
<th>ID Carpeta</th>
<th>ID Usuario</th>





</tr>
</thead>
<tbody>

<?php

$conexion=mysqli_connect("localhost","root","","gestion_archivos");               
$SQL="SELECT archivos.id, archivos.nombre, archivos.fecha_create, archivos.id_carpeta, archivos.id_usuario FROM archivos";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
while($fila=mysqli_fetch_array($dato)){

?>
<tr>
<td><?php echo $fila['id']; ?></td>
<td><?php echo $fila['nombre']; ?></td>
<td><?php echo $fila['fecha_create']; ?></td>
<td><?php echo $fila['id_carpeta']; ?></td>
<td><?php echo $fila['id_usuario']; ?></td>





<?php
}
}else{

?>
<tr class="text-center">
<td colspan="16">No existen registros</td>
</tr>


<?php

}

?>
</table>
<!-- <button class="btn btn-outline-primary mb-3" type="button"> <a href="../../../r_user/views/prueba1/index.php"> Agregar comentario </a> </button> -->
<a href="../../gestion/r_user/views/prueba1/index.php" class="btn btn-primary" id="btnUpload"><i class="material-icons">add</i>Agregar comentario </a>



</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="../js/user.js"></script>
</html>
</div>

<div class="section-description">
                <h1>COMENTARIOS</h1>
            </div>
            <div>
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
            </div>

<?php 
include_once 'Views/components/modal.php'; 
include_once 'Views/template/footer.php'; 
?>
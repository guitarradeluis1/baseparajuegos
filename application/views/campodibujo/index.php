<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/funciones.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_mapa_dibujo.js');?>"></script>
<!---------------------------------------------------------------------->
<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("campo/index/".$Campo["mapa"]["id"], "Atras", "class='plata'"); ?>
    <?php echo anchor($controlador."/add/".$Campo["id"], "Nuevo", "class='plata'"); ?>
    <?php echo anchor($controlador."/addenemigo/".$Campo["id"], "Nuevo Enemigo", "class='plata'"); ?>
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Campo["mapa"]["nombre"]; ?> [<?php echo $Campo["nombre"]; ?>]</label>
    <hr />
    <table>
        <tr>
            <td><div id="canvas"></div><td>
            <td>
                <div id="info"></div>
                <div id="acctions"></div>
            <td>
        </tr>
    </table>
<!--:::::::::::::::::::::::::::::::-->
<table>
    <tr>
        <th colspan="8"><b>Objetos</b></th>
    </tr>
    <tr>
        <th>ID</th>
        <th>EDITAR</th>
        <th>DIBUJO</th>
        <th>POSICION</th>
        <th>FUNCION</th>
        <th>IA</th>
        <th>DESTINO</th>
        <th>NIVEL</th>
        <th>ELIMINAR</th>
    </tr>
<?php
if($Salida)
{
    foreach ($Salida as $info) 
    {
    ?>
    <tr>
    <td><?php echo $info["id"]; ?></td>
        <td><?php echo anchor($controlador."/edit/".$info["id"]."/".$Campo["id"], "Editar", "class='plata'"); ?></td>
        <td><?php echo $info["dibujo"]["texto"]; ?></td>
        <td><?php echo $info["posicionx"].",".$info["posiciony"]; ?></td>
        <td><?php if(isset($info["funciones"]["nombre"])){echo $info["funciones"]["nombre"]."(".$info["parametros"].")";} ?></td>
        <td><?php if(isset($info["ia"]["nombre"])){echo $info["ia"]["nombre"];} ?></td>
        <td><?php if(isset($info["campo_destino"])){echo $info["campo_destino"];} ?></td>
        <td><?php echo $info["nivel"]; ?></td>
        <td><?php echo anchor($controlador."/eliminar/".$info["id"]."/".$Campo["id"], "Eliminar", "class='plata'"); ?></td>
    </tr>
    <?php
    }
}
?>
</table>
<!--:::::::::::::::::::::::::::::::-->
<table>
    <tr>
        <th colspan="5"><b>Enemigos</b></th>
    </tr>
    <tr>
        <th>ID</th>
        <th>DIBUJO</th>
        <th>NOMBRE</th>
        <th>MOVIMIENTO</th>
        <th>POSICIÓN</th>
        <th>ELIMINAR</th>
    </tr>
<?php
if($campo_enemigo)
{
    foreach ($campo_enemigo as $info_ene) 
    {
    ?>
    <tr>
        <td><?php echo anchor($controlador."/editenemigo/".$info_ene["id"]."/".$Campo["id"], "Editar", "class='plata'"); ?></td>
        <td><?php echo $info_ene["enemigo"]["objeto"]["nombre"]; ?></td>
        <td>
            <?php echo $info_ene["enemigo"]["nombre"]; ?>
            <?php if(isset($info_ene["ia"]["nombre"])){echo "<br/><b>IA: </b>".$info_ene["ia"]["nombre"];} ?>
        </td>
        <td><?php echo $info_ene["enemigo"]["movimientos"]["nombre"]; ?></td>
        <td><?php echo $info_ene["x"].",".$info_ene["y"]; ?></td>
        <td><?php echo anchor($controlador."/eliminarenemigo/".$info_ene["id"]."/".$Campo["id"], "Eliminar", "class='plata'"); ?></td>
    </tr>
    <?php
    }
}
?>
</table>
<!--:::::::::::::::::::::::::::::::-->
</div>
<?php
    #echo "<hr /><pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<hr /><pre>"; print_r($Campo); echo "</pre>";
    #echo "<hr /><pre>"; print_r($Salida); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_enemigo); echo "</pre>";
?>
<script>
$(document).ready(function()
{
     //$(".carga").click(function (){carga($(this).val());});
    //-------------------------
    precargas = <?php echo json_encode($campo_objeto); ?>;
    imagenes = <?php echo json_encode($Campo); ?>;
    objetos = <?php echo json_encode($Salida); ?>;
    enemigos = <?php echo json_encode($campo_enemigo); ?>;
    //console.log(objetos);
});
//**********************************
//$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//**********************************
function carga(objeto_id)
{
    //ajax("../../dibujo/lista/"+objeto_id+"/dibujo_id", "div_dibujo_id");
}
</script>
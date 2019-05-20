<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_dibujo.js');?>"></script>
<!---------------------------------------------------------------------->
<?php echo anchor($controlador."/index/".$Salida["objeto"]["id"], "Atras", "class='plata'"); ?>
<?php echo anchor("objeto/edit/".$Salida["objeto"]["id"], "Editar Objeto", "class='plata'"); ?>
<div>
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Tipo Dibujo : </b><br /> 
            <?php echo creador_selector("dibujotipo_id", $dibujotipo, ""); ?>
            </p>
            <p><b>Texto : </b><br /> 
            <?php echo form_input(array("name" => "texto", "id" => "texto", "placeholder" => "texto.", "type" => "text", "value" => $Salida["texto"] )); ?>
            </p>
            <p><b>height : </b><br /> 
            <?php echo form_input(array("name" => "height", "id" => "height", "placeholder" => "height", "type" => "number", "class"=>"number", "value" => $Salida["height"] )); ?>
            </p>
            <p><b>width : </b><br /> 
            <?php echo form_input(array("name" => "width", "id" => "width", "placeholder" => "width", "type" => "number", "class"=>"number", "value" => $Salida["width"] )); ?>
            </p>
            <p><b>font : ( 20px Arial )</b><br /> 
            <?php echo form_input(array("name" => "font", "id" => "font", "placeholder" => "font.", "type" => "text", "value" => $Salida["font"] )); ?>
            </p>
            <p><b>color :</b><br /> 
            <?php echo form_input(array("name" => "color", "id" => "color", "placeholder" => "color.", "type" => "color", "value" => $Salida["color"] )); ?>
            </p>
        </td>
        <td>
            <p><b>velocidad : </b><br /> 
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad", "type" => "number", "class"=>"number", "value" => $Salida["velocidad"] )); ?>
            </p>
            <p><b>cuadros : ( [0,0,0,0] ) <?php echo "Limites: (".$Salida["objeto"]["conteofila"]."*".$Salida["objeto"]["conteocolumna"].")+#"; ?></b><br /> 
            <?php echo form_input(array("name" => "cuadros", "id" => "cuadros", "placeholder" => "cuadros.", "type" => "text", "value" => $Salida["cuadros"] )); ?>
            </p>
            <p><b>play : </b><br /> 
            <?php echo creador_selector("play", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
            <p><b>fisica : </b><br /> 
            <?php echo creador_selector("fisica", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
            <p><b>immovable : </b><br /> 
            <?php echo creador_selector("immovable", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
        </td>
        <td>
            <div id="canvas"></div>
            <br />
            <?php echo img('archivos/'.$Salida["objeto"]["archivo"], 'grande'); ?>
        </td>
    </tr>
</table>
    <?php echo form_submit("post", "Enviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
<script>
var imagenes = {};
$(document).ready(function()
{
    $("#dibujotipo_id").val("<?php echo $Salida["dibujotipo_id"]; ?>");
    $("#play").val("<?php echo $Salida["play"]; ?>");
    $("#fisica").val("<?php echo $Salida["fisica"]; ?>");
    $("#immovable").val("<?php echo $Salida["immovable"]; ?>");
    //-------------------------
    imagenes = <?php echo json_encode($Salida); ?>;
    //console.log(imagenes);
});
</script>
<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_personaje.js');?>"></script>
<!---------------------------------------------------------------------->
<?php echo anchor($controlador."/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Objeto : </b><br /> 
            <?php echo creador_selector("objeto_id", $objeto, ""); ?>
            </p>
            <p><b>Nombre : </b><br /> 
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value"=>$Salida["nombre"] )); ?>
            </p>
        </td>
        <td>
            <p><b>Left : </b><br /> 
            <span id="div_left_id"><?php #echo creador_selector("left_id", $objeto, ""); ?></span>
            </p>
            <p><b>Right : </b><br /> 
            <span id="div_right_id"><?php #echo creador_selector("right_id", $objeto, ""); ?></span>
            </p>
            <p><b>Down : </b><br /> 
            <span id="div_down_id"><?php #echo creador_selector("down_id", $objeto, ""); ?></span>
            </p>
            <p><b>UP : </b><br /> 
            <span id="div_up_id"><?php #echo creador_selector("up_id", $objeto, ""); ?></span>
            </p>
            <p><b>Stop : </b><br /> 
            <span id="div_stop_id"><?php #echo creador_selector("stop_id", $objeto, ""); ?></span>
            </p>
        </td>
        <td>
            <div id="canvas"></div>
            <br />
            <?php echo img('archivos/'.$Salida["objeto"]["archivo"], 'grande'); ?>
        </td>
    </tr>
</table>
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php
	#echo "<pre>"; print_r($Salida); echo "</pre>";
?>
<script>
$(document).ready(function()
{
    $("#objeto_id").val("<?php echo $Salida["objeto_id"]; ?>");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/left_id/<?php echo $Salida["left_id"]; ?>", "div_left_id");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/right_id/<?php echo $Salida["right_id"]; ?>", "div_right_id");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/down_id/<?php echo $Salida["down_id"]; ?>", "div_down_id");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/up_id/<?php echo $Salida["up_id"]; ?>", "div_up_id");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/stop_id/<?php echo $Salida["stop_id"]; ?>", "div_stop_id");
    //-------------------------
    imagenes = <?php echo json_encode($Salida); ?>;
    //console.log(imagenes);
});
//**********************************
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/left_id", "div_left_id");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/right_id", "div_right_id");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/down_id", "div_down_id");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/up_id", "div_up_id");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/stop_id", "div_stop_id");});
</script>
<?php echo anchor($controlador."/index/".$objeto_id, "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$objeto_id, "id=formulario"); ?>
    <?php echo form_hidden('objeto_id', $objeto_id); ?>
<table>
    <tr>
        <td>
            <p><b>Tipo Dibujo : </b><br /> 
            <?php echo creador_selector("dibujotipo_id", $dibujotipo, ""); ?>
            </p>
            <p><b>Texto : </b><br /> 
            <?php echo form_input(array("name" => "texto", "id" => "texto", "placeholder" => "texto.", "type" => "text")); ?>
            </p>
            <p><b>height : </b><br /> 
            <?php echo form_input(array("name" => "height", "id" => "height", "placeholder" => "height", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>width : </b><br /> 
            <?php echo form_input(array("name" => "width", "id" => "width", "placeholder" => "width", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>font : ( 20px Arial )</b><br /> 
            <?php echo form_input(array("name" => "font", "id" => "font", "placeholder" => "font.", "type" => "text")); ?>
            </p>
            <p><b>color :</b><br /> 
            <?php echo form_input(array("name" => "color", "id" => "color", "placeholder" => "color.", "type" => "color")); ?>
            </p>
        </td>
        <td>
            <p><b>velocidad : </b><br /> 
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>cuadros : ( [0,0,0,0] ) <?php echo "Limites: (".$objeto["conteofila"]."*".$objeto["conteocolumna"].")+#"; ?></b><br /> 
            <?php echo form_input(array("name" => "cuadros", "id" => "cuadros", "placeholder" => "cuadros.", "type" => "text")); ?>
            </p>
            <p><b>play : </b><br /> 
            <?php echo creador_selector("play", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
            <p><b>fisica : </b><br /> 
            <?php echo creador_selector("fisica", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
            <p><b>inamovible : </b><br /> 
            <?php echo creador_selector("immovable", array(0=>"NO",1=>"SI"), ""); ?>
            </p>
        </td>
        <td>
            <?php echo img('archivos/'.$objeto["archivo"], 'grande'); ?>
        </td>
    </tr>
</table>
    <?php echo form_submit("post", "Enviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<script>
$(document).ready(function()
{
    /*
    //_________________________
    $("#titulo_campo").keyup(function (){
    	$(this).val(limitar_palabras($(this).val(),1));
    });*/
});
//**********************************
</script>
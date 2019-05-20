<?php echo anchor($controlador."/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
    <p><b>Nombre : </b><br /> 
    <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value"=>$Salida["nombre"] )); ?>
    </p>
    <p><b>Posicion X : </b><br /> 
    <?php echo form_input(array("name" => "x", "id" => "x", "placeholder" => "Posicion X", "type" => "number", "value"=>$Salida["x"] )); ?>
    </p>
    <p><b>Posicion Y : </b><br /> 
    <?php echo form_input(array("name" => "y", "id" => "y", "placeholder" => "Posicion Y", "type" => "number", "value"=>$Salida["y"] )); ?>
    </p>
    <p><b>Campo : </b><br /> 
    <span id="div_campo_id"><?php #echo creador_selector("stop_id", $objeto, ""); ?></span>
    </p>
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php
	#echo "<pre>"; print_r($Salida); echo "</pre>";
?>
<script>
$(document).ready(function()
{
    ajax("../../campo/lista/<?php echo $Salida["id"]; ?>/<?php echo $Salida["campo_id"]; ?>", "div_campo_id");
    /*$('#orden').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    //_________________________
    $("#titulo_campo").keyup(function (){
    	$(this).val(limitar_palabras($(this).val(),1));
    });*/
});
//**********************************
function limitar_palabras(texto, limite)
{
    var palabras = texto.split(/\b[\s,\.\-:;]*/,limite);
    texto=palabras.join(" ");
    return texto;
}
</script>
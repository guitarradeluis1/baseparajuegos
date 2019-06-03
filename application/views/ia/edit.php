<?php echo anchor($controlador."/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
    <p><b>Nombre : </b><br /> 
    <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value"=>$Salida["nombre"] )); ?>
    </p>
    <p><b>Descripcion : </b><br /> 
    <?php echo form_input(array("name" => "descripcion", "id" => "descripcion", "placeholder" => "descripcion.", "type" => "text", "value"=>$Salida["descripcion"] )); ?>
    </p>
    <p><b>Nivel (Nivel de jugador que puede ver "0 para todos"): </b><br /> 
    <?php echo form_input(array("name" => "nivel", "id" => "nivel", "placeholder" => "Nivel.", "type" => "text", "value"=>$Salida["nivel"])); ?>
    </p>
    <p><b>Enemigo : </b><br />
    <span id="div_enemigo_id"><?php #echo creador_selector("enemigo_id", $enemigo_id, ""); ?></span>
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
    /*$('#orden').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    //_________________________
    $("#titulo_campo").keyup(function (){
    	$(this).val(limitar_palabras($(this).val(),1));
    });*/
    ajax("../../funciones/lista_enemigo/enemigo_id/<?php echo $Salida["enemigo_id"]; ?>", "div_enemigo_id");
});
//**********************************
function limitar_palabras(texto, limite)
{
    var palabras = texto.split(/\b[\s,\.\-:;]*/,limite);
    texto=palabras.join(" ");
    return texto;
}
</script>
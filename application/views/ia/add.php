<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/", "id=formulario"); ?>
    <?php #echo form_hidden('campanas_id', $campanas_id); ?>
    <p><b>Nombre : </b><br /> 
    <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
    </p>
    <p><b>Descripcion : </b><br /> 
    <?php echo form_input(array("name" => "descripcion", "id" => "descripcion", "placeholder" => "descripcion.", "type" => "text" )); ?>
    </p>
    <p><b>Nivel (Nivel de jugador que puede ver "0 para todos"): </b><br /> 
    <?php echo form_input(array("name" => "nivel", "id" => "nivel", "placeholder" => "Nivel.", "type" => "text")); ?>
    </p>
    <p><b>Enemigo : </b><br />
    <span id="div_enemigo_id"><?php #echo creador_selector("enemigo_id", $enemigo_id, ""); ?></span>
    </p>
    <?php echo form_submit("post", "Enviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<script>
$(document).ready(function()
{
    $('#nivel').keyup(function (){
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    /*
    //_________________________
    $("#titulo_campo").keyup(function (){
    	$(this).val(limitar_palabras($(this).val(),1));
    });*/
    ajax("../funciones/lista_enemigo/enemigo_id", "div_enemigo_id");
});
//**********************************
</script>
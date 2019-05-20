<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/", "id=formulario"); ?>
    <?php #echo form_hidden('campanas_id', $campanas_id); ?>
    <p><b>Nombre : </b><br /> 
    <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
    </p>
    <?php echo form_submit("post", "Enviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
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
});
//**********************************
</script>
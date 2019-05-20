<div id="body">
<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
    <?php echo form_open($controlador."/".$funcion."/".$Parametro["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Parametro["id"]); ?>
    <p><b>Titulo de la campa&ntilde;a : </b><br /> 
    <?php echo $Parametro["nombre"]; ?>
    </p>
    <p><b>Titulo de la campa&ntilde;a : </b><br /> 
    <?php echo form_input(array("name" => "atributo", "id" => "atributo", "placeholder" => "Atrivuto.", "type" => "text", "value"=>$Parametro["atributo"])); ?>
    </p>
    <?php echo form_submit("post", "Eviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
    <br />
    <?php #echo anchor('usuario/', 'Ingresar', array('title' => 'Ingresa a Yuno!')); ?>
</div>
<?php #echo "<pre>"; print_r($Parametro); echo "</pre>"; ?>
<script>
jQuery(document).ready(function()
{
    //________________________________________________________
    //.................................
    $("#formulario").validate({
        // Specify the validation rules
        rules: {
            atributo: "required",
        },
        // Specify the validation error messages
        messages: {
            atributo: "<br /><label class='label_rojo'>Campo requerido.</label>",
        },
        
        submitHandler: function(form){
            form.submit();
        }
    });
    //.................................
});
//-----------------------------------------------
</script>
<div id="body">
    <?php echo anchor($controlador."/index/".$Salida["campanas_id"], "Atras", "class='plata'"); ?>
    <br />
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
    <?php echo form_hidden('campanas_id', $Salida["campanas_id"]); ?>
    <p><b>Referente a : </b><br /> 
    <?php echo form_input(array("name" => "referente", "id" => "referente", "placeholder" => "referente.", "type" => "text", "value"=>$Salida["referente"])); ?>
    </p>
    <p><b>E-mail : </b><br /> 
    <?php echo form_input(array("name" => "email", "id" => "email", "placeholder" => "email.", "type" => "email", "value"=>$Salida["email"])); ?>
    </p>
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
    <br />
    <?php #echo anchor('usuario/', 'Ingresar', array('title' => 'Ingresa a Yuno!')); ?>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
<script>
jQuery(document).ready(function()
{
    /*$('#orden_listas').val("<?php #echo $Salida["orden_listas"]; ?>");
    //________________________________________________________ number  text
   	    $('#asdasd').keyup(function(){
        	$(this).val(limitar_palabras($(this).val(),1));
   	    });*/
    //________________________________________________________
    //.................................
    $("#formulario").validate({
        // Specify the validation rules
        rules: {
            referente: "required",
            email : "required",
        },
        
        // Specify the validation error messages
        messages: {
            referente: "<br /><label class='label_rojo'>Campo requerido.</label>",
            email: "<br /><label class='label_rojo'>Campo requerido.</label>",
        },
        
        submitHandler: function(form){
            form.submit();
        }
    });
    //.................................
});
//---------------------------------------------------------------------------
function limitar_palabras(texto, limite)
{
}
</script>
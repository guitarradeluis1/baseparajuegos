<div id="body">
<?php
	echo anchor("/ingreso/index", "Atras", "class='plata'");
?>
<table>
<tr>
    <td>
        <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
        <?php echo form_hidden('id', $Salida["id"]); ?>
        <p><b>País.</b><br /> 
        <?php echo creador_selector("paises_id", $paises, ""); ?>
        </p>
        <p><b>Corrreo.</b><br /> 
        <?php echo $Salida["email"]; ?>
        </p>
        <p><b>Nombre.</b><br /> 
        <?php echo $Salida["nombre"]; ?>
        </p>
        <p><b>Contrase&nacute;a.</b><br />
        <?php echo form_input(array("name" => "pass", "id" => "pass", "placeholder" => "Contraseñas.", "type" => "password")); ?>
        </p>
        <p><b>Repetir Contrase&nacute;a.</b><br />
        <?php echo form_input(array("name" => "pass1", "id" => "pass1", "placeholder" => "Repetir contraseñas.", "type" => "password")); ?>
        </p>
        <p><b>Fecha nacimiento.</b><br />
        <?php echo form_input(array("name" => "fecha_nacimento", "id" => "fecha_nacimento", "placeholder" => "", "type" => "date", "value" => $Salida["fecha_nacimento"])); ?>
        </p>
</tr>
</table>
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close();?>
    <br />
</div>
<?php
	#echo "<pre>"; print_r($Salida); echo "</echo>";
?>
<script>
jQuery(document).ready(function()
{
    //________________________________________________________
    $('#paises_id').val("<?php echo $Salida["paises_id"]; ?>");
    //________________________________________________________
    //.................................
    $("#formulario").validate({
        // Specify the validation rules
        rules: {
            paises_id: "required",
            fecha_nacimento: "required",
        },
        
        // Specify the validation error messages
        messages: {
            paises_id: "<br /><label class='label_rojo'>Campo requerido.</label>",
            fecha_nacimento: "<br /><label class='label_rojo'>Campo requerido.</label>",
        },
        
        submitHandler: function(form)
        {
            form.submit();
        }
    });
    //.................................
});
//---------------------------------------------------------------------------
</script>
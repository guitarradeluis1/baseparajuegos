<div id="body">
    <b>Nuevo Usuario</b><hr />
    <?php echo form_open($controlador."/".$funcion, "id=formulario"); ?>
    <p><b>País.</b><br /> 
    <?php echo creador_selector("paises_id", $paises, ""); ?>
    </p>
    <p><b>Corrreo.</b><br /> 
    <?php echo form_input(array("name" => "email", "id" => "email", "placeholder" => "email.", "type" => "email")); ?>
    </p>
    <p><b>Nombre.</b><br /> 
    <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "class"=>"unapalabra")); ?>
    </p>
    <p><b>Contrase&nacute;a.</b><br />
    <?php echo form_input(array("name" => "pass", "id" => "pass", "placeholder" => "Contraseñas.", "type" => "password")); ?>
    </p>
    <p><b>Repetir Contrase&nacute;a.</b><br />
    <?php echo form_input(array("name" => "pass1", "id" => "pass1", "placeholder" => "Repetir contraseñas.", "type" => "password")); ?>
    </p>
    <p><b>Fecha nacimiento.</b><br />
    <?php echo form_input(array("name" => "fecha_nacimento", "id" => "fecha_nacimento", "placeholder" => "", "type" => "date")); ?>
    </p>
    <?php echo form_submit("control", "Entrar", "class=link_verde_largo"); ?>
    <!--input type="button" class="link_verde_largo" id="btn_nuevo" value="Registrate" /-->
    <?php echo form_close(); ?>
    <br />
    <?php echo anchor("/welcome/index", "Login", "class='link_verde'"); ?>
</div>
<div id="div_result"></div>
<?php #echo "<pre>"; print_r($paises); echo "</pre>"; ?>
<script type="text/javascript">
jQuery(document).ready(function()
{
    //________________________________________________________
   	//$('#nombre').keyup(function(){$(this).val(limitar_palabras($(this).val(),1));});
    //________________________________________________________
    //.................................
    $("#formulario").validate({
        // Specify the validation rules
        rules: {
            paises_id: "required",
            email: "required",
            nombre: "required",
            pass : "required",
            pass1: "required",
            fecha_nacimento: "required",
        },
        
        // Specify the validation error messages
        messages: {
            paises_id: "<br /><label class='label_rojo'>Campo requerido.</label>",
            email: "<br /><label class='label_rojo'>E-mail requerido.</label>",
            nombre: "<br /><label class='label_rojo'>Campo requerido.</label>",
            pass: "<br /><label class='label_rojo'>Campo requerido.</label>",
            pass1: "<br /><label class='label_rojo'>Campo requerido.</label>",
            fecha_nacimento: "<br /><label class='label_rojo'>Campo requerido.</label>",
        },
        
        submitHandler: function(form)
        {
            //form.submit();
            $.ajax({
                type: "POST",
                url: "./nuevo",
                data: $("#formulario").serialize(), // serializes the form's elements.
                success: function(data)
                {
                   $("#div_result").html(data);
                }
            });
        }
    });
    //.................................
});
//---------------------------------------------------------------------------
/*$('#nit').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
});*/
//---------------------------------------------------------------------------
</script>
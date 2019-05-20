<div id="body">
    <?php echo form_open($controlador."/index", "id=formulario"); ?>
    <p><b>Corrreo.</b><br /> 
    <?php echo form_input(array("name" => "correo", "id" => "correo", "placeholder" => "Usuario.", "type" => "email")); ?>
    </p>
    <p><b>Contrase&nacute;a.</b><br />
    <?php echo form_input(array("name" => "pass", "id" => "pass", "placeholder" => "Contraseñas.", "type" => "password")); ?>
    </p>
    <?php echo form_submit("control", "Entrar", "class=link_verde_largo"); ?>
    <input type="button" class="link_verde_largo" id="btn_nuevo" value="Registrate" />
    <?php echo form_close(); ?>
    <br />
</div>
<script type="text/javascript">
jQuery(document).ready(function()
{
    $("#btn_nuevo").click(function(){location.href ="./welcome/nuevo";});
    //.................................
    $("#formulario").validate({
        // Specify the validation rules
        rules: {
            correo: "required",
            pass : "required",
        },
        // Specify the validation error messages
        messages: {
            correo: "<br /><label class='label_rojo'>E-mail requerido.</label>",
            pass: "<br /><label class='label_rojo'>Contraseña requerido.</label>",
        },
        
        submitHandler: function(form){
            form.submit();
        }
    });
    //.................................
});
//---------------------------------------------------------------------------
/*$('#nit').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
});
//---------------------------------------------------------------------------
$('#verifica').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
});
//---------------------------------------------------------------------------
$('#codigo_contrato').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
});*/
//---------------------------------------------------------------------------
function limitar_palabras(texto, limite)
{
    var palabras = texto.split(/\b[\s,\.\-:;]*/,limite);
    texto=palabras.join(" ");
    return texto;
}
</script>
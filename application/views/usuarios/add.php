<div id="body">
<table>
<tr>
    <td>
        <?php echo form_open($controlador."/".$funcion, "id=formulario"); ?>
        <p><b>Correo / Usuario : </b><br /> 
        <?php echo form_input(array("name" => "correo", "id" => "correo", "placeholder" => "correo/usuario.", "type" => "email")); ?>
        </p>
        <p><b>Contrase&ntilde;a : </b><br /> 
        <?php echo form_input(array("name" => "pass", "id" => "pass", "placeholder" => "pass.", "type" => "text")); ?>
        </p>
        <p><b>Activo : </b><br /> 
        <?php echo form_dropdown('activo', array(1=>"Si", 0=>"No"), 'large'); ?>
        </p>
    </td>
    <td>
        <p><b>Nombre : </b><br /> 
        <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
        </p>
        </p>
        <p><b>Apellido : </b><br /> 
        <?php echo form_input(array("name" => "apellido", "id" => "apellido", "placeholder" => "apellido.", "type" => "text")); ?>
        </p>
    </td>
</tr>
</table>
    <?php echo form_submit("post", "Eviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
    <br />
    <?php #echo anchor('usuario/', 'Ingresar', array('title' => 'Ingresa a Yuno!')); ?>
</div>
<script>
</script>
<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php #echo form_open($controlador."/".$funcion."/", "id=formulario"); ?>
    <?php echo form_open_multipart($controlador."/".$funcion."/", "id=formulario"); ?>
    <?php #echo form_hidden('campanas_id', $campanas_id); ?>
    <table>
        <tr>
            <td>
                <p><b>Tipo Objeto : </b><br /> 
                <?php echo creador_selector("objetotipo_id", $objetotipo, ""); ?>
                </p>
                <p><b>Nombre : </b><br /> 
                <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
                </p>
                <p><b>Archivo : </b><br /> 
                    <?php #echo creador_selector("archivo", $archivo, ""); ?>
                    <input type="file" name="archivo" multiple="multiple" />
                </p>
            </td>
            <td>
                <p><b>Corte x : </b><br /> 
                <?php echo form_input(array("name" => "cortex", "id" => "cortex", "placeholder" => "cortex.", "type" => "number", "class"=>"number")); ?>
                </p>
                <p><b>Corte y : </b><br /> 
                <?php echo form_input(array("name" => "cortey", "id" => "cortey", "placeholder" => "cortey.", "type" => "number", "class"=>"number")); ?>
                </p>
                <p><b>Conteo Fila : </b><br /> 
                <?php echo form_input(array("name" => "conteofila", "id" => "conteofila", "placeholder" => "conteofila.", "type" => "number", "class"=>"number")); ?>
                </p>
                <p><b>Conteo Columna : </b><br /> 
                <?php echo form_input(array("name" => "conteocolumna", "id" => "conteocolumna", "placeholder" => "conteocolumna.", "type" => "number", "class"=>"number")); ?>
                </p>
                <p><b>Inventario : </b><br /> 
                <?php echo creador_selector("inventario", array(0=>"NO",1=>"SI"), ""); ?>
                </p>
            </td>
        </tr>
    </table>
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
<?php
	#echo "<pre>"; print_r($objetotipo); echo "</pre>";
?>
<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
    <table>
        <tr>
            <td>
                <p><b>Tipo Objeto : </b><br /> 
                <?php echo creador_selector("objetotipo_id", $objetotipo, ""); ?>
                </p>
                <p><b>Nombre : </b><br /> 
                <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value"=>$Salida["nombre"] )); ?>
                </p>
                <p><b>Archivo : </b><br /> 
                <?php #echo creador_selector("archivo", $archivo, ""); ?>
                <?php echo img('archivos/'.$Salida["archivo"], 'grande'); ?>
                </p>
            </td>
            <td>
                <p><b>Corte x : </b><br /> 
                <?php echo form_input(array("name" => "cortex", "id" => "cortex", "placeholder" => "cortex.", "type" => "number", "class"=>"number", "value"=>$Salida["cortex"])); ?>
                </p>
                <p><b>Corte y : </b><br /> 
                <?php echo form_input(array("name" => "cortey", "id" => "cortey", "placeholder" => "cortey.", "type" => "number", "class"=>"number", "value"=>$Salida["cortey"])); ?>
                </p>
                <p><b>Conteo Fila : </b><br /> 
                <?php echo form_input(array("name" => "conteofila", "id" => "conteofila", "placeholder" => "conteofila.", "type" => "number", "class"=>"number", "value"=>$Salida["conteofila"])); ?>
                </p>
                <p><b>Conteo Columna : </b><br /> 
                <?php echo form_input(array("name" => "conteocolumna", "id" => "conteocolumna", "placeholder" => "conteocolumna.", "type" => "number", "class"=>"number", "value"=>$Salida["conteocolumna"])); ?>
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
    $("#objetotipo_id").val("<?php echo $Salida["objetotipo_id"]; ?>");
    $("#archivo").val("<?php echo $Salida["archivo"]; ?>");
    $("#inventario").val("<?php echo $Salida["inventario"]; ?>");
});
//**********************************
</script>
<?php
#echo "<pre>"; print_r($Salida); echo "</pre>";
?>
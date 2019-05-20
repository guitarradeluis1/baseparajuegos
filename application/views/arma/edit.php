<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_arma.js');?>"></script>
<!---------------------------------------------------------------------->
<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
<?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
<?php echo form_hidden('id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Objeto : </b><br /> 
            <?php echo creador_selector("objeto_id", $objeto, ""); ?>
            </p>
            <p><b>Dibujo : </b><br /> 
            <span id="div_dibujo_id"><?php #echo creador_selector("dibujo_id", $dibujo, ""); ?></span>
            </p>
            <p><b>Nombre : </b><br /> 
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value" => $Salida["nombre"] )); ?>
            </p>
            <p><b>Da&ntilde;o minimo: </b><br /> 
            <?php echo form_input(array("name" => "dano_min", "id" => "dano_min", "placeholder" => "dano_min", "type" => "number", "class"=>"number", "value" => $Salida["dano_min"])); ?>
            </p>
            <p><b>Da&ntilde;o maximo : </b><br /> 
            <?php echo form_input(array("name" => "dano_max", "id" => "dano_max", "placeholder" => "dano_max", "type" => "number", "class"=>"number", "value" => $Salida["dano_max"])); ?>
            </p>
            <p><b>Funciones : </b><br />
            <span id="div_funciones_id"><?php #echo creador_selector("funciones_id", $funciones_id, ""); ?></span>
            </p>
        </td>
        <td>
            <p><b>Defensa: </b><br /> 
            <?php echo form_input(array("name" => "defensa", "id" => "defensa", "placeholder" => "defensa", "type" => "number", "class"=>"", "value" => $Salida["defensa"])); ?>
            </p>
            <p><b>Fuerza: </b><br /> 
            <?php echo form_input(array("name" => "fuerza", "id" => "fuerza", "placeholder" => "fuerza", "type" => "number", "class"=>"", "value" => $Salida["fuerza"])); ?>
            </p>
            <p><b>Punteria: </b><br /> 
            <?php echo form_input(array("name" => "punteria", "id" => "punteria", "placeholder" => "punteria", "type" => "number", "class"=>"", "value" => $Salida["punteria"])); ?>
            </p>
            <p><b>Velocidad: </b><br /> 
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad", "type" => "number", "class"=>"", "value" => $Salida["velocidad"])); ?>
            </p>
        </td>
        <td>
            <div id="canvas"></div>
            <br />
            <?php echo img('archivos/'.$Salida["objeto"]["archivo"], 'grande'); ?>
        </td>
    </tr>
</table>
    <?php echo form_submit("post", "Enviar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php
    #echo "<pre>"; print_r($Salida); echo "</pre>";
?>
<script>
$(document).ready(function()
{
    $("#objeto_id").val("<?php echo $Salida["objeto_id"]; ?>");
    ajax("../../funciones/lista/funciones_id/<?php echo $Salida["funciones_id"]; ?>", "div_funciones_id");
    ajax("../../dibujo/lista/"+$("#objeto_id").val()+"/dibujo_id/<?php echo $Salida["dibujo_id"]; ?>", "div_dibujo_id");
    //-------------------------
    imagenes = <?php echo json_encode($Salida); ?>;
    //console.log(imagenes);
});
//**********************************
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
</script>
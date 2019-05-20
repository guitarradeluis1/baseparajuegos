<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
<?php echo form_open($controlador."/".$funcion."/", "id=formulario"); ?>
<?php #echo form_hidden('campanas_id', $campanas_id); ?>
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
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
            </p>
            <p><b>Da&ntilde;o minimo: </b><br /> 
            <?php echo form_input(array("name" => "dano_min", "id" => "dano_min", "placeholder" => "dano_min", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Da&ntilde;o maximo : </b><br /> 
            <?php echo form_input(array("name" => "dano_max", "id" => "dano_max", "placeholder" => "dano_max", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Funciones: </b><br />
            <span id="div_funciones_id"><?php #echo creador_selector("funciones_id", $funciones_id, ""); ?></span>
            </p>
        </td>
        <td>
            <p><b>Defensa: </b><br /> 
            <?php echo form_input(array("name" => "defensa", "id" => "defensa", "placeholder" => "defensa", "type" => "number", "class"=>"")); ?>
            </p>
            <p><b>Fuerza: </b><br /> 
            <?php echo form_input(array("name" => "fuerza", "id" => "fuerza", "placeholder" => "fuerza", "type" => "number", "class"=>"")); ?>
            </p>
            <p><b>Punteria: </b><br /> 
            <?php echo form_input(array("name" => "punteria", "id" => "punteria", "placeholder" => "punteria", "type" => "number", "class"=>"")); ?>
            </p>
            <p><b>Velocidad: </b><br /> 
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad", "type" => "number", "class"=>"")); ?>
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
    ajax("../funciones/lista/funciones_id", "div_funciones_id");
});
//**********************************
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
</script>
<?php
#echo "<pre>"; print_r($objeto); echo "</pre>";
?>
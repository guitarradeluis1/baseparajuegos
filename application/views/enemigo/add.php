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
            <p><b>Nombre : </b><br /> 
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text")); ?>
            </p>
            <p><b>Daño minimo : </b><br /> 
            <?php echo form_input(array("name" => "dano_min", "id" => "dano_min", "placeholder" => "dano_min.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Daño maximo : </b><br /> 
            <?php echo form_input(array("name" => "dano_max", "id" => "dano_max", "placeholder" => "dano_max.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Vida : </b><br /> 
            <?php echo form_input(array("name" => "vida", "id" => "vida", "placeholder" => "dano_max.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Defensa : </b><br /> 
            <?php echo form_input(array("name" => "defensa", "id" => "defensa", "placeholder" => "defensa.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Fuerza : </b><br /> 
            <?php echo form_input(array("name" => "fuerza", "id" => "fuerza", "placeholder" => "fuerza.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Punteria : </b><br /> 
            <?php echo form_input(array("name" => "punteria", "id" => "punteria", "placeholder" => "punteria.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Velocidad : </b><br /> 
            <?php echo form_input(array("name" => "velocidad_juego", "id" => "velocidad_juego", "placeholder" => "velocidad_juego.", "type" => "number", "class"=>"number", "value"=>"" )); ?>
            </p>
        </td>
        <td>
            <p><b>Velocidad movimiento: </b><br /> 
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad.", "type" => "number", "class"=>"number")); ?>
            </p>
            <p><b>Movimiento : </b><br /> 
            <span id="div_movimientos_id"><?php #echo creador_selector("movimientos_id", $objeto, ""); ?></span>
            </p>
            <p><b>Left : </b><br /> 
            <span id="div_left_id"><?php #echo creador_selector("left_id", $objeto, ""); ?></span>
            </p>
            <p><b>Right : </b><br /> 
            <span id="div_right_id"><?php #echo creador_selector("right_id", $objeto, ""); ?></span>
            </p>
            <p><b>Down : </b><br /> 
            <span id="div_down_id"><?php #echo creador_selector("down_id", $objeto, ""); ?></span>
            </p>
            <p><b>UP : </b><br /> 
            <span id="div_up_id"><?php #echo creador_selector("up_id", $objeto, ""); ?></span>
            </p>
            <p><b>Stop : </b><br /> 
            <span id="div_stop_id"><?php #echo creador_selector("stop_id", $objeto, ""); ?></span>
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
    ajax("../movimientos/lista/movimientos_id", "div_movimientos_id");
});
//**********************************
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/left_id", "div_left_id");});
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/right_id", "div_right_id");});
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/down_id", "div_down_id");});
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/up_id", "div_up_id");});
$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/stop_id", "div_stop_id");});
</script>
<?php echo anchor($controlador."/index/".$Mapa["id"], "Atras", "class='plata'"); ?>
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Mapa["nombre"]; ?></label>
    <hr />
    <?php echo form_open($controlador."/".$funcion."/".$Mapa["id"], "id=formulario"); ?>
    <?php echo form_hidden('mapa_id', $Mapa["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Nombre : </b><br /> 
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text" )); ?>
            </p>
            <p><b>Objeto : </b><br /> 
            <?php echo creador_selector("objeto_id", $objeto, ""); ?>
            </p>
            <p><b>Fondo : </b><br /> 
            <span id="div_fondo"><?php #echo creador_selector("fondo", $dibujo, ""); ?></span>
            </p>
        </td>
        <td>
            <p><b>Arriba : </b><br /> 
            <span id="div_limite_arriba_dibujo"><?php #echo creador_selector(""limite_arriba_dibujo", $dibujo, ""); ?></span>
            </p>
            <p><b>Abajo : </b><br />
            <span id="div_limite_abajo_dibujo"><?php #echo creador_selector("limite_abajo_dibujo", $dibujo, ""); ?></span>
            </p>
            <p><b>Derecha : </b><br /> 
            <span id="div_limite_derecha_dibujo"><?php #echo creador_selector("limite_derecha_dibujo", $dibujo, ""); ?></span>
            </p>
            <p><b>Izquierda : </b><br /> 
            <span id="div_limite_izquierda_dibujo"><?php #echo creador_selector("limite_izquierda_dibujo", $dibujo, ""); ?></span>
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

});
//**********************************
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/fondo", "div_fondo");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/limite_arriba_dibujo", "div_limite_arriba_dibujo");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/limite_abajo_dibujo", "div_limite_abajo_dibujo");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/limite_derecha_dibujo", "div_limite_derecha_dibujo");});
$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/limite_izquierda_dibujo", "div_limite_izquierda_dibujo");});
</script>
<?php
#echo "<pre>"; print_r($Objetos); echo "</pre>";
?>
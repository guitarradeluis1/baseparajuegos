<?php echo anchor($controlador."/objetos/".$enemigo_id, "Atras", "class='plata'"); ?>
<div id="body">
    <?php echo form_open($controlador."/".$funcion."/".$enemigo_id, "id=formulario"); ?>
    <?php echo form_hidden('enemigo_id', $enemigo_id); ?>
<table>
    <tr>
        <td>
            <p><b>Movimiento : </b><br /> 
            <span id="div_movimientos_id"><?php #echo creador_selector("movimientos_id", $objeto, ""); ?></span>
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
    ajax("../../arma/lista/arma_id/arma_id", "div_movimientos_id");
});
//**********************************
</script>
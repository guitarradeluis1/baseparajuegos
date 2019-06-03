<?php echo anchor($controlador."/index/".$Campo["id"], "Atras", "class='plata'"); ?>
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Campo["mapa"]["nombre"]; ?> [<?php echo $Campo["nombre"]; ?>]</label>
    <hr />
    <!----:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::----->
    <?php echo form_open($controlador."/".$funcion."/".$Campoenemigo["id"]."/".$Campoenemigo["campo_id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Campoenemigo["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Enemigo : </b><br />
            <span id="div_enemigo_id"><?php #echo creador_selector("enemigo_id", $enemigo_id, ""); ?></span>
            </p>
        </td>
    </tr>
    <tr>
        <td>
            <p><b>Posición X : </b><br />
            <?php echo form_input(array("name" => "x", "id" => "x", "placeholder" => "x", "type" => "text", "value" =>$Campoenemigo["x"] )); ?>
            </p>
        </td>
        <td>
            <p><b>Posición Y : </b><br />
            <?php echo form_input(array("name" => "y", "id" => "y", "placeholder" => "y", "type" => "text", "value" =>$Campoenemigo["y"] )); ?>
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
    $('#x').keyup(function (){this.value = (this.value + '').replace(/[^0-9]/g, ''); });
    $('#y').keyup(function (){this.value = (this.value + '').replace(/[^0-9]/g, ''); });
    ajax("../../../funciones/lista_enemigo/enemigo_id/<?php echo $Campoenemigo["enemigo_id"]; ?>", "div_enemigo_id");
    //-------------------------
});
//**********************************
</script>
<?php
    #echo "<br /><pre>"; print_r($Campoenemigo); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_destino); echo "</pre>";
?>
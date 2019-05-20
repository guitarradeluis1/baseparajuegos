<?php echo anchor($controlador."/index/".$Campo["id"], "Atras", "class='plata'"); ?>
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Campo["mapa"]["nombre"]; ?> [<?php echo $Campo["nombre"]; ?>]</label>
    <hr />
    <?php echo form_open($controlador."/".$funcion."/".$Campo["id"], "id=formulario"); ?>
    <?php echo form_hidden('campo_id', $Campo["id"]); ?>
    <?php echo form_hidden('mapa_id', $Campo["mapa"]["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Objeto : </b><br />
            <?php echo creador_selector("objeto_id", $objeto, ""); ?>
            </p>
            <p><b>Personaje : </b><br /> 
            <?php echo creador_selector("personaje_id", $personaje, ""); ?>
            </p>
            <p><b>Mapa Destino : </b><br />
            <?php echo creador_selector("otro_mapa", $mapa, ""); ?>
            </p>
            <p><b>Campo Destino : </b><br />
            <div id="div_campo">Campo....</div>
            </p>
            <p><b>Destino X : </b><br />
            <?php echo form_input(array("name" => "destinox", "id" => "destinox", "placeholder" => "destinox", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Destino Y : </b><br />
            <?php echo form_input(array("name" => "destinoy", "id" => "destinoy", "placeholder" => "destinoy", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Tamaño X : </b><br />
            <?php echo form_input(array("name" => "tamanox", "id" => "tamanox", "placeholder" => "tamanox", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Tamaño Y : </b><br />
            <?php echo form_input(array("name" => "tamanoy", "id" => "tamanoy", "placeholder" => "tamanoy", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Posición X : </b><br />
            <?php echo form_input(array("name" => "x", "id" => "x", "placeholder" => "x", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Posición Y : </b><br />
            <?php echo form_input(array("name" => "y", "id" => "y", "placeholder" => "y", "type" => "text", "class"=>"number")); ?>
            </p>
        </td>
        <td>
            <p><b>Inmovil : </b><br />
            <?php echo creador_selector_si("inmovil", ""); ?>
            </p>
            <p><b>Velocidad : </b><br />
            <?php echo form_input(array("name" => "velocidad", "id" => "velocidad", "placeholder" => "velocidad", "type" => "text", "class"=>"number")); ?>
            </p>
            <p><b>Camina Aleatorio : </b><br />
            <?php echo creador_selector_si("camina_aleatorio", ""); ?>
            </p>
            <p><b>Muro : </b><br />
            <?php echo creador_selector_si("muro", ""); ?>
            </p>
            <p><b>Colicion : </b><br />
            <?php echo creador_selector_si("colicion", ""); ?>
            </p>
            <p><b>Boton : </b><br />
            <?php echo creador_selector_si("boton", ""); ?>
            </p>
            <p><b>Funcion : </b><br />
            <?php echo creador_textbox("funcion", 25, 5, 150, ""); ?>
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
$("#otro_mapa").change(function ()
{if($(this).val()!=""){ajax("../../campo/lista/"+$(this).val(), "div_campo");}
else{jQuery('#div_campo').html("<?php echo img('img/giphy.gif', 'pequeña'); ?>");}
});
</script>
<?php
#echo "<pre>"; print_r($Campo); echo "</pre>";
?>
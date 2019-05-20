<?php echo anchor("campo/index/".$Salida["mapa_id"], "Atras", "class='plata'"); ?>
<?php echo anchor($controlador."/add_campo_objeto/".$Salida["id"], "Agregar Objeto", "class='plata'"); ?>
<!-------------------------------------------------------------------->
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Salida["mapa"]["nombre"]; ?></label>
    <hr />
    <?php
    foreach($campo_objeto as $caob)
    {
        ?>
        <?php echo $caob["id"]." ".$caob["objeto"]["nombre"]." - ".$caob["campo"]["nombre"]; ?>
        <?php
    }
    ?>
    <!----:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::----->
    <hr />
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('campo_id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Objeto : </b><br /> 
            <?php echo creador_selector("objeto_id", $objeto, ""); ?>
            </p>
        </td>
    </tr>
</table>
    
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php
    #echo "<br /><pre>"; print_r($Salida); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_objeto); echo "</pre>";
?>
<script>
$(document).ready(function()
{
});
//**********************************

</script>
<?php echo anchor($controlador."/index/".$Salida["campo_id"], "Atras", "class='plata'"); ?>
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Campo["mapa"]["nombre"]; ?> [<?php echo $Campo["nombre"]; ?>]</label>
    <hr />
    <?php
    foreach($campo_objeto as $caob)
    {
        ?>
        <button class='plata carga' value="<?php echo $caob["id"]; ?>" ><?php echo $caob["id"]." ".$caob["objeto"]["nombre"]." - ".$caob["campo"]["nombre"]; ?></button>
        <?php
    }
    ?>
    <hr />
    <!----:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::----->
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"]."/".$Campo["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Dibujo : </b><br />
            <span id="div_dibujo_id"><?php #echo creador_selector("dibujo_id", $dibujo_id, ""); ?></span>
            </p>
            <p><b>Funciones : </b><br />
            <span id="div_funciones_id"><?php #echo creador_selector("funciones_id", $funciones_id, ""); ?></span>
            </p>
            <p><b>Arma : </b><br />
            <span id="div_arma_id"><?php #echo creador_selector("arma_id", arma_id, ""); ?></span>
            </p>
            <p><b>Parametros : </b><br />
            <?php echo form_input(array("name" => "parametros", "id" => "parametros", "placeholder" => "parametros", "type" => "text", "value"=>$Salida["parametros"] )); ?>
            </p>
            <p><b>IA : </b><br />
            <span id="div_ia_id"><?php #echo creador_selector("ia_id", $ia_id, ""); ?></span>
            </p>
            <p><b>Campo Destino : </b><br />
            <?php echo creador_selector("campo_destino", $campo_destino, ""); ?>
            </p>
        </td>
        <td>
            <p><b>Nivel<br />(De muestra al jugador | si es 0 se muestra a todos) : </b><br />
            <?php echo form_input(array("name" => "nivel", "id" => "nivel", "placeholder" => "nivel", "type" => "text", "class"=>"number", "value"=>$Salida["nivel"] )); ?>
            </p>
            <p><b>Posicion x : </b><br />
            <?php echo form_input(array("name" => "posicionx", "id" => "posicionx", "placeholder" => "posicionx", "type" => "text", "class"=>"number", "value"=>$Salida["posicionx"] )); ?>
            </p>
            <p><b>Posicion y : </b><br />
            <?php echo form_input(array("name" => "posiciony", "id" => "posiciony", "placeholder" => "posiciony", "type" => "text", "class"=>"number", "value"=>$Salida["posiciony"] )); ?>
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
     $(".carga").click(function (){carga($(this).val());});
     ajax("../../../funciones/lista/funciones_id/<?php echo $Salida["funciones_id"]; ?>", "div_funciones_id");
     ajax("../../../arma/lista/arma_id/<?php echo $Salida["arma_id"]; ?>", "div_arma_id");
     ajax("../../../ia/lista/ia_id/<?php echo $Salida["ia_id"]; ?>", "div_ia_id");
     $("#campo_destino").val("<?php echo $Salida["campo_destino"]; ?>");
    //-------------------------
    ajax("../../../dibujo/lista/<?php echo $Salida["dibujo"]["objeto_id"]; ?>/dibujo_id/<?php echo $Salida["dibujo"]["id"]; ?>", "div_dibujo_id");
});
//**********************************
function carga(objeto_id)
{
    ajax("../../../dibujo/lista/"+objeto_id+"/dibujo_id", "div_dibujo_id");
}
</script>
<?php
    #echo "<br /><pre>"; print_r($Salida); echo "</pre>";
    #echo "<br /><pre>"; print_r($Campo); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_destino); echo "</pre>";
?>
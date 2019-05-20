<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<?php echo anchor($controlador."/edit/".$Salida["id"], "Editar", "class='plata'"); ?>
<?php #echo anchor("agendamientotipocampos/add/".$Salida["id"], "Nuevo campo", "class='plata'"); ?>
<hr />
<table>
    <tr>
        <th colspan="2"><?php echo strtoupper($Salida["nombre"]); ?></th>
    </tr>
</table>
<label><b>CAMPOS DE AGENDAMIENTO.</b></label>
<br />
<?php
if($Salida["id"] == 1)
{
?>
<table>
    <tr>
        <th>ORDEN</th>
        <th>TITULO</th>
        <th>TIPO</th>
        <th>LISTA</th>
        <th>VISIBLE</th>
        <th>OBLIGATORIO</th>
        <th>E-mail</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Fecha inicio</td>
        <td>Fecha</td>
        <td>NO</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Hora</td>
        <td>Hora</td>
        <td>NO</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Tiempo medias horas</td>
        <td>Tiempo</td>
        <td>Lista por media hora</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
<?php
}
else if($Salida["id"] == 2)
{
    ?>
<table>
    <tr>
        <th>ORDEN</th>
        <th>TITULO</th>
        <th>TIPO</th>
        <th>LISTA</th>
        <th>VISIBLE</th>
        <th>OBLIGATORIO</th>
        <th>E-mail</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Fecha inicio</td>
        <td>Fecha</td>
        <td>NO</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
</table>
    <?php
}
else if($Salida["id"] == 3)
{
    ?>
<table>
    <tr>
        <th>ORDEN</th>
        <th>TITULO</th>
        <th>TIPO</th>
        <th>LISTA</th>
        <th>VISIBLE</th>
        <th>OBLIGATORIO</th>
        <th>E-mail</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Fecha inicio</td>
        <td>Fecha</td>
        <td>NO</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
    <tr>
        <td>1</td>
        <td>Fecha fin</td>
        <td>Fecha</td>
        <td>NO</td>
        <td>SI</td>
        <td>SI</td>
        <td>SI</td>
    </tr>
</table>
    <?php
}
/*
if($Campos)
{
    foreach($Campos as $Campo)
    {
    ?>
    <tr>
        <td><?php echo $Campo["orden"]; ?></td>
        <td><?php echo anchor("agendamientotipocampos/edit/".$Campo["id"], $Campo["titulo_campo"]); ?></td>
        <td><?php
        if(isset($Campo["tipos"]["nombre"]))
        {echo $Campo["tipos"]["nombre"];} ?></td>
        <td><?php
        if(isset($Campo["lista"]["nombre"]))
        {echo $Campo["lista"]["nombre"];} ?></td>
        <td><?php
        if($Campo["visible"] == 0){echo "No";}
        else{echo "Si";}
        ?></td>
        <td><?php
        if($Campo["obligatorio"] == 0){echo "No";}
        else{echo "Si";}
        ?></td>
        <td><?php
        if($Campo["mail"] == 0){echo "";}
        else{echo "Se envia.";}
        ?></td>
    </tr>
    <?php
    }
}
?>
</table>
<input type="button" value="Ejemplo de formuario" id="ejemplo" class='plata' style="cursor: hand;" />
<div id="ejemplo1" style="display: none" >
<table>
<?php
if($Campos)
{
    $salto = 0;
    foreach($Campos as $Campo)
    {
    if($Campo["visible"] == 1)
    {
        if($salto == 0)
        {
            echo "<tr>";
        }
        $salto = $salto + 1;
        ?>
        <td>
        <b><?php echo $Campo["titulo_campo"]; ?></b>
        <br />
        <?php
        if(isset($Campo["lista"]["nombre"]))
        {
            echo form_dropdown("campo_".$Campo["id"], $Opciones[$Campo["lista"]["id"]], 'large');
        }
        else
        {
            if( isset($Campo["tipos"]["id"]))
            {}
            else
            {$Campo["tipos"]["id"] = 1;}
            if($Campo["tipos"]["id"] == 2)#textatrea
            {
                $data = array(
                  'name'        => "campo_".$Campo["id"],
                  'id'          => $Campo["titulo_campo"],
                  'value'       => '',
                  "placeholder" => $Campo["ayuda"],
                  'rows'        => '10',
                  'cols'        => '10',
                  'style'       => 'width:50%',
                );
                echo form_textarea($data);
            }
            else #if($Campo["tipos"]["id"] == 1)
            {
                if(isset($Campo["tipos"]["html"])){$tipo_cam = $Campo["tipos"]["html"];}
                else{ $tipo_cam = "text"; }
                echo form_input(array(
                "name" => "campo_".$Campo["id"],
                "id" => $Campo["titulo_campo"], 
                "placeholder" => $Campo["ayuda"],
                "type" => $tipo_cam
                ));
            }
        }
        echo "<br /><pre>".$Campo["ayuda"]."</pre>";
        ?>
        </td>
    <?php
        if($salto == 3)
        {
            $salto = 0;
            echo "</tr>";
        }
    }
    }
}
*/
?>
</table>
<hr />
<b>Comparaci&oacute;n :</b>
<hr />
<?php
if($Salida["id"] == 1)
{
?>
<ul>
	<li><b>1.</b> Ubicar agendamiento en la fecha.</li>
    <li><b>2.</b> Comparar rango de hora y tiempo.</li>
</ul>
<?php
}
else if($Salida["id"] == 2)
{
?>
<ul>
	<li><b>1.</b> Ubicar agendamiento en la fecha.</li>
</ul>
<?php
}
else if($Salida["id"] == 3)
{
?>
<ul>
	<li><b>1.</b> Ubicar agendamiento en la fecha inicio.</li>
    <li><b>2.</b> Agendar con respecto a la fecha fin.</li>
</ul>
<?php
}
?>
</div>
<?php
    #echo "<pre>"; print_r($Salida); echo "</pre>";
    #echo "<pre>"; print_r($Campos); echo "</pre>";
?>
<script>
var esco = 1;
$("#ejemplo").click(function()
{
    if(esco == 1)
    {
        esco = 0;
        $("#ejemplo1").show("slow");
    }
    else
    {
        esco = 1;
        $("#ejemplo1").hide("slow");
    }
  
});
</script>
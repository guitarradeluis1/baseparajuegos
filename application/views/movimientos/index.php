<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor("objeto/", "Atras", "class='plata'"); ?>
    <?php echo anchor($controlador."/add/".$objeto_id, "Nuevo", "class='plata'"); ?>
    <hr />
    <b><?php echo $objeto["nombre"]." (".$objeto["objetotipo"]["nombre"].")"; ?></b>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>TIPO</th>
            <th><?php echo strtoupper("height"); ?></th>
            <th><?php echo strtoupper("width"); ?></th>
            <th>FUENTE</th>
            <th>COLOR</th>
            <th>VELOCIDAD</th>
            <th>CUADROS</th>
            <th>play</th>
            <th>fisica</th>
            <th>immovable</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info["id"], "Editar", "class='plata'"); ?></td>
            <td><?php echo $info["texto"]; ?></td>
            <td><?php echo $info["dibujotipo"]["nombre"]; ?></td>
            <td><?php echo $info["height"]; ?></td>
            <td><?php echo $info["width"]; ?></td>
            <td><?php echo $info["font"]; ?></td>
            <td style="background-color: <?php echo $info["color"]; ?>;"><?php echo $info["color"]; ?></td>
            <td><?php echo $info["velocidad"]; ?></td>
            <td><?php echo $info["cuadros"]; ?></td>
            <td><?php echo texto_si($info["play"]); ?></td>
            <td><?php echo texto_si($info["fisica"]); ?></td>
            <td><?php echo texto_si($info["immovable"]); ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php
#echo "<pre>"; print_r($objeto); echo "</pre>";
#echo "<pre>"; print_r($Salida); echo "</pre>";
?>
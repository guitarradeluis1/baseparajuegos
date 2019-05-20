<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add", "Nuevo", "class='plata'"); ?>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>TIPO</th>
            <th>ARCHIVO</th>
            <th>CORTE X</th>
            <th>CORTE Y</th>
            <th>INVENTARIO</th>
            <th>CONTEO</th>
            <th>DIBUJOS</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info["id"], "Editar", "class='plata'"); ?></td>
            <td><?php echo $info["nombre"]; ?></td>
            <td><?php echo $info["objetotipo"]["nombre"]; ?></td>
            <td><?php echo $info["archivo"]; ?></td>
            <td><?php echo $info["cortex"]; ?></td>
            <td><?php echo $info["cortey"]; ?></td>
            <td><?php echo texto_si($info["inventario"]); ?></td>
            <td><?php echo $info["conteofila"].",".$info["conteocolumna"]; ?></td>
            <td><?php echo anchor("dibujo/index/".$info["id"], "Dibujos", "class='plata'"); ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
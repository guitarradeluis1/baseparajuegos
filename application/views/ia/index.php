<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add", "Nuevo", "class='plata'"); ?>
    <hr />
    <table>
        <tr>
            <th>NOMBRE</th>
            <th>descripcion</th>
            <th>ID</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo $info["nombre"]; ?></td>
            <td><?php echo $info["descripcion"]; ?></td>
            <td><?php echo anchor($controlador."/edit/".$info["id"], "Editar (".$info["id"].")", "class='plata'"); ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Datos); echo "</pre>"; ?>
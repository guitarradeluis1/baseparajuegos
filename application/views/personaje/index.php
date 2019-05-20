<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add", "Nuevo", "class='plata'"); ?>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>OBJETO</th>
            <th>left</th>
            <th>right</th>
            <th>down</th>
            <th>up</th>
            <th>stop</th>
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
            <td><?php echo $info["objeto"]["nombre"]; ?></td>
            <td><?php echo $info["left"]["texto"]; ?></td>
            <td><?php echo $info["right"]["texto"]; ?></td>
            <td><?php echo $info["down"]["texto"]; ?></td>
            <td><?php echo $info["up"]["texto"]; ?></td>
            <td><?php echo $info["stop"]["texto"]; ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
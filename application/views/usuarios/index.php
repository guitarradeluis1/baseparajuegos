<div id="body">
    <table>
        <tr>
            <th>ID</th>
            <th>CORREO/USUARIO</th>
            <th>NOMBRE</th>
            <th>APELLIDO</th>
            <th>ACTIVO</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info->id, "Editar ".$info->id, "class='plata'"); ?></td>
            <td><?php echo anchor($controlador."/vista/".$info->id, $info->correo); ?></td>
            <td><?php echo $info->nombre; ?></td>
            <td><?php echo $info->apellido; ?></td>
            <td><?php echo $info->activo; ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
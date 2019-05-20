<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add", "Nuevo", "class='plata'"); ?>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>ARCHIVO</th>
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
            <td><?php echo $info["archivo"]; ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
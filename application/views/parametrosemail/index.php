<table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>ATRIBUTO</th>
        </tr>
    <?php
    if($Parametros)
    {
        foreach ($Parametros as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info["id"], $info["id"], "class='plata'"); ?></td>
            <td><?php echo anchor($controlador."/edit/".$info["id"], $info["nombre"]); ?></td>
            <td><?php echo $info["atributo"]; ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
<?php
#echo "<pre>"; print_r($Parametros); echo "</pre>";
?>
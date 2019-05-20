<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor($controlador."/", "Atras", "class='plata'"); ?>
    <?php echo anchor($controlador."/addObjeto/".$id, "Nuevo Objeto", "class='plata'"); ?>
    <span><b><?php echo $Enemigo['nombre'] ?></b></span>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>EDITAR</th>
            <th>ELIMINAR</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo $info["id"]; ?></td>
            <td><?php echo $info["arma"]['nombre']; ?></td>
            <td><?php echo anchor($controlador."/editObjeto/".$info["id"], "Editar", "class='plata'"); ?></td>
            <td><?php echo anchor($controlador."/deleteObjeto/".$info["id"]."/".$id, "Eliminar", "class='plata'"); ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php 
#echo "<pre>"; print_r($Salida); echo "</pre>";
#echo "<pre>"; print_r($Enemigo); echo "</pre>";
?>
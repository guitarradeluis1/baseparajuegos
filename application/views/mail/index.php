<div id="body">
    <?php
    echo anchor("campanas/vista/".$campanas_id, "Atras", "class='plata'");
    echo anchor($controlador."/add/".$campanas_id, "Nuevo e-mail.", "class='plata'");
    ?>
    <table align="center">
    <table>
        <tr>
            <th>ID</th>
            <th>REFERENTE</th>
            <th>E-MAIL</th>
            <th>ULTIMO CAMBIO</th>
            <th>USUARIO</th>
        </tr>
    <?php
    if($mails)
    {
        foreach ($mails as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info["id"], $info["id"]); ?></td>
            <td><?php echo anchor($controlador."/edit/".$info["id"], $info["referente"]); ?>
            <td><?php echo $info["email"]; ?></td>
            <td><?php echo $info["cambio"]; ?></td>
            <td><?php echo $info["usuario"]["nombre"]." ".$info["usuario"]["apellido"]; ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($mails); echo "</pre>"; ?>
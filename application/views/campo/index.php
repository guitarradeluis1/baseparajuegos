<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add/".$Mapa["id"], "Nuevo", "class='plata'"); ?>
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Mapa["nombre"]; ?></label>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>FONDO</th>
            <th>ARRIBA</th>
            <th>ABAJO</th>
            <th>DERECHA</th>
            <th>IZQUIERDA</th>
            <th>USUARIO</th>
            <th>Objetos</th>
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
            <td><?php echo $info["fondo_dibu"]["texto"]; ?></td>
            <td><?php echo $info["limite_arriba_dibujo_dibu"]["texto"]; ?></td>
            <td><?php echo $info["limite_abajo_dibujo_dibu"]["texto"]; ?></td>
            <td><?php echo $info["limite_derecha_dibujo_dibu"]["texto"]; ?></td>
            <td><?php echo $info["limite_izquierda_dibujo_dibu"]["texto"]; ?></td>
            <td><?php if($info["usuarios_id"]==0){echo "libre";}else{echo $info["usuarios"];} ?></td>
            <td><?php echo anchor("campodibujo/index/".$info["id"], "Objetos", "class='plata'"); ?></td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php
    #echo "<pre>"; print_r($Salida); echo "</pre>";
?>
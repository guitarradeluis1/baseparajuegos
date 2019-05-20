<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("ingreso", "Inicio", "class='plata'"); ?>
    <?php echo anchor($controlador."/add", "Nuevo", "class='plata'"); ?>
    <hr />
    <table>
        <tr>
            <th>ID</th>
            <th>NOMBRE</th>
            <th>Dibujo</th>
            <th>DAÑO</th>
            <th>FUNCION</th>
            <th>DEFENSA</th>
            <th>FUERZA</th>
            <th>PUNTERIA</th>
            <th>VELOCIDAD</th>
        </tr>
    <?php
    if($Salida)
    {
        foreach ($Salida as $info) 
        {
        ?>
        <tr>
            <td><?php echo anchor($controlador."/edit/".$info["id"], "Editar ".$info["id"], "class='plata'"); ?></td>
            <td><?php echo $info["nombre"]; ?></td>
            <td><?php echo $info["dibujo"]["texto"]." (".$info["objeto"]["nombre"].")"; ?></td>
            <td><?php echo $info["dano_min"]." - ". $info["dano_max"]; ?></td>
            <td><?php if(isset($info["funciones"]["nombre"])){echo $info["funciones"]["nombre"]."()";} ?></td>
            <td><?php echo $info["defensa"]; ?> Def</td>
            <td><?php echo $info["fuerza"]; ?> Fue</td>
            <td><?php echo $info["punteria"]; ?> Pun</td>
            <td><?php echo $info["velocidad"]; ?> Vel</td>
        </tr>
        <?php
        }
    }
    ?>
    </table>
</div>
<?php #echo "<pre>"; print_r($Salida); echo "</pre>"; ?>
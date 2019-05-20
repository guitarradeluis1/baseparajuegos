<?php
if($session["tipousuario_id"] == 1)
{
    echo anchor("/funciones/index", "funciones", "class='plata'");
    echo anchor("/enemigo/index", "Enemigos", "class='plata'");
    echo anchor("/ia/index", "IA", "class='plata'");
    echo anchor("/objeto/index", "Obejto", "class='plata'");
    echo anchor("/personaje/index", "Personajes", "class='plata'");
    echo anchor("/arma/index", "Armas", "class='plata'");
    echo anchor("/mapa/index", "Mapa", "class='plata'");
    #echo anchor("/campoobjeto/index", "Campo Objeto", "class='plata'");
    echo "<hr />";
}
?>
<?php
	echo anchor("/usuarios/edit/", "Editar perfil", "class='plata'");
    if($session["personaje_id"] == 0)
    {
        echo anchor("/usuarios/escojer_personaje/", "Comenzar juego.", "class='plata'");
    }
    else
    {
        echo anchor("/ingreso/mundo/1", "Entrar", "class='plata'");
    }
    $img_perfil = "";
    if($session["img_perfil"] == "")
    {$img_perfil = "na.png";}
?>
<hr />
<table>
    <tr>
        <td rowspan="2"><img src="<?php echo base_url('fotos/'.$img_perfil);?>" /></td>
        <td>Usuario :<b><?php echo $session["nombre"]; ?></b></td>
        <td>E-mail :<b><?php echo $session["email"]; ?></b></td>
    </tr>
    <tr>
        <td>Pais: <b><?php echo $Pais["nombre"]." (".$Pais["iso"].")"; ?></b></td>
        <td>Fecha nacimiento: <b><?php echo $session["fecha_nacimento"]; ?></b></td>
    </tr>
</table>
<hr />
<b>Datos Jugador <?php echo $session["nombre"]; ?></a></b>
<hr />
<table>
    <tr>
        <td>Vida: <b><?php echo $session["vida"]; ?></b></td>
        <td>Velocidad: <b><?php echo $session["velocidad"]; ?></b></td>
    </tr>
    <tr>
        <td>Nivel: <b><?php echo $session["nivel"]; ?></b></td>
        <td>Fuerza: <b><?php echo $session["fuerza"]; ?></b></td>
    </tr>
    <tr>
        <td>Punteria: <b><?php echo $session["punteria"]; ?></b></td>
        <td>Defensa: <b><?php echo $session["defensa"]; ?></b></td>
    </tr>
</table>
<?php
	#echo "<pre>"; print_r($session); echo "</echo>";
    #echo "<pre>"; print_r($Pais); echo "</echo>";
?>
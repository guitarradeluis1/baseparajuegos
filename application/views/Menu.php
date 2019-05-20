<!--
<table align="center">
    <tr>
        <td><?php /*echo anchor("usuarios/index", "usuarios", "class='link_azul'"); ?></td>
        <td><?php echo anchor("campanas/index", "Campa&nacute;as", "class='link_azul'"); ?></td>
        <?php #echo anchor("listas/index", "Listas", "class='link_azul'"); ?>
        <td><?php echo anchor("orden_listas/index", "Listas orden", "class='link_azul'"); ?></td>
        <td><?php echo anchor("tickets/index", "Tickets", "class='link_azul'"); ?></td>
        <td><?php echo anchor("reportes/index", "Reportes", "class='link_azul'"); ?></td>
    </tr>
    <tr>
        <td><?php echo anchor($controlador."/add", "Nueva", "class='link_verde'"); ?></td>
        <td><?php echo anchor($controlador."/index", "Lista", "class='link_verde'");*/ ?></td>
    </tr>
</table>
-->
<nav>
    <ul class="menu">
        <!--li><?php #echo anchor("/ingreso/index", "Inicio", ""); ?></li-->
        <li><a href="#">Usuarios</a>
            <ul>
                <li><?php echo anchor("usuarios/index", "Listado", ""); ?></li>
                <li><?php echo anchor("usuarios/add", "Nuevo usuario", ""); ?></li>
                <li><?php echo anchor("parametrosemail/index", "Parametros E-mail", ""); ?></li>
            </ul>
        </li>
        <li><a href="#">Campa&ntilde;as</a>
            <ul>    
                <li><?php echo anchor("campanas/index", "Listado", ""); ?></li>
                <li><?php echo anchor("campanas/add", "Nueva campa&ntilde;a", ""); ?></li>
            </ul>
        </li>
        <li><a href="#">Listas</a>
            <ul>    
                <li><?php echo anchor("orden_listas/index", "Listado por grupos", ""); ?></li>
                <li><?php echo anchor("orden_listas/add", "Nuevo grupo", ""); ?></li>
                <li><?php echo anchor("listas/add", "Nueva lista", ""); ?></li>
                <li><?php echo anchor("listas/index", "Listado completo", ""); ?></li>
            </ul>
        </li>
        <li><a href="#">Tickets</a>
            <ul>    
                <li><?php echo anchor("tickets/index", "Listado", ""); ?></li>
            </ul>
        </li>
        <li><a href="#">Agendamientos</a>
            <ul>    
                <li><?php echo anchor("pibotes/index", "Bases de agendamiento", ""); ?></li>
                <li><?php echo anchor("pibotes/add", "Nueva base de agendamiento", ""); ?></li>
                <li><?php echo anchor("agendamientotipo/index", "Tipo de agendamiento", ""); ?></li>
            </ul>
        </li>
        <li><a href="#">Reportes</a>
            <ul>    
                <li><?php echo anchor("reportes/index", "Listado", ""); ?></li>
                <li><?php echo anchor("reportes/add", "Campa&ntilde;as", ""); ?></li>
                <li><?php echo anchor("reportes/campanaunicasaiente", "Campa&ntilde;as saliente 1 (Registro unico)", ""); ?></li>
                <li><?php echo anchor("reportes/campanaunicasaiente2", "Campa&ntilde;as saliente 2 (Registro unico)", ""); ?></li>
                <li><?php echo anchor("reportes/agendamiento", "Agendamiento", ""); ?></li>
            </ul>
        </li>
    </ul>
<div class="clearfix"></div>
</nav>
<br />
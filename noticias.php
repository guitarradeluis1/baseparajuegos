<?php
include('coneccion.php');
$link=conectar();
#________________________________________________________________________
$fecha = date("Y-m-d");
$sql = "select * from noticias where fecha = '".$fecha."' and roles_id = 17";
$resultado = mysql_query($sql, $link);
$inicio = "conectado.";
if (!$resultado)
{
    $inicio = "Error de BD, no se pudo consultar la base de datos.";
}
$cadena = "";
while ($fila = mysql_fetch_assoc($resultado))
{
    $cadena = $cadena.$fila['textos']."#";
}

echo $_GET['callback'] . "(". "{".
    "inicio : '".$inicio."',".
    "datos : '".$cadena."'".
        " } )";
#_________________________________________________________________
?>
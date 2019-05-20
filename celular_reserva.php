<?php
$inicio = $_GET["inicio"];
$sedes_id = $_GET["sede"];

if( strlen($inicio) == 9)
{
    $fecha_corte = explode("-", $inicio);
    $inicio = $fecha_corte[0]."-0".$fecha_corte[1]."-".$fecha_corte[2];
}

include('coneccion.php');
$link=conectar();

#________________________________________________________________________

$sql = "select * from reservas 
where inicio = '".$inicio."' and sedes_id = ".$sedes_id;#
$resultado = mysql_query($sql, $link);
$inicio = "conectado.";
if (!$resultado)
{
    $inicio = "Error de BD, no se pudo consultar la base de datos.";
}

$oficinas = array();
$ante = array();
$cadena = "";
$K=0;
while ($fila = mysql_fetch_assoc($resultado))
{
    $oficinas[$K]["id"] = $fila['oficinas_id'];
    #........................................
    $sqlo = "select * from oficinas where id = ".$fila['oficinas_id']."";#
    $resultado_oficina = mysql_query($sqlo, $link);
        while ($salidao = mysql_fetch_assoc($resultado_oficina))
        {$oficinas[$K]["nombre"]=$salidao["nombre"];}
    $K = $K + 1;
}

#echo "<pre>"; print_r($oficinas); echo "</pre>";
foreach($oficinas as $key => $value)
{
    $ante[] = $cadena.$value["id"].":".$value["nombre"].";";
}
$ante = array_unique($ante);
#echo "<pre>"; print_r($ante); echo "</pre>";
foreach($ante as $key => $value)
{
    $cadena = $cadena.$value."";
}
#mysql_free_result($resultado);

echo $_GET['callback'] . "(". "{".
    "inicio : '".$inicio."',".
    "datos : '".$cadena."'".
        " } )";
#_________________________________________________________________
?>
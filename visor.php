<?php
$inicio = $_GET["inicio"];
$oficinas = $_GET["oficinas"];

if( strlen($inicio) == 9)
{
    $fecha_corte = explode("-", $inicio);
    $inicio = $fecha_corte[0]."-0".$fecha_corte[1]."-".$fecha_corte[2];
}

include('coneccion.php');
$link=conectar();

#________________________________________________________________________

$sql = "select reservas.*, empresas.razon_social as razon_social  from reservas 
inner join contratos on contratos.id = reservas.contratos_id
inner join cotizaciones on cotizaciones.id = contratos.cotizaciones_id
inner join empresas on empresas.id = cotizaciones.empresas_id
where reservatiempos_id = 3 and inicio = '".$inicio."' and oficinas_id = ".$oficinas." ".
"ORDER BY reservas.hora DESC";#
$resultado = mysql_query($sql, $link);
$inicio = "conectado.";
if (!$resultado)
{
    $inicio = "Error de BD, no se pudo consultar la base de datos.";
}

$reservas = array();
$cadena = "";
$K = 0;
while ($fila = mysql_fetch_assoc($resultado))
{
        $hasta_hora = strtotime ( '+'.$fila["tiempo"].' hours ' , strtotime($fila["hora"]) ); //+30 minutos
        $hasta_hora = date("h:i:s A", $hasta_hora );
    $reservas[$K] = $fila['titulo']." (".$fila['hora'].");<b>inicio:</b> ".$fila['hora']."|<b>Fin:</b> ".$hasta_hora;
    $reservas[$K] = $reservas[$K]."|<b>Tiempo:</b> ".$fila['tiempo']." hora";
    $reservas[$K] = $reservas[$K]."|<b>Empresa:</b> ".$fila['razon_social']." ";
    $reservas[$K] = $reservas[$K]."|<b>Puestos:</b> ".$fila['npuestos']."|<b>Observacion:</b> ".$fila['observacion']."#";
    #$reservas[$K] = $reservas[$K]."|Puestos:".$fila['npuestos']."|Observacion:".$fila['observacion'];
    $K = $K + 1;
}

#echo "<pre>"; print_r($reservas); echo "</pre>";
$cadena = "";
foreach($reservas as $reserva)
{
    $cadena = $cadena."".utf8_encode($reserva);
}

echo $_GET['callback'] . "(". "{".
    "inicio : '".$inicio."',".
    "datos : '".$cadena."'".
        " } )";
#_________________________________________________________________
?>
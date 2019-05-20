<?php
$sedes_id = $_GET["sedes_id"];
$tipo = $_GET["tipo"];
include('coneccion.php');
$link=conectar();

    #________________________________________________________________________
    $sql = "select oficinas.*
    from oficinas
    where oficinas.sedes_id = ".$sedes_id." ".
    "ORDER BY oficinas.nombre ASC";#DESC
    $resultado = mysql_query($sql, $link);
    $inicio = "conectado.";
    if (!$resultado)
    {
        $inicio = "Error de BD, no se pudo consultar la base de datos.";
    }
    #________________________________________________________________________
    $reservas = array();
    $cadena = "";
    $K = 0;
    while ($fila = mysql_fetch_assoc($resultado))
    {
        $reservas[$K] = $fila['id'].";".$fila['nombre']; #";
        $reservas[$K] .= ";<b>Puestos:</b>".$fila['puestos'];
        $reservas[$K] .= "|<b>Mesas de reunion:</b>".$fila['mesas_reunion'];
        $reservas[$K] .= "|<b>Escritorio:</b>".$fila['escritorio'];
        $reservas[$K] .= "|<b>Silla secretarial:</b>".$fila['silla_secretarial'];
        $reservas[$K] .= "|<b>Silla interlocutora:</b>".$fila['silla_interlocutora'];
        $reservas[$K] .= "|<b>Silla gerencial:</b>".$fila['silla_gerencial'];
        $reservas[$K] .= "|<b>Televisor:</b>".$fila['televisor'];
        $reservas[$K] .= "|<b>Teatro:</b>".$fila['teatro'];
        $reservas[$K] .= "|<b>Video beam:</b>".$fila['video_beam'];
        $reservas[$K] .= "|<b>Tablero:</b>".$fila['tablero'];
        $reservas[$K] .= "<br /><b>Caja reservas:</b>".$fila['caja_reservas'];
        $reservas[$K] .= "#";
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
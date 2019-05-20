<?php
$oficinas_id = $_GET["oficinas_id"];
include('coneccion.php');
$link=conectar();

    #________________________________________________________________________
    $sql = "select oficinas.*
    from oficinas
    where oficinas.id = ".$oficinas_id." ".
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
        $reservas[$K] .= ";puestos:".$fila['puestos'];
        $reservas[$K] .= "|mesas_reunion:".$fila['mesas_reunion'];
        $reservas[$K] .= "|escritorio:".$fila['escritorio'];
        $reservas[$K] .= "|silla_secretarial:".$fila['silla_secretarial'];
        $reservas[$K] .= "|silla_interlocutora:".$fila['silla_interlocutora'];
        $reservas[$K] .= "|silla_gerencial:".$fila['silla_gerencial'];
        $reservas[$K] .= "|televisor:".$fila['televisor'];
        $reservas[$K] .= "|teatro:".$fila['teatro'];
        $reservas[$K] .= "|video_beam:".$fila['video_beam'];
        $reservas[$K] .= "|tablero:".$fila['tablero'];
        $reservas[$K] .= "|caja_reservas:".$fila['caja_reservas'];
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
<?php
$puestos = $_GET["puestos"];
$oficinas_id = $_GET["oficinas_id"];
$mesas_reunion = $_GET["mesas_reunion"];
$escritorio = $_GET["escritorio"];
$silla_secretarial = $_GET["silla_secretarial"];
$silla_interlocutora = $_GET["silla_interlocutora"];
$silla_gerencial = $_GET["silla_gerencial"];
$televisor = $_GET["televisor"];
$teatro = $_GET["teatro"];
$video_beam = $_GET["video_beam"];
$tablero = $_GET["tablero"];
$caja_reservas = $_GET["caja_reservas"];

include('coneccion.php');
$link=conectar();

    #________________________________________________________________________
    $sql = "UPDATE oficinas 
    SET 
    puestos = ".$puestos.",
    mesas_reunion = ".$mesas_reunion.",
    escritorio = ".$escritorio.",
    silla_secretarial = ".$silla_secretarial.",
    silla_interlocutora = ".$silla_interlocutora.",
    silla_gerencial = ".$silla_gerencial.",
    televisor = ".$televisor.",
    teatro = ".$teatro.",
    video_beam = ".$video_beam.",
    tablero = ".$tablero.",
    caja_reservas = ".$caja_reservas." 
     WHERE id = ".$oficinas_id."";#DESC
     
    $inicio = "id: ".$oficinas_id;
    if (mysql_query($sql, $link) === TRUE) {
    $cadena =  "Registro actualizado";
    } else {
        $cadena = "Error de BD.";
    }
    #________________________________________________________________________

    echo $_GET['callback'] . "(". "{".
        "inicio : '".$inicio."',".
        "datos : '".$cadena."'".
            " } )";
?>
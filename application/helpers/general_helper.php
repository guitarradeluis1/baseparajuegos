<?php
//__________________________________________________________________________________
function img($src = null, $estilo = null, $idcampo = null, $valor = null ) 
{
    $img = "<img src='".base_url()."".$src."' ";
    if($estilo!="")
    { $img .= " class = '".$estilo."' "; }
    if($idcampo!="")
    { $img .= " id = '".$idcampo."' "; }
    if($valor!="")
    { $img .= " valor = '".$valor."' "; }
    $img .= "' />";
    return $img;
}
//__________________________________________________________________________________
function campos_session()
{
    $datos = array
    (
        'id',
        'tipousuario_id',
        'paises_id',
        'personaje_id',
        'arma1',
        'arma2',
        'email',
        //'pass',
        'nombre',
        'fecha_nacimento',
        'creado',
        'ultima_entrada',
        'img_jugador',
        'img_perfil',
        'vida',
        'nivel',
        'defensa',
        'fuerza',
        'punteria',
        'velocidad',
    );
    return $datos;
}
//__________________________________________________________________________________
function creador_selector($nombre, $Opciones, $otro)
{
    $selec = '';
    $selec .= '<select size="1" name = "'.$nombre.'" id = "'.$nombre.'" '.$otro.'>';
    #$selec .= '<option value=""></option>';
    foreach($Opciones as $key => $Opcione)
    {
        #echo "<pre>"; print_r($Opcione); echo "</pre>"; exit;
        $selec .= '<option value="'.$key.'">'.$Opcione.'</option>';
    }
    $selec .= '</select>';
    return $selec;
}
//__________________________________________________________________________________
function creador_selector_si($nombre, $otro)
{
    $selec = '';
    $selec .= '<select size="1" name = "'.$nombre.'" id = "'.$nombre.'" '.$otro.'>';
        $selec .= '<option value="0">NO</option>';
        $selec .= '<option value="1">SI</option>';
    $selec .= '</select>';
    return $selec;
}
//__________________________________________________________________________________
function texto_si($numero)
{
    $selec = "";
    if($numero == 0)
    {
        $selec = "NO";
    }
    else if($numero == 1)
    {
        $selec = "SI";
    }
    return $selec;
}
//__________________________________________________________________________________
function creador_textbox($nombre, $cols, $rows, $maxlength, $value = null)
{
    $selec = '';
    $selec .= '<textarea name = "'.$nombre.'" id = "'.$nombre.'" ';
    $selec .= 'cols="'.$cols.'" rows="'.$rows.'" maxlength="'.$maxlength.'">'.$value.'</textarea>';
    return $selec;
}
//__________________________________________________________________________________
function suma_tiempos($time1, $time2)
{
    #............................................
    list($hour1, $min1, $sec1) = parteHora($time1);
    #............................................
    list($hour2, $min2, $sec2) = parteHora($time2);
    #............................................
    $salida = date('H:i:s', mktime( $hour1 + $hour2, $min1 + $min2, $sec1 + $sec2));
    $salida = strtotime($salida );
    return date("h:i a", $salida);
}
function parteHora( $hora )
{
    $horaSplit = explode(":", $hora);
    if( count($horaSplit) < 3 )
    {
        $horaSplit[2] = 0;
    }
    return $horaSplit;
}
//__________________________________________________________________________________
?>
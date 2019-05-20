<?php
	include('coneccion.php');
    $link=conectar();
    $Mensaje = $_REQUEST["con"];
    $M = explode(":", $Mensaje);
    #echo "<pre>"; print_r($M); echo "</pre>";
    $contrato = $M[3]-5;
    $nombre_host = gethostbyaddr($_SERVER['REMOTE_ADDR']);
    
    $estadoaceptaciones_id = 3;
    $comentarioscalidad = "Aprobado por el cliente vía Web";
    $firmadigitalcliente = "<br>||FECHA[ ".date('Y-m-d H:m:i'). "]||IP[".$_SERVER['REMOTE_ADDR']."]<br>||USERDATA[".ObtenerNavegador($_SERVER['HTTP_USER_AGENT'])."]<br>||HOST[".$nombre_host."]||<br>Otros[".$_SERVER['HTTP_USER_AGENT']."]";
    #$firmadigitalcliente = "FIRMA DIGITAL CLIENTE<br>||FECHA[" . date('Y-m-d H:m:i') . "]||<br>||USERDATA[" . $_SERVER["HTTP_USER_AGENT"] . "]<br>||HOST[" . $nombre_host . "]||";
    $sql="UPDATE contratos Set
    estadoaceptaciones_id = ".$estadoaceptaciones_id.",
    comentarioscalidad='".$comentarioscalidad."',
    firmadigitalcliente='".$firmadigitalcliente."'
    WHERE
    codigocontrato=".$contrato."";
    mysql_query($sql,$link) or die ("Error de carga de datos.<br/>");
?>
<div id="mensaje_arriba">
<?php
	echo utf8_encode("Aprobación del contrato exitosa por favor verifica los datos 
    faltantes para terminar la activación correcta del contrato.");
?>
</div>
<?php
function ObtenerNavegador($user_agent) {
     $navegadores = array(
          'Opera' => 'Opera',
          'Mozilla Firefox'=> '(Firebird)|(Firefox)',
          'Galeon' => 'Galeon',
          'Chome'=>'Gecko',
          'MyIE'=>'MyIE',
          'Lynx' => 'Lynx',
          'Netscape' => '(Mozilla/4\.75)|(Netscape6)|(Mozilla/4\.08)|(Mozilla/4\.5)|(Mozilla/4\.6)|(Mozilla/4\.79)',
          'Konqueror'=>'Konqueror',
          'Internet Explorer 7' => '(MSIE 7\.[0-9]+)',
          'Internet Explorer 6' => '(MSIE 6\.[0-9]+)',
          'Internet Explorer 5' => '(MSIE 5\.[0-9]+)',
          'Internet Explorer 4' => '(MSIE 4\.[0-9]+)',
);
foreach($navegadores as $navegador=>$pattern){
       if (eregi($pattern, $user_agent))
       return $navegador;
    }
return 'Desconocido';
}
?>
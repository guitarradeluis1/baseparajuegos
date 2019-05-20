<?php
function conectar()
{

$host='localhost';  $user='root'; $pass='Pr1m3H0ld1ngS3rv1c3'; $bd_name='erpprime_dbprime1';
#$host='mysql.nixiweb.com';  $user='u432595208_sex'; $pass='12122010'; $bd_name='u432595208_sex';


$link=mysql_connect($host,$user,$pass)or die
("Error al conectar la base de datos..");
mysql_select_db($bd_name,$link)or die
("Error al selecionar la base de datos");
return $link;
} 
?>

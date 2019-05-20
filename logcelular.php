<?php
$usuario = $_GET["usuario"];
$pass = $_GET["password"];

if($usuario==""  || $pass=="")
{
    $inicio = "Error de BD, no se pudo consultar la base de datos.";
}
else
{
    # echo $pass = md5 ( $pass  );
    include('coneccion.php');
    $link=conectar();
    
    $sql = "select * from users where username = '".$usuario."' and celular = '".$pass."'";#
    $resultado = mysql_query($sql, $link);
    $inicio = "conectado.";
    if (!$resultado)
    {
        $inicio = "Error de BD, no se pudo consultar la base de datos.";
    }
    
    $id = 0;
    $passusuario = "";
    $input_usuario = "";
    while ($fila = mysql_fetch_assoc($resultado)) 
    {
        $id = $fila['id'];
        $input_usuario = $fila['username'];
        $passusuario = $fila['celular'];
    }
    #mysql_free_result($resultado);
}
echo $_GET['callback'] . "(". "{".
    "inicio : '".$inicio."',".
    "id : ".$id.",".
    "usuario : '".$input_usuario."',".
    "otro : '1:13;3:2;1:2'".
        " } )";
?>
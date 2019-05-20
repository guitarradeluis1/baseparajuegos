<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<title>Frameindi 0.1</title>
    <meta name="author" content="Luis Eduardo Bernal Suarez - guitarradeluis@gmail.com" />
    <link rel="shortcut icon" href="img/favicon.ico" /> 
</head>
<link href="<?php echo base_url('css/menu.css');?>" media="screen" rel="stylesheet" type="text/css" />
<style>
::selection{ background-color: #E13300; color: white; }
::moz-selection{ background-color: #E13300; color: white; }
::webkit-selection{ background-color: #E13300; color: white; }

	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	a {
	    cursor: hand;
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body{
		margin: 0 15px 0 15px;
	}
	
	p.footer{
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	
	#container{
		margin: 10px;
		border: 1px solid #D0D0D0;
		-webkit-box-shadow: 0 0 8px #D0D0D0;
	}
    .label_rojo
    {
        color: red;
    }
    .label_verde
    {
        color: #00CC00
    }
    .titulo_centrado
    {
        text-align: center;
        font-size: 200%;
        font-weight: bold;
    }
/*___________________________________________________________________________________*/
/*  ^^   */
.elementosdelmenu
{
	display:block ;
}
.elementosmenucontraido
{
	display:none;
}
/*  ^^   */
/*___________________________________________________________________________________*/
/* verde = #5FB404 74DF00 azul = #2862ac */
.Mensaje_alerta{
    background-color: #2862ac;
    color: white;
    margin: 10px;
	border: 1px solid #D0D0D0;
	-webkit-box-shadow: 0 0 8px #D0D0D0;
}
/*___________________________________________________________________________________*/
/** enlace o link **/
.link_verde
{
    text-align: center;
    font-weight: bolder;  
    text-decoration:none;
    width: 60px;
    color: #fff;
    background-color: #5FB404;
    position: relative;
    display: block;
    padding: 10px 10px;
    border-radius: 4px;
}
.link_azul
{
    text-align: center;
    font-weight: bolder;  
    text-decoration:none;
    width: 60px;
    color: #fff;
    background-color: #2862ac;
    position: relative;
    display: block;
    padding: 10px 10px;
    border-radius: 4px;
}
.link_verde_largo
{
    text-align: center;
    font-weight: bolder;  
    text-decoration:none;
    width: 200px;
    color: #fff;
    background-color: #5FB404;
    position: relative;
    display: block;
    padding: 10px 10px;
    border-radius: 4px;
}
.link_azul_largo
{
    text-align: center;
    font-weight: bolder;  
    text-decoration:none;
    width: 220px;
    color: #fff;
    background-color: #2862ac;
    position: relative;
    display: block;
    padding: 10px 10px;
    border-radius: 4px;
}
/*___________________________________________________________________________________*/
.plata { /* clase general */
  border: 1px solid #dedede;
  border-radius: 3px;
  color: #555;
  display: inline-block;
  font: bold 12px/12px HelveticaNeue, Arial;
  padding: 8px 11px;
  text-decoration: none;
  cursor:pointer; cursor: hand;
}

.plata.white{
  background: #f5f5f5;
  border-color: #dedede #d8d8d8 #d3d3d3;
  box-shadow: 0 1px 1px #eaeaea, inset 0 1px 0 #fbfbfb;
  color: #555;
  text-shadow: 0 1px 0 #fff;
  background: -moz-linear-gradient(top,  #f9f9f9, #f0f0f0);
  background: -webkit-linear-gradient(top,  #f9f9f9, #f0f0f0);
  background: o-linear-gradient(top,  #f9f9f9, #f0f0f0);
  background: ms-linear-gradient(top,  #f9f9f9, #f0f0f0);
  background: linear-gradient(top,  #f9f9f9, #f0f0f0);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#f0f0f0');
}
.plata:hover {
	background: #f4f4f4;
    border-color: #c7c7c7 #c3c3c3 #bebebe;
    box-shadow: 0 1px 1px #ebebeb, inset 0 1px 0 #f3f3f3;
    text-shadow: 0 1px 0 #fdfdfd;
    background: -moz-linear-gradient(top,  #efefef, #f8f8f8);
    background: -webkit-linear-gradient(top,  #efefef, #f8f8f8);
    background: -o-linear-gradient(top,  #efefef, #f8f8f8);
    background: -ms-linear-gradient(top,  #efefef, #f8f8f8);
    background: linear-gradient(top,  #efefef, #f8f8f8);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#efefef', endColorstr='#f8f8f8');
}
/*___________________________________________________________________________________*/
/** Tables **/
table {
    border-right:0;
    clear: both;
    color: #333;
    margin-bottom: 10px;
    width: 100%;
    text-align:center;
}
th {
    border:0;
    border-bottom:1px solid #CCC;
    text-align: left;
    padding:2px;
}
th a {
    cursor: hand;
    display: block;
    padding: 2px 4px;
    text-decoration: none;
}
th a.asc:after {
    content: ' ?';
}
th a.desc:after {
    content: ' ?';
}

table tr td {
    text-align: left;
    vertical-align: top;
    padding: 5px;
}

.tablespc {
    text-align: center;
    vertical-align: top;
    padding: 5px;
}
table tr:nth-child(even) {
    background: #f0f0f0;
}
td.actions {
    text-align: center;
    white-space: nowrap;
}
table td.actions a {
    margin: 0px 6px;
    padding:2px 5px;
}
.titulo_tabla
{
    font-weight: bold;
    font-family: sans-serif;
    font-style: normal;
    background-color: #A4A4A4;
	border: 1px solid #D0D0D0;
	color: #F2F2F2;
}
/*___________________________________________________________________________________*/
/*imagnes*/
img.icono{
  width: 20px; height: 20px;
}
img.pequeña_boton{
  width: 55px; height: 55px;
}
img.pequeña{
  width: 50px; height: 50px;
}
img.mediana{
  width: 100px; height: 100px;
}
img.grande{
  width: 200px; height: 200px;
}
/*___________________________________________________________________________________*/
</style>
<!--script type="text/javascript" src="http://erp.primeholdingservice.com/clientes/application/libraries/jquery-1.7.min.js"></script-->
<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<!--script src="<?php #echo base_url('js/phaser.min.js');?>"></script--> 
<div id="container">
	<h1><?php
    if($controlador == "welcome")
    {
        echo img('img/logogamer.png', 'mediana')." ".strtoupper("Frameindi");
        echo "&nbsp;&nbsp;";
    }
    else if($controlador != "welcome")
    {
        echo img('img/logogamer.png', 'peque�a')." ".strtoupper($controlador);
        echo "&nbsp;&nbsp;";
        #echo " ".anchor("/ingreso/index", "Campa&ntilde;as", "class='plata'");
        echo " ".anchor("/welcome/salir", "Salir", "class='plata'");
    }
    ?></h1>
<?php
echo $Mensaje_alerta;
if($Mensaje_alerta != "")
{
?>
    <div class="Mensaje_alerta">&nbsp;<b><?php echo $Mensaje_alerta; ?></b>&nbsp;</div>
<?php
}
?>
<script>
var navegador = navigator.userAgent;
if (navigator.userAgent.indexOf('Chrome') !=-1)
{
    //document.write('est� usando Google Chrome ...');
}
else
{
    document.write('<label class="label_rojo">Se recomienda utilizar Google Chrome.</label><br />');
    document.write("<?php echo img('img/chome.png', 'pequeña'); ?>");
}
/*
  if (navigator.userAgent.indexOf('MSIE') !=-1) 
  {//document.write('est� usando Internet Explorer ...');}
  else if (navigator.userAgent.indexOf('Firefox') !=-1)
  {//document.write('est� usando Firefox ...');}
  else if (navigator.userAgent.indexOf('Chrome') !=-1)
  {//document.write('est� usando Google Chrome ...');}
  else if (navigator.userAgent.indexOf('Opera') !=-1)
  {//document.write('est� usando Opera ...');}
  else
  {//document.write('est� usando un navegador no identificado ...');}
*/
</script>
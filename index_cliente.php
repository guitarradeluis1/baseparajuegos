<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Prime Holding</title>
    <link href="img/minologo.ico" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="css/bootstrap.css" media="all" />
    <link rel="stylesheet" href="css/bootstrap-responsive.css" media="all" />
    <link rel="stylesheet" href="estilogeneral.css" media="all" />
    <script type="text/javascript" src="jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="./shadowbox-3.0.3/shadowbox.css" />
    <script type="text/javascript" src="./shadowbox-3.0.3/shadowbox.js"></script>
    <script src="jquery.numeric.js"></script>
    <script>
        Shadowbox.init({
    // let's skip the automatic setup because we don't have any
    // properly configured link elements on the page
    skipSetup: true
    });
    </script>
     
</head>

<body>
<div id="cuerpo">
    <div class="row">
        <div class="span2">
            <br /><img src="prime_logo.jpg" />
            <ul class="nav nav-tabs nav-stacked">
                <li class=""></li>
                <li></li>
            </ul>
       </div>
       
       <div id="contenido" class="span8">

            <ul class="nav nav-tabs" id="myTab">
              <li class="active"><a href="#uno">Activaci&oacute;n de contrato.</a></li>
            </ul>

            <div class="tab-content">
                <div id="contenidointerno"></div>
            </div>

       </div>
       <br />
    </div>
    <br />
</div>

</body>
</html>
<script>
$(document).ready(function()
{//
    //jQuery("#entrada_edad").numeric();
    //Permite diseñar menus
    $('.dropdown-toggle').dropdown();  
    //Tabs
    $('#myTab a').click(function (e) 
    {
      e.preventDefault();
      $(this).tab('show');
    });
    //$("#baner_prinsipal").load("./entrada/publibuscar/baner_publico.php");
    <?php
    if(isset($_REQUEST["con"]))
    {
        $envio = "./prime.php?con=".$_REQUEST["con"];
    ?>
        $("#contenidointerno").load("<?php echo $envio; ?>");
    <?php 
    }
    ?>   
});

//Objetos y tiendas
//$("#link_dos").click(function(){$("#div_tiendas").load("./entrada/publibuscar/formbusco_publico.php"); });
function muestri(img, cosa)
{
    Shadowbox.open({
        content:    '<div><img src="'+img+'" /></div>',
        player:     "html",
        title:      cosa,
        height:     600,
        width:      600
    });
} 
</script>
<?php echo anchor($controlador."/index/", "Atras", "class='plata'"); ?>
<div id="body">
<br />
<br />
    <form id="formulario" action="<?php echo base_url("index.php/archivo/add/"); ?>" method="POST" enctype="multipart/form-data" >
        <b>Nombre :</b><br /><input type="text" id="nombre" name="nombre" />
        <br />
        <input type="file" name="archivo" multiple="multiple"  /><br /><br />
        <input type="submit" name="submit" value="Upload" class="link_verde_largo" />
    </form>
    <hr />
    <b>Lista de archivos (./archivos/)</b><br />
    <?php
    $directorio = opendir("./archivos/");
    while ($archivo = readdir($directorio))
    {
        if (is_dir($archivo))
        {
            #echo "<br />";
            #echo "[".$archivo."]<br />";
        }
        else
        {
            echo "".$archivo."<br />";
            #echo anchor($controlador."/leer/".$archivo, $archivo, "");
            #echo anchor($controlador."/leer/".$archivo."/".$campanas_id, $archivo, "")."<br />";
        }
    }
    ?>
</div>
<script>
$(document).ready(function()
{
    /*$('#orden').keyup(function (){
    this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
    //_________________________
    $("#titulo_campo").keyup(function (){
    	$(this).val(limitar_palabras($(this).val(),1));
    });*/
});
//**********************************
</script>
<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_mapa_base.js');?>"></script>
<!---------------------------------------------------------------------->
<?php echo anchor("campo/index/".$Salida["mapa_id"], "Atras", "class='plata'"); ?>
<?php echo anchor($controlador."/add_campo_objeto/".$Salida["id"], "Agregar Objeto", "class='plata'"); ?>
<!-------------------------------------------------------------------->
<div id="body">
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Salida["mapa"]["nombre"]; ?></label>
    <hr />
    <?php
    foreach($campo_objeto as $caob)
    {
        ?>
        <button class='plata carga' value="<?php echo $caob["objeto"]["id"]; ?>" ><?php echo $caob["objeto"]["id"]." ".$caob["objeto"]["nombre"]." - ".$caob["campo"]["nombre"]; ?></button>
        <?php
    }
    ?>
    <!----:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::----->
    <hr />
    <?php echo form_open($controlador."/".$funcion."/".$Salida["id"], "id=formulario"); ?>
    <?php echo form_hidden('id', $Salida["id"]); ?>
<table>
    <tr>
        <td>
            <p><b>Nombre : </b><br /> 
            <?php echo form_input(array("name" => "nombre", "id" => "nombre", "placeholder" => "nombre.", "type" => "text", "value" => $Salida["nombre"] )); ?>
            </p>
            <p><b>Cambio : </b><br /> 
            <span><?php echo creador_selector("cambio", 
            array(
                ""=>"NA",
                "fondo"=>"fondo",
                "limite_arriba_dibujo"=>"limite_arriba_dibujo",
                "limite_abajo_dibujo"=>"limite_abajo_dibujo",
                "limite_derecha_dibujo"=>"limite_derecha_dibujo",
                "limite_izquierda_dibujo"=>"limite_izquierda_dibujo"),
             ""); #fondo ?></span>
            </p>
            <p><b>Dibujo : </b><br /> 
            <span id="div_dibujo_id"><?php #echo creador_selector("dibujo_id", $dibujo, ""); ?></span>
            </p>
        </td>
        <td>
            <p><b>Fondo : </b><br /> 
            <span id="div_fondo"><?php echo $Salida["fondo_dibu"]["texto"]; #fondo ?></span>
            </p>
            <p><b>Arriba : </b><br /> 
            <span id="div_limite_arriba_dibujo"><?php echo $Salida["limite_arriba_dibujo_dibu"]["texto"]; #limite_arriba_dibujo ?></span>
            </p>
            <p><b>Abajo : </b><br />
            <span id="div_limite_abajo_dibujo"><?php echo $Salida["limite_abajo_dibujo_dibu"]["texto"]; #limite_abajo_dibujo ?></span>
            </p>
            <p><b>Derecha : </b><br /> 
            <span id="div_limite_derecha_dibujo"><?php echo $Salida["limite_derecha_dibujo_dibu"]["texto"]; #limite_derecha_dibujo ?></span>
            </p>
            <p><b>Izquierda : </b><br /> 
            <span id="div_limite_izquierda_dibujo"><?php echo $Salida["limite_izquierda_dibujo_dibu"]["texto"]; #limite_izquierda_dibujo ?></span>
            </p>
        </td>
        <td>
            <div id="canvas"></div>
        </td>
    </tr>
</table>
    
    <?php echo form_submit("post", "Editar", "class=link_verde"); ?>
    <?php echo form_close(); ?>
</div>
<?php
    #echo "<br /><pre>"; print_r($Salida); echo "</pre>";
    #echo "<hr /><pre>"; print_r($campo_objeto); echo "</pre>";
?>
<script>
$(document).ready(function()
{
     $(".carga").click(function (){carga($(this).val());});
    //-------------------------
    precargas = <?php echo json_encode($campo_objeto); ?>;
    imagenes = <?php echo json_encode($Salida); ?>;
    //console.log(imagenes);
});
//**********************************
//$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//**********************************
function carga(objeto_id)
{
    ajax("../../dibujo/lista/"+objeto_id+"/dibujo_id", "div_dibujo_id");
}
</script>
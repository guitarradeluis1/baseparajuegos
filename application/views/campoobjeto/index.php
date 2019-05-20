<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/funciones.js');?>"></script>
<script src="<?php echo base_url('js/juego/vista_previa_mapa_dibujo.js');?>"></script>
<!---------------------------------------------------------------------->
<?php #echo anchor($controlador."/add/", "Nuevo tipo de agendamiento", "class='plata'"); ?>
<div id="body">
    <?php echo anchor("campo/index/".$Campo["mapa"]["id"], "Atras", "class='plata'"); ?>
    <?php echo anchor($controlador."/add/".$Campo["id"], "Nuevo", "class='plata'"); ?>
    <hr />
    <label class="label_verde titulo_centrado">MAPA: <?php echo $Campo["mapa"]["nombre"]; ?> [<?php echo $Campo["nombre"]; ?>]</label>
    <hr />
<table>
    <tr>
        <td>
            <div id="canvas"></div>
        </td>
    </tr>
    <tr>
        <td>
        <!--:::::::::::::::::::::::::::::::-->
            <table>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>PUC</th>
                </tr>
            <?php
            if($Salida)
            {
                foreach ($Salida as $info) 
                {
                ?>
                <tr>
                    <td><?php echo anchor($controlador."/edit/".$info->id, "Editar", "class='plata'"); ?></td>
                    <td><?php echo $info->nombre; ?></td>
                    <td><?php echo $info->puc; ?></td>
                </tr>
                <?php
                }
            }
            ?>
            </table>
            <!--:::::::::::::::::::::::::::::::-->
        </td>
    </tr>
</table>
</div>
<?php
    #echo "<pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<pre>"; print_r($Campo); echo "</pre>";
    echo "<pre>"; print_r($Salida); echo "</pre>";
?>
<script>
$(document).ready(function()
{
     //$(".carga").click(function (){carga($(this).val());});
    //-------------------------
    precargas = <?php echo json_encode($campo_objeto); ?>;
    imagenes = <?php echo json_encode($Campo); ?>;
    //console.log(precargas);
});
//**********************************
//$("#objeto_id").change(function (){ajax("../../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//$("#objeto_id").change(function (){ajax("../dibujo/lista/"+$(this).val()+"/dibujo_id", "div_dibujo_id");});
//**********************************
function carga(objeto_id)
{
    //ajax("../../dibujo/lista/"+objeto_id+"/dibujo_id", "div_dibujo_id");
}
</script>
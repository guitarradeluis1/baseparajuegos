<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/juego/funciones.js');?>"></script>
<script src="<?php echo base_url('js/mundo/selecion_personaje.js');?>"></script>
<!---------------------------------------------------------------------->
<div id="body">
    <?php #echo anchor("ingreso/index", "Atras", "class='plata'"); ?>
    <hr />
    <label class="label_verde">Selecciona tu personaje</label>
    <hr />
    <div id="canvas"></div>
</div>
<div id="div_escondido"></div>
<?php
    #echo "<pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<pre>"; print_r($personajes); echo "</pre>";
    #echo "<pre>"; print_r($Salida); echo "</pre>";
?>
<script>
$(document).ready(function()
{
     //$(".carga").click(function (){carga($(this).val());});
    //-------------------------
    usuario_session = <?php echo json_encode($session); ?>;
    personajes = <?php echo json_encode($personajes); ?>;
    //console.log(personajes);
});
//**********************************
</script>
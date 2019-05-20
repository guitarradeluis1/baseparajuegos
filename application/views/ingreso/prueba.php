<script>
$(document).ready(function()
{
     //$(".carga").click(function (){carga($(this).val());});
    //-------------------------
    //usuario_session = <?php #echo json_encode($session); ?>;
    precargas = <?php echo json_encode($campo_objeto); ?>;
    campo = <?php echo json_encode($campo); ?>;
    campo_dubujo = <?php echo json_encode($campo_dubujo); ?>;
    personaje_img = <?php echo json_encode($personaje); ?>;
    Posicion = <?php echo json_encode($Posicion); ?>;
    Usuario = <?php echo json_encode($Usuario); ?>;
    //console.log(campo_dubujo);
});
//**********************************
</script>
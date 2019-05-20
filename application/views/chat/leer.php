<script>
$(document).ready(function()
{
    objchat.mensajes = <?php echo json_encode($leer); ?>;
    $("#tr_chat").html("");
    objchat.pintarchat();
});
</script>
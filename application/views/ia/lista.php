<?php
echo creador_selector($nombre, $Salida, "");
#echo $nombre."<pre>"; print_r($Salida); echo "</pre>";
if($selector != "")
{
?>
    <script>
    $(document).ready(function()
    {
        $("#<?php echo $nombre; ?>").val("<?php echo $selector; ?>");
    });
    //**********************************
    </script>
<?php
}
?>
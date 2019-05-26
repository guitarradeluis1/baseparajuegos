<?php
if(isset($session["Contrato"]))
{?>
<table>
    <tr>
        <td><?php echo anchor("/welcome/salir", "Salir", "class='link_azul'"); ?></td>
        <td>
        <?php
        if($controlador!="welcome" && $controlador!="ingreso")
        {
            echo anchor("/ingreso/index", "Menu", "class='link_azul'");
        }
        ?>
        </td>
    </tr>
</table>
<?php
}
?>
<p class="footer">
(Page rendered in <strong>{elapsed_time}</strong> seconds) 
Licencia <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache2.0</a></p>
</div>
<!--Luis Eduardo Bernal Suarez guitarradeluis@gmail.com-->
<script>
console.log("Luis Eduardo Bernal Suarez guitarradeluis@gmail.com");
/*$(document).ready(function()
{
    //____________________________________________
    $(".desplegar").click(Deplegar);
});*/
//______________________________________________--
function Deplegar()
{
    var des = $(this).attr("despliego");
    $("#"+des).toggle("slow");
    //console.log("#"+des);
}
//_______________________________________________
function limitar_palabras(texto, limite)
{
    var palabras = texto.split(/\b[\s,\.\-:;]*/,limite);
    texto=palabras.join(" ");
    return texto;
}
//_______________________________________________
function limitardiez(tem_numero)
{
    var tem_texto = "";
    if(parseInt(tem_numero) < 99)
    {tem_texto ="0"+tem_numero;}
    else
    {tem_texto = tem_numero;}
    return tem_texto;
}
//_______________________________________________
function ajax(URL, lugar)
{
    jQuery.ajax
    ({
        type: "POST",
        url: URL,
        beforeSend: function()
        {
            jQuery('#'+lugar).html("<?php echo img('img/giphy.gif', 'pequeña'); ?>");
        },
        success: function(msg)
        {
            jQuery('#'+lugar).html(msg);
        }
    });
    //$("#xxx").change(function (){ajax(URL, lugar}));
    //$("#otro_mapa").change(function (){ajax("../../campo/index/"+$(this).val(), "div_campo");});
}
//_______________________________________________
$('.number').keyup(function (){this.value = (this.value + '').replace(/[^0-9]/g, '');});
$('.numberAll').keyup(function (){this.value = (this.value + '').replace(/[^0-9]/g, '');});
//$(".unapalabra").keyup(function(){$(this).val(limitar_palabras($(this).val(),1));});
</script>
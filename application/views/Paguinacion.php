<div id="pagination">
<?php 
    $redondeo = (round($registros/$total_registro)+1);
    #echo $redondeo."<br />";
    echo $this->pagination->create_links(); 
    echo anchor($controlador."/".$funcion."/", "<< Inicio", "class='plata'");
    echo "";
    if($paguina>0)
    {
        echo anchor($controlador."/".$funcion."/".($paguina-$total_registro), "< Atras", "class='plata'");
        echo "";
    }
    if($paguina<=$redondeo)
    {
        echo anchor($controlador."/".$funcion."/".($paguina+$total_registro), "Adelante >", "class='plata'");
        echo "";
    }
    echo anchor($controlador."/".$funcion."/".($redondeo), "Fin >>", "class='plata'");
?>
</div>
<div class="card">
    <div class="card-header">
        <b><?php echo $Armas["nombre"]; ?> (Nivel <?php echo $Armas["nivel"]; ?>)</b>
    </div>
    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <?php
            if($Armas["arma1"])
            {
                echo $Armas["arma_1"]["nombre"]." Rango (".$Armas["arma_1"]["dano_min"]." - ".$Armas["arma_1"]["dano_max"].")";
            }
            if($Armas["arma2"])
            {
                echo $Armas["arma_2"]["nombre"]." Rango (".$Armas["arma_2"]["dano_min"]." - ".$Armas["arma_2"]["dano_max"].")";
            }
            ?>
            <hr/>
            <p>
                Defensa: <?php echo $Armas["defensa"]; ?> 
                <?php
                $X = $Armas["defensa"];
                if($Armas["arma1"])
                {
                    echo " + ".$Armas["arma_1"]["defensa"]." (".$Armas["arma_1"]["nombre"].")";
                    $X = $X + $Armas["arma_1"]["defensa"];
                }
                if($Armas["arma2"])
                {
                    echo " + ".$Armas["arma_2"]["defensa"]." (".$Armas["arma_2"]["nombre"].")";
                    $X = $X + $Armas["arma_2"]["defensa"];
                }
                echo " = ".$X;
                ?>
                <br/>
            </p>
            <p>
                Fuerza: <?php echo $Armas["fuerza"]; ?> 
                <?php
                $X = $Armas["fuerza"];
                if($Armas["arma1"])
                {
                    echo " + ".$Armas["arma_1"]["fuerza"]." (".$Armas["arma_1"]["nombre"].")";
                    $X = $X + $Armas["arma_1"]["fuerza"];
                }
                if($Armas["arma2"])
                {
                    echo " + ".$Armas["arma_2"]["fuerza"]." (".$Armas["arma_2"]["nombre"].")";
                    $X = $X + $Armas["arma_2"]["fuerza"];
                }
                echo " = ".$X;
                ?>
                <br/>
            </p>
            <p>
                Punteria: <?php echo $Armas["punteria"]; ?> 
                <?php
                $X = $Armas["fuerza"];
                if($Armas["arma1"])
                {
                    echo " + ".$Armas["arma_1"]["punteria"]." (".$Armas["arma_1"]["nombre"].")";
                    $X = $X + $Armas["arma_1"]["punteria"];
                }
                if($Armas["arma2"])
                {
                    echo " + ".$Armas["arma_2"]["punteria"]." (".$Armas["arma_2"]["nombre"].")";
                    $X = $X + $Armas["arma_2"]["punteria"];
                }
                echo " = ".$X;
                ?>
                <br/>
            </p>
            <p>
                Velocidad: <?php echo $Armas["velocidad"]; ?> 
                <?php
                $X = $Armas["velocidad"];
                if($Armas["arma1"])
                {
                    echo " + ".$Armas["arma_1"]["velocidad"]." (".$Armas["arma_1"]["nombre"].")";
                    $X = $X + $Armas["arma_1"]["velocidad"];
                }
                if($Armas["arma2"])
                {
                    echo " + ".$Armas["arma_2"]["velocidad"]." (".$Armas["arma_2"]["nombre"].")";
                    $X = $X + $Armas["arma_2"]["velocidad"];
                }
                echo " = ".$X;
                ?>
                <br/>
            </p>
            <footer class="blockquote-footer">
                <b>Vida : <cite title="Source Title"><?php echo $Armas["vida"]; ?></cite></b>
                <b>Puntos de Exp : <cite title="Source Title"><?php echo $Armas["puntos"]; ?></cite></b>
            </footer>
        </blockquote>
    </div>
</div>
<br/>
<?php #echo "<pre>"; print_r($Armas); echo "</pre>"; ?>
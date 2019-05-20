<script>
$(document).ready(function()
{
    //pintar_consola_limpia();
    Usuario = <?php echo json_encode($Usuario); ?>;
    arma_usuarios = <?php echo json_encode($arma_usuarios); ?>;
    pint_jugadores = <?php echo json_encode($Conectados); ?>;
    agregar_jugadores();
    label_nivel.setText(`Nivel: ${Usuario.nivel.toString()} Vida: ${Usuario.vida.toString()} `);
    //---------------------
    if(parseInt(arma_usuarios.oro) < 10)
    {label_oro.setText(`00${arma_usuarios.oro.toString()} oro `);}
    else if(parseInt(arma_usuarios.oro) < 99)
    {label_oro.setText(`0${arma_usuarios.oro.toString()} oro `);}
    else
    {label_oro.setText(`${arma_usuarios.oro.toString()} oro `);}
    //---------------------
    if(parseInt(arma_usuarios.plata) < 10)
    {label_plata.setText("00"+arma_usuarios.plata.toString()+" plata ");}
    else if(parseInt(arma_usuarios.plata) < 99)
    {label_plata.setText("0"+arma_usuarios.plata.toString()+" plata ");}
    else
    {label_plata.setText(arma_usuarios.plata.toString()+" plata ");}
    //---------------------
    label_estado_vida.setText("Vida: "+Usuario.vida.toString()+" ");
    label_estado_nivel.setText("Nivel: "+Usuario.nivel.toString()+" ");
    label_estado_velocidad.setText("Velocidad: "+Usuario.velocidad.toString()+" ");
    label_estado_fuerza.setText("Fuerza: "+Usuario.fuerza.toString()+" ");
    label_estado_punteria.setText("Punteria: "+Usuario.punteria.toString()+" ");
    label_estado_defensa.setText("Defensa: "+Usuario.defensa.toString()+" ");
    //---------------------
    btn_lab_1.setText(limitardiez(arma_usuarios.c1.toString())+" ");
    btn_lab_2.setText(limitardiez(arma_usuarios.c2.toString())+" ");
    btn_lab_3.setText(limitardiez(arma_usuarios.c3.toString())+" ");
    btn_lab_4.setText(limitardiez(arma_usuarios.c4.toString())+" ");
    btn_lab_5.setText(limitardiez(arma_usuarios.c5.toString())+" ");
    btn_lab_6.setText(limitardiez(arma_usuarios.c6.toString())+" ");
    btn_lab_7.setText(limitardiez(arma_usuarios.c7.toString())+" ");
    btn_lab_8.setText(limitardiez(arma_usuarios.c8.toString())+" ");
    if(arma_usuarios.arma_1_id != "0")
    {
        arma_usuarios.arma_1.dibujo.cuadros = arma_usuarios.arma_1.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_1.dibujo.cuadros = arma_usuarios.arma_1.dibujo.cuadros.replace("]", "");
        img_itm_1.loadTexture( arma_usuarios.arma_1.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_1.dibujo.cuadros) );
    }
    else
    {img_itm_1.loadTexture("fondo_negro", 0);}
    img_itm_1.height = 45; img_itm_1.width = 45;
    //.........
    if(arma_usuarios.arma_2_id != "0")
    {
        arma_usuarios.arma_2.dibujo.cuadros = arma_usuarios.arma_2.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_2.dibujo.cuadros = arma_usuarios.arma_2.dibujo.cuadros.replace("]", "");
        img_itm_2.loadTexture( arma_usuarios.arma_2.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_2.dibujo.cuadros) );
    }
    else
    {img_itm_2.loadTexture("fondo_negro", 0);}
    img_itm_2.height = 45; img_itm_2.width = 45;
    //.........
    if(arma_usuarios.arma_3_id != "0")
    {
        arma_usuarios.arma_3.dibujo.cuadros = arma_usuarios.arma_3.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_3.dibujo.cuadros = arma_usuarios.arma_3.dibujo.cuadros.replace("]", "");
        img_itm_3.loadTexture( arma_usuarios.arma_3.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_3.dibujo.cuadros) );
    }
    else
    {img_itm_3.loadTexture("fondo_negro", 0);}
    img_itm_3.height = 45; img_itm_3.width = 45;
    //.........
    if(arma_usuarios.arma_4_id != "0")
    {
        arma_usuarios.arma_4.dibujo.cuadros = arma_usuarios.arma_4.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_4.dibujo.cuadros = arma_usuarios.arma_4.dibujo.cuadros.replace("]", "");
        img_itm_4.loadTexture( arma_usuarios.arma_4.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_4.dibujo.cuadros) );
    }
    else
    {img_itm_4.loadTexture("fondo_negro", 0);}
    img_itm_4.height = 45; img_itm_4.width = 45;
    //.........
    if(arma_usuarios.arma_5_id != "0")
    {
        arma_usuarios.arma_5.dibujo.cuadros = arma_usuarios.arma_5.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_5.dibujo.cuadros = arma_usuarios.arma_5.dibujo.cuadros.replace("]", "");
        img_itm_5.loadTexture( arma_usuarios.arma_5.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_5.dibujo.cuadros) );
    }
    else
    {img_itm_5.loadTexture("fondo_negro", 0);}
    img_itm_5.height = 45; img_itm_5.width = 45;
    //.........
    if(arma_usuarios.arma_6_id != "0")
    {
        arma_usuarios.arma_6.dibujo.cuadros = arma_usuarios.arma_6.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_6.dibujo.cuadros = arma_usuarios.arma_6.dibujo.cuadros.replace("]", "");
        img_itm_6.loadTexture( arma_usuarios.arma_6.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_6.dibujo.cuadros) );
    }
    else
    {img_itm_6.loadTexture("fondo_negro", 0);}
    img_itm_6.height = 45; img_itm_6.width = 45;
    //.........
    if(arma_usuarios.arma_7_id != "0")
    {
        arma_usuarios.arma_7.dibujo.cuadros = arma_usuarios.arma_7.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_7.dibujo.cuadros = arma_usuarios.arma_7.dibujo.cuadros.replace("]", "");
        img_itm_7.loadTexture( arma_usuarios.arma_7.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_7.dibujo.cuadros) );
    }
    else
    {img_itm_7.loadTexture("fondo_negro", 0);}
    img_itm_7.height = 45; img_itm_7.width = 45;
    //.........
    if(arma_usuarios.arma_8_id != "0")
    {
        arma_usuarios.arma_8.dibujo.cuadros = arma_usuarios.arma_8.dibujo.cuadros.replace("[", "");
        arma_usuarios.arma_8.dibujo.cuadros = arma_usuarios.arma_8.dibujo.cuadros.replace("]", "");
        img_itm_8.loadTexture( arma_usuarios.arma_8.dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_8.dibujo.cuadros) );
    }
    else
    {img_itm_8.loadTexture("fondo_negro", 0);}
    img_itm_8.height = 45; img_itm_8.width = 45;
    //.........
    if(Usuario.arma1 != "0" && Usuario.arma1 != "")
    {
        btn_arm_1.loadTexture( Usuario.arma_1.dibujo.objeto.nombre.toString(), eval(Usuario.arma_1.dibujo.cuadros) );
    }
    btn_arm_1.height = 45; btn_arm_1.width = 45;
    //abrir_items();
    //----------------------------------------------------
    //Modal Status
    $("label#label_puntos").html(Usuario.puntos.toString());
    $("label#label_velocidad").html(Usuario.velocidad.toString());
    $("label#label_fuerza").html(Usuario.fuerza.toString());
    $("label#label_punteria").html(Usuario.punteria.toString());
    $("label#label_defensa").html(Usuario.defensa.toString());
    if(parseInt(Usuario.puntos)>0)
    {
        $("button.btn_mas").show(200);
    }
    else
    {
        $("button.btn_mas").hide();
    }
    //----------------------------------------------------
    //MENU
    $("#menu_titulo").html(Usuario.nombre.toString());
    //console.log(Usuario);
});
</script>
var item_enuso = {};
var mira_actual = "abrir_items";
//_______________________________________________
function pintar_todo(imgfondo, secmento, velocidad, tamano_cortes)
{
    for(K=0;K<=canvas_tanano_x/tamano_cortes;K++)
    {
        for(Y=0;Y<=canvas_tanano_y/tamano_cortes;Y++)
        {
            fondo_pasto = game.add.sprite(K*tamano_cortes, Y*tamano_cortes, imgfondo);
            fondo_pasto.animations.add('fondo_inicial', secmento, velocidad, true);
            fondo_pasto.animations.play('fondo_inicial');
        }
    }
}
//_______________________________________________
function pintar_bordes(posicion,imgfondo, secmento, velocidad, tamano_cortes)
{
    //0 = arriba | 1 =abbajo | 2 = derecha | 3 = izquierda
    for(K=0;K<=canvas_tanano_x/tamano_cortes;K++)
    {
        if(posicion == 0)
        {fondo_pasto = game.add.sprite(K*tamano_cortes, -20, imgfondo);}
        else if(posicion == 1)
        {fondo_pasto = game.add.sprite(K*tamano_cortes, canvas_tanano_y-10, imgfondo);}
        else if(posicion == 2)
        {fondo_pasto = game.add.sprite( canvas_tanano_y+20, K*tamano_cortes, imgfondo);}
        else if(posicion == 3)
        {fondo_pasto = game.add.sprite( -20, K*tamano_cortes, imgfondo);}
        fondo_pasto.animations.add('fondo_inicial', secmento, velocidad, true);
        fondo_pasto.animations.play('fondo_inicial');
    }
}
//_______________________________________________
function pintar_consola()
{
    tem_consola = game.add.sprite(canvas_tanano_x+10, 0, 'fondo_negro');
    tem_consola.height = canvas_tanano_x;
    tem_consola.width = canvas_tanano_y;
    game.add.bitmapText(canvas_tanano_x+12, 2, 'carrier_command', Usuario.nombre.toString()+" ", 13);
    label_nivel = game.add.bitmapText(canvas_tanano_x+12, 16, 'carrier_command', "Nivel: "+Usuario.nivel.toString()+" ", 10);
    label_tutorial = game.add.text(canvas_tanano_x+12, canvas_tanano_y-12, 'Movimientos (W,A,S,D) ', { font: '10px Arial', fill: '#26D803' });
    label_notificar = game.add.text(canvas_tanano_x+12, canvas_tanano_y-60, '', { font: '20px Arial', fill: '#26D803' });
    btn_salir = game.add.button( canvas_tanano_x_total-40, 2, 'saobotones', '', this, 22, 23, 23);//mouse, normal, click
    btn_salir.height = 35; btn_salir.width = 35;
    btn_salir.onInputUp.add(function(){window.location.href = "../ingreso/index";}, this);
    button_items = game.add.button(canvas_tanano_x+15, 35, 'saobotones', abrir_items, this, 11, 12, 12);//mouse, normal, click | abrir_items
    button_items.height = 55; button_items.width = 55;
    button_status = game.add.button(canvas_tanano_x+65, 35, 'saobotones', dialogo.puntos, this, 20, 21, 21);//mouse, normal, click
    button_status.height = 55; button_status.width = 55;
    button_misiones = game.add.button(canvas_tanano_x+115, 35, 'saobotones', abrir_misiones, this, 56, 57, 57);//mouse, normal, click
    button_misiones.height = 55; button_misiones.width = 55;
    button_control = game.add.button(canvas_tanano_x+165, 35, 'saobotones', abrir_control, this, 69, 70, 70);//mouse, normal, click
    button_control.height = 55; button_control.width = 55;
    //button_control.angle += 90;
}
//_______________________________________________
function pintar_consola_limpia()
{
    var tem_position_out = -500;
    mira_verde.position.x = tem_position_out;
    btn_basura.position.x = tem_position_out;
    label_oro.position.x = tem_position_out;
    label_plata.position.x = tem_position_out;
    img_itm_1.position.x = tem_position_out;
    img_itm_2.position.x = tem_position_out;
    img_itm_3.position.x = tem_position_out;
    img_itm_4.position.x = tem_position_out;
    img_itm_5.position.x = tem_position_out;
    img_itm_6.position.x = tem_position_out;
    img_itm_7.position.x = tem_position_out;
    img_itm_8.position.x = tem_position_out;
    btn_itm_1.position.x = tem_position_out;
    btn_itm_2.position.x = tem_position_out;
    btn_itm_3.position.x = tem_position_out;
    btn_itm_4.position.x = tem_position_out;
    btn_itm_5.position.x = tem_position_out;
    btn_itm_6.position.x = tem_position_out;
    btn_itm_7.position.x = tem_position_out;
    btn_itm_8.position.x = tem_position_out;
    
    btn_lab_1.position.x = tem_position_out;
    btn_lab_2.position.x = tem_position_out;
    btn_lab_3.position.x = tem_position_out;
    btn_lab_4.position.x = tem_position_out;
    btn_lab_5.position.x = tem_position_out;
    btn_lab_6.position.x = tem_position_out;
    btn_lab_7.position.x = tem_position_out;
    btn_lab_8.position.x = tem_position_out;
    
    btn_arm_1.position.x = tem_position_out;
    btn_arm_2.position.x = tem_position_out;
    
    mis_tit_1.position.x = tem_position_out;
    mis_lab_1.position.x = tem_position_out;
    mis_tit_2.position.x = tem_position_out;
    mis_lab_2.position.x = tem_position_out;
    mis_btn_can_1.position.x = tem_position_out;
    mis_btn_can_2.position.x = tem_position_out;
    
    linea_separador_1.position.x = tem_position_out;
    linea_separador_2.position.x = tem_position_out;
    
    btn_atk_1.position.x = tem_position_out;
    btn_atk_2.position.x = tem_position_out;
    btn_atk_3.position.x = tem_position_out;
    
    dialogo_tit.position.x = tem_position_out;
    dialogo_lab.position.x = tem_position_out;
    btn_si.position.x = tem_position_out;
    btn_no.position.x = tem_position_out;
    btn_mas.position.x = tem_position_out;
    btn_menos.position.x = tem_position_out;
    lable_number.position.x = tem_position_out;
    
    button_abajo.position.x = tem_position_out;
    button_derecha.position.x = tem_position_out;
    button_arriba.position.x = tem_position_out;
    button_izquierda.position.x = tem_position_out;
    
    label_estado_vida.position.x = tem_position_out;
    label_estado_nivel.position.x = tem_position_out;
    label_estado_velocidad.position.x = tem_position_out;
    label_estado_fuerza.position.x = tem_position_out;
    label_estado_punteria.position.x = tem_position_out;
    label_estado_defensa.position.x = tem_position_out;
    //btn_estado_puntos.position.x = tem_position_out;
    
    label_notificar.setText(" ");
}
//=========================================================================================================
function abrir_items()
{
    mira_actual = "abrir_items";
    pintar_consola_limpia();
    btn_basura.position.x = canvas_tanano_x+240;
    label_oro.position.x = canvas_tanano_x+240;
    label_plata.position.x = canvas_tanano_x+240;
    
    img_itm_1.position.x = canvas_tanano_x+20;
    img_itm_2.position.x = canvas_tanano_x+70;
    img_itm_3.position.x = canvas_tanano_x+120;
    img_itm_4.position.x = canvas_tanano_x+170;
    img_itm_5.position.x = canvas_tanano_x+20;
    img_itm_6.position.x = canvas_tanano_x+70;
    img_itm_7.position.x = canvas_tanano_x+120;
    img_itm_8.position.x = canvas_tanano_x+170;
    
    btn_itm_1.position.x = canvas_tanano_x+20;
    btn_itm_2.position.x = canvas_tanano_x+70;
    btn_itm_3.position.x = canvas_tanano_x+120;
    btn_itm_4.position.x = canvas_tanano_x+170;
    btn_itm_5.position.x = canvas_tanano_x+20;
    btn_itm_6.position.x = canvas_tanano_x+70;
    btn_itm_7.position.x = canvas_tanano_x+120;
    btn_itm_8.position.x = canvas_tanano_x+170;
    
    btn_lab_1.position.x = canvas_tanano_x+20;
    btn_lab_2.position.x = canvas_tanano_x+70;
    btn_lab_3.position.x = canvas_tanano_x+120;
    btn_lab_4.position.x = canvas_tanano_x+170;
    btn_lab_5.position.x = canvas_tanano_x+20;
    btn_lab_6.position.x = canvas_tanano_x+70;
    btn_lab_7.position.x = canvas_tanano_x+120;
    btn_lab_8.position.x = canvas_tanano_x+170;
    
    btn_arm_1.position.x = canvas_tanano_x+40;
    btn_arm_2.position.x = canvas_tanano_x+160;
    
    linea_separador_1.position.x = canvas_tanano_x+10;
    linea_separador_2.position.x = canvas_tanano_x+10;
    
    btn_atk_1.position.x = canvas_tanano_x+20;
    btn_atk_2.position.x = canvas_tanano_x+80;
    btn_atk_3.position.x = canvas_tanano_x+140;
    if(seg_funciones >= 0)
    {
        seg_funciones = -3;
        var tem_aleatorio = Math.random()*1000000;
        ajax("../../ingreso/cargar_estatus/"+campo.id+"/"+tem_aleatorio, "div_escondido");
    }
}
var usar_item =
{
    uno: function(entrada_btn)
    {
        console.log("uno");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(1);
    },
    dos: function(entrada_btn)
    {
        console.log("dos");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(2);
    },
    tres: function(entrada_btn)
    {
        console.log("tres");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(3);
    },
    cuatro: function(entrada_btn)
    {
        console.log("cuatro");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(4);
    },
    cinco: function(entrada_btn)
    {
        console.log("cinco");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(5);
    },
    seis: function(entrada_btn)
    {
        console.log("seis");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(6);
    },
    siete: function(entrada_btn)
    {
        console.log("siete");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(7);
    },
    ocho: function(entrada_btn)
    {
        console.log("ocho");
        seleccion_mira_verde(entrada_btn);
        usar_item_numb(8);
    },
    basura: function(entrada_btn)
    {
        console.log("basura");
        usar_item_numb(0);
    },
}
var usar_arma =
{
    uno: function()
    {datos_arma_numb(1);},
    dos: function()
    {datos_arma_numb(2);},
}
var usar_atk =
{
    uno: function()
    {usar_atk_numb(1);},
    dos: function()
    {usar_atk_numb(2);},
    tres: function()
    {usar_atk_numb(3);},
}
function usar_item_numb(item_numb)
{
    console.log("usar item: "+item_numb);
    item_enuso = {};
    switch(item_numb)
    {
        case 0:
        // Eliminar item
        if(arma_usuarios.arma_1_id != "0")
        {
            item_enuso = arma_usuarios.arma_1;
            item_enuso.cantidad_actual = arma_usuarios.c1;
            item_enuso.posicion_actual = "1";
            var temp_var = {};
            temp_var.titulo = "Eliminar objeto";
            temp_var.mensaje = "Quieres eliminar un item ("+item_enuso.nombre+")?";
            temp_var.funcion = "eliminar_obj("+item_enuso.posicion_actual+");";// JSON.stringify
            modal_mensaje(temp_var);
        }
        break;
        case 1:
        if(arma_usuarios.arma_1_id != "0")
        {
            item_enuso = arma_usuarios.arma_1;
            item_enuso.cantidad_actual = arma_usuarios.c1;
            item_enuso.posicion_actual = "1";
            abrir_dialogo(3);
        }
        break;
        case 2:
        if(arma_usuarios.arma_2_id != "0")
        {
            item_enuso = arma_usuarios.arma_2;
            item_enuso.cantidad_actual = arma_usuarios.c2;
            item_enuso.posicion_actual = "2";
            abrir_dialogo(3);
        }
        break;
        case 3:
        if(arma_usuarios.arma_3_id != "0")
        {
            item_enuso = arma_usuarios.arma_3;
            item_enuso.cantidad_actual = arma_usuarios.c3;
            item_enuso.posicion_actual = "3";
            abrir_dialogo(3);
        }
        break;
        case 4:
        if(arma_usuarios.arma_4_id != "0")
        {
            item_enuso = arma_usuarios.arma_4;
            item_enuso.cantidad_actual = arma_usuarios.c4;
            item_enuso.posicion_actual = "4";
            abrir_dialogo(3);
        }
        break;
        case 5:
        if(arma_usuarios.arma_5_id != "0")
        {
            item_enuso = arma_usuarios.arma_5;
            item_enuso.cantidad_actual = arma_usuarios.c5;
            item_enuso.posicion_actual = "5";
            abrir_dialogo(3);
        }
        break;
        case 6:
        if(arma_usuarios.arma_6_id != "0")
        {
            item_enuso = arma_usuarios.arma_6;
            item_enuso.cantidad_actual = arma_usuarios.c6;
            item_enuso.posicion_actual = "6";
            abrir_dialogo(3);
        }
        break;
        case 7:
        if(arma_usuarios.arma_7_id != "0")
        {
            item_enuso = arma_usuarios.arma_7;
            item_enuso.cantidad_actual = arma_usuarios.c7;
            item_enuso.posicion_actual = "7";
            abrir_dialogo(3);
        }
        break;
        case 8:
        if(arma_usuarios.arma_8_id != "0")
        {
            item_enuso = arma_usuarios.arma_8;
            item_enuso.cantidad_actual = arma_usuarios.c8;
            item_enuso.posicion_actual = "8";
            abrir_dialogo(3);
        }
        break;
        default:
            item_enuso = {};
    }
    console.log("ITEMMMMMMM ["+item_numb+"]");
}
function datos_arma_numb(item_numb)
{
    jQuery.ajax
    ({
        type: "POST",
        url: `../../arma/status_arma/${item_numb}`,
        beforeSend: function()
        {
            //jQuery('#'+lugar).html("<?php echo img('img/giphy.gif', 'pequeña'); ?>");
        },
        success: function(msg)
        {
            console.log(msg);
            var temp_var = {};
            temp_var.titulo = "Status Arma";
            temp_var.mensaje = msg;
            temp_var.funcion = "";
            modal_mensaje(temp_var);
        },
        error: function(e)
        {
            console.log("Error carga status arma!");
        }
    });
    console.log("ARMA ["+item_numb+"]");
}
function usar_atk_numb(item_numb)
{
    console.log("ATK ["+item_numb+"]");
}
//=========================================================================================================
function abrir_status()
{
    try
    {
        mira_actual = "abrir_status";
        pintar_consola_limpia();
        label_estado_vida.position.x = canvas_tanano_x+25;
        label_estado_nivel.position.x = canvas_tanano_x+25;
        label_estado_velocidad.position.x = canvas_tanano_x+25;
        label_estado_fuerza.position.x = canvas_tanano_x+25;
        label_estado_punteria.position.x = canvas_tanano_x+25;
        label_estado_defensa.position.x = canvas_tanano_x+25;
        //btn_estado_puntos = canvas_tanano_x+25;
        if(seg_funciones >= 0)
        {
            seg_funciones = -3;
            stado_cargar();
            //var tem_aleatorio = Math.random()*1000000;
            //ajax("../../ingreso/cargar_estatus/"+campo.id+"/"+tem_aleatorio, "div_escondido");
        }
    }
    catch(err)
    {
        window.location.replace("../");
    }
}
//=========================================================================================================
function abrir_misiones()
{
    mira_actual = "abrir_misiones";
    pintar_consola_limpia();
    mis_tit_1.position.x = canvas_tanano_x+35;
    mis_lab_1.position.x = canvas_tanano_x+25;
    mis_tit_2.position.x = canvas_tanano_x+35;
    mis_lab_2.position.x = canvas_tanano_x+25;
    mis_btn_can_1.position.x = canvas_tanano_x+10;
    mis_btn_can_2.position.x = canvas_tanano_x+10;
}
var mision_cancelar =
{
    uno: function()
    {mision_cancelar_numb(1);},
    dos: function()
    {mision_cancelar_numb(2);},
}
function mision_cancelar_numb(item_numb)
{
    console.log("Cancelo mision ["+item_numb+"]");
}
//=========================================================================================================
//abrir_dialogo(1); = SI NO con dialogo
//abrir_dialogo(2); = cantidad con dialogo
//abrir_dialogo(3); = SI NO
//abrir_dialogo(0); = cerrar
function abrir_dialogo(entrada_tipo)//Abrir dialogo y si y no  abrir_dialogo(2); abrir_dialogo(1);
{
    //console.log(item_enuso);
    abrir_dialogo_tipo = entrada_tipo;
    if(abrir_dialogo_tipo == 0)
    {
        var tem_position_out = -500;
        dialogo_tit.position.x = tem_position_out;
        dialogo_lab.position.x = tem_position_out;
        btn_si.position.x = tem_position_out;
        btn_no.position.x = tem_position_out;
        btn_mas.position.x = tem_position_out;
        btn_menos.position.x = tem_position_out;
        lable_number.position.x = tem_position_out;
        label_notificar.setText(" ");
    }
    else if(abrir_dialogo_tipo == 1) //SI NO con dialogo
    {
        pintar_consola_limpia();
        dialogo_tit.position.x = canvas_tanano_x+12;
        dialogo_lab.position.x = canvas_tanano_x+22;
        btn_si.position.x = canvas_tanano_x+20; btn_si.position.y = 330;
        btn_no.position.x = canvas_tanano_x+80; btn_no.position.y = 330;
    }
    else if(abrir_dialogo_tipo == 2) //selecion cantidad con dialogo
    {
        pintar_consola_limpia();
        dialogo_tit.position.x = canvas_tanano_x+12;
        dialogo_lab.position.x = canvas_tanano_x+22;
        val_lable_number = 0;
        lable_number.setText("00 ");
        btn_si.position.x = canvas_tanano_x+160; btn_si.position.y = 330;
        btn_no.position.x = canvas_tanano_x+200; btn_no.position.y = 330;
        btn_mas.position.x = canvas_tanano_x+20; btn_mas.position.y = 330;
        btn_menos.position.x = canvas_tanano_x+110; btn_menos.position.y = 330;
        lable_number.position.x = canvas_tanano_x+70; lable_number.position.y = 335;
    }
    else if(abrir_dialogo_tipo == 3) //SI NO
    {
        label_notificar.setText(item_enuso.nombre.toString()+" ");
        btn_si.position.x = canvas_tanano_x+180; btn_si.position.y = canvas_tanano_y-60;
        btn_no.position.x = canvas_tanano_x+220; btn_no.position.y = canvas_tanano_y-60;
    }
}
var dialogo =
{
    si: function()
    {
        label_notificar.setText("");
        pintar_consola_limpia();
        dialogo_entrada(1);
    },
    no: function()
    {abrir_dialogo(0);},
    resta: function()
    {sumatoria(0);},
    suma: function()
    {sumatoria(1);},
    puntos: function()
    {$('#btn_hide_modal_status').click();}
}
function dialogo_entrada(item_numb)
{
    //console.log("Dialogo ["+item_numb+"]");
    if(item_enuso.funciones_id != "0")
    {
        //console.log("Funcion :: "+item_enuso.funciones.nombre.toString()+"()");
        eval(item_enuso.funciones.nombre.toString()+"()");
    }
}
function sumatoria(tem_entrada)
{
    if(tem_entrada == 1)
    {
        if(val_lable_number<99)
        {val_lable_number = val_lable_number + 1;}
    }
    else if(tem_entrada == 0)
    {
        if(val_lable_number>0)
        {val_lable_number = val_lable_number - 1;}
    }
    
    var tem_salidatexto = "";
    if(val_lable_number<10)
    {tem_salidatexto = "0"+val_lable_number+" ";}
    else
    {tem_salidatexto = val_lable_number+" ";}
    lable_number.setText(tem_salidatexto);
}
//=========================================================================================================
function abrir_control(entrada)
{
    mira_actual = "abrir_control";
    pintar_consola_limpia();
    button_abajo.position.x = canvas_tanano_x+190;
    button_derecha.position.x = canvas_tanano_x+230;
    button_arriba.position.x = canvas_tanano_x+150;
    button_izquierda.position.x = canvas_tanano_x+100;
    
}
var controlvirtual =
{
    derecha: function()
    {
        //key_derecha.isDown();
        contro_interno.derecha = true;
    },
    abajo: function()
    {contro_interno.abajo = true;},
    izquierda: function()
    {contro_interno.izquierda = true;},
    arriba: function()
    {contro_interno.arriba = true;},
    soltar: function()
    {
        contro_interno.derecha = false;
        contro_interno.abajo = false;
        contro_interno.izquierda = false;
        contro_interno.arriba = false;
        //console.log(button_derecha.input.pointerOver());
    },
}
//=========================================================================================================
function console_pruebas()
{
    console.log("console_pruebas..............");
}
//_______________________________________________
function colision_ia(ia_id)
{
     console.log("colision_ia : "+ia_id);
}
//_______________________________________________
function consola_ubi(per_x, per_y)
{
    console.log("personaje ["+per_x+" , "+per_y+"]");
}
//_______________________________________________
function label_control(entrada)
{
    label_tutorial.setText("Movimientos (W,A,S,D)      ["+entrada+"] ");
}
//_______________________________________________
function salir_url()
{
     window.location.href = "../ingreso/index";
}
//_______________________________________________
function seleccion_mira_verde(entrada_btn)
{
    //label_error.setText(entrada_btn.nombre);
    //personaje_id_selecionado = entrada_btn.valor; label_notificar
    console.log(entrada_btn);
    label_notificar.setText("");
    mira_verde.position.x = entrada_btn.position.x;
    mira_verde.position.y = entrada_btn.position.y;
}
//_______________________________________________
function stado_cargar()
{
    var tem_aleatorio = Math.random()*1000000;
    ajax("../../ingreso/cargar_estatus/"+campo.id+"/"+tem_aleatorio, "div_escondido");
    //var tem_aleatorio = Math.random()*1000000;
    //ajax("../ingreso/index/otro.js/"+tem_aleatorio, "div_escondido", { basura: tem_aleatorio });
    //ajax("../../ingreso/prueba/"+tem_aleatorio, "div_escondido");
}
//_______________________________________________
function armausuario_guardar()
{
    pintar_consola_limpia();
    var json = "json=" + JSON.stringify(arma_usuarios);
    $.ajax(
    {
        type: "POST",
        dataType: "text/json",
        url: "../../ingreso/actualiza_armausuario/",
        data: json,//""+JSON.stringify(arma_usuarios)+"",
        success: function(msg)
        {
            jQuery('#div_escondido').html(msg);
            abrir_items();
        },
        error: function(e)
        {
            //console.log("Error actualiso arma usuario");
        }
    });
}
//_______________________________________________
function usuario_guardar()
{
    pintar_consola_limpia();
    var json = "json=" + JSON.stringify(Usuario);
    $.ajax(
    {
        type: "POST",
        dataType: "text/json",
        url: "../../ingreso/actualiza_usuario/",
        data: json,//""+JSON.stringify(arma_usuarios)+"",
        success: function(msg)
        {
            jQuery('#div_escondido').html(msg);
            abrir_status();
            abrir_items();
        },
        error: function(e)
        {
            //console.log("Error actualizo usuario");
        }
    });
}
//_______________________________________________
function repintar_items()
{
    label_nivel.setText("Nivel: "+Usuario.nivel.toString()+" Vida: "+Usuario.vida.toString()+" ");
    //---------------------
    if(parseInt(arma_usuarios.oro) < 10)
    {label_oro.setText("00"+arma_usuarios.oro.toString()+" oro ");}
    else if(parseInt(arma_usuarios.oro) < 99)
    {label_oro.setText("0"+arma_usuarios.oro.toString()+" oro ");}
    else
    {label_oro.setText(arma_usuarios.oro.toString()+" oro ");}
    //---------------------
    if(parseInt(arma_usuarios.plata) < 10)
    {label_plata.setText("00"+arma_usuarios.plata.toString()+" plata ");}
    else if(parseInt(arma_usuarios.plata) < 99)
    {label_plata.setText("0"+arma_usuarios.plata.toString()+" plata ");}
    else
    {label_plata.setText(arma_usuarios.plata.toString()+" plata ");}
    btn_lab_1.setText(limitardiez(arma_usuarios.c1.toString())+" ");
    btn_lab_2.setText(limitardiez(arma_usuarios.c2.toString())+" ");
    btn_lab_3.setText(limitardiez(arma_usuarios.c3.toString())+" ");
    btn_lab_4.setText(limitardiez(arma_usuarios.c4.toString())+" ");
    btn_lab_5.setText(limitardiez(arma_usuarios.c5.toString())+" ");
    btn_lab_6.setText(limitardiez(arma_usuarios.c6.toString())+" ");
    btn_lab_7.setText(limitardiez(arma_usuarios.c7.toString())+" ");
    btn_lab_8.setText(limitardiez(arma_usuarios.c8.toString())+" ");
    abrir_status();
    abrir_items();
}
//_______________________________________________
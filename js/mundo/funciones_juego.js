//=========================================================================================================
function console_pruebas()
{
    console.log("console_pruebas..............");
}
//_______________________________________________
function obj_arma()
{
    var temp_arma = Usuario.arma1;
    if( item_enuso.id != temp_arma && item_enuso.id != "" )
    {
        pintar_consola_limpia();
        if(temp_arma != "" && temp_arma != "0")
        {
            if(arma_usuarios.arma_1_id == temp_arma)
            {arma_usuarios.c1 = ""+(parseInt(arma_usuarios.c1) + 1)+"";}
            else if(arma_usuarios.arma_2_id == temp_arma)
            {arma_usuarios.c2 = ""+(parseInt(arma_usuarios.c2) + 1)+"";}
            else if(arma_usuarios.arma_3_id == temp_arma)
            {arma_usuarios.c3 = ""+(parseInt(arma_usuarios.c3) + 1)+"";}
            else if(arma_usuarios.arma_4_id == temp_arma)
            {arma_usuarios.c4 = ""+(parseInt(arma_usuarios.c4) + 1)+"";}
            else if(arma_usuarios.arma_5_id == temp_arma)
            {arma_usuarios.c5 = ""+(parseInt(arma_usuarios.c5) + 1)+"";}
            else if(arma_usuarios.arma_6_id == temp_arma)
            {arma_usuarios.c6 = ""+(parseInt(arma_usuarios.c6) + 1)+"";}
            else if(arma_usuarios.arma_7_id == temp_arma)
            {arma_usuarios.c7 = ""+(parseInt(arma_usuarios.c7) + 1)+"";}
            else if(arma_usuarios.arma_8_id == temp_arma)
            {arma_usuarios.c8 = ""+(parseInt(arma_usuarios.c8) + 1)+"";}
            else //Almasena si esta vacio
            {
                if(arma_usuarios.arma_1_id == "" || arma_usuarios.arma_1_id == "0")
                {arma_usuarios.arma_1_id = temp_arma; arma_usuarios.c1 = "1";}
                else if(arma_usuarios.arma_2_id == "" || arma_usuarios.arma_2_id == "0")
                {arma_usuarios.arma_2_id = temp_arma; arma_usuarios.c2 = "1";}
                else if(arma_usuarios.arma_3_id == "" || arma_usuarios.arma_3_id == "0")
                {arma_usuarios.arma_3_id = temp_arma; arma_usuarios.c3 = "1";}
                else if(arma_usuarios.arma_4_id == "" || arma_usuarios.arma_4_id == "0")
                {arma_usuarios.arma_4_id = temp_arma; arma_usuarios.c4 = "1";}
                else if(arma_usuarios.arma_5_id == "" || arma_usuarios.arma_5_id == "0")
                {arma_usuarios.arma_5_id = temp_arma; arma_usuarios.c5 = "1";}
                else if(arma_usuarios.arma_6_id == "" || arma_usuarios.arma_6_id == "0")
                {arma_usuarios.arma_6_id = temp_arma; arma_usuarios.c6 = "1";}
                else if(arma_usuarios.arma_7_id == "" || arma_usuarios.arma_7_id == "0")
                {arma_usuarios.arma_7_id = temp_arma; arma_usuarios.c7 = "1";}
                else if(arma_usuarios.arma_8_id == "" || arma_usuarios.arma_8_id == "0")
                {arma_usuarios.arma_8_id = temp_arma; arma_usuarios.c8 = "1";}
            }
        }
        //item_enuso = btn_arm_1 posicion_actual cantidad_actual
        if( parseInt(item_enuso.cantidad_actual) > 0)
        {
            //-----------
            eval('arma_usuarios.c'+item_enuso.posicion_actual+' = "'+item_enuso.cantidad_actual+'";');
            eval("btn_arm_1.loadTexture( arma_usuarios.arma_"+item_enuso.posicion_actual+".dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_"+item_enuso.posicion_actual+".dibujo.cuadros), false );");
            eval("btn_arm_1.height = 45; btn_arm_1.width = 45;");
             //eval("arma_usuarios.arma_"+item_enuso.posicion_actual.toString()+".cantidad_actual = "+item_enuso.cantidad_actual);
            item_enuso.cantidad_actual = item_enuso.cantidad_actual - 1;
            //-----------
            eval('Usuario.arma1 = "'+item_enuso.id+'";');
            //-----------
            if(item_enuso.cantidad_actual <= 0)
            {
                eval('arma_usuarios.arma_'+item_enuso.posicion_actual.toString()+'_id = "0";');
                eval('arma_usuarios.c'+item_enuso.posicion_actual.toString()+' = "0";');
            }
            else
            {
                eval('arma_usuarios.c'+item_enuso.posicion_actual.toString()+' = arma_usuarios.c'+item_enuso.posicion_actual.toString()+'-1;');
            }
            //-----------
        }
        //------
        usuario_guardar();
        armausuario_guardar();
        //------
    }
    repintar_items();
    //------
    abrir_items();
    //------
}
//_______________________________________________
function asignar_arma(temp_arma)
{
    if( temp_arma != "" )
    {
        pintar_consola_limpia();
        if(temp_arma != "" && temp_arma != "0")
        {
            if(arma_usuarios.arma_1_id == temp_arma)
            {arma_usuarios.c1 = ""+(parseInt(arma_usuarios.c1) + 1)+"";}
            else if(arma_usuarios.arma_2_id == temp_arma)
            {arma_usuarios.c2 = ""+(parseInt(arma_usuarios.c2) + 1)+"";}
            else if(arma_usuarios.arma_3_id == temp_arma)
            {arma_usuarios.c3 = ""+(parseInt(arma_usuarios.c3) + 1)+"";}
            else if(arma_usuarios.arma_4_id == temp_arma)
            {arma_usuarios.c4 = ""+(parseInt(arma_usuarios.c4) + 1)+"";}
            else if(arma_usuarios.arma_5_id == temp_arma)
            {arma_usuarios.c5 = ""+(parseInt(arma_usuarios.c5) + 1)+"";}
            else if(arma_usuarios.arma_6_id == temp_arma)
            {arma_usuarios.c6 = ""+(parseInt(arma_usuarios.c6) + 1)+"";}
            else if(arma_usuarios.arma_7_id == temp_arma)
            {arma_usuarios.c7 = ""+(parseInt(arma_usuarios.c7) + 1)+"";}
            else if(arma_usuarios.arma_8_id == temp_arma)
            {arma_usuarios.c8 = ""+(parseInt(arma_usuarios.c8) + 1)+"";}
            else //Almasena si esta vacio
            {
                if(arma_usuarios.arma_1_id == "" || arma_usuarios.arma_1_id == "0")
                {arma_usuarios.arma_1_id = temp_arma; arma_usuarios.c1 = "1";}
                else if(arma_usuarios.arma_2_id == "" || arma_usuarios.arma_2_id == "0")
                {arma_usuarios.arma_2_id = temp_arma; arma_usuarios.c2 = "1";}
                else if(arma_usuarios.arma_3_id == "" || arma_usuarios.arma_3_id == "0")
                {arma_usuarios.arma_3_id = temp_arma; arma_usuarios.c3 = "1";}
                else if(arma_usuarios.arma_4_id == "" || arma_usuarios.arma_4_id == "0")
                {arma_usuarios.arma_4_id = temp_arma; arma_usuarios.c4 = "1";}
                else if(arma_usuarios.arma_5_id == "" || arma_usuarios.arma_5_id == "0")
                {arma_usuarios.arma_5_id = temp_arma; arma_usuarios.c5 = "1";}
                else if(arma_usuarios.arma_6_id == "" || arma_usuarios.arma_6_id == "0")
                {arma_usuarios.arma_6_id = temp_arma; arma_usuarios.c6 = "1";}
                else if(arma_usuarios.arma_7_id == "" || arma_usuarios.arma_7_id == "0")
                {arma_usuarios.arma_7_id = temp_arma; arma_usuarios.c7 = "1";}
                else if(arma_usuarios.arma_8_id == "" || arma_usuarios.arma_8_id == "0")
                {arma_usuarios.arma_8_id = temp_arma; arma_usuarios.c8 = "1";}
            }
        }
        //item_enuso = btn_arm_1 posicion_actual cantidad_actual
        if( parseInt(item_enuso.cantidad_actual) > 0)
        {
            //-----------
            eval('arma_usuarios.c'+item_enuso.posicion_actual+' = "'+item_enuso.cantidad_actual+'";');
            eval("btn_arm_1.loadTexture( arma_usuarios.arma_"+item_enuso.posicion_actual+".dibujo.objeto.nombre.toString(), eval(arma_usuarios.arma_"+item_enuso.posicion_actual+".dibujo.cuadros), false );");
            eval("btn_arm_1.height = 45; btn_arm_1.width = 45;");
             //eval("arma_usuarios.arma_"+item_enuso.posicion_actual.toString()+".cantidad_actual = "+item_enuso.cantidad_actual);
            item_enuso.cantidad_actual = item_enuso.cantidad_actual - 1;
            //-----------
            eval('Usuario.arma1 = "'+item_enuso.id+'";');
            //-----------
            if(item_enuso.cantidad_actual <= 0)
            {
                eval('arma_usuarios.arma_'+item_enuso.posicion_actual.toString()+'_id = "0";');
                eval('arma_usuarios.c'+item_enuso.posicion_actual.toString()+' = "0";');
            }
            else
            {
                eval('arma_usuarios.c'+item_enuso.posicion_actual.toString()+' = arma_usuarios.c'+item_enuso.posicion_actual.toString()+'-1;');
            }
            //-----------
        }
        //------
        usuario_guardar();
        armausuario_guardar();
        //------
    }
    repintar_items();
    //------
    abrir_items();
    //------
}
//_______________________________________________
function obj_sanar()
{
    console.log("obj_sanar..............");
    //item_enuso = btn_arm_1
}
//_______________________________________________
function recojer_obj(entrada)
{
    var temp_var = {};
    temp_var.titulo = "Objeto";
    temp_var.mensaje = "Quieres recojer "+entrada.nombre+"?";
    temp_var.funcion = "asignar_arma("+(entrada.id)+");";// JSON.stringify
    modal_mensaje(temp_var);
}
//_______________________________________________
function eliminar_obj(numero)
{
    if(arma_usuarios["c"+numero] > 1)
    {
        arma_usuarios["c"+numero] = arma_usuarios["c"+numero] - 1;
    }
    else
    {
        arma_usuarios["c"+numero] = 0
        arma_usuarios.arma_1_id = "0";
        arma_usuarios["arma_1"] = [];
    }
    usuario_guardar();
    armausuario_guardar();
    repintar_items();
    abrir_items();
}
//_______________________________________________
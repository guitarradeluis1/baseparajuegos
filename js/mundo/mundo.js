var inicio_juego = 0;
var g_pausa = 0;
var velocidad_ini = 35;
var abrir_dialogo_tipo = 0;
var canvas_tanano_x = 480;
var canvas_tanano_x_total = 800;
var canvas_tanano_y = 460;
var puntos = "../../../";
var game = new Phaser.Game(canvas_tanano_x_total, canvas_tanano_y, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{
    var origen = puntos+'archivos/';
    var origen_fijo = puntos+'archivos_fijos/';
    game.load.image('basura', origen_fijo+'basura.png');
    game.load.image('mira', origen_fijo+'mira.png');
    game.load.image('mira_verde', origen_fijo+'mira_verde.png');
    game.load.image('mira_blanca', origen_fijo+'mira_blanca.png');
    game.load.image('fondo_blanco', origen_fijo+'blanco.png');
    game.load.image('fondo_negro', origen_fijo+'negro.png');
    game.load.spritesheet('saobotones', origen_fijo+'saobotones.png', 193, 192);
    game.load.bitmapFont('carrier_command', puntos+'fuentes/carrier_command.png', puntos+'fuentes/carrier_command.xml');
    game.load.bitmapFont('carrier_command_rojo', puntos+'fuentes/carrier_command_rojo.png', puntos+'fuentes/carrier_command.xml');
    for(var precarga in precargas_objetos)
    {
        //console.log(precargas[precarga]);
        if(precargas_objetos[precarga].objetotipo_id == "1" || precargas_objetos[precarga].objetotipo_id== "4" )
        {
            game.load.spritesheet(precargas_objetos[precarga].nombre.toString(), origen+precargas_objetos[precarga].archivo.toString(), parseInt(precargas_objetos[precarga].cortex), parseInt(precargas_objetos[precarga].cortey) );
        }
        else if(precargas_objetos[precarga].objetotipo_id == "2")
        {
            game.load.image(precargas_objetos[precarga].nombre.toString(), origen+precargas_objetos[precarga].archivo.toString() );
        }
        else if(precargas_objetos[precarga].objetotipo_id == "3")
        {
            game.load.audio(precargas_objetos[precarga].nombre.toString(), origen+precargas_objetos[precarga].archivo.toString() );
        }
    }
    //enemigos total
    for(var en in enemigos)
    {
        game.load.spritesheet( enemigos[en].enemigo.objeto.nombre.toString(), origen+enemigos[en].enemigo.objeto.archivo.toString(), parseInt(enemigos[en].enemigo.objeto.cortex), parseInt(enemigos[en].enemigo.objeto.cortey) );
    }
}
/*Inicio de los componentes==============================================================================================*/
var tem_consola;
var conteo_objetos = {};

var personaje;
var limite1, limite2, limite3, limite4;
var key_arriba;
var key_abajo;
var key_izquierda;
var key_derecha;
var seg_funciones = 0;
var seg_posicion = 0;

var mira_verde;
var label_notificar, label_tutorial, label_nivel, label_oro, label_plata;
var btn_salir, button_items, button_status, button_misiones, button_control;
var button_abajo, button_derecha, button_arriba, button_izquierda;

var label_estado_vida, label_estado_nivel, label_estado_velocidad, label_estado_fuerza, label_estado_punteria, label_estado_defensa, btn_estado_puntos;

var btn_basura;
var img_itm_1, img_itm_2, img_itm_2, img_itm_2, img_itm_5, img_itm_6, img_itm_7, img_itm_8;
var btn_itm_1, btn_itm_2, btn_itm_3, btn_itm_4, btn_itm_5, btn_itm_6, btn_itm_7, btn_itm_8;
var btn_lab_1, btn_lab_2, btn_lab_3, btn_lab_4, btn_lab_5, btn_lab_6, btn_lab_7, btn_lab_8;

var linea_separador_1;
var linea_separador_2;

var btn_arm_1, btn_arm_2;

var mis_tit_1;
var mis_lab_1;
var mis_tit_2;
var mis_lab_2;
var mis_btn_can_1;
var mis_btn_can_2;

var dialogo_tit;
var dialogo_lab;
var btn_si;
var btn_no;
var btn_mas;
var btn_menos;
var lable_number;
var val_lable_number;

var contro_interno = {};
var pint_enemigos = {};
var label_jugadores = {};
var label_jugadores_panel = {};
var btn_pint_jugadores = {};

function create()
{
    /*contro_interno.derecha = false;
    contro_interno.izquierda = false;
    contro_interno.arriba = false;
    contro_interno.abajo = false;*/
    
    game.physics.startSystem(Phaser.Physics.ARCADE);
    tem_consola = game.add.sprite(canvas_tanano_x, -5, 'fondo_blanco');
    tem_consola.height = canvas_tanano_x;
    tem_consola.width = canvas_tanano_y;
    tem_consola.campo_id = parseInt(campo.id);
    //Limites---------------------------------------
    limite1 = game.add.sprite(0, -25, 'nulo');
    limite1.width = canvas_tanano_x;
    limite2 = game.add.sprite(0, canvas_tanano_y-5, 'nulo');
    limite2.width = canvas_tanano_x;
    limite3 = game.add.sprite(-25, 0, 'nulo');
    limite3.height = canvas_tanano_y;
    limite4 = game.add.sprite(canvas_tanano_x+3, 0, 'nulo');
    limite4.height = canvas_tanano_y;
    //Pintar fondo pasto-------------------------
    pintar_todo(campo.fondo_dibu.objeto.nombre.toString(), eval(campo.fondo_dibu.cuadros), parseInt(campo.fondo_dibu.velocidad), 32); //parseInt(campo.fondo_dibu.height)
    pintar_bordes(0,campo.limite_arriba_dibujo_dibu.objeto.nombre.toString(), eval(campo.limite_arriba_dibujo_dibu.cuadros), parseInt(campo.limite_arriba_dibujo_dibu.velocidad), 31);
    pintar_bordes(1,campo.limite_abajo_dibujo_dibu.objeto.nombre.toString(), eval(campo.limite_abajo_dibujo_dibu.cuadros), parseInt(campo.limite_abajo_dibujo_dibu.velocidad), 31);
    pintar_bordes(2,campo.limite_derecha_dibujo_dibu.objeto.nombre.toString(), eval(campo.limite_derecha_dibujo_dibu.cuadros), parseInt(campo.limite_derecha_dibujo_dibu.velocidad), 31);
    pintar_bordes(3,campo.limite_izquierda_dibujo_dibu.objeto.nombre.toString(), eval(campo.limite_izquierda_dibujo_dibu.cuadros), parseInt(campo.limite_izquierda_dibujo_dibu.velocidad), 31);
    //Pintando objetos---------------------------
    for(var i in campo_dubujo)
    {
        if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "1" || campo_dubujo[i].dibujo.objeto.objetotipo_id== "4" )
        {
            conteo_objetos["posicion"+(campo_dubujo[i].id)] = "";
            if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "1" || campo_dubujo[i].dibujo.objeto.objetotipo_id== "4" )
            {
                conteo_objetos["posicion"+(campo_dubujo[i].id)] = game.add.sprite( parseInt(campo_dubujo[i].posicionx), parseInt(campo_dubujo[i].posiciony), campo_dubujo[i].dibujo.objeto.nombre.toString());
                conteo_objetos["posicion"+(campo_dubujo[i].id)].height = parseInt(campo_dubujo[i].dibujo.height);
                conteo_objetos["posicion"+(campo_dubujo[i].id)].width = parseInt(campo_dubujo[i].dibujo.width);
                conteo_objetos["posicion"+(campo_dubujo[i].id)].animations.add( campo_dubujo[i].dibujo.texto.toString(), eval(campo_dubujo[i].dibujo.cuadros), parseInt(campo_dubujo[i].dibujo.velocidad), true);
                conteo_objetos["posicion"+(campo_dubujo[i].id)].animations.play(campo_dubujo[i].dibujo.texto.toString());
                //Fisicas campo_dubujo
                if(campo_dubujo[i].dibujo.fisica == "1")
                {game.physics.arcade.enable(conteo_objetos["posicion"+(campo_dubujo[i].id)]);}
                if(campo_dubujo[i].dibujo.immovable == "1")
                {conteo_objetos["posicion"+(campo_dubujo[i].id)].body.immovable = true;}
                //arma
                if(campo_dubujo[i].arma_id != "0")
                {
                    conteo_objetos["posicion"+(campo_dubujo[i].id)].arma = campo_dubujo[i].arma;
                }
            }
            else if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "2")
            {
                game.add.sprite( parseInt(campo_dubujo[i].posicionx), parseInt(campo_dubujo[i].posiciony), campo_dubujo[i].dibujo.objeto.nombre.toString());
            }
            else if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "3")
            {
                conteo_objetos["posicion"+(campo_dubujo[i].id)] = game.add.audio(campo_dubujo[i].dibujo.objeto.nombre.toString());
                conteo_objetos["posicion"+(campo_dubujo[i].id)].allowMultiple = true;
                conteo_objetos["posicion"+(campo_dubujo[i].id)].play();
            }
        }
    }
    //Personaje ---------------------------
    if(personaje_img.objeto.objetotipo.id == "1" || personaje_img.objeto.objetotipo.id == "4" )
    {
        personaje = game.add.sprite( parseInt(Posicion.x), parseInt(Posicion.y), personaje_img.objeto.nombre.toString());
        //Animacion-------------------------------------------
        personaje.animations.add('left', eval(personaje_img.left.cuadros), parseInt(personaje_img.left.velocidad), true);//16
        personaje.animations.add('right', eval(personaje_img.right.cuadros), parseInt(personaje_img.right.velocidad), true);
        personaje.animations.add('down', eval(personaje_img.down.cuadros), parseInt(personaje_img.down.velocidad), true);
        personaje.animations.add('up', eval(personaje_img.up.cuadros), parseInt(personaje_img.up.velocidad), true);
        personaje.animations.add('stop', eval(personaje_img.stop.cuadros), parseInt(personaje_img.stop.velocidad), true);
        personaje.animations.play('stop');
        //-------------------------------------------
        
        game.physics.arcade.enable(personaje);
        personaje.body.velocity.x = 0;
        
        game.physics.arcade.enable(limite1);
        limite1.body.immovable = true;
        game.physics.arcade.enable(limite2);
        limite2.body.immovable = true;
        game.physics.arcade.enable(limite3);
        limite3.body.immovable = true;
        game.physics.arcade.enable(limite4);
        limite4.body.immovable = true;
        
        //Controles-----------------------------
        key_arriba = game.input.keyboard.addKey(Phaser.Keyboard.UP);
        key_abajo = game.input.keyboard.addKey(Phaser.Keyboard.DOWN);
        key_izquierda = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
        key_derecha = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);
    }
    pintar_consola();
    //Items---------------------
    btn_basura  = game.add.button(canvas_tanano_x+240, 90, 'basura', usar_item.basura, this, 5, 5, 5);
    btn_basura.height = 30; btn_basura.width = 30;
    
    label_oro = game.add.text(canvas_tanano_x+240, 140, '000 oro ', { font: '14px Arial', fill: '#FFFF00' });
    label_plata = game.add.text(canvas_tanano_x+240, 155, '000 plata ', { font: '14px Arial', fill: '#BDBDBD' });

    // img_itm_1.loadTexture('saobotones', 0);
    img_itm_1 = game.add.sprite( canvas_tanano_x+20, 90, 'nulo'); img_itm_1.height = 45; img_itm_1.width = 45;
    img_itm_2 = game.add.sprite( canvas_tanano_x+70, 90, 'nulo'); img_itm_2.height = 45; img_itm_2.width = 45;
    img_itm_3 = game.add.sprite( canvas_tanano_x+120, 90, 'nulo'); img_itm_3.height = 45; img_itm_3.width = 45;
    img_itm_4 = game.add.sprite( canvas_tanano_x+170, 90, 'nulo'); img_itm_4.height = 45; img_itm_4.width = 45;
    img_itm_5 = game.add.sprite( canvas_tanano_x+20, 160, 'nulo'); img_itm_5.height = 45; img_itm_5.width = 45;
    img_itm_6 = game.add.sprite( canvas_tanano_x+70, 160, 'nulo'); img_itm_6.height = 45; img_itm_6.width = 45;
    img_itm_7 = game.add.sprite( canvas_tanano_x+120, 160, 'nulo'); img_itm_7.height = 45; img_itm_7.width = 45;
    img_itm_8 = game.add.sprite( canvas_tanano_x+170, 160, 'nulo'); img_itm_8.height = 45; img_itm_8.width = 45;
    
    btn_itm_1 = game.add.button(canvas_tanano_x+20, 90, 'mira_blanca', usar_item.uno, this, 0, 0, 0); btn_itm_1.height = 45; btn_itm_1.width = 45;
    btn_itm_2 = game.add.button(canvas_tanano_x+70, 90, 'mira_blanca', usar_item.dos, this, 0, 0, 0); btn_itm_2.height = 45; btn_itm_2.width = 45;
    btn_itm_3 = game.add.button(canvas_tanano_x+120, 90, 'mira_blanca', usar_item.tres, this, 0, 0, 0); btn_itm_3.height = 45; btn_itm_3.width = 45;
    btn_itm_4 = game.add.button(canvas_tanano_x+170, 90, 'mira_blanca', usar_item.cuatro, this, 0, 0, 0); btn_itm_4.height = 45; btn_itm_4.width = 45;
    btn_itm_5 = game.add.button(canvas_tanano_x+20, 160, 'mira_blanca', usar_item.cinco, this, 0, 0, 0); btn_itm_5.height = 45; btn_itm_5.width = 45;
    btn_itm_6 = game.add.button(canvas_tanano_x+70, 160, 'mira_blanca', usar_item.seis, this, 0, 0, 0); btn_itm_6.height = 45; btn_itm_6.width = 45;
    btn_itm_7 = game.add.button(canvas_tanano_x+120, 160, 'mira_blanca', usar_item.siete, this, 0, 0, 0); btn_itm_7.height = 45; btn_itm_7.width = 45;
    btn_itm_8 = game.add.button(canvas_tanano_x+170, 160, 'mira_blanca', usar_item.ocho, this, 0, 0, 0); btn_itm_8.height = 45; btn_itm_8.width = 45;
    
    btn_lab_1 = game.add.text(canvas_tanano_x+20, 140, '00', { font: '20px Arial', fill: '#FDFCFC' });//#000000
    btn_lab_2 = game.add.text(canvas_tanano_x+70, 140, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_3 = game.add.text(canvas_tanano_x+120, 140, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_4 = game.add.text(canvas_tanano_x+170, 140, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_5 = game.add.text(canvas_tanano_x+20, 210, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_6 = game.add.text(canvas_tanano_x+70, 210, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_7 = game.add.text(canvas_tanano_x+120, 210, '00', { font: '20px Arial', fill: '#FDFCFC' });
    btn_lab_8 = game.add.text(canvas_tanano_x+170, 210, '00', { font: '20px Arial', fill: '#FDFCFC' });
    mira_verde = game.add.sprite( -500, -500, 'mira_verde'); mira_verde.height = 45; mira_verde.width = 45;
    linea_separador_1 = game.add.text(canvas_tanano_x+10, 210, '______________________\n Armas.', { font: '20px Arial', fill: '#BDBDBD' });
    
    btn_arm_1 = game.add.button(canvas_tanano_x+40, 257, 'fondo', usar_arma.uno, this); btn_arm_1.height = 45; btn_arm_1.width = 45;
    btn_arm_2 = game.add.button(canvas_tanano_x+160, 257, 'fondo', usar_arma.dos, this); btn_arm_2.height = 45; btn_arm_2.width = 45;
    linea_separador_2 = game.add.text(canvas_tanano_x+10, 290, '______________________\n Ataques.', { font: '20px Arial', fill: '#BDBDBD' });
    
    //mouse, normal, click
    btn_atk_1  = game.add.button(canvas_tanano_x+20, 340, 'saobotones', usar_atk.uno, this, 15, 16, 16); btn_atk_1.height = 45; btn_atk_1.width = 45;
    btn_atk_2  = game.add.button(canvas_tanano_x+80, 340, 'saobotones', usar_atk.dos, this, 24, 25, 25); btn_atk_2.height = 45; btn_atk_2.width = 45;
    btn_atk_3  = game.add.button(canvas_tanano_x+140, 340, 'saobotones', usar_atk.tres, this, 33, 34, 34); btn_atk_3.height = 45; btn_atk_3.width = 45;
    
    mis_tit_1 = game.add.text(canvas_tanano_x+35, 90, 'titulo', { font: '20px Arial', fill: '#31B404' });
    mis_lab_1 = game.add.text(canvas_tanano_x+25, 120, 'textossss \ndasdasdas', { font: '18px Arial', fill: '#FDFCFC' });
    mis_btn_can_1 = game.add.button(canvas_tanano_x+5, 90, 'basura', mision_cancelar.uno, this, 5, 5, 5);
    mis_btn_can_1.height = 20; mis_btn_can_1.width = 20;
    mis_tit_2 = game.add.text(canvas_tanano_x+35, 240, 'titulo', { font: '20px Arial', fill: '#31B404' });
    mis_lab_2 = game.add.text(canvas_tanano_x+25, 270, 'textossss \ndasdasdas', { font: '18px Arial', fill: '#FDFCFC' });
    mis_btn_can_2 = game.add.button(canvas_tanano_x+5, 240, 'basura', mision_cancelar.dos, this, 5, 5, 5);
    mis_btn_can_2.height = 20; mis_btn_can_2.width = 20;
    
    label_estado_vida = game.add.text(canvas_tanano_x+25, 90, 'Vida: ', { font: '20px Arial', fill: '#FDFCFC' });
    label_estado_nivel = game.add.text(canvas_tanano_x+25, 120, 'Nivel: ', { font: '20px Arial', fill: '#FDFCFC' });
    label_estado_velocidad = game.add.text(canvas_tanano_x+25, 150, 'Velocidad: ', { font: '20px Arial', fill: '#FDFCFC' });
    label_estado_fuerza = game.add.text(canvas_tanano_x+25, 180, 'Fuerza: ', { font: '20px Arial', fill: '#FDFCFC' });
    label_estado_punteria = game.add.text(canvas_tanano_x+25, 210, 'Punteria: ', { font: '20px Arial', fill: '#FDFCFC' });
    label_estado_defensa = game.add.text(canvas_tanano_x+25, 240, 'Defensa: ', { font: '20px Arial', fill: '#FDFCFC' });
    //btn_estado_puntos = game.add.button(canvas_tanano_x+25, 270, 'saobotones', dialogo.puntos, this, 78, 79, 79);
    //btn_estado_puntos.height = 30; btn_estado_puntos.width = 30;
    
    dialogo_tit = game.add.text(canvas_tanano_x+15, 90, 'titulo dialogo', { font: '20px Arial', fill: '#31B404' });
    dialogo_lab = game.add.text(canvas_tanano_x+25, 120, 'textossss \ndasdasdas', { font: '18px Arial', fill: '#FDFCFC' });
    
    button_derecha = game.add.button(canvas_tanano_x+230, 190, 'saobotones', '', this, 76, 77, 76);//mouse, normal, click
    button_derecha.height = 55; button_derecha.width = 55;
    /*button_derecha.onInputOver.add(controlvirtual.derecha, this);//coloca mouse
    button_derecha.onInputUp.add(controlvirtual.derecha, this);// click
    button_derecha.onInputOut.add(controlvirtual.soltar, this);//retira mouse */
    //button_control.angle += 90;
    button_abajo = game.add.button(canvas_tanano_x+190, 270, 'saobotones', '', this, 76, 77, 76);//mouse, normal, click
    button_abajo.height = 55; button_abajo.width = 55;
    button_abajo.angle += 90;
    
    button_izquierda = game.add.button(canvas_tanano_x+100, 245, 'saobotones', '', this, 76, 77, 76);//mouse, normal, click
    button_izquierda.height = 55; button_izquierda.width = 55;
    button_izquierda.angle += 180;
    
    button_arriba = game.add.button(canvas_tanano_x+150, 110, 'saobotones', '', this, 76, 77, 76);//mouse, normal, click
    button_arriba.height = 55; button_arriba.width = 55;
    button_arriba.angle += 30;
    //mouse, normal, click
    btn_si  = game.add.button(canvas_tanano_x+20, 330, 'saobotones', dialogo.si, this, 78, 79, 79);
    btn_no  = game.add.button(canvas_tanano_x+80, 330, 'saobotones', dialogo.no, this, 87, 88, 88);
    btn_si.height = 40; btn_si.width = 40; btn_no.height = 40; btn_no.width = 40;
    btn_mas = game.add.button(canvas_tanano_x+20, 330, 'saobotones', dialogo.suma, this, 31, 32, 31);
    btn_menos = game.add.button(canvas_tanano_x+110, 330, 'saobotones', dialogo.resta, this, 67, 68, 67);
    btn_mas.height = 40; btn_mas.width = 40; btn_menos.height = 40; btn_menos.width = 40;
    lable_number = game.add.text(canvas_tanano_x+70, 335, '00 ', { font: '30px Arial', fill: '#02E120' });
    
    game.add.text(canvas_tanano_x+10, 372, '______________________', { font: '20px Arial', fill: '#BDBDBD' });
    
    abrir_items();
    //Pintando enemigos--------------------------
    for(var en in enemigos)
    {
        var temp_x = Math.floor(Math.random() * (40 - canvas_tanano_x)) + canvas_tanano_x;
        var temp_y = Math.floor(Math.random() * (60 - canvas_tanano_y)) + canvas_tanano_y;
        //game.load.spritesheet( enemigos[en].enemigo.objeto.nombre.toString(), origen+enemigos[en].enemigo.objeto.archivo.toString(), parseInt(enemigos[en].enemigo.objeto.cortex), parseInt(enemigos[en].enemigo.objeto.cortey) );
        pint_enemigos[en] = game.add.sprite(temp_x, temp_y, enemigos[en].enemigo.objeto.nombre.toString());
        //Direcionamiento ------------------------------------
        pint_enemigos[en].tipo_moviemiento = parseInt(enemigos[en].enemigo.movimientos.id);
        // 1 = quieto | 2 = arriba abajo | 3 = derecha izquierda | 4 = aleatorio | 5 = ataque | 6 = defensa
        pint_enemigos[en].direccion = 0; // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda 
        pint_enemigos[en].velocidad = enemigos[en].enemigo.velocidad;
        pint_enemigos[en].enemigo_id = enemigos[en].enemigo.id;
        pint_enemigos[en].movomiento = true;
        if(enemigos[en].ia)
        {
            pint_enemigos[en].ia = enemigos[en].ia;
        }
        //Animacion-------------------------------------------
        pint_enemigos[en].animations.add('left', eval(enemigos[en].enemigo.left.cuadros), parseInt(enemigos[en].enemigo.left.velocidad), true);//16
        pint_enemigos[en].animations.add('right', eval(enemigos[en].enemigo.right.cuadros), parseInt(enemigos[en].enemigo.right.velocidad), true);
        pint_enemigos[en].animations.add('down', eval(enemigos[en].enemigo.down.cuadros), parseInt(enemigos[en].enemigo.down.velocidad), true);
        pint_enemigos[en].animations.add('up', eval(enemigos[en].enemigo.up.cuadros), parseInt(enemigos[en].enemigo.up.velocidad), true);
        pint_enemigos[en].animations.add('stop', eval(enemigos[en].enemigo.stop.cuadros), parseInt(enemigos[en].enemigo.stop.velocidad), true);
        pint_enemigos[en].animations.play('stop');
    }
    for(var en in enemigos)
    {
        game.physics.arcade.enable(pint_enemigos[en]);
        pint_enemigos[en].body.velocity.x = 0;
    }
    //Pinta texto de jugadores conectados---------
    for(en = 0; en < 10; en++)
    {
        label_jugadores_panel[en] = game.add.sprite(-500, -500, 'fondo_negro');
        label_jugadores_panel[en].width = 33; label_jugadores_panel[en].height = 15;
        label_jugadores[en] = game.add.text(-500, -500, 'ERROR', { font: '16px Arial', fill: '#00FF00' });
        //label_jugadores[en] = game.add.bitmapText(-500, -500, 'carrier_command', "", 9);
        //pint_jugadores[en] = game.add.button(20, 40, 'saobotones', dialogo.si, this, 78, 79, 79);
    }
    //---------------------------------
    game.time.events.loop(Phaser.Timer.SECOND, movimiento_enemigo, this);
    game.time.events.loop(Phaser.Timer.SECOND, segundero, this);//cronometro por segundo canvas_tanano_x+12, canvas_tanano_y
    //console.log(conteo_objetos);
}
/*Cambio de los componenete==============================================================================================*/
function update()
{
    //Colicion--------------------------------------------------
    game.physics.arcade.collide(personaje, limite1);
    game.physics.arcade.collide(personaje, limite2);
    game.physics.arcade.collide(personaje, limite3);
    game.physics.arcade.collide(personaje, limite4);
    //Enemigo coicion-------------------------------------------
    for(var en in enemigos)
    {
        game.physics.arcade.collide(personaje, pint_enemigos[en], function(){
            if(pint_enemigos[en].ia.id)
            {
                pint_enemigos[en].movomiento = false;
                dialogoIA(pint_enemigos[en].ia);
                setInterval(function(){ pint_enemigos[en].movomiento = true; }, 3000);
            }
            else
            {pelea(pint_enemigos[en].enemigo_id);}
        });
        game.physics.arcade.collide(pint_enemigos[en], limite1);
        game.physics.arcade.collide(pint_enemigos[en], limite2);
        game.physics.arcade.collide(pint_enemigos[en], limite3);
        game.physics.arcade.collide(pint_enemigos[en], limite4);
        for(var en_2 in enemigos)
        {
            game.physics.arcade.collide(pint_enemigos[en], pint_enemigos[en_2]);
        }
    }
    for(var i in campo_dubujo)
    {
        if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "1" || campo_dubujo[i].dibujo.objeto.objetotipo_id== "4" )
        {
            if(campo_dubujo[i].dibujo.objeto.objetotipo_id == "1" || campo_dubujo[i].dibujo.objeto.objetotipo_id== "4" )
            {
                //Colicion-----
                game.physics.arcade.collide(conteo_objetos["posicion"+(campo_dubujo[i].id)], limite1);
                game.physics.arcade.collide(conteo_objetos["posicion"+(campo_dubujo[i].id)], limite2);
                game.physics.arcade.collide(conteo_objetos["posicion"+(campo_dubujo[i].id)], limite3);
                game.physics.arcade.collide(conteo_objetos["posicion"+(campo_dubujo[i].id)], limite4);
                //Fisicas campo_dubujo
                //this.game.physics.arcade.collide(player.sprite, this.enemies, function(){    player.killEnemy(score);}, null, player);
                if(campo_dubujo[i].funciones_id == "0" && campo_dubujo[i].ia_id != "0")// IA
                {
                    if(seg_funciones >= 0)
                    {
                        game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)],
                        function()
                        {
                            seg_funciones = -3;
                            label_control("IA");
                            colision_ia(parseInt(campo_dubujo[i].ia_id));
                        });
                    }
                    else
                    {game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)] );}
                }
                else if(campo_dubujo[i].funciones_id != "0" && campo_dubujo[i].ia_id == "0")// FUNCIONES
                {
                    if(seg_funciones >= 0)
                    {
                        game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)],
                        function()
                        {
                            seg_funciones = -3;
                            label_control("FP");
                            if(campo_dubujo[i].parametros == "" && campo_dubujo[i].arma_id == 0)
                            {eval(campo_dubujo[i].funciones.nombre+"();");}
                            else if(campo_dubujo[i].parametros == "" && campo_dubujo[i].arma_id != 0)// armas
                            {
                                eval(campo_dubujo[i].funciones.nombre+"("+JSON.stringify(campo_dubujo[i].arma)+");");
                                conteo_objetos["posicion"+(campo_dubujo[i].id)].destroy();
                            }
                            else
                            {eval(campo_dubujo[i].funciones.nombre+"("+campo_dubujo[i].parametros+");");}
                            //ajax("../../ingreso/cargar_estatus/"+tem_aleatorio, "div_escondido");
                        });
                    }
                    else
                    {game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)] );}
                }
                else if(campo_dubujo[i].funciones_id == "0" && campo_dubujo[i].ia_id == "0" && campo_dubujo[i].campo_destino != "0"  )// DESTINO
                {
                    game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)],
                    function()
                    {
                        tem_consola.campo_id = campo_dubujo[i].campo_destino;
                        jQuery.ajax
                        ({
                            type: "POST",
                            url: "../../ingreso/actualiza_ubucacion/"+tem_consola.campo_id+"/"+parseInt(campo_dubujo[i].posicionx)+"/"+parseInt(campo_dubujo[i].posiciony),
                            beforeSend: function()
                            {
                                jQuery('#canvas').html("Cargando nivel...");
                                jQuery('#div_imgcarga').show();
                            },
                            success: function(msg)
                            {
                                //window.location.reload();
                                //var tem_aleatorio = Math.random()*1000000;
                                var Digital = new Date();
                                var hours = Digital.getHours();
                                window.location.href = '../../ingreso/mundo/'+hours;
                                /*var tem_aleatorio = Math.random()*1000000;
                                ajax("../../ingreso/mundo_carga/"+tem_aleatorio, "div_escondido");*/
                            }
                        });
                        label_control("R");
                    });
                }
                else
                {
                    game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)] );
                }
                //--------
            }
        }
        //Enemigo------
        for(var en in enemigos)
        {
            game.physics.arcade.collide(pint_enemigos[en], conteo_objetos["posicion"+(campo_dubujo[i].id)]);
        }
    }
    //Controles Movimientos ------------------------------------
    if (key_arriba.isDown)
    {
        personaje.body.velocity.y = -velocidad_ini;
    }
    else if (key_abajo.isDown)
    {
        personaje.body.velocity.y = velocidad_ini;
    }
    else
    {
        personaje.body.velocity.y = 0; 
    }
    
    if (key_izquierda.isDown)
    {
        personaje.body.velocity.x = -velocidad_ini;
    }
    else if (key_derecha.isDown)
    {
        personaje.body.velocity.x = velocidad_ini;
    }
    else
    {
        personaje.body.velocity.x = 0;
    }
    //Controle Animacio ------------------------------------
    if (key_izquierda.isDown)
    {
        personaje.animations.play('left');
    }
    else if (key_derecha.isDown)
    {
        personaje.animations.play('right');
    }
    else if (key_abajo.isDown)
    {
        personaje.animations.play('down');
    }
    else if (key_arriba.isDown)
    {
        personaje.animations.play('up');
    }
    else
    {
        personaje.animations.stop();
    }
    //control virtual------
    /*
    if(contro_interno.izquierda == true)
    {
        personaje.animations.play('left');
        personaje.body.velocity.x = -velocidad_ini;
    }
    else if(contro_interno.derecha == true)
    {
        personaje.animations.play('right');
        personaje.body.velocity.x = velocidad_ini;
    }
    else if(contro_interno.abajo == true)
    {
        personaje.body.velocity.y = velocidad_ini;
        personaje.animations.play('down');
    }
    else if(contro_interno.arriba == true)
    {
        personaje.body.velocity.y = -velocidad_ini;
        personaje.animations.play('up');
    }*/
}
/*========================================================================================================================*/
function segundero()
{
    seg_funciones++;
    seg_posicion++;
    if(seg_posicion == 2)
    {label_control("");}
    else if(seg_posicion == 5)
    {
        label_control("AP");
        ajax("../../ingreso/actualiza_ubucacion/"+parseInt(campo.id)+"/"+personaje.position.x+"/"+personaje.position.y , "");
    }
    else if(seg_posicion == 10)
    {
        seg_posicion = 0;
        label_control("JU");
        var tem_aleatorio = Math.random()*1000000;
        ajax("../../ingreso/cargar_estatus/"+campo.id+"/"+tem_aleatorio, "div_escondido");
    }
    //console.log(seg_funciones+","+seg_posicion);
}
//--------------------------------
function pelea(id)
{
    console.log(`peleaaa .... ${id}`);
    let maximo = enemigos.length;
    jQuery.ajax
    ({
        type: "POST",
        url: "../../ingreso/actualiza_ubucacion/"+tem_consola.campo_id+"/"+parseInt(personaje.position.x)+"/"+parseInt(personaje.position.y),
        beforeSend: function()
        {
            jQuery('#canvas').html("Cargando nivel...");
            jQuery('#div_imgcarga').show();
        },
        success: function(msg)
        {
            //window.location.reload();
            //var tem_aleatorio = Math.random()*1000000;
            var Digital = new Date();
            var hours = Digital.getHours();
            window.location.href = `../../ingreso/pelea/${id}/${maximo}`;
        }
    });
}
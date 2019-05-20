var inicio_juego = 0;
var g_pausa = 0;
var velocidad_ini = 35;
var abrir_dialogo_tipo = 0;
var canvas_tanano_x = 480;
var canvas_tanano_x_total = 800;
var canvas_tanano_y = 460;
var puntos = "../../../../";
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
    game.load.image('buton_azul', origen_fijo+'buton_azul.png');
    
    game.load.spritesheet('efectosBatalla', origen_fijo+'efectosBatalla.png', 50, 50);
    game.load.spritesheet('flechaAlerta', origen_fijo+'flechaAlerta.png', 50, 50);
    game.load.spritesheet('saobotones', origen_fijo+'saobotones.png', 193, 192);
    game.load.spritesheet('triangulo', origen_fijo+'triangulo.png', 100, 100);
    game.load.spritesheet('marcadores', origen_fijo+'marcadores.png', 100, 100, 4);
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
    enemigo_1.vida = parseInt(enemigo_1.vida);
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
var btn_atacar;

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


let recuadro;
let obj_enemigos_1 = {};
let obj_enemigos_2 = {};
let obj_enemigos_3 = {};


let btn_atacar_e;
let btn_atacar_2;
let btn_atacar_3;
var label_acciones;
var label_menos_vida_u;
var label_menos_vida_e1;

let flechaAlerta = [];
let efectosBatalla = [];
let esperaAtkCargado = 0;
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
    //Enemigos ---------------------------- obj_enemigos_1
    btn_atacar_e = game.add.sprite( parseInt(140), parseInt(190), `saobotones`);
    btn_atacar_e.animations.add('uno', [15, 16], 1, true);
    btn_atacar_e.animations.add('dos', [24, 25], 1, true);
    btn_atacar_e.animations.add('tres', [33, 34], 1, true);
    btn_atacar_e.animations.add('espera', [58, 59], 1, true);;
    btn_atacar_e.animations.play('espera');
    btn_atacar_e.height = 45; btn_atacar_e.width = 45;
    
    btn_atacar_j = game.add.sprite( parseInt(290), parseInt(190), `saobotones`);
    btn_atacar_j.animations.add('uno', [15, 16], 1, true);
    btn_atacar_j.animations.add('dos', [24, 25], 1, true);
    btn_atacar_j.animations.add('tres', [33, 34], 1, true);
    btn_atacar_j.animations.add('espera', [58, 59], 1, true);
    btn_atacar_j.animations.play('espera');
    btn_atacar_j.height = 45; btn_atacar_j.width = 45;
    
    btn_atacar_posision  = game.add.button( 370, 260, 'saobotones', obj_atk.defender, this, 51, 52, 51); 
    btn_atacar_posision.height = 45; btn_atacar_posision.width = 45;
    
    obj_enemigos_1 = game.add.sprite( parseInt(70), parseInt(180), enemigo_1.objeto.nombre.toString());
    obj_enemigos_1.animations.add('right', eval(enemigo_1.right.cuadros), parseInt(enemigo_1.right.velocidad), true);
    
    obj_enemigos_1.animations.add('left', eval(enemigo_1.left.cuadros), parseInt(enemigo_1.left.velocidad), true);
    obj_enemigos_1.animations.add('right', eval(enemigo_1.right.cuadros), parseInt(enemigo_1.right.velocidad), true);
    obj_enemigos_1.animations.add('down',  eval(enemigo_1.down.cuadros), parseInt(enemigo_1.down.velocidad), true);
    obj_enemigos_1.animations.add('up', eval(enemigo_1.up.cuadros), parseInt(enemigo_1.up.velocidad), true);
    obj_enemigos_1.animations.play('right');
    
    triangulo_atk_1 = game.add.sprite( parseInt(47), parseInt(166), `triangulo`);
    triangulo_atk_1.animations.add('cero', [0], 1, true);
    triangulo_atk_1.animations.add('uno', [1], 1, true);
    triangulo_atk_1.animations.add('dos', [2], 1, true);
    triangulo_atk_1.animations.add('tres', [3], 1, true);
    triangulo_atk_1.animations.play('cero');
    triangulo_atk_1.height = 80; triangulo_atk_1.width = 80;
    //Personaje ---------------------------
    if(personaje_img.objeto.objetotipo.id == "1" || personaje_img.objeto.objetotipo.id == "4" )
    {
        personaje = game.add.sprite( parseInt(370), parseInt(180), personaje_img.objeto.nombre.toString());
        //Animacion-------------------------------------------
        personaje.animations.add('left', eval(personaje_img.left.cuadros), parseInt(personaje_img.left.velocidad), true);
        personaje.animations.add('right', eval(personaje_img.right.cuadros), parseInt(personaje_img.right.velocidad), true);
        personaje.animations.add('down', eval(personaje_img.down.cuadros), parseInt(personaje_img.down.velocidad), true);
        personaje.animations.add('up', eval(personaje_img.up.cuadros), parseInt(personaje_img.up.velocidad), true);
        personaje.animations.add('stop', eval(personaje_img.stop.cuadros), parseInt(personaje_img.stop.velocidad), true);
        personaje.animations.play('left');
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
    btn_atk_1  = game.add.button(canvas_tanano_x+20, 340, 'saobotones', obj_atk.uno, this, 15, 16, 16); 
    btn_atk_1.height = 45; btn_atk_1.width = 45;
    btn_atk_2  = game.add.button(canvas_tanano_x+80, 340, 'saobotones', obj_atk.dos, this, 24, 25, 25); 
    btn_atk_2.height = 45; btn_atk_2.width = 45;
    btn_atk_3  = game.add.button(canvas_tanano_x+140, 340, 'saobotones', obj_atk.tres, this, 33, 34, 34); 
    btn_atk_3.height = 45; btn_atk_3.width = 45;
    
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
    recuadro = game.add.sprite(55, 380, 'fondo_blanco');
    recuadro.height = 60;
    recuadro.width = 400;
    
    btn_atacar = game.add.button(375, 340, 'buton_azul', obj_atk.atacar);
    btn_atacar.width = 80;
    btn_atacar.height = 40;
    game.add.text(380, 352, 'ATACAR ', { font: '18px Arial', fill: '#000000' });
    
    flechaAlerta[0] = game.add.sprite( -420, -270, `flechaAlerta`);
    flechaAlerta[0].animations.add('a', [0, 1], 3, true);
    flechaAlerta[0].animations.play('a');
    flechaAlerta[0].width = 30; flechaAlerta[0].height = 30;
    
    flechaAlerta[1] = game.add.sprite( -670, -345, `flechaAlerta`);
    flechaAlerta[1].animations.add('a', [0, 1], 3, true);
    flechaAlerta[1].animations.play('a');
    flechaAlerta[1].width = 30; flechaAlerta[1].height = 30;
    
    efectosBatalla[0] = game.add.sprite( -200, 120, `efectosBatalla`);
    efectosBatalla[0] .animations.add('0', [0, 1, 2, 3, 4], 1, true);
    efectosBatalla[0] .animations.add('1', [5, 6, 7, 8, 9], 1, true);
    efectosBatalla[0] .animations.add('2', [10, 11, 12, 13, 14], 1, true);
    efectosBatalla[0] .animations.add('3', [15, 16, 17, 18, 19], 1, true);
    efectosBatalla[0] .animations.add('4', [20, 21, 22, 23, 24], 1, true);
    efectosBatalla[0] .animations.add('5', [25, 26, 27, 28, 29], 1, true);
    efectosBatalla[0] .animations.add('6', [30, 31, 32, 33, 34], 1, true);
    efectosBatalla[0] .animations.add('calabera', [35, 36], 1, true);
    efectosBatalla[0] .animations.play('calabera');
    efectosBatalla[0] .width = 70; efectosBatalla[0] .height = 70;
    
    efectosBatalla[1] = game.add.sprite( -200, 200, `efectosBatalla`);
    efectosBatalla[1] .animations.add('0', [0, 1, 2, 3, 4], 1, true);
    efectosBatalla[1] .animations.add('1', [5, 6, 7, 8, 9], 1, true);
    efectosBatalla[1] .animations.add('2', [10, 11, 12, 13, 14], 1, true);
    efectosBatalla[1] .animations.add('3', [15, 16, 17, 18, 19], 1, true);
    efectosBatalla[1] .animations.add('4', [20, 21, 22, 23, 24], 1, true);
    efectosBatalla[1] .animations.add('5', [25, 26, 27, 28, 29], 1, true);
    efectosBatalla[1] .animations.add('6', [30, 31, 32, 33, 34], 1, true);
    efectosBatalla[1] .animations.add('calabera', [35, 36], 1, true);
    efectosBatalla[1] .animations.play('calabera');
    efectosBatalla[1] .width = 75; efectosBatalla[1] .height = 75;
    
    //Triangulo------------------------
    triangulo_def = game.add.sprite( parseInt(346), parseInt(166), `triangulo`);
    triangulo_def.animations.add('cero', [0], 1, true);
    triangulo_def.animations.add('uno', [1], 1, true);
    triangulo_def.animations.add('dos', [2], 1, true);
    triangulo_def.animations.add('tres', [3], 1, true);
    triangulo_def.animations.play('cero');
    triangulo_def.height = 80; triangulo_def.width = 80;
    label_acciones =  game.add.text(72, 385, 'ESPERANDO... \n', { font: '16px Arial', fill: '#0425F5' });
    label_menos_vida_e1 =  game.add.text(65, 140, '', { font: '20px Arial bold', fill: '#FF0303' });
    label_menos_vida_e1.fontWeight = 'bold';
    label_menos_vida_u =  game.add.text(360, 140, '', { font: '20px Arial bold', fill: '#FF0303' });
    label_menos_vida_u.fontWeight = 'bold';
    
    //---------------------------------
    ajax("../../cargar_estatus/"+campo.id+"/1", "div_escondido");
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
                            ajax("../../cargar_estatus/"+campo.id+"/1", "div_escondido");
                            //ajax("../../ingreso/cargar_estatus/"+tem_aleatorio, "div_escondido");
                        });
                    }
                    else
                    {game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)] );}
                }
                else if(campo_dubujo[i].funciones_id == "0" && campo_dubujo[i].ia_id == "0" && campo_dubujo[i].campo_destino != "0"  )// DESTINO
                {/*
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
                            }
                        });
                        label_control("R");
                    });*/
                }
                else
                {
                    game.physics.arcade.collide(personaje, conteo_objetos["posicion"+(campo_dubujo[i].id)] );
                }
                //--------
            }
        }
    }
    //Controles Movimientos ------------------------------------
    
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
        //label_control("AP");
        //ajax("../../ingreso/actualiza_ubucacion/"+parseInt(campo.id)+"/"+personaje.position.x+"/"+personaje.position.y , "");
    }
    else if(seg_posicion == 10)
    {
        seg_posicion = 0;
        label_control("JU");
        var tem_aleatorio = Math.random()*1000000;
        ajax("../../cargar_estatus/"+campo.id+"/1", "div_escondido");
    }
    //console.log(seg_funciones+","+seg_posicion);
}
//-------------------------------- enemigo_1.vida

var obj_atk =
{
    posicion_defensa: 0,
    tipo: 0,
    uno: ()=>{
        label_acciones.setText(`Ataque normal`);
        obj_atk.asignarPosicion(`uno`);
        obj_atk.tipo = 1;
    },
    dos: ()=>{
        label_acciones.setText(`Ataque cargado`);
        obj_atk.asignarPosicion(`dos`);
        obj_atk.tipo = 2;
    },
    tres: ()=>{
        if(Usuario.arma2)
        {
            label_acciones.setText(`Ataque especial`);
            obj_atk.asignarPosicion(`tres`);
            obj_atk.tipo = 3;
        }
        else
        {
            label_acciones.setText(`No tienes arma secundaria!`);
            obj_atk.asignarPosicion(`espera`);
            obj_atk.tipo = 0;
        }
    },
    asignarPosicion: p=>{
        btn_atacar_j.animations.play(`${p}`);
    },
    defender: ()=>{
        obj_atk.posicion_defensa = obj_atk.posicion_defensa + 1;
        if(obj_atk.posicion_defensa > 3)
        {obj_atk.posicion_defensa = 1;}
        if(obj_atk.posicion_defensa == 1)
        {triangulo_def.animations.play('uno');}
        else if(obj_atk.posicion_defensa == 2)
        {triangulo_def.animations.play('dos');}
        else if(obj_atk.posicion_defensa == 3)
        {triangulo_def.animations.play('tres');}
    },
    atacar: ()=>{
        if(obj_atk.tipo == 0 || obj_atk.posicion_defensa == 0)
        {
            flechaAlerta[0].position.x = 420;
            flechaAlerta[0].position.y = 270;
            flechaAlerta[1].position.x = 670;
            flechaAlerta[1].position.y = 345;
            label_acciones.setText(`Selecciona la posicion y el tipo de ataque`);
        }
        else
        {
            label_acciones.setText(``);
            flechaAlerta[0].position.x = -420;
            flechaAlerta[1].position.x = -670;
            efectosBatalla[0].position.x = 200;
            efectosBatalla[1].position.x = 200;
            label_menos_vida_u.setText(``);
            label_menos_vida_e1.setText(``);
            btn_atacar_j.animations.play('espera');
            triangulo_def.animations.play('cero');
            if(esperaAtkCargado>0)
            {
                esperaAtkCargado = esperaAtkCargado -1;
                btn_atk_2.position.x = -900;
            }
            else
            {btn_atk_2.position.x = canvas_tanano_x+80;}
            var tempTipo = Math.floor((Math.random() * 5) + 1);
            if(tempTipo == 1 || tempTipo == 4 || tempTipo == 5)
            {
                btn_atacar_e.animations.play('uno');
                tempTipo = 1;
            }
            else if(tempTipo == 2)
            {btn_atacar_e.animations.play('dos');}
            else if(tempTipo == 3)
            {btn_atacar_e.animations.play('tres');}
            
            var tempPosicion = Math.floor((Math.random() * 3) + 1);
            if(tempPosicion == 1)
            {triangulo_atk_1.animations.play('uno');}
            else if(tempPosicion == 2)
            {triangulo_atk_1.animations.play('dos');}
            else if(tempPosicion == 3)
            {triangulo_atk_1.animations.play('tres');}
            
            if(tempPosicion == obj_atk.posicion_defensa) //Si las posiciones coinsiden 
            {
                efectosBatalla[0] .animations.play('0');
                if(tempTipo == 1)//atk normal
                {
                    switch(obj_atk.tipo)
                    {
                        case 1: //atk jugador normal
                            label_acciones.setText(`Ataque anulado`);
                            efectosBatalla[1].position.x = -200;
                        break;
                        case 2: //atk jugador cargado
                            label_acciones.setText(`Contra golpe \ndaño al ${enemigo_1.nombre}`);
                            efectosBatalla[1] .animations.play('4');
                            btn_atk_2.position.x = -900;
                            obj_atk.danoEnemigo(2);
                        break;
                        case 3: //atk jugador espacial
                            label_acciones.setText(`Pendiente....`);
                            efectosBatalla[1] .animations.play('2');
                            obj_atk.danoEnemigo(3);
                            obj_atk.danoUsuario(3);
                        break;
                    }
                }
                else if(tempTipo == 2)//atk cargado
                {
                    switch(obj_atk.tipo)
                    {
                        case 1: //atk jugador normal
                            label_acciones.setText(`Contra golpe \ndaño al ${Usuario.nombre}`);
                            efectosBatalla[0] .animations.play('3');
                            efectosBatalla[1] .animations.play('4');
                            obj_atk.danoUsuario(1);
                        break;
                        case 2: //atk jugador cargado
                            label_acciones.setText(`Daño masivo \n${Usuario.nombre} \n${enemigo_1.nombre}`);
                            efectosBatalla[0] .animations.play('1');
                            efectosBatalla[1] .animations.play('2');
                            btn_atk_2.position.x = -900;
                            obj_atk.danoEnemigo(2);
                            obj_atk.danoUsuario(2);
                        break;
                        case 3: //atk jugador espacial
                            label_acciones.setText(`Pendiente....`);
                            efectosBatalla[0].position.x = -200;
                            efectosBatalla[1].position.x = -200;
                        break;
                    }
                }
                else if(tempTipo == 3)//atk Especial
                {
                    switch(obj_atk.tipo)
                    {
                        case 1: //atk jugador normal
                            //enemigo_1.dano_max * 2;
                            label_acciones.setText(`Golpe Especial ${enemigo_1.nombre} \ndaño al ${Usuario.nombre}`);
                            efectosBatalla[0] .animations.play('3');
                            efectosBatalla[1] .animations.play('4');
                            obj_atk.danoEnemigo(3);
                            obj_atk.danoUsuario(1);
                        break;
                        case 2: //atk jugador cargado
                            //enemigo_1.dano_max * 2 - (especial/2);
                            label_acciones.setText(`Golpe Especial ${enemigo_1.nombre} \ndaño al ${Usuario.nombre}`);
                            efectosBatalla[0] .animations.play('1');
                            efectosBatalla[1] .animations.play('2');
                            btn_atk_2.position.x = -900;
                            obj_atk.danoEnemigo(3);
                            obj_atk.danoUsuario(2);
                        break;
                        case 3: //atk jugador espacial
                            label_acciones.setText(`Pendiente....`);
                            efectosBatalla[0].position.x = -200;
                            efectosBatalla[1].position.x = -200;
                        break;
                    }
                }
            }
            else //Si las posiciones coinsiden 
            {
                var tempTexto = ``;
                switch(obj_atk.tipo)// Daño del usuarioa
                {
                    case 1: //atk jugador normal
                        tempTexto = `Contra golpe daño al ${enemigo_1.nombre}`;
                        efectosBatalla[1] .animations.play('4');
                        obj_atk.danoEnemigo(1);
                    break;
                    case 2: //atk jugador cargado
                        tempTexto = `Contra golpe daño al ${enemigo_1.nombre}`;
                        efectosBatalla[1] .animations.play('2');
                        btn_atk_2.position.x = -900;
                        obj_atk.danoEnemigo(2);
                    break;
                    case 3: //atk jugador espacial
                        tempTexto = `Pendiente....`;
                    break;
                }
                tempTexto += ` \n`;
                switch(tempTipo)// Daño del enemigo
                {
                    case 1: //atk jugador normal
                        tempTexto += `Golpe daño al ${Usuario.nombre}`;
                        efectosBatalla[0] .animations.play('3');
                        obj_atk.danoUsuario(1);
                    break;
                    case 2: //atk jugador cargado
                        //enemigo_1.dano_max * 2;
                        tempTexto += `Golpe Cargado daño al ${Usuario.nombre}`;
                        efectosBatalla[0] .animations.play('1');
                        obj_atk.danoUsuario(2);
                    break;
                    case 3: //atk jugador espacial
                        //enemigo_1.dano_max * 2;
                        tempTexto += `Golpe Especial daño al ${Usuario.nombre}`;
                        obj_atk.danoUsuario(3);
                    break;
                }
                label_acciones.setText(tempTexto);
            }
            obj_atk.posicion_defensa = 0;
            obj_atk.tipo =  0;
        }
        if(Usuario.vida<1) //Muerto
        {
            efectosBatalla[0].position.x = -200;
            efectosBatalla[1].position.x = 200;
            efectosBatalla[1] .animations.play('calabera');
            label_acciones.setText(`${Usuario.nombre} MUERTO...`);
            setTimeout(() => {
                window.location.href = `../../../ingreso/muerto/${Usuario.id}`;
            }, 20);
        }
        if( enemigo_1.vida<1) // Ganar
        {
            efectosBatalla[0].position.x = 200;
            efectosBatalla[1].position.x = -200;
            efectosBatalla[0] .animations.play('calabera');
            label_acciones.setText(`${Usuario.nombre} GANADOR`);
            setTimeout(() => {
                window.location.href = `../../../ingreso/ganador/${Usuario.id}/${enemigo_1.id}`;
            }, 20);
        }
    },
    danoUsuario: (tipo)=>{ // 1 normal | 2 cargado | 3 espacial
        let dano_enemigo = 0;
        switch(tipo)// Daño del enemigo
        {
            case 1:
                dano_enemigo = Math.random() * parseInt(enemigo_1.dano_max - enemigo_1.dano_min) + parseInt(enemigo_1.dano_min);
            break; 
            case 2:
                dano_enemigo = Math.random() * parseInt(enemigo_1.dano_max - (enemigo_1.dano_max/2)) + parseInt(enemigo_1.dano_max/2);
            break;
            case 3:
                dano_enemigo = enemigo_1.dano_max + (enemigo_1.dano_max/4);
            break;
        }
        dano_enemigo = Math.round(dano_enemigo);
        Usuario.vida = parseInt(Usuario.vida)-dano_enemigo;
        ajax(`../../cambio_vida/${Usuario.vida}`, `div_escondido`);
        label_nivel.setText(`Nivel: ${Usuario.nivel.toString()} Vida: ${Usuario.vida.toString()} `);
        label_menos_vida_u.setText(`-${dano_enemigo}`);
    },
    danoEnemigo: (tipo)=>{ // 1 normal | 2 cargado | 3 espacial
        let dano_enemigo = 0;
        switch(tipo)// Daño del enemigo
        {
            case 1:
                var tempMax = parseInt(Usuario.arma_1.dano_max) + parseInt(Usuario.arma_1.dano_min);
                var tempMini = parseInt(Usuario.arma_1.dano_min);
                dano_enemigo = Math.round(Math.random()*(tempMax)+ tempMini);
            break;
            case 2:
                dano_enemigo = parseInt(Usuario.arma_1.dano_max);
                esperaAtkCargado = 2;
            break;
            case 3:
                //Pendiente...
            break;
        }
        var tempSuma = 0;
        if(Usuario.arma_1.defensa)
        {
            tempSuma = parseInt(Usuario.arma_1.defensa) + parseInt(Usuario.arma_1.defensa);
        }
        if(Usuario.arma_1.fuerza)
        {
            tempSuma += parseInt(Usuario.arma_1.fuerza) + parseInt(Usuario.arma_1.fuerza);
        }
        if(Usuario.arma_1.punteria)
        {
            tempSuma += parseInt(Usuario.arma_1.punteria) + parseInt(Usuario.arma_1.punteria);
        }
        if(Usuario.arma_1.velocidad)
        {
            tempSuma += parseInt(Usuario.arma_1.velocidad) + parseInt(Usuario.arma_1.velocidad);
        }
        if(tempSuma<1)
        {tempSuma = 0;}
        dano_enemigo = eval(`${dano_enemigo} + ${tempSuma}`);
        dano_enemigo = Math.round(dano_enemigo);
        enemigo_1.vida = enemigo_1.vida-dano_enemigo;
        label_menos_vida_e1.setText(`-${dano_enemigo}`);
    },
    especial: ()=>{
        console.log("especial.......");
    },
    atacar_uno: ()=>{
        console.log("atacar.......");
    },
}
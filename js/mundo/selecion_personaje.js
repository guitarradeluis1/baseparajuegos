var inicio_juego = 0;
var abrir_dialogo_tipo = 0;
var canvas_tanano_x = 480;
var canvas_tanano_x_total = 800;
var canvas_tanano_y = 460;
var game = new Phaser.Game(canvas_tanano_x_total, canvas_tanano_y, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{
    var origen = '../../archivos/';
    var origen_fijo = '../../archivos_fijos/';
    game.load.image('mira', origen_fijo+'mira.png');
    game.load.image('mira_verde', origen_fijo+'mira_verde.png');
    game.load.image('fondo', origen_fijo+'blanco.png');
    game.load.spritesheet('saobotones', origen_fijo+'saobotones.png', 192, 192);
    game.load.bitmapFont('carrier_command', '../../fuentes/carrier_command.png', '../../fuentes/carrier_command.xml');
    game.load.bitmapFont('carrier_command_rojo', '../../fuentes/carrier_command_rojo.png', '../../fuentes/carrier_command.xml');
    for(var i in personajes)
    {
        //console.log(personajes[i]);
        if(personajes[i].objeto.objetotipo_id == "1" || personajes[i].objeto.objetotipo_id== "4" )
        {
            game.load.spritesheet(personajes[i].objeto.nombre.toString(), origen+personajes[i].objeto.archivo.toString(), parseInt(personajes[i].objeto.cortex), parseInt(personajes[i].objeto.cortey) );
        }
        else if(personajes[i].objeto.objetotipo_id == "2")
        {
            game.load.image(personajes[i].objeto.nombre.toString(), origen+personajes[i].objeto.archivo.toString() );
        }
        else if(personajes[i].objeto.objetotipo_id == "3")
        {
            game.load.audio(personajes[i].objeto.nombre.toString(), origen+personajes[i].objeto.archivo.toString() );
        }
    }
}
/*Inicio de los componentes==============================================================================================*/
var personaje_id_selecionado = 0;
var btn_aceptar, btn_cancelar;
var label_error;
var mira_verde;
var conteo_personajes = {};
var conteo_btn = {};
var btn_itm = {};
var reglon = 0;
var pintoa = 280;
var pintob = 120;
function create()
{
    game.stage.backgroundColor = "#585858";
    for(var i in personajes)
    {
        if(personajes[i].objeto.objetotipo_id == "1" || personajes[i].objeto.objetotipo_id== "4" )
        {
            conteo_personajes["posicion"+(personajes[i].id)] = "";
            if(personajes[i].objeto.objetotipo_id == "1" || personajes[i].objeto.objetotipo_id== "4" )
            {
                /*-----*/
                reglon = reglon + 1;
                pintoa = pintoa + 50;
                if(reglon == 5)
                {
                    pintoa = 280;
                    pintob = pintob + 50;
                }
                conteo_personajes["posicion"+(personajes[i].id)] = game.add.sprite( pintoa, pintob, personajes[i].objeto.nombre.toString());
                conteo_personajes["posicion"+(personajes[i].id)].height = parseInt(personajes[i].down.height);
                conteo_personajes["posicion"+(personajes[i].id)].width = parseInt(personajes[i].down.width);
                conteo_personajes["posicion"+(personajes[i].id)].animations.add( personajes[i].down.texto.toString(), eval(personajes[i].down.cuadros), parseInt(personajes[i].down.velocidad), true);
                conteo_personajes["posicion"+(personajes[i].id)].animations.play(personajes[i].down.texto.toString());
                /*-----*/
                conteo_btn["posicion"+(personajes[i].id)] = game.add.button( pintoa-4, pintob-4, 'mira', '', this, 0, 0, 0);
                conteo_btn["posicion"+(personajes[i].id)].height = 45;
                conteo_btn["posicion"+(personajes[i].id)].width = 45;
                conteo_btn["posicion"+(personajes[i].id)].valor = personajes[i].id;
                conteo_btn["posicion"+(personajes[i].id)].nombre = personajes[i].nombre;
                conteo_btn["posicion"+(personajes[i].id)].onInputUp.add(seleccion, this);
                /*-----*/
            }
            else if(personajes[i].objeto.objetotipo_id == "2")
            {
                game.add.sprite( parseInt(objetos[objeto].posicionx), parseInt(objetos[objeto].posiciony), personajes[i].objeto.nombre.toString());
            }
            else if(personajes[i].objeto.objetotipo_id == "3")
            {
                conteo_personajes["posicion"+(personajes[i].id)] = game.add.audio(personajes[i].objeto.nombre.toString());
                conteo_personajes["posicion"+(personajes[i].id)].allowMultiple = true;
                conteo_personajes["posicion"+(personajes[i].id)].play();
            }
        }
    }
    //game.add.text(260, 50, 'Selecciona tu personaje', { font: '20px carrier_command', fill: '#31B404' });
    game.add.bitmapText(190, 10, 'carrier_command', 'Selecciona tu personaje.', 15);
    label_error = game.add.bitmapText(240, 40, 'carrier_command_rojo','', 12);
    
    mira_verde = game.add.sprite( -80, -80, 'mira_verde');
    mira_verde.height = 45; mira_verde.width = 45;
    
    btn_aceptar = game.add.button( 360, 60, 'saobotones', '', this, 86, 87, 87);
    btn_aceptar.height = 50; btn_aceptar.width = 50;
    btn_aceptar.onInputUp.add(cargar_personaje, this);
    
    btn_cancelar = game.add.button( 420, 60, 'saobotones', '', this, 96, 97, 97);
    btn_cancelar.height = 50; btn_cancelar.width = 50;
    btn_cancelar.onInputUp.add(regresar, this);
}
/*Cambio de los componenete==============================================================================================*/
function update()
{

}
/*========================================================================================================================*/
function seleccion(entrada_btn)
{
    label_error.setText(entrada_btn.nombre);
    personaje_id_selecionado = entrada_btn.valor;
    mira_verde.position.x = entrada_btn.position.x;
    mira_verde.position.y = entrada_btn.position.y;
}
//___________________________________________________
function regresar()
{
    window.location.href = "../ingreso/index";
}
//___________________________________________________
function cargar_personaje()
{
    if(personaje_id_selecionado == 0)
    {
        label_error.setText("Personaje NO selecionado.");
    }
    else
    {
        label_error.setText("Cargando...");
        ajax("../usuarios/elegi_personaje/"+personaje_id_selecionado, "div_escondido");
    }
}
//___________________________________________________


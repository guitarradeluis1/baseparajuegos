//**********************************
var game = new Phaser.Game(200, 200, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{
    var origen = '../../../archivos/';
    game.load.image('fondo_blanco', origen+'blanco.png');
    game.load.image('fondo_negro', origen+'negro.png');
    if(imagenes.objeto.objetotipo.id == "1" || imagenes.objeto.objetotipo.id == "4" )
    {
        game.load.spritesheet(imagenes.objeto.nombre.toString(), origen+imagenes.objeto.archivo.toString(), parseInt(imagenes.objeto.cortex), parseInt(imagenes.objeto.cortey) );
    }
}
/*Inicio de los componentes==============================================================================================*/
var inicio_juego = 0;
var abrir_dialogo_tipo = 0;
var canvas_tanano_x = 200;
var canvas_tanano_x_total = 400;
var canvas_tanano_y = 200;

var personaje;
var limite1, limite2, limite3, limite4;
var key_arriba;
var key_abajo;
var key_izquierda;
var key_derecha;
function create()
{
    game.add.sprite(0, 0, 'fondo_blanco');//fondo
    //Limites---------------------------------------
    limite1 = game.add.sprite(0, -535, 'fondo_negro');
    limite1.width = canvas_tanano_x;
    limite2 = game.add.sprite(0, canvas_tanano_y-5, 'fondo_negro');
    limite2.width = canvas_tanano_x;
    limite3 = game.add.sprite(-830, 0, 'fondo_negro');
    limite3.height = canvas_tanano_y;
    limite4 = game.add.sprite(canvas_tanano_x-5, 0, 'fondo_negro');
    limite4.height = canvas_tanano_y;
    if(imagenes.objeto.objetotipo.id == "1" || imagenes.objeto.objetotipo.id == "4" )
    {
        personaje = game.add.sprite(20, 20, imagenes.objeto.nombre.toString());
        //Animacion-------------------------------------------
        personaje.animations.add('left', eval(imagenes.left.cuadros), parseInt(imagenes.left.velocidad), true);//16
        personaje.animations.add('right', eval(imagenes.right.cuadros), parseInt(imagenes.right.velocidad), true);
        personaje.animations.add('down', eval(imagenes.down.cuadros), parseInt(imagenes.down.velocidad), true);
        personaje.animations.add('up', eval(imagenes.up.cuadros), parseInt(imagenes.up.velocidad), true);
        personaje.animations.add('stop', eval(imagenes.stop.cuadros), parseInt(imagenes.stop.velocidad), true);
        personaje.animations.play('stop');
        //-------------------------------------------
        game.physics.startSystem(Phaser.Physics.ARCADE);
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
        key_arriba = game.input.keyboard.addKey(Phaser.Keyboard.W);
        key_abajo = game.input.keyboard.addKey(Phaser.Keyboard.S);
        key_izquierda = game.input.keyboard.addKey(Phaser.Keyboard.A);
        key_derecha = game.input.keyboard.addKey(Phaser.Keyboard.D);
    }
}
/*Cambio de los componenete==============================================================================================*/
function update()
{
    //Colicion--------------------------------------------------
    game.physics.arcade.collide(personaje, limite1);
    game.physics.arcade.collide(personaje, limite2);
    game.physics.arcade.collide(personaje, limite3);
    game.physics.arcade.collide(personaje, limite4);
    //Controles Movimientos ------------------------------------
    if (key_arriba.isDown)
    {
        personaje.body.velocity.y = -100;
    }
    else if (key_abajo.isDown)
    {
        personaje.body.velocity.y = 100;
    }
    else
    {
        personaje.body.velocity.y = 0; 
    }
    
    if (key_izquierda.isDown)
    {
        personaje.body.velocity.x = -100;
    }
    else if (key_derecha.isDown)
    {
        personaje.body.velocity.x = 100;
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
}
/*========================================================================================================================*/
function cambio_duadros(tem_texto, tem_numero_fila, tem_numero_columna)
{
    tem_texto = tem_texto.replace("[", "");
    tem_texto = tem_texto.replace("]", "");
    tem_texto = tem_texto.split(",");
    var retorno = "[";
    for (x = 0; x < tem_texto.length; x++)
    {
        retorno += eval("("+tem_numero_fila+"*"+tem_numero_columna+")+"+tem_texto[x])+",";
    }
    retorno = retorno.substr(0, retorno.length-1);
    retorno += "]";
    return retorno.toString();
}
var game = new Phaser.Game(480, 460, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{var lugar = '../../../archivos/armas.png';
    game.load.image('fondo', lugar);
    game.load.image('plataforma', lugar);
    game.load.image('diamante', lugar);
    game.load.spritesheet('personaje', lugar, 32, 48);// (nombre, img, cote_x, corte y)
}
/*Inicio de los componentes==============================================================================================*/
var personaje;
var plataforma;
function create()
{
    //agrego obkjetos----------------------------
    plataforma = game.add.sprite(30, 100, 'plataforma');
    plataforma.width = 20; plataforma.height = 20;
    personaje = game.add.sprite(32, 0, 'personaje');
    //fisicas----------------------------------------
    game.physics.startSystem(Phaser.Physics.ARCADE);
    game.physics.arcade.enable(personaje);
    game.physics.arcade.enable(plataforma);
    plataforma.body.immovable = true;
    //atrib personaje----------------------------------
    personaje.body.velocity.x = 0;
    //Animacion-------------------------------------------
    personaje.animations.add('left', [0, 1, 2, 3], 10, true);
    personaje.animations.add('right', [5, 6, 7, 8], 10, true);
    personaje.animations.add('up', [4], 8, true);
    personaje.animations.play('right');
    //Controles-----------------------------
    key_arriba = game.input.keyboard.addKey(Phaser.Keyboard.UP);
    key_abajo = game.input.keyboard.addKey(Phaser.Keyboard.DOWN);
    key_izquierda = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
    key_derecha = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);
}
/*Cambio de los componenete==============================================================================================*/
function update()
{
    //Colicion-------------------------------------
    game.physics.arcade.collide(personaje, plataforma, consola);
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
    else
    {
        personaje.animations.play('up');
    }
}
//____________________________________________________________________________________________________________________________
//____________________________________________________________________________________________________________________________
function consola()
{
    console.log("colicion");
}
//_______________________________________________
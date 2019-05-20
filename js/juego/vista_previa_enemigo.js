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

var personaje = new Object();
var K = 0;
var limite1, limite2, limite3, limite4;
var key_arriba;
var key_abajo;
var key_izquierda;
var key_derecha;
var tipo_moviemiento = 0;
var cant_enemigos = 2;
var seg = 0;
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
        for (K = 0; K < cant_enemigos; K++)
        {
            personaje[""+K] = game.add.sprite(40, 40, imagenes.objeto.nombre.toString());
            //Direcionamiento ------------------------------------
            personaje[""+K].tipo_moviemiento = tipo_moviemiento;
            // 1 = quieto | 2 = arriba abajo | 3 = derecha izquierda | 4 = aleatorio | 5 = ataque | 6 = defensa
            personaje[""+K].direccion = 0; // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda 
            //Animacion-------------------------------------------
            personaje[""+K].animations.add('left', eval(imagenes.left.cuadros), parseInt(imagenes.left.velocidad), true);//16
            personaje[""+K].animations.add('right', eval(imagenes.right.cuadros), parseInt(imagenes.right.velocidad), true);
            personaje[""+K].animations.add('down', eval(imagenes.down.cuadros), parseInt(imagenes.down.velocidad), true);
            personaje[""+K].animations.add('up', eval(imagenes.up.cuadros), parseInt(imagenes.up.velocidad), true);
            personaje[""+K].animations.add('stop', eval(imagenes.stop.cuadros), parseInt(imagenes.stop.velocidad), true);
            personaje[""+K].animations.play('stop');
        }
        
        //-------------------------------------------
        game.physics.startSystem(Phaser.Physics.ARCADE);
        for (K = 0; K < cant_enemigos; K++)
        {
            game.physics.arcade.enable(personaje[""+K]);
            personaje[""+K].body.velocity.x = 0;
        }
        /*if(personaje[""+K].tipo_moviemiento == 4)//Aleatorio
        {
            personaje[""+K].body.collideWorldBounds = true;
            personaje[""+K].body.bounce.set(1);
            personaje[""+K].body.velocity.x = game.rnd.realInRange(-200, 200);
            personaje[""+K].body.velocity.y = game.rnd.realInRange(-200, 200);
        }*/
        game.physics.arcade.enable(limite1);
        limite1.body.immovable = true;
        game.physics.arcade.enable(limite2);
        limite2.body.immovable = true;
        game.physics.arcade.enable(limite3);
        limite3.body.immovable = true;
        game.physics.arcade.enable(limite4);
        limite4.body.immovable = true;
        
        //Controles-----------------------------
        /*key_arriba = game.input.keyboard.addKey(Phaser.Keyboard.W);
        key_abajo = game.input.keyboard.addKey(Phaser.Keyboard.S);
        key_izquierda = game.input.keyboard.addKey(Phaser.Keyboard.A);
        key_derecha = game.input.keyboard.addKey(Phaser.Keyboard.D);*/
        game.time.events.loop(Phaser.Timer.SECOND, movimiento_enemigo, this);
        
        for(var per in personaje)
        {
            game.physics.arcade.collide(personaje[per], limite1,
            function()
            {colicion_enemigo(per);});
            game.physics.arcade.collide(personaje[per], limite2,
            function()
            {colicion_enemigo(per);});
            game.physics.arcade.collide(personaje[per], limite3,
            function()
            {colicion_enemigo(per);});
            game.physics.arcade.collide(personaje[per], limite4,
            function()
            {colicion_enemigo(per);});
        }
    }
}
/*Cambio de los componenete==============================================================================================*/
function update()
{
    //Colicion--------------------------------------------------
    for (K = 0; K < cant_enemigos; K++)
    {
        game.physics.arcade.collide(personaje[""+K], limite1);
        game.physics.arcade.collide(personaje[""+K], limite2);
        game.physics.arcade.collide(personaje[""+K], limite3);
        game.physics.arcade.collide(personaje[""+K], limite4);
    }
    //Enemigos--------------------------------------------------
    
    //Controles Movimientos ------------------------------------
    /*
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
    }*/
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
//__________________________________________-
function movimiento_enemigo()
{
    seg++;
    if(seg == 3)
    {
        seg = 0;
        for(var per in personaje)
        {
            if(personaje[per].tipo_moviemiento == 4)
            {
                var temp_direccion = Math.floor(Math.random() * (6 - 0)) + 0;
                personaje[per].direccion = temp_direccion;
            }
            else if(personaje[per].tipo_moviemiento == 2 || personaje[per].tipo_moviemiento == 3)
            {
                var temp_direccion = Math.floor(Math.random() * (2 - 0)) + 0;
                personaje[per].direccion = temp_direccion;
            }
        }   
    }
    // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda | 4 = quieto
    var temp_velosidad= 15;
    for(var per in personaje)
    {
        if(personaje[per].tipo_moviemiento == 2)//arriba abajo
        {
            if(personaje[per].direccion == 0)
            {
                personaje[per].body.velocity.y = temp_velosidad;
                personaje[per].animations.play('down');
            }
            else if(personaje[per].direccion == 1)
            {
                personaje[per].body.velocity.y = -temp_velosidad;
                personaje[per].animations.play('up');
            }
        }
        else if(personaje[per].tipo_moviemiento == 3)//arriba abajo
        {
            if(personaje[per].direccion == 0)
            {
                personaje[per].body.velocity.x = temp_velosidad;
                personaje[per].animations.play('right');
            }
            else if(personaje[per].direccion == 1)
            {
                personaje[per].body.velocity.x = -temp_velosidad;
                personaje[per].animations.play('left');
            }
        }
        else
        //if(personaje[per].tipo_moviemiento == 4)//aleatorio
        {
            if(personaje[per].direccion == 0)
            {
                personaje[per].body.velocity.y = temp_velosidad;
                personaje[per].animations.play('down');
            }
            else if(personaje[per].direccion == 1)
            {
                personaje[per].body.velocity.y = -temp_velosidad;
                personaje[per].animations.play('up');
            }
            else if(personaje[per].direccion == 3)
            {
                personaje[per].body.velocity.x = -temp_velosidad;
                personaje[per].animations.play('left');
            }
            else if(personaje[per].direccion == 4)
            {
                personaje[per].body.velocity.x = temp_velosidad;
                personaje[per].animations.play('right');
            }
            else
            {
                personaje[per].body.velocity.x = 0;
                personaje[per].body.velocity.y = 0;
                personaje[per].animations.stop();
            }
        }
    }
}
//__________________________________________-
function colicion_enemigo(apuntador)
{
    console.log("luis..."+apuntador);
}
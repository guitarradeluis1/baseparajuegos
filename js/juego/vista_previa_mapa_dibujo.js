var inicio_juego = 0;
var abrir_dialogo_tipo = 0;
var canvas_tanano_x = 480;
var canvas_tanano_x_total = 800;
var canvas_tanano_y = 460;
var seg = 0;
var game = new Phaser.Game(canvas_tanano_x_total, canvas_tanano_y, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{
    var origen = '../../../archivos/';
    game.load.image('fondo', origen+'blanco.png');
    for(var precarga in precargas)
    {
        //console.log(precargas[precarga]);
        if(precargas[precarga].objeto.objetotipo_id == "1" || precargas[precarga].objeto.objetotipo_id== "4" )
        {
            game.load.spritesheet(precargas[precarga].objeto.nombre.toString(), origen+precargas[precarga].objeto.archivo.toString(), parseInt(precargas[precarga].objeto.cortex), parseInt(precargas[precarga].objeto.cortey) );
        }
        else if(precargas[precarga].objeto.objetotipo_id == "2")
        {
            game.load.image(precargas[precarga].objeto.nombre.toString(), origen+precargas[precarga].objeto.archivo.toString() );
        }
        else if(precargas[precarga].objeto.objetotipo_id == "3")
        {
            game.load.audio(precargas[precarga].objeto.nombre.toString(), origen+precargas[precarga].objeto.archivo.toString() );
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
var pint_enemigos = {};
var limite1, limite2, limite3, limite4;
function create()
{
    tem_consola = game.add.sprite(canvas_tanano_x, -5, 'fondo');
    tem_consola.height = canvas_tanano_x;
    tem_consola.width = canvas_tanano_y;
    //Limites------------------------------------
    limite1 = game.add.sprite(0, -23, 'fondo_negro');
    limite1.width = canvas_tanano_x;
    limite2 = game.add.sprite(0, canvas_tanano_y-7, 'fondo_negro');
    limite2.width = canvas_tanano_x;
    limite3 = game.add.sprite(-23, 0, 'fondo_negro');
    limite3.height = canvas_tanano_y;
    limite4 = game.add.sprite(canvas_tanano_x+3, 0, 'fondo_negro');
    limite4.height = canvas_tanano_y;
    //Pintar fondo pasto-------------------------
    pintar_todo( imagenes.fondo_dibu.objeto.nombre.toString(), eval(imagenes.fondo_dibu.cuadros), parseInt(imagenes.fondo_dibu.velocidad), 32); //parseInt(imagenes.fondo_dibu.height)
    pintar_bordes(0, imagenes.limite_arriba_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_arriba_dibujo_dibu.cuadros), parseInt(imagenes.limite_arriba_dibujo_dibu.velocidad), 31);
    pintar_bordes(1, imagenes.limite_abajo_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_abajo_dibujo_dibu.cuadros), parseInt(imagenes.limite_abajo_dibujo_dibu.velocidad), 31);
    pintar_bordes(2, imagenes.limite_derecha_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_derecha_dibujo_dibu.cuadros), parseInt(imagenes.limite_derecha_dibujo_dibu.velocidad), 31);
    pintar_bordes(3, imagenes.limite_izquierda_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_izquierda_dibujo_dibu.cuadros), parseInt(imagenes.limite_izquierda_dibujo_dibu.velocidad), 31);
    //Pintando objetos---------------------------
    for(var objeto in objetos)
    {
        if(objetos[objeto].dibujo.objeto.objetotipo_id == "1" || objetos[objeto].dibujo.objeto.objetotipo_id== "4" )
        {
            conteo_objetos["posicion"+(objetos[objeto].id)] = "";
            if(objetos[objeto].dibujo.objeto.objetotipo_id == "1" || objetos[objeto].dibujo.objeto.objetotipo_id== "4" )
            {
                conteo_objetos["posicion"+(objetos[objeto].id)] = game.add.sprite( parseInt(objetos[objeto].posicionx), parseInt(objetos[objeto].posiciony), objetos[objeto].dibujo.objeto.nombre.toString());
                conteo_objetos["posicion"+(objetos[objeto].id)].height = parseInt(objetos[objeto].dibujo.height);
                conteo_objetos["posicion"+(objetos[objeto].id)].width = parseInt(objetos[objeto].dibujo.width);
                conteo_objetos["posicion"+(objetos[objeto].id)].animations.add( objetos[objeto].dibujo.texto.toString(), eval(objetos[objeto].dibujo.cuadros), parseInt(objetos[objeto].dibujo.velocidad), true);
                conteo_objetos["posicion"+(objetos[objeto].id)].animations.play(objetos[objeto].dibujo.texto.toString());
                conteo_objetos["posicion"+(objetos[objeto].id)].inputEnabled = true;
                conteo_objetos["posicion"+(objetos[objeto].id)].datos = { 
                    id: objetos[objeto].id, 
                    nombre: objetos[objeto].dibujo.texto,
                    campo_id: objetos[objeto].campo_id,
                    x:  objetos[objeto].posicionx,
                    y:  objetos[objeto].posiciony
                };
                conteo_objetos["posicion"+(objetos[objeto].id)].events.onInputDown.add(selector, this);
            }
            else if(objetos[objeto].dibujo.objeto.objetotipo_id == "2")
            {
                game.add.sprite( parseInt(objetos[objeto].posicionx), parseInt(objetos[objeto].posiciony), objetos[objeto].dibujo.objeto.nombre.toString());
            }
            else if(objetos[objeto].dibujo.objeto.objetotipo_id == "3")
            {
                conteo_objetos["posicion"+(objetos[objeto].id)] = game.add.audio(objetos[objeto].dibujo.objeto.nombre.toString());
                conteo_objetos["posicion"+(objetos[objeto].id)].allowMultiple = true;
                conteo_objetos["posicion"+(objetos[objeto].id)].play();
            }
        }
    }
    //Limites---------------------------------------
    game.physics.arcade.enable(limite1);
    limite1.body.immovable = true;
    game.physics.arcade.enable(limite2);
    limite2.body.immovable = true;
    game.physics.arcade.enable(limite3);
    limite3.body.immovable = true;
    game.physics.arcade.enable(limite4);
    limite4.body.immovable = true;
    //Pintando enemigos--------------------------
    for(var en in enemigos)
    {
        if(enemigos[en].x && enemigos[en].y)
        {
            var temp_x = enemigos[en].x;
            var temp_y = enemigos[en].y;
        }
        else
        {
            var temp_x = Math.floor(Math.random() * (40 - canvas_tanano_x)) + canvas_tanano_x;
            var temp_y = Math.floor(Math.random() * (60 - canvas_tanano_y)) + canvas_tanano_y;
        }
        //game.load.spritesheet( enemigos[en].enemigo.objeto.nombre.toString(), origen+enemigos[en].enemigo.objeto.archivo.toString(), parseInt(enemigos[en].enemigo.objeto.cortex), parseInt(enemigos[en].enemigo.objeto.cortey) );
        pint_enemigos[en] = game.add.sprite(parseFloat(temp_x), parseFloat(temp_y), enemigos[en].enemigo.objeto.nombre.toString());
        //Direcionamiento ------------------------------------
        pint_enemigos[en].tipo_moviemiento = parseInt(enemigos[en].enemigo.movimientos.id);
        // 1 = quieto | 2 = arriba abajo | 3 = derecha izquierda | 4 = aleatorio | 5 = ataque | 6 = defensa
        pint_enemigos[en].direccion = 0; // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda 
        //Animacion-------------------------------------------
        pint_enemigos[en].animations.add('left', eval(enemigos[en].enemigo.left.cuadros), parseInt(enemigos[en].enemigo.left.velocidad), true);//16
        pint_enemigos[en].animations.add('right', eval(enemigos[en].enemigo.right.cuadros), parseInt(enemigos[en].enemigo.right.velocidad), true);
        pint_enemigos[en].animations.add('down', eval(enemigos[en].enemigo.down.cuadros), parseInt(enemigos[en].enemigo.down.velocidad), true);
        pint_enemigos[en].animations.add('up', eval(enemigos[en].enemigo.up.cuadros), parseInt(enemigos[en].enemigo.up.velocidad), true);
        pint_enemigos[en].animations.add('stop', eval(enemigos[en].enemigo.stop.cuadros), parseInt(enemigos[en].enemigo.stop.velocidad), true);
        pint_enemigos[en].animations.play('stop');
    }
    game.physics.startSystem(Phaser.Physics.ARCADE);
    for(var en in enemigos)
    {
        game.physics.arcade.enable(pint_enemigos[en]);
        pint_enemigos[en].body.velocity.x = 0;
    }
    game.time.events.loop(Phaser.Timer.SECOND, movimiento_enemigo, this);
    //console.log(conteo_objetos);
}
/*Cambio de los componenete==============================================================================================*/
function update()
{
    //Colicion--------------------------------------------------
    for(var en in enemigos)
    {
        game.physics.arcade.collide(pint_enemigos[en], limite1);
        game.physics.arcade.collide(pint_enemigos[en], limite2);
        game.physics.arcade.collide(pint_enemigos[en], limite3);
        game.physics.arcade.collide(pint_enemigos[en], limite4);
    }
}
/*========================================================================================================================*/
function movimiento_enemigo()
{
    seg++;
    if(seg == 3)
    {
        seg = 0;
        for(var en in enemigos)
        {
            if(pint_enemigos[en].tipo_moviemiento == 4)
            {
                var temp_direccion = Math.floor(Math.random() * (6 - 0)) + 0;
                pint_enemigos[en].direccion = temp_direccion;
            }
            else if(pint_enemigos[en].tipo_moviemiento == 2 || pint_enemigos[en].tipo_moviemiento == 3)
            {
                var temp_direccion = Math.floor(Math.random() * (2 - 0)) + 0;
                pint_enemigos[en].direccion = temp_direccion;
            }
        }   
    }
    // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda | 4 = quieto
    var temp_velosidad= 15;
    for(var en in enemigos)
    {
        if(pint_enemigos[en].tipo_moviemiento == 2)//arriba abajo
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
        }
        else if(pint_enemigos[en].tipo_moviemiento == 3)//arriba abajo
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.x = -temp_velosidad;
                pint_enemigos[en].animations.play('left');
            }
        }
        else
        //if(pint_enemigos[en].tipo_moviemiento == 4)//aleatorio
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
            else if(pint_enemigos[en].direccion == 3)
            {
                pint_enemigos[en].body.velocity.x = -temp_velosidad;
                pint_enemigos[en].animations.play('left');
            }
            else if(pint_enemigos[en].direccion == 4)
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            else
            {
                pint_enemigos[en].body.velocity.x = 0;
                pint_enemigos[en].body.velocity.y = 0;
                pint_enemigos[en].animations.stop();
            }
        }
    }
}
function selector(seleccion)
{
    const { datos } = seleccion;
    $(`#info`).html(`<b>${datos.id}</b>: ${datos.nombre} (${datos.x}, ${datos.y}) <div id="btn_editor"></div>`);
    ajax(`../../campodibujo/botonEditar/${datos.id}/${datos.campo_id}`, "btn_editor");
};
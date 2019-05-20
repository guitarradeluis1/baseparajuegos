//**********************************
var canvas_tanano_x = 200; // 480 200
var canvas_tanano_y = 200; // 460 200
var game = new Phaser.Game(canvas_tanano_x, canvas_tanano_y, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
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
}
/*Inicio de los componentes==============================================================================================*/
var ejemplo;
function create()
{
    //Pintar fondo pasto-------------------------
    pintar_todo( imagenes.fondo_dibu.objeto.nombre.toString(), eval(imagenes.fondo_dibu.cuadros), parseInt(imagenes.fondo_dibu.velocidad), 32); //parseInt(imagenes.fondo_dibu.height)
    pintar_bordes(0, imagenes.limite_arriba_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_arriba_dibujo_dibu.cuadros), parseInt(imagenes.limite_arriba_dibujo_dibu.velocidad), 31);
    pintar_bordes(1, imagenes.limite_abajo_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_abajo_dibujo_dibu.cuadros), parseInt(imagenes.limite_abajo_dibujo_dibu.velocidad), 31);
    pintar_bordes(2, imagenes.limite_derecha_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_derecha_dibujo_dibu.cuadros), parseInt(imagenes.limite_derecha_dibujo_dibu.velocidad), 31);
    pintar_bordes(3, imagenes.limite_izquierda_dibujo_dibu.objeto.nombre.toString(), eval(imagenes.limite_izquierda_dibujo_dibu.cuadros), parseInt(imagenes.limite_izquierda_dibujo_dibu.velocidad), 31);

}
/*Cambio de los componenete==============================================================================================*/
function update()
{

}
/*========================================================================================================================*/
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
        {fondo_pasto = game.add.sprite( canvas_tanano_y-10, K*tamano_cortes, imgfondo);}
        else if(posicion == 3)
        {fondo_pasto = game.add.sprite( -20, K*tamano_cortes, imgfondo);}
        fondo_pasto.animations.add('fondo_inicial', secmento, velocidad, true);
        fondo_pasto.animations.play('fondo_inicial');
    }
}
//_______________________________________________
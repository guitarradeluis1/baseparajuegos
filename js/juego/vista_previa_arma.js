//**********************************
var game = new Phaser.Game(200, 200, Phaser.AUTO, 'canvas', { preload: preload, create: create, update: update });
/*Carga de objetos==============================================================================================*/
function preload()
{
    var origen = '../../../archivos/';
    game.load.image('fondo', origen+'blanco.png');
    if(imagenes.objeto.objetotipo.id == "1" || imagenes.objeto.objetotipo.id == "4" )
    {
        game.load.spritesheet(imagenes.objeto.nombre.toString(), origen+imagenes.objeto.archivo.toString(), parseInt(imagenes.objeto.cortex), parseInt(imagenes.objeto.cortey) );
    }
    else if(imagenes.objeto.objetotipo.id == "2")
    {
        game.load.image(imagenes.objeto.nombre.toString(), origen+imagenes.objeto.archivo.toString() );
    }
    else if(imagenes.objeto.objetotipo.id == "3")
    {
        game.load.audio(imagenes.objeto.nombre.toString(), origen+imagenes.objeto.archivo.toString() );
    }
}
/*Inicio de los componentes==============================================================================================*/
var ejemplo;
function create()
{
    game.add.sprite(0, 0, 'fondo');//fondo
    if(imagenes.objeto.objetotipo.id == "1" || imagenes.objeto.objetotipo.id == "4" )
    {
        ejemplo = game.add.sprite( 2, 2, imagenes.objeto.nombre.toString());
        ejemplo.height = parseInt(imagenes.dibujo.height);
        ejemplo.width = parseInt(imagenes.dibujo.width);
        ejemplo.animations.add( imagenes.dibujo.texto.toString(), eval(imagenes.dibujo.cuadros), parseInt(imagenes.dibujo.velocidad), true);
        ejemplo.animations.play(imagenes.dibujo.texto.toString());
    }
    else if(imagenes.objeto.objetotipo.id == "2")
    {
        game.add.sprite(2, 2, imagenes.objeto.nombre.toString());
    }
    else if(imagenes.objeto.objetotipo.id == "3")
    {
        audio = game.add.audio(imagenes.objeto.nombre.toString());
        audio.allowMultiple = true;
        audio.play();
    }
}
/*Cambio de los componenete==============================================================================================*/
function update()
{

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
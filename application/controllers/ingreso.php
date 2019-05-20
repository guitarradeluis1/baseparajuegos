<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Ingreso extends CI_Controller {
     /*
     1. Nombre del controlado en minuscula
     2. Nombre de la clase en mayuscula la primera
     3. crear el costructor
     4. Cada funcion puede tener su propias vistas dirigiendo la ruta
     */
function __construct()
{
   parent::__construct();
   $this->load->helper('url');
   $this->load->helper('form');
   $this->load->helper('general');
   $this->load->library('session');
   $this->load->model('paises_model');
   
   $this->load->model('objeto_model');
   $this->load->model('usuarios_model');
   $this->load->model('armausuarios_model');
   $this->load->model('campoobjeto_model');
   $this->load->model('campo_model');
   $this->load->model('campodibujo_model');
   $this->load->model('campousuarios_model');
   $this->load->model('campoenemigo_model');
   $this->load->model('personaje_model');
   $this->load->model('enemigo_model');
}
//_____________________________________________________
    public function parametros()
    {
       $id = $this->session->userdata("id");
       if(isset($id) && $id !="")
       {
           $parametros = array();
           $parametros["total_registro"] = 25;
           $parametros["estilo"] = "cabesa";
           $parametros["controlador"] = "ingreso";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "ingreso";
           $parametros["Mensaje_alerta"] = "";
           $parametros["session"] = $this->variables_session();
           $parametros["menu"] = "Menu";
           return $parametros;
       }
       else
       {redirect("/welcome/salir", 'location');}
	}
    #####################
    public function variables_session()
    {
       $lugares = campos_session();
       $datos_session = array();
       foreach($lugares as $texto)
       { $datos_session[$texto] = $this->session->userdata($texto);}
       return $datos_session;
	}
//_____________________________________________________
public function index()
{
   #$this->session->sess_destroy();
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $datos = $parametros;
   $datos["Mensaje_alerta"] = "";
   $datos["Pais"] = $this->paises_model->consulta($parametros["session"]["paises_id"]);
   $this->load->view($parametros["estilo"],$datos);
   #$this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   #$this->load->view("botones_menu");
   $this->load->view("alerta");
   $this->load->view("footer");
}
//_____________________________________________________
public function mundo($mensaje = null)
{
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "mundo";
   $datos = $parametros;
   $datos["Posicion"] = $this->campousuarios_model->consulto($this->session->userdata("id"));
   $datos["precargas_objetos"] = $this->objeto_model->todo();
   //$datos["campo_objeto"] = $this->campoobjeto_model->consulto_objeto($datos["Posicion"]["campo_id"]);
   $datos["Usuario"] = $this->usuarios_model->consulto_ligero($this->session->userdata("id"));
   $datos["campo"] = $this->campo_model->consulto($datos["Posicion"]["campo_id"]);
   $datos["campo_dubujo"] = $this->campodibujo_model->todo($datos["Posicion"]["campo_id"]);
   $datos["campo_enemigo"] = $this->campoenemigo_model->consulto_campo($datos["Posicion"]["campo_id"]);
   $datos["personaje"] = $this->personaje_model->consulto($parametros["session"]["personaje_id"]);
   $this->load->view("cabesa_material", $datos);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function pelea($enemigo_id, $maximo)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "pelea_tres"; # pelea_dados | pelea_tres
    $datos = $parametros;
    $datos["Posicion"] = $this->campousuarios_model->consulto($this->session->userdata("id"));
    $datos["precargas_objetos"] = $this->objeto_model->todo();
    //$datos["campo_objeto"] = $this->campoobjeto_model->consulto_objeto($datos["Posicion"]["campo_id"]);
    $datos["Usuario"] = $this->usuarios_model->consulto_ligero($this->session->userdata("id"));
    $datos["campo"] = $this->campo_model->consulto($datos["Posicion"]["campo_id"]);
    $datos["campo_dubujo"] = $this->campodibujo_model->todo($datos["Posicion"]["campo_id"]);
    $datos["campo_enemigo"] = $this->campoenemigo_model->consulto_campo($datos["Posicion"]["campo_id"]);
    $datos["personaje"] = $this->personaje_model->consulto($parametros["session"]["personaje_id"]);
    $datos["enemigo_1"] = $this->enemigo_model->consulto($enemigo_id);
    if($maximo>3){$maximo = 3;}
    $datos["cantidad"] = rand(1, $maximo);
    $this->load->view("cabesa_material", $datos);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    $this->load->view("footer");
}
//_____________________________________________________
public function mundo_carga()
{
   #$this->session->sess_destroy(); $parametros["session"]["id"]
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "prueba";
   $datos = $parametros;
   $datos["Usuario"] = $this->usuarios_model->consulto_ligero($this->session->userdata("id"));
   $datos["Posicion"] = $this->campousuarios_model->consulto($this->session->userdata("id"));
   $datos["campo_objeto"] = $this->campoobjeto_model->consulto_objeto($datos["Posicion"]["campo_id"]);
   $datos["campo"] = $this->campo_model->consulto($datos["Posicion"]["campo_id"]);
   $datos["campo_dubujo"] = $this->campodibujo_model->todo($datos["Posicion"]["campo_id"]);
   $datos["personaje"] = $this->personaje_model->consulto($parametros["session"]["personaje_id"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
}
//_____________________________________________________
public function actualiza_ubucacion($campo_id, $x, $y)
{
    if($campo_id > 0)
    {
        $datos = array();
        $datos["usuarios_id"] = $this->session->userdata("id");
        $datos["campo_id"] = $campo_id;
        $datos["x"] = $x;
        $datos["y"] = $y;
        $campo = $this->campo_model->consulto($campo_id);
        if($campo["usuarios_id"] == 0 || $campo["usuarios_id"] == "0")
        {
           $this->campousuarios_model->actualizo($datos);
        }
    }
}
//_____________________________________________________
public function cargar_estatus($campo_id = null)
{
   #usuario consulto_ligero y  arma_usuarios
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "cargar_estatus";
   $datos = $parametros;
   $datos["Usuario"] = $this->usuarios_model->consulto_ligero($this->session->userdata("id"));
   if($campo_id!=null)
   {$datos["Conectados"] = $this->campousuarios_model->conectados($campo_id, $this->session->userdata("id"));}
   $datos["arma_usuarios"] = $this->armausuarios_model->consulto($this->session->userdata("id"));
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
}
//_____________________________________________________
public function cambio_vida($vida)
{
    #usuario consulto_ligero y  arma_usuarios
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "cambio_vida";
    $datos = $parametros;
    $datos["Usuario"] = $this->usuarios_model->cambio_vida($this->session->userdata("id"), $vida);
}
//_____________________________________________________
public function actualiza_armausuario()
{
    try
    {
        $arma_usuarios = json_decode($_POST['json']);
        $datos = array();
        $datos["usuarios_id"] = $this->session->userdata("id");
        $datos["oro"] = $arma_usuarios->oro;
        $datos["plata"] = $arma_usuarios->plata;
        $datos["arma_1"] = $arma_usuarios->arma_1_id;
        $datos["arma_2"] = $arma_usuarios->arma_2_id;
        $datos["arma_3"] = $arma_usuarios->arma_3_id;
        $datos["arma_4"] = $arma_usuarios->arma_4_id;
        $datos["arma_5"] = $arma_usuarios->arma_5_id;
        $datos["arma_6"] = $arma_usuarios->arma_6_id;
        $datos["arma_7"] = $arma_usuarios->arma_7_id;
        $datos["arma_8"] = $arma_usuarios->arma_8_id;
        $datos["c1"] = $arma_usuarios->c1;
        $datos["c2"] = $arma_usuarios->c2;
        $datos["c3"] = $arma_usuarios->c3;
        $datos["c4"] = $arma_usuarios->c4;
        $datos["c5"] = $arma_usuarios->c5;
        $datos["c6"] = $arma_usuarios->c6;
        $datos["c7"] = $arma_usuarios->c7;
        $datos["c8"] = $arma_usuarios->c8;
        if($datos["usuarios_id"] != 0 || $datos["usuarios_id"] != "0")
        {
            $this->armausuarios_model->actualizo($datos);
        }
    }
    catch(Exception $e)
    {
        return $e->getMessage();
    }
}
//_____________________________________________________
public function actualiza_usuario()
{
    try
    {
        $usuario = json_decode($_POST['json']);
        $datos = array();
        $datos["id"] = $this->session->userdata("id");
        if($usuario->arma1 != "")
        {$datos["arma1"] = intval($usuario->arma1);}
        #if($usuario->arma2 != "")
        #{$datos["arma2"] = $usuario->arma2;}
        if($usuario->vida != "")
        {$datos["vida"] = intval($usuario->vida);}
        if($usuario->nivel != "")
        {$datos["nivel"] = intval($usuario->nivel);}
        if($usuario->defensa != "")
        {$datos["defensa"] = intval($usuario->defensa);}
        if($usuario->fuerza != "")
        {$datos["fuerza"] = intval($usuario->fuerza);}
        if($usuario->punteria != "")
        {$datos["punteria"] = intval($usuario->punteria);}
        if($usuario->velocidad != "")
        {$datos["velocidad"] = intval($usuario->velocidad);}
        #print_r($datos); exit;
        if($datos["id"] != 0 || $datos["id"] != "0")
        {
            $this->usuarios_model->actualizo($datos);
        }
    }
    catch(Exception $e)
    {
        return $e->getMessage();
    }
}
//_____________________________________________________
public function actualiza_puntos($tipo)
{
    try
    {
        $datos = array();
        $datos["id"] = $this->session->userdata("id");
        $datos["tipo"] = $tipo;
        $puntos = $this->usuarios_model->actualizo_puntos($this->session->userdata("id"), $tipo);
        exit;
        #return $this->usuarios_model->actualizo_puntos($this->session->userdata("id"), $tipo);
        #return $tipo;
    }
    catch(Exception $e)
    {
        return $e->getMessage();
    }
}

//_____________________________________________________
public function ganador($usuario_id, $enemigo_id){
    echo "Pendiente...";
}
//_____________________________________________________
public function muerto($usuario_id){
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "muerto";
    $datos = $parametros;
    $posicion = $this->campousuarios_model->consulto($this->session->userdata("id"));
    $campo = $this->campo_model->consulto($posicion["campo_id"]);
    #echo "<pre>"; print_r($campo); echo "</pre>"; exit;
    $datos = array();
    $datos["usuarios_id"] = $this->session->userdata("id");
    $datos["campo_id"] = $campo["mapa"]["campo_id"];
    $datos["x"] = $campo["mapa"]["x"];
    $datos["y"] = $campo["mapa"]["y"];
    #echo "<pre>"; print_r($datos); echo "</pre>"; exit;
    $this->campousuarios_model->actualizo($datos);
    redirect("/ingreso/mundo/2", 'location');
}
//_____________________________________________________
}
?>
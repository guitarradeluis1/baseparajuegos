<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Chat extends CI_Controller {
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
   
   $this->load->model('chat_model');
   $this->load->model('objeto_model');
   $this->load->model('usuarios_model');
   $this->load->model('campo_model');
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
           $parametros["controlador"] = "chat";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "chat";
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
public function envio()
{
    try
    {
        $json = json_decode($_POST['json']);
        $datos = array();
        $datos["usuario1"] = $this->session->userdata("id");
        $datos["usuario2"] = $json->contacto_jugador;
        $datos["campo_id"] = $json->contacto_campo;
        $datos["mapa_id"] = $json->contacto_piso;
        $datos["mapa_id"] = $json->contacto_piso;
        $datos["gremio_id"] = $json->contacto_gremio;
        $datos["mensaje"] = $json->mensaje;
        $this->chat_model->nuevo($datos);
    }
    catch(Exception $e)
    {
        return $e->getMessage();
    }
}
//_____________________________________________________
public function leer()
{
    try
    {
        $json = json_decode($_POST['json']);
        $datos = array();
        $datos["usuario2"] = $json->contacto_jugador;
        $datos["campo_id"] = $json->contacto_campo;
        $datos["mapa_id"] = $json->contacto_piso;
        $datos["grupo"] = $json->contacto_grupo;
        $datos["gremio_id"] = $json->contacto_gremio;
        $datos["usuario1"] = 0;
        if($datos["usuario2"] != 0)
        {
            $datos["usuario1"] = $this->session->userdata("id");
        }
        $datos["leer"] =  $this->chat_model->leer($datos);
        $this->load->view("chat/leer", $datos);
    }
    catch(Exception $e)
    {
        return $e->getMessage();
    }
}
//_____________________________________________________
}
?>
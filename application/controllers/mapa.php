<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Mapa extends CI_Controller {
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
   $this->load->library('pagination');
   $this->load->model('campo_model');
   $this->load->model('mapa_model');
}
//_____________________________________________________
    public function parametros()
    {
       $id = $this->session->userdata("id");
       if(isset($id) && $id !="")
       {
           $parametros = array();
           $parametros["total_registro"] = 20;
           $parametros["estilo"] = "cabesa";
           $parametros["controlador"] = "mapa";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "mapa";
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
public function index($paguina = null)
{
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $datos = $parametros;
   $datos["Salida"] = $this->mapa_model->todo();
   $this->load->view($parametros["estilo"],$datos);
   #$this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   #$this->load->view("Paguinacion", $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function add()
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add";
    $datos = $parametros;
    if (isset($_POST["post"]) )
    {
        #if ($_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->mapa_model->nuevo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index");
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/".$parametros["funcion"]);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function edit($id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "edit";
    $datos = $parametros;
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->mapa_model->actualizo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index");
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/".$parametros["funcion"]);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Salida"] = $this->mapa_model->consulto($id);
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function vista($id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "vista";
    $datos = $parametros;
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Salida"] = $this->mapa_model->consulto($id);
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
}
?>
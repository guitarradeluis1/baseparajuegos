<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campo extends CI_Controller {
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
   $this->load->model('objeto_model');
   $this->load->model('campoobjeto_model');
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
           $parametros["controlador"] = "campo";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "campo";
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
public function index($mapa_id)
{
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $datos = $parametros;
   $datos["Mapa"] = $this->mapa_model->consulto($mapa_id);
   $datos["Salida"] = $this->campo_model->todo($mapa_id);
   $this->load->view($parametros["estilo"],$datos);
   #$this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   #$this->load->view("Paguinacion", $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function add($mapa_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add";
    $datos = $parametros;
    if (isset($_POST["post"]) )
    {
        #if ($_POST['titulo']!="" && $_POST['guion']!="" ) campoobjeto_model
        {
            unset($_POST["post"]);
            $objeto_id = $_POST["objeto_id"];
            #echo "<pre>"; print_r($objeto_id); echo "</pre>";
            unset($_POST["objeto_id"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campo_model->nuevo($_POST, $objeto_id);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado != "") 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$mapa_id);
            }
            else if($resultado == "")
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/".$parametros["funcion"]."/".$mapa_id);
            }
        }
    }
    $datos["Mapa"] = $this->mapa_model->consulto($mapa_id);
    $datos["objeto"] = $this->objeto_model->lista();
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
    $datos["Salida"] = $this->campo_model->consulto($id);
    $datos["campo_objeto"] = $this->campoobjeto_model->consulto_campo($id);
    //$datos["objeto"] = $this->objeto_model->lista();
    $datos["Mapa"] = $this->mapa_model->consulto($datos["Salida"]["mapa_id"]);
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $datos = array();
            $datos["id"] = $id;
            $datos[$_POST["cambio"].""] = $_POST["dibujo_id"];
            $datos["nombre"] = $_POST["nombre"];
            #echo "<pre>"; print_r($datos); echo "</pre>"; exit;
            $resultado = $this->campo_model->actualizo($datos);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/".$parametros["funcion"]."/".$id);
                #redirect($parametros["controlador"]."/index/".$id);
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/".$parametros["funcion"]."/".$id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    #$datos["Mensaje_alerta"] = $mensaje;
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function add_campo_objeto($id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add_campo_objeto";
    $datos = $parametros;
    $datos["Salida"] = $this->campo_model->consulto($id);
    $datos["campo_objeto"] = $this->campoobjeto_model->consulto_campo($id);
    $datos["objeto"] = $this->objeto_model->lista();
    $datos["Mapa"] = $this->mapa_model->consulto($datos["Salida"]["mapa_id"]);
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campoobjeto_model->nuevo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/edit/".$id);
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/edit/".$id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    #$datos["Mensaje_alerta"] = $mensaje;
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
    $datos["Salida"] = $this->campo_model->consulto($id);
    #$this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    #$this->load->view("footer");
}
//_____________________________________________________
public function lista($mapa_id, $selector = 0)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "lista";
    $datos = $parametros;
    $datos["Salida"] = $this->campo_model->lista($mapa_id);
    $datos["selector"] = $selector;
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
}
//_____________________________________________________
}
?>
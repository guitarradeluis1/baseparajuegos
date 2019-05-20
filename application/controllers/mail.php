<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Mail extends CI_Controller {
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
   $this->load->model('mail_model');;
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
           $parametros["controlador"] = "mail";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "mail";
           $parametros["Mensaje_alerta"] = "";
           $parametros["session"] = $this->variables_session();
           if($parametros["session"]["tipousuario_id"]==1)
           {$parametros["menu"] = "Menu";}
           else
           {$parametros["menu"] = "Menu_acesor";}
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
public function index($campanas_id)
{
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $parametros["campanas_id"] = $campanas_id;
   $datos = $parametros;
   $datos["mails"] = $this->mail_model->todo($campanas_id);
   $this->load->view($parametros["estilo"],$datos);
   $this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   #$this->load->view("Paguinacion", $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function add($campanas_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add";
    $parametros["campanas_id"] = $campanas_id;
    $datos = $parametros;
    if (isset($_POST["post"]) )
    {
        if ($_POST['referente']!="")
        {
            $_POST["usuarios_id"] = $parametros["session"]["id_usuario"];
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->mail_model->nuevo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado != 0) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$campanas_id);
            }
            else
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/add/".$campanas_id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function edit($mail_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "edit";
    $datos = $parametros;
    if (isset($_POST["post"]) )
    {
        if ($_POST['id']!="")
        {
            $_POST["usuarios_id"] = $parametros["session"]["id_usuario"];
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            unset($_POST["post"]);
            $resultado = $this->mail_model->actualizo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$_POST["campanas_id"]);
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/index/".$mail_id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Salida"] = $this->mail_model->consulto($mail_id);
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
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
    $datos["Salida"] = $this->listas_model->consulto($id);
    $datos["Opciones"] = $this->listaopciones_model->todo($id);
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
}
?>
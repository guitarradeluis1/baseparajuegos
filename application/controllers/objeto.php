<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Objeto extends CI_Controller {
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
   $this->load->model('objeto_model');
   $this->load->model('objetotipo_model');
   $this->load->model('archivo_model');
   
   $this->load->helper('file');
   $this->load->helper(array('form', 'url'));
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
           $parametros["controlador"] = "objeto";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "objeto";
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
   $parametros["paguina"] = $paguina;
   #$pre = $this->objeto_model->todo();
   #$parametros["registros"] = $pre->num_rows;
   $datos = $parametros;
   $datos["Salida"] = $this->objeto_model->todo();
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
    $datos["objetotipo"] = $this->objetotipo_model->lista();
    if ( isset($_POST["post"]) )
    {
        #::::::::::::::::::::::::::::::::::::::::::::::
        $array_caracteres = array('~', '`', '!', '@', '#', '$', '%', '*', '^', '&', '(', ')', '-', '°', 'º', 'Âº', '-º', ' ', ':', ';');
        $tipo = explode("/", $_FILES["archivo"]["type"]);
        #echo "<pre>"; print_r($tipo); echo "</pre>";
        #echo "<pre>"; print_r($_FILES); echo "</pre>";
        #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
        #$full_url = base_url("csv/".$_FILES["archivo"]["name"]);
        #$full_url = "C:/AppServ/www/denwa/csv/".$_FILES["archivo"]["name"];
        $full_url = "archivos/".$_POST['nombre'].".".$tipo[1];
        #$succeso = move_uploaded_file($_FILES['archivo'], $full_url); # tmp_name
        #if (move_uploaded_file($_POST['nombre'], $full_url))
        if (move_uploaded_file($_FILES['archivo']['tmp_name'], $full_url))
        {
            //echo "El archivo es válido y fue cargado exitosamente.";#\n
            unset($_POST["submit"]);
            unset($_POST["post"]);
            $_POST["archivo"] = $_POST['nombre'].".".$tipo[1];
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->objeto_model->nuevo($_POST);
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
        else
        {
            echo "¡Posible ataque de carga de archivos!";#\n files
        }
        #::::::::::::::::::::::::::::::::::::::::::::::
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
    $datos["objetotipo"] = $this->objetotipo_model->lista();
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->objeto_model->actualizo($_POST);
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
    $datos["Salida"] = $this->objeto_model->consulto($id);
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
    $datos["Salida"] = $this->usuarios_model->consulto($id);
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function lista($objeto_id, $nombre, $selector = "")
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "lista";
    $datos = $parametros;
    $datos["objeto_id"] = $objeto_id;
    $datos["nombre"] = $nombre;
    $datos["selector"] = $selector;
    $datos["Salida"] = $this->dibujo_model->lista($objeto_id);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
}
//_____________________________________________________
}
?>
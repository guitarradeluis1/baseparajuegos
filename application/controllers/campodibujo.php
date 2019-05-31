<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campodibujo extends CI_Controller {
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
   
   $this->load->model('campodibujo_model');
   $this->load->model('campoobjeto_model');
   $this->load->model('campo_model');
   $this->load->model('mapa_model');
   $this->load->model('objeto_model');
   $this->load->model('campoenemigo_model');
   $this->load->model('arma_model');
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
           $parametros["controlador"] = "campodibujo";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "campodibujo";
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
public function index($campo_id)
{
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $datos = $parametros;
   #$datos["Mapa"] = $this->mapa_model->consulto($mapa_id);
   $datos["Salida"] = $this->campodibujo_model->todo($campo_id);
   $datos["Campo"] = $this->campo_model->consulto($campo_id);
   $datos["campo_objeto"] = $this->campoobjeto_model->consulto_campo($campo_id);
   $datos["campo_enemigo"] = $this->campoenemigo_model->consulto_campo($campo_id);
   $this->load->view($parametros["estilo"],$datos);
   #$this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   #$this->load->view("Paguinacion", $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function add($campo_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add";
    $datos = $parametros;
    $datos["Campo"] = $this->campo_model->consulto($campo_id);
    $datos["campo_objeto"] = $this->campoobjeto_model->consulto_campo($campo_id);
    $datos["campo_destino"] = $this->campo_model->lista();
    if (isset($_POST["post"]) )
    {
        #if ($_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campodibujo_model->nuevo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id);
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id);
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
public function edit($id, $campo_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "edit";
    $datos = $parametros;
    $datos["Salida"] = $this->campodibujo_model->consulto($id);
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campodibujo_model->actualizo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/". $campo_id);
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/index/". $campo_id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Campo"] = $this->campo_model->consulto($datos["Salida"]["campo_id"]);
    $datos["campo_objeto"] = $this->campoobjeto_model->consulto_campo($datos["Salida"]["campo_id"]);
    $datos["campo_destino"] = $this->campo_model->lista();
    #$datos["armas"] = $this->arma_model->lista();
    
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
public function eliminar($id, $campo_id)
{
    $this->campodibujo_model->eliminar($id);
    redirect("campodibujo/index/".$campo_id );
}
//_____________________________________________________
public function addenemigo($campo_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "addenemigo";
    $datos = $parametros;
    #$datos["Mapa"] = $this->mapa_model->consulto($mapa_id);
    $datos["Campo"] = $this->campo_model->consulto($campo_id);
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campoenemigo_model->nuevo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id );
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("Paguinacion", $datos);
    $this->load->view("footer");
}
//_____________________________________________________
public function editenemigo($id, $campo_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "editenemigo";
    $datos = $parametros;
    $datos["Campoenemigo"] = $this->campoenemigo_model->consulto($id);
    $datos["Campo"] = $this->campo_model->consulto($campo_id);
    if (isset($_POST["post"]) )
    {
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->campoenemigo_model->actualizo($_POST);
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id );
            }
            else if($resultado == 0)
            {
                #echo "<script>alert('nuevoregitra');</script>";
                redirect($parametros["controlador"]."/index/".$campo_id);
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("Paguinacion", $datos);
    $this->load->view("footer");
}
//_____________________________________________________
public function eliminarenemigo($id, $campo_id)
{
    $this->campoenemigo_model->eliminar($id);
    redirect("campodibujo/index/".$campo_id );
}
//_____________________________________________________
public function botonEditar($id, $campo_id)
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "botonEditar";
    $datos = $parametros;
    $datos["id"] = $id;
    $datos["campo_id"] = $campo_id;
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
}
//_____________________________________________________
}
?>
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuarios extends CI_Controller {
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
   $this->load->model('usuarios_model');
   $this->load->model('paises_model');
   $this->load->model('personaje_model');
   $this->load->model('campousuarios_model');
   $this->load->model('armausuarios_model');
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
           $parametros["controlador"] = "usuarios";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "usuarios";
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
   $pre = $this->usuarios_model->todo();
   $parametros["registros"] = $pre->num_rows;
   $datos = $parametros;
   $datos["Salida"] = $this->usuarios_model->todo_paginados($parametros["total_registro"], $paguina);
   $this->load->view($parametros["estilo"],$datos);
   #$this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   $this->load->view("Paguinacion", $datos);
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
            $resultado = $this->usuarios_model->nuevo($_POST);
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
public function edit()
{
    $id = $this->session->userdata("id");
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "edit";
    $datos = $parametros;
    $datos["paises"] = $this->paises_model->lista();
    if (isset($_POST["id"]) )
    {
        if($_POST["pass"] == "")
        {
            $_POST["pass"] = "xxxxxxxxxsdfsfsdfsdfsdfsdfsdfsdfjxxxxxxxxxxxxxxxxxx";
        }
        if($_POST["pass1"] == "")
        {
            $_POST["pass1"] = "dsddkkkkkkkkkkkkkkkkkkkkkllllllllllllffffffffffffff";
        }
        #if ($_POST['id']!="" &&  $_POST['titulo']!="" && $_POST['guion']!="" )
        {
            if($_POST["pass"] == $_POST["pass1"])
            {
                unset($_POST["pass1"]);
            }
            else
            {
                unset($_POST["pass1"]);
                unset($_POST["pass"]);
            }
            unset($_POST["post"]);
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = $this->usuarios_model->actualizo($_POST);
            if($resultado == 1) 
            {
                #echo "<script>alert('Neuvo registro creado.');</script>";
                $this->session->set_userdata("paises_id", $_POST["paises_id"]);
                $this->session->set_userdata("fecha_nacimento", $_POST["fecha_nacimento"]);
                redirect("/ingreso/index");
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
    $datos["Salida"] = $this->usuarios_model->consulto($id);
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function vista()
{
    $id = $this->session->userdata("id");
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "vista";
    $datos = $parametros;
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Salida"] = $this->usuarios_model->consulto($id);
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function escojer_personaje()
{
    $id = $this->session->userdata("id");
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "escojer_personaje";
    $datos = $parametros;
    #$datos["Mensaje_alerta"] = $mensaje;
    $datos["Salida"] = $this->usuarios_model->consulto($id);
    $datos["personajes"] = $this->personaje_model->todo();
    $this->load->view($parametros["estilo"],$datos);
    #$this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function elegi_personaje($personaje_id)
{
    $id = intval($this->session->userdata("id"));
    $personaje_id = intval($personaje_id);
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "elegi_personaje";
    $datos = $parametros;
    #echo "<pre>"; print_r($parametros["session"]); echo "</pre>"; exit;
    if($parametros["session"]["personaje_id"]==0)
    {
        $actualizo = array();
        $actualizo["id"] = $this->session->userdata("id");
        $actualizo["personaje_id"] = $personaje_id;
        #echo "<pre>"; print_r($actualizo); echo "</pre>"; exit;
        $resultado = $this->usuarios_model->actualizo($actualizo);
        if($resultado == 1) 
        {
            #echo "<script>alert('Neuvo registro creado.');</script>";
            $this->campousuarios_model->nuevo($id);
            $this->armausuarios_model->nuevo($id);
            $this->session->set_userdata("personaje_id", $personaje_id);
            echo "<script>window.location.href = '../ingreso/mundo/1';</script>";
        }
        else if($resultado == 0)
        {
            echo "<script>window.location.href = '../usuarios/escojer_personaje';</script>";
            #redirect($parametros["controlador"]."/escojer_personaje/");
        }
    }
}
//_____________________________________________________
}
?>
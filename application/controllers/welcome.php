<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
     
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
   $this->load->model('usuarios_model');
   $this->load->model('paises_model');
}
//_____________________________________________________
public function parametros()
{
   $parametros = array();
   $parametros["total_registro"] = 3;
   $parametros["estilo"] = "cabesa";
   $parametros["controlador"] = "welcome";
   $parametros["funcion"] = "";
   $parametros["carpeta"] = "welcome";
   $parametros["Mensaje_alerta"] = "";
   #$parametros["session"] = $this->variables_session();
   return $parametros;
}
//_____________________________________________________
public function index($mensaje = null)
{
   #$this->session->sess_destroy();
   $datos = array();
   $parametros = $this->parametros();
   $datos = $parametros;
   $datos["Mensaje_alerta"] = $mensaje;
   #$datos["controlador"] = $parametros["controlador"];
   #$datos["accion"] = "index";
   #$this->load->view('welcome_message');
    if (isset($_POST['correo']) && isset($_POST['pass']) )
    {
        if ($_POST['correo']!="" && $_POST['pass']!="" )
        {
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = 0;
            $resultado = $this->usuarios_model->verificar($_POST['correo'], $_POST['pass'] );
            if($resultado == 1)
            {
                #echo $this->session->userdata("id"); exit;
                if($this->session->userdata("id")>0)
                {redirect("/ingreso/index", 'location');}
                #redirect(base_url()."/",'refresh');
                #echo $this->session->userdata("id");
                #echo "Existe..."; exit;
            }
            else
            {
                $datos["Mensaje_alerta"] = "Datos incorrectos.";
                #redirect(base_url()."/".$datos["Mensaje_alerta"],'');
                #redirect("/".$datos["controlador"]."/234", 'location');
            }
        }
    }
   $this->load->view($parametros["estilo"],$datos);
   $this->load->view($parametros["carpeta"]."/index", $datos);
   $this->load->view("alerta");
   $this->load->view("footer");
}
//_____________________________________________________
public function nuevo($mensaje = null)
{
   #$this->session->sess_destroy();
   $datos = array();
   $parametros = $this->parametros();
   $datos = $parametros;
   $datos["Mensaje_alerta"] = $mensaje;
   $datos["funcion"] = "nuevo";
   $datos["paises"] = $this->paises_model->lista();
   #$datos["accion"] = "index";
   #$this->load->view('welcome_message');
    if (isset($_POST['control']) )
    {
        #-----
        $yaregistrado = 0;
        $yaregistrado = $this->usuarios_model->consultaexistencia("email", $_POST['email']);
        if($yaregistrado == 1){echo '<script> box_mensaje("E-mail ya registrado.", "label_rojo");</script>';exit;}
        #-----
        $yaregistrado = 0;
        $yaregistrado = $this->usuarios_model->consultaexistencia("nombre", $_POST['nombre']);
        if($yaregistrado == 1){echo '<script> box_mensaje("Nombre ya registrado.", "label_rojo");</script>';exit;}
        #-----
        $yaregistrado = 1;
        if($_POST['pass'] === $_POST['pass1']){$yaregistrado = 0;}
        if($yaregistrado == 1){echo '<script> box_mensaje("La contrase\u00f1a no coinside.", "label_rojo");</script>';exit;}
        #-----
        #if ($_POST['correo']!="" && $_POST['pass']!="" )
        {
            unset($_POST["control"]);
            unset($_POST["pass1"]);
            $_POST["arma1"] = 0;
            $_POST["arma2"] = 0;
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            $resultado = 0;
            $resultado = $this->usuarios_model->nuevo($_POST);
            if($resultado != 0) 
            {
                echo '<script>box_mensaje("Usuario Creado.", "label_verde");</script>';
                echo '<script> location.href ="./index";</script>';
                #redirect($parametros["controlador"]."/index/");
            }
            else
            {
                #redirect($parametros["controlador"]."/add/".$campanas_id);
                echo '<script> box_mensaje("Error: Creación de usuario.", "label_rojo");</script>';exit;
            }
        }
    }
   $this->load->view($parametros["estilo"],$datos);
   $this->load->view($parametros["carpeta"]."/nuevo", $datos);
   $this->load->view("alerta");
   $this->load->view("footer");
}
//_____________________________________________________
public function salir()
{
    $parametros = $this->parametros();
    $this->session->sess_destroy();
    redirect("/".$parametros["controlador"]."/", 'location');
}
//_____________________________________________________
}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>
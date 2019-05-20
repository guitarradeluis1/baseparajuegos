<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Files extends CI_Controller {

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
   #$this->load->helper('url');
   #$this->load->helper('form');
   $this->load->helper('general');
   $this->load->library('session');
   $this->load->library('pagination');
   $this->load->helper(array('download', 'file', 'url', 'html', 'form'));
   $this->folder = 'uploads/';
   $this->load->model('campanas_model');
   $this->load->model('campos_model');
   $this->load->model('denwa_model');
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
           $parametros["controlador"] = "files";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "files";
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
public function index($paguina = null)
{
    $parametros = $this->parametros();
    $this->load->view($parametros["controlador"].'/upload_form', array('error' => ' ' )); 
}
//_____________________________________________________
public function add() 
{
    $parametros = $this->parametros();
    $config['upload_path'] = './uploads/';
	$config['allowed_types'] = "";#'gif|jpg|png';
	$config['max_size']	= '200';
	$config['max_width']  = '1024';
	$config['max_height']  = '768';
	
	$this->load->library('upload', $config);

	if ( ! $this->upload->do_upload())
	{
		$error = array('error' => $this->upload->display_errors());
		
		$this->load->view($parametros["controlador"].'/add', $error);
	}	
	else
	{
		$data = array('upload_data' => $this->upload->data());
		
		$this->load->view('add', $data);
	}

}
//_____________________________________________________
public function cargando()
{
    $parametros = $this->parametros();
   $config['upload_path'] = './uploads/';
	$config['allowed_types'] = 'txt';
	$config['max_size']	= '100';
	$config['max_width']  = '1024';
	$config['max_height']  = '768';
	
	$this->load->library('upload', $config);

	if ( ! $this->upload->do_upload())
	{
		$error = array('error' => $this->upload->display_errors());
		
		$this->load->view($parametros["controlador"].'/add', $error);
	}	
	else
	{
		$data = array('upload_data' => $this->upload->data());
		$this->load->view('upload_success', $data);
	}
}
//_____________________________________________________
public function downloads($name)
{
       $data = file_get_contents($this->folder.$name); 
       force_download($name,$data); 
}
//_____________________________________________________
public function adddenwa($campanas_id) 
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "adddenwa";
    $datos = $parametros;
    $datos["campanas_id"] = $campanas_id;
    $datos["Campana"] = $this->campanas_model->consulto($campanas_id);
    if (isset($_POST["submit"]) )
    {
        $array_caracteres = array('~', '`', '!', '@', '#', '$', '%', '*', '^', '&', '(', ')', '-', '°', 'º', 'Âº', '-º', ' ', ':', ';');
        #echo "<pre>"; print_r($_FILES); echo "</pre>";
        #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
        #$full_url = base_url("csv/".$_FILES["archivo"]["name"]);
        #$full_url = "C:/AppServ/www/denwa/csv/".$_FILES["archivo"]["name"];
        $full_url = "csvdenwa/".$_FILES["archivo"]["name"];
        #$succeso = move_uploaded_file($_FILES['archivo'], $full_url); tmp_name
        if (move_uploaded_file($_FILES['archivo']['tmp_name'], $full_url))
        {
            echo "El archivo es válido y fue cargado exitosamente.";#\n
        }
        else
        {
            echo "¡Posible ataque de carga de archivos!";#\n files
        }
    }
    #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");

}
//_____________________________________________________
public function leer($archivo, $campanas_id)
{
    $Datos = array();
    $fila = 1;
    if (($gestor = fopen("csvdenwa/".$archivo, "r")) !== FALSE)
    {
        while (($corte = fgetcsv($gestor, 1000, ",")) !== FALSE)
        {
            $numero = count($corte);
            #echo "<p> $numero de campos en la línea $fila: <br /></p>";
            $fila++;
            for ($c=0; $c < $numero; $c++)
            {
                $Datos[] = $corte[$c];
            }
        }
        fclose($gestor);
    }
    else
    {
        echo "Error";
    }
    #echo "<pre>"; print_r($Datos); echo "</pre>"; exit;
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "leer";
    $datos = $parametros;
    $datos["campanas_id"] = $campanas_id;
    $datos["Campos_salida"] = $this->campos_model->todo($campanas_id);
    $datos["Campana"] = $this->campanas_model->consulto($campanas_id);
    $datos["Datos"] = $Datos;
    $this->load->view($parametros["estilo"],$datos);
    $this->load->view($parametros["menu"]);
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function carga_sql($sql)
{
    /*:espacio: 
    :inicia: (
    :fin: )
    :nada: ''
    :coma: ,
    :comi: '*/
    $sql = str_replace(":espacio:", " ", $sql);
    $sql = str_replace("%20", " ", $sql);
    $sql = str_replace(":inicia:", "(", $sql);
    $sql = str_replace(":fin:", ")", $sql);
    $sql = str_replace(":coma:", ",", $sql);
    $sql = str_replace(":nada:", "''", $sql);
    $sql = str_replace(":comi:", "'", $sql);
    if(2 == 2)
    {
        #echo $sql; exit;
        $resultado = $this->denwa_model->query($sql);
        if($resultado == 1)
        {
            echo "Carga exitosa<br />".$sql;
        }
        else
        {
            echo "Error de carga<br />".$sql;
        }
    }
    else
    {
        echo $sql;
    }
    exit;
}
//_____________________________________________________
}
?>
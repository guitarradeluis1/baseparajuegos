<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Reportes extends CI_Controller {
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
   $this->load->model('campanas_model');
   $this->load->model('campos_model');
   $this->load->model('denwa_model');
   $this->load->model('salidas_model');
   $this->load->model('agendasmientodenwa_model');
   $this->load->model('pibotesitems_model');
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
           $parametros["controlador"] = "reportes";
           $parametros["funcion"] = "";
           $parametros["carpeta"] = "reportes";
           $parametros["Mensaje_alerta"] = "";
           $parametros["session"] = $this->variables_session();
           if($parametros["session"]["tipousuario_id"]==1)
           {$parametros["menu"] = "Menu";}
           else
           {$parametros["menu"] = "Menu_acesor";}
           return $parametros;
       }
       else
       {redirect("/welcome/salir", 'location');exit;}
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
   $datos = array();
   $parametros = $this->parametros();
   $parametros["funcion"] = "index";
   $datos = $parametros;
   $this->load->view($parametros["estilo"],$datos);
   $this->load->view($parametros["menu"]);
   $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
   $this->load->view("footer");
}
//_____________________________________________________
public function add()
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "add";
    $datos = $parametros;
    $datos["importo"] = 0;
    $datos["Campanas"] = $this->campanas_model->lista_opciones();
    if (isset($_POST["post"]) )
    {}
    else
    {
        $this->load->view($parametros["estilo"],$datos);
        $this->load->view($parametros["menu"]);
    }
    if (isset($_POST["post"]) )
    {
        $datos["importo"] = 1;
        #if ($_POST['titulo']!="" && $_POST['guion']!="" )
        {
            unset($_POST["post"]);
            $datos["Campana"] = $this->campanas_model->consulto($_POST["camapanas_id"]);
            $datos["Campos"] = $this->campos_model->todo($_POST["camapanas_id"]);
            #echo "<pre>"; print_r($datos["Campos"]); echo "</pre>";
            #echo "<pre>"; print_r($datos["Campana"]); echo "</pre>";
            #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
            if($_POST["vista"] == 0)
            {
                $this->load->view("Excel", $datos);
            }
            else if($_POST["vista"] == 1)
            {
                $this->load->view($parametros["estilo"],$datos);
                $this->load->view($parametros["menu"]);
            }
            else if($_POST["vista"] == 2)
            {
                $this->load->view("csv", $datos);
            }
            #..................................................................
            if($datos["Campana"]["generado"] == 1)
            {
                if($datos["Campana"]["tipocampana"]== 0)
                {
                    #Entrada
                    #$datos["Consulta"] = $this->denwa_model->consulta_campana_todo($_POST["camapanas_id"]);
                    $datos["Consulta"] = $this->denwa_model->consulta_campana_todo_fecha($_POST["camapanas_id"], $_POST["inicio"], $_POST["fin"]);
                    $this->load->view($parametros["carpeta"]."/Entrada", $datos);
                }
                else
                {
                    if($datos["Campana"]["saliendo"]== 1)
                    {
                        if($datos["Campana"]["tipobusca"]== 0)
                        {
                           #Salida aleatorio
                        }
                        else
                        {
                            #Salida buscador
                        }
                        $datos["Campos_salida"] = $this->salidas_model->todo($_POST["camapanas_id"]);
                        #$datos["Consulta"] = $this->denwa_model->consulta_campana_todo($_POST["camapanas_id"]);
                        $datos["Consulta"] = $this->denwa_model->consulta_campana_todo_fecha($_POST["camapanas_id"], $_POST["inicio"], $_POST["fin"]);
                        foreach($datos["Consulta"] as $key => $valor)
                        {
                            $datos["Consulta"][$key]["Salida"] = $this->denwa_model->espesifico_salida($valor["saliente_id"], $_POST["camapanas_id"]);
                            $datos["Consulta"][$key]["Salida"] = $datos["Consulta"][$key]["Salida"][0];
                        }
                        $this->load->view($parametros["carpeta"]."/Salida", $datos);
                    }
                }
            }
            #..................................................................
            #echo "<pre>"; print_r($resultado); echo "</pre>"; exit;
            
        }
    }
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    #$this->load->view("botones_menu");
    $this->load->view("footer");
}
//_____________________________________________________
public function campanaunicasaiente()
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "campanaunicasaiente";
    $datos = $parametros;
    $datos["importo"] = 0;
    $datos["vist"] = 0;
    $Campanas_salis = $this->campanas_model->todo();
    #echo "<pre>"; print_r($Campanas_salis->result()); echo "</pre>"; exit();
    $datos["Campanas"] = array();
    foreach($Campanas_salis->result() as $Campanas_sali)
    {
        if($Campanas_sali->tipocampana == 1 && $Campanas_sali->activo == 1)
        {
            $datos["Campanas"][$Campanas_sali->id] = $Campanas_sali->titulo;
        }
    }
    if (isset($_POST["post"]) )
    {
        if ($_POST["vista"] == 1)//Vista
        {
            $datos["vist"] = 0;
        }
        else if($_POST["vista"] == 0)//Excel
        {
            $datos["vist"] = 1;
            $this->load->view("Excel");
        }
        else if($_POST["vista"] == 2)
        {
            $datos["vist"] = 2;
            $this->load->view("csv");
        }
    }
    #---------------------------------------------------
    if($datos["vist"] == 0)
    {
        $this->load->view($parametros["estilo"],$datos);
        $this->load->view($parametros["menu"]);
    }
    #---------------------------------------------------
    if (isset($_POST["post"]) )
    {
        #$datos["importo"] = 1;
        if($_POST["vista"] == 0)//Excel
        {
            $datos["importo"] = 1;
        }
        else if($_POST["vista"] == 2)
        {
            $datos["importo"] = 2;
        }
        unset($_POST["post"]);
        #echo "<pre>"; print_r($_POST); echo "</pre>"; exit;
        $datos["Campos_salida"] = $this->salidas_model->todo($_POST["camapanas_id"]);
        $datos["Campos"] = $this->campos_model->todo($_POST["camapanas_id"]);
        $datos["Consulta"] = $this->denwa_model->ultimagestionsaliente($_POST["camapanas_id"]);#, $_POST["inicio"], $_POST["fin"]
        #echo "<pre>"; print_r($datos["Consulta"]); echo "</pre>"; exit;
        foreach($datos["Consulta"] as $key => $valor)
        {
            $datos["Consulta"][$key]["Gestion"] = $this->denwa_model->ultimagestionecha($_POST["camapanas_id"], $datos["Consulta"][$key]["id"]);
            if(isset($datos["Consulta"][$key]["Gestion"][0]["usuarios_id"]))
            {
                $datos["Consulta"][$key]["Usuario"] = $this->usuarios_model->consulto($datos["Consulta"][$key]["Gestion"][0]["usuarios_id"]);
            }
        }
        #echo "<pre>"; print_r($datos["Consulta"]); echo "</pre>"; exit();
    }
    #---------------------------------------------------
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    if($datos["vist"] == 0)
    {
        #$this->load->view("botones_menu");
        $this->load->view("footer");
    }
}
//_____________________________________________________
public function campanaunicasaiente2()
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "campanaunicasaiente2";
    $datos = $parametros;
    $datos["importo"] = 0;
    $datos["vist"] = 0;
    $Campanas_salis = $this->campanas_model->todo();
    #echo "<pre>"; print_r($Campanas_salis->result()); echo "</pre>"; exit();
    $datos["Campanas"] = array();
    foreach($Campanas_salis->result() as $Campanas_sali)
    {
        if($Campanas_sali->tipocampana == 1 && $Campanas_sali->activo == 1)
        {
            $datos["Campanas"][$Campanas_sali->id] = $Campanas_sali->titulo;
        }
    }
    if (isset($_POST["post"]) )
    {
        if ($_POST["vista"] == 1)//Vista
        {
            $datos["vist"] = 0;
        }
        else if($_POST["vista"] == 0)//Excel
        {
            $datos["vist"] = 1;
            $this->load->view("Excel");
        }
        else if($_POST["vista"] == 2)
        {
            $datos["vist"] = 1;
            $this->load->view("csv");
        }
    }
    #---------------------------------------------------
    if($datos["vist"] == 0)
    {
        $this->load->view($parametros["estilo"],$datos);
        $this->load->view($parametros["menu"]);
    }
    #---------------------------------------------------
    if (isset($_POST["post"]) )
    {
        #$datos["importo"] = 1;
        if($_POST["vista"] == 0)//Excel
        {
            $datos["importo"] = 1;
        }
        else if($_POST["vista"] == 2)
        {
            $datos["importo"] = 2;
        }
        unset($_POST["post"]);
        #echo "<pre>"; print_r($_POST); echo "</pre>";# exit;
        $Consulta = $this->denwa_model->denwaconsaliente($_POST["camapanas_id"]);
        $Filtro = array();
        $temporal = array();
        $conteo = 0;
        foreach($Consulta as $consulta)
        {
            $temporal["saliente_id"] = $consulta["saliente_id"];
            $temporal["denwa_id"] = $consulta["denwa_id"];
            foreach($Consulta as $comparo)
            {
                //----------------------------
                if($comparo["saliente_id"] == $temporal["saliente_id"])
                {
                    if($comparo["denwa_id"] > $temporal["denwa_id"])
                    {
                        $temporal["denwa_id"] = $comparo["denwa_id"];
                    }
                }
                //----------------------------
            }
            //...
            $Filtro[$conteo] = $temporal;
            $conteo = $conteo + 1;
        }
        $conteo = 0;
        $Filtrofinal = array();
        foreach($Filtro as $filtro)
        {
            if($conteo == 0)
            {
                $Filtrofinal[$conteo] = $filtro;
                $conteo = $conteo + 1;
            }
            else
            {
                if( $Filtrofinal[$conteo-1]["saliente_id"] != $filtro["saliente_id"] )
                {
                    $Filtrofinal[$conteo] = $filtro;
                    $conteo = $conteo + 1;
                }
            }
        }
        foreach($Filtrofinal as $key => $valor)
        {
            $Filtrofinal[$key]["Salida"] = $this->salidas_model->espesifico($valor["saliente_id"], $_POST["camapanas_id"]);
            $Gestion = $this->denwa_model->espesifico($valor["denwa_id"], $_POST["camapanas_id"]);            
            $Filtrofinal[$key]["Gestion"] = $Gestion;
            $Filtrofinal[$key]["Usuario"] = $this->usuarios_model->consulto( $Gestion[0]->usuarios_id );
        }
        #echo "<pre>"; print_r($Consulta); echo "</pre><hr />"; #exit();
        #echo "<pre>"; print_r($Filtrofinal); echo "</pre>"; exit();
        $datos["Campos_salida"] = $this->salidas_model->todo($_POST["camapanas_id"]);
        $datos["Campos"] = $this->campos_model->todo($_POST["camapanas_id"]);
        $datos["Consulta"] = $Filtrofinal;        
    }
    #---------------------------------------------------
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    if($datos["vist"] == 0)
    {
        #$this->load->view("botones_menu");
        $this->load->view("footer");
    }
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
public function agendamiento()
{
    $datos = array();
    $parametros = $this->parametros();
    $parametros["funcion"] = "agendamiento";
    $datos = $parametros;
    $datos["importo"] = 0;
    $datos["vist"] = 0;
    $Campanas_salis = $this->campanas_model->todo();
    #echo "<pre>"; print_r($Campanas_salis->result()); echo "</pre>"; exit();
    $datos["Campanas"] = array();
    foreach($Campanas_salis->result() as $Campanas_sali)
    {
        #if($Campanas_sali->tipocampana == 1 && $Campanas_sali->activo == 1)
        {
            $datos["Campanas"][$Campanas_sali->id] = $Campanas_sali->titulo;
        }
    }
    if (isset($_POST["post"]) )
    {
        if ($_POST["vista"] == 1)//Vista
        {
            $datos["vist"] = 0;
        }
        else if($_POST["vista"] == 0)//Excel
        {
            $datos["vist"] = 1;
            $this->load->view("Excel");
        }
        else if($_POST["vista"] == 2)
        {
            $datos["vist"] = 1;
            $this->load->view("csv");
        }
    }
    #---------------------------------------------------
    if($datos["vist"] == 0)
    {
        $this->load->view($parametros["estilo"], $datos);
        $this->load->view($parametros["menu"]);
    }
    #---------------------------------------------------
    if (isset($_POST["post"]) )
    {
        $datos["importo"] = 1;
        if($_POST["vista"] == 0)//Excel
        {
            $datos["importo"] = 1;
        }
        else if($_POST["vista"] == 2)
        {
            $datos["importo"] = 2;
        }
        unset($_POST["post"]);
        #echo "<pre>"; print_r($_POST); echo "</pre>";
        $Agendas = array();
        $Agendas = $this->agendasmientodenwa_model->consultaagenda($_POST["camapanas_id"]);
        foreach($Agendas as $key => $valor)
        {
            $Agendas[$key]["Usuario"] = $this->usuarios_model->consulto( $valor["dato"][0]->usuarios_id );
            $Agendas[$key]["Pibote"] = $this->pibotesitems_model->consultoespesofico( $valor["agenda"]["pibote"], $valor["agenda"]["pibotesitems_id"] );
        }
        $datos["Agendas"] = $Agendas;
        $datos["Campos"] = $this->campos_model->todo($_POST["camapanas_id"]);
        #echo "<pre>"; print_r($datos["Agendas"]); echo "</pre>";
        #exit;   
    }
    #---------------------------------------------------
    $this->load->view($parametros["carpeta"]."/".$parametros["funcion"], $datos);
    if($datos["vist"] == 0)
    {
        #$this->load->view("botones_menu");
        $this->load->view("footer");
    }
}
//_____________________________________________________
}
?>
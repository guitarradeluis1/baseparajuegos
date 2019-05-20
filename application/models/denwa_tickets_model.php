<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Denwa_tickets_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('salidas_model');
       $this->load->model('campos_model');
       $this->load->model('usuarios_model');
    }
//________________________________________________________________
function todo($tickets_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('tickets_'.$tickets_id);
	return  $consulta;
}
//____________________________________________________________________
function espesifico($id, $campana_id)
{
    $this->db->where("id", $id);
	$consulta = $this->db->get('denwa_'.$campana_id);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        return $data;
    }
}
//_____________________________________________________________________
function nuevo($tickets_id, $datos)
{
    $datos["fecha"] = date("d-m-Y");
    $datos["hora"] = date("h:i:s A");
    #if($datos["saliente_id"]!="")
    {
        #Actualizo el leiod
        #$this->lei($campanas_id, $datos["saliente_id"]);
    }
    $this->db->insert('tickets_'.$tickets_id, $datos);
    $id = "";
    $id = $this->db->insert_id();
    return $id;
}
//_____________________________________________________________________
function agenda($tickets_id, $fecha, $campo_consulto= null, $consultor = null)
{
    $this->db->where("TICKETS_FECHA_AGENDA", $fecha);
    if($campo_consulto != "" && $consultor != "")
    {
        $this->db->like($campo_consulto, $consultor);
    } 
	$consulta = $this->db->get('tickets_'.$tickets_id);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        return $data;
    }
}
//______________________________________________________________________
function actualizo($id, $tabla, $datos)
{
    #$datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update($tabla, $datos); 
}
//______________________________________________________________________
}
?>
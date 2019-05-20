<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Listado_tiempos_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       #$this->load->library('session');
       #$this->load->model('lineadeservicios_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('listado_tiempos');
	return  $consulta;
}
function todo_paginados($por_pagina,$segmento) 
{
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('listado_tiempos',$por_pagina,$segmento);
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
function lista_opciones()
{
    $Arreglo = array();
    $this->db->select('*');
        $this->db->from('listado_tiempos');
        #$this->db->where("id", $sedes_id);
        $this->db->order_by('orden', 'asc');
        $sql = $this->db->get();
        $Arreglo["00:00:00"] = "Ninguno.";
        foreach($sql->result() as $datos)
        {
            $Arreglo[$datos->valor] = $datos->nombre;
            #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
        }
    return $Arreglo;
}
//______________________________________________________________________
function nuevo($datos)
{
    $datos["creado"] = date("d-m-Y");
    return $this->db->insert('listado_tiempos', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('listado_tiempos', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    $retorno = array();
    if($id)
    {
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('listado_tiempos');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'orden' => $info->orden,
           'nombre' => $info->nombre,
           'valor' => $info->valor
       );
    }
    }
	return  $retorno;
}
//______________________________________________________________________
}
?>
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Listaopciones_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       #$this->load->library('session');
       #$this->load->model('lineadeservicios_model');
    }
//________________________________________________________________
function todo($listas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('listas_id', $listas_id);
    #$this->db->order_by('ida', 'desc');
	$consulta = $this->db->get('listaopciones');
	if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        return $data;
    }
}
function todo_paginados($por_pagina,$segmento) 
{
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('listas',$por_pagina,$segmento);
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
function nuevo($datos)
{
    #$datos["creado"] = date("d-m-Y");
    return $this->db->insert('listaopciones', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('listaopciones', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('listaopciones');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'listas_id' => $info->listas_id,
           'opcion' => $info->opcion
       );
    }
	return  $retorno;
}
//______________________________________________________________________
function todo_selector($listas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('listas_id', $listas_id);
    $this->db->order_by('opcion', 'asc');
	$consulta = $this->db->get('listaopciones');
	if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $key => $valor)
        {
            $data[$valor->opcion] = $valor->opcion;
        }
        return $data;
    }
}
//______________________________________________________________________
}
?>
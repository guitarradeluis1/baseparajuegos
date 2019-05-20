<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Listas_model extends CI_Model
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
	$consulta = $this->db->get('listas');
	return  $consulta;
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
//________________________________________________________________
function todo_filtro($orden_listas = null)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
    if($orden_listas != null)
    {
        $this->db->where("orden_listas", $orden_listas);
    }
    else
    {
         $this->db->where("orden_listas", null);
    }
	$consulta = $this->db->get('listas');
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
        $this->db->from('listas');
        #$this->db->where("id", $sedes_id);
        $this->db->order_by('nombre', 'asc');
        $sql = $this->db->get();
        $Arreglo[""] = "Ninguno.";
        foreach($sql->result() as $datos)
        {
            $Arreglo[$datos->id] = $datos->nombre;
            #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
        }
    return $Arreglo;
}
//______________________________________________________________________
function nuevo($datos)
{
    $datos["creado"] = date("d-m-Y");
    return $this->db->insert('listas', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('listas', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    $retorno = array();
    if($id)
    {
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('listas');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'nombre' => $info->nombre,
           'creado' => $info->creado,
           'cambio' => $info->cambio,
           'orden_listas' => $info->orden_listas
       );
    }
    }
	return  $retorno;
}
//______________________________________________________________________
}
?>
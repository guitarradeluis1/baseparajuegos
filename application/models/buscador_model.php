<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Buscador_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       #$this->load->library('session');
       $this->load->model('salidas_model');
       $this->load->model('campanas_model');
    }
//________________________________________________________________
function todo($campanas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("campanas_id", $campanas_id);
    #$this->db->order_by('id', 'desc');
	$consulta = $this->db->get('buscador');
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        if(count($data)>0)
        {
            $Arreglo = array();
            $K = 0;
            foreach($data as $info)
            {
                $Arreglo[$K] = array
                (
                   'id' => $info->id,
                   'salidas_id' => $info->salidas_id,
                   'campanas_id' => $info->campanas_id
               );
               ####################################################################
               $Arreglo[$K]["salida"] = $this->salidas_model->consulto($info->salidas_id);
               $Arreglo[$K]["campana"] = $this->campanas_model->consulto($info->campanas_id);
               ####################################################################
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
function todo_paginados($por_pagina,$segmento) 
{
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('buscador',$por_pagina,$segmento);
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
        $this->db->from('buscador');
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
    #$datos["creado"] = date("d-m-Y");
    return $this->db->insert('buscador', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('buscador', $datos); 
}
//______________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('buscador');
}
//______________________________________________________________________
function consulto($id)
{
    $retorno = array();
    if($id)
    {
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('buscador');
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
           'cambio' => $info->cambio
       );
    }
    }
	return  $retorno;
}
//______________________________________________________________________
}
?>
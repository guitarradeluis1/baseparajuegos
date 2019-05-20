<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Salidas_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       #$this->load->library('session');
       #$this->load->model('tipos_model');
       #$this->load->model('listas_model');
    }
//________________________________________________________________
function todo($campanas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('campanas_id', $campanas_id);
    #$this->db->order_by('ida', 'desc');
	$consulta = $this->db->get('salidas');
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
                    'campanas_id' => $info->campanas_id,
                    'nombre' => $info->nombre,
                    'titulo' => $info->titulo,
                    'tipo' => $info->tipo,
                    'email' => $info->email,
                );
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
    $consulta = $this->db->get('campos',$por_pagina,$segmento);
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
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    return $this->db->insert('salidas', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('salidas', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('salidas');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'campanas_id' => $info->campanas_id,
           'nombre' => $info->nombre,
           'titulo' => $info->titulo,
           'tipo' => $info->tipo,
           'email' => $info->email,
       );
    }
	return  $retorno;
}
//______________________________________________________________________
function datos($campanas_id)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    #$this->db->where('id', $datos["id"]);
    $consulta = $this->db->get('saliente_'.$campanas_id);
    return $consulta; 
}
//______________________________________________________________________
function lista($campanas_id)#($pagination, $segment)
{
    $Arreglo = array();
    $this->db->select('*');
        $this->db->from('salidas');
        $this->db->where("campanas_id", $campanas_id);
        $this->db->order_by('titulo', 'asc');
        $sql = $this->db->get();
        foreach($sql->result() as $datos)
        {
            $Arreglo[$datos->id] = $datos->titulo;
            #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
        }
    return $Arreglo;
}
//______________________________________________________________________
function espesifico($id, $campanas)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('saliente_'.$campanas);
    $this->db->where("id",$id);
    $consulta = $this->db->get();
    /*foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'campanas_id' => $info->campanas_id,
           'nombre' => $info->nombre,
           'titulo' => $info->titulo,
           'tipo' => $info->tipo,
           'email' => $info->email,
       );
    }*/
    $consulta = $consulta->result_array();
    $consulta = $consulta[0];
	return  $consulta;
}
//______________________________________________________________________
function edito_espesifico($campanas, $datos)
{
    $this->db->where('id', $datos["id"]);
    return $this->db->update('saliente_'.$campanas, $datos); 
}
//______________________________________________________________________
}
?>
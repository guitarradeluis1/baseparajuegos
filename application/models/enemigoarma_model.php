<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Enemigoarma_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('arma_model');
       $this->load->model('enemigo_model');
    }
//________________________________________________________________
function todo($enemigo_id)
{
    $this->db->order_by('id', 'asc');
    $this->db->where("enemigo_id",$enemigo_id);
	$consulta = $this->db->get('enemigo_arma');
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
                    'enemigo_id' => $info->enemigo_id,
                    'arma_id' => $info->arma_id
               );
               ####################################################################
               $Arreglo[$K]["enemigo"] = $this->enemigo_model->consulto($info->enemigo_id);
               $Arreglo[$K]["arma"] = $this->arma_model->consulto($info->arma_id);
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
    $consulta = $this->db->get('enemigo_arma',$por_pagina,$segmento);
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
    #return $this->db->insert('campos', $datos); 
    $id = "";
    $this->db->insert('enemigo_arma', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('enemigo_arma', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('enemigo_arma');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
            'id' => $info->id,
            'enemigo_id' => $info->enemigo_id,
            'arma_id' => $info->arma_id,
            ####################################################################
            "enemigo" => $this->enemigo_model->consulto($info->enemigo_id),
            "arma" => $this->arma_model->consulto($info->arma_id)
            ####################################################################
       );   
    }
	return  $retorno;
}
//______________________________________________________________________
function lista()
{
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('enemigo_arma');
    #$this->db->where("activo", 1);
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
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('enemigo_arma');
}
//______________________________________________________________________
}
?>
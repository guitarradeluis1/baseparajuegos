<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campoobjeto_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('campo_model');
       $this->load->model('objeto_model');
    }
//________________________________________________________________
function todo($campo_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('campo_id', $campo_id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('campo_objeto');
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
                   'campo_id' => $info->campo_id,
                   'objeto_id' => $info->objeto_id,
                );
               ####################################################################
               $Arreglo[$K]["campo"] = $this->campo_model->consulto($info->campo_id);
               $Arreglo[$K]["objeto"] = $this->objeto_model->consulto($info->objeto_id);
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
    $consulta = $this->db->get('campo_objeto',$por_pagina,$segmento);
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
    $this->db->insert('campo_objeto', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campo_objeto', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo_objeto');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'campo_id' => $info->campo_id,
           'objeto_id' => $info->objeto_id,
           ####################################################################
           "campo" => $this->campo_model->consulto($info->campo_id),
           "objeto" => $this->objeto_model->consulto($info->objeto_id),
           ####################################################################
        );  
    }
	return  $retorno;
}
//______________________________________________________________________
function consulto_campo($campo_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'asc');
    $this->db->where("campo_id", $campo_id);
	$consulta = $this->db->get('campo_objeto');
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
                   'campo_id' => $info->campo_id,
                   'objeto_id' => $info->objeto_id,
                );
               ####################################################################
               $Arreglo[$K]["campo"] = $this->campo_model->consulto($info->campo_id);
               $Arreglo[$K]["objeto"] = $this->objeto_model->consulto($info->objeto_id);
               ####################################################################
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
//______________________________________________________________________
function consulto_objeto($campo_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'asc');
    $this->db->where("campo_id", $campo_id);
	$consulta = $this->db->get('campo_objeto');
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
                   'campo_id' => $info->campo_id,
                   'objeto_id' => $info->objeto_id,
                );
               ####################################################################
               #$Arreglo[$K]["campo"] = $this->campo_model->consulto($info->campo_id);
               $Arreglo[$K]["objeto"] = $this->objeto_model->consulto($info->objeto_id);
               ####################################################################
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
//______________________________________________________________________
function lista()
{
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('campo_objeto');
    #$this->db->where("activo", 1);
    $this->db->order_by('id', 'asc');
    $sql = $this->db->get();
    $Arreglo[""] = "Ninguno.";
    foreach($sql->result() as $datos)
    {
        $Arreglo[$datos->id] = $datos->id;
        #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
    }
    return $Arreglo;
}
//______________________________________________________________________
}
?>
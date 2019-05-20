<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Personaje_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('objeto_model');
       $this->load->model('dibujo_model');
       #$this->load->model('agendamientotipocampos_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('personaje');
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
                    'objeto_id' => $info->objeto_id,
                    'nombre' => $info->nombre,
                    'left_id' => $info->left_id,
                    'right_id' => $info->right_id,
                    'down_id' => $info->down_id,
                    'up_id' => $info->up_id,
                    'stop_id' => $info->stop_id,
               );
               ####################################################################
               $Arreglo[$K]["objeto"] = $this->objeto_model->consulto($info->objeto_id);
               $Arreglo[$K]["left"] = $this->dibujo_model->consulto($info->left_id);
               $Arreglo[$K]["right"] = $this->dibujo_model->consulto($info->right_id);
               $Arreglo[$K]["down"] = $this->dibujo_model->consulto($info->down_id);
               $Arreglo[$K]["up"] = $this->dibujo_model->consulto($info->up_id);
               $Arreglo[$K]["stop"] = $this->dibujo_model->consulto($info->stop_id);
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
    $consulta = $this->db->get('personaje',$por_pagina,$segmento);
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
    $this->db->insert('personaje', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('personaje', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('personaje');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
            'id' => $info->id,
            'objeto_id' => $info->objeto_id,
            'nombre' => $info->nombre,
            'left_id' => $info->left_id,
            'right_id' => $info->right_id,
            'down_id' => $info->down_id,
            'up_id' => $info->up_id,
            'stop_id' => $info->stop_id,
            ####################################################################
            "objeto" => $this->objeto_model->consulto($info->objeto_id),
            "left" => $this->dibujo_model->consulto($info->left_id),
            "right" => $this->dibujo_model->consulto($info->right_id),
            "down" => $this->dibujo_model->consulto($info->down_id),
            "up" => $this->dibujo_model->consulto($info->up_id),
            "stop" => $this->dibujo_model->consulto($info->stop_id),
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
    $this->db->from('personaje');
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
}
?>
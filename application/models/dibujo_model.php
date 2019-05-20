<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Dibujo_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('dibujotipo_model');
       $this->load->model('objeto_model');
       #$this->load->model('agendamientotipocampos_model');
    }
//________________________________________________________________
function todo($objeto_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('objeto_id', $objeto_id);
    $this->db->order_by('texto', 'asc');
	$consulta = $this->db->get('dibujo');
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
                   'dibujotipo_id' => $info->dibujotipo_id,
                   'objeto_id' => $info->objeto_id,
                   'texto' => $info->texto,
                   'height' => $info->height,
                   'width' => $info->width,
                   'font' => $info->font,
                   'color' => $info->color,
                   'velocidad' => $info->velocidad,
                   'cuadros' => $info->cuadros,
                   'play' => $info->play,
                   'fisica' => $info->fisica,
                   'immovable' => $info->immovable,
               );
               ####################################################################
               $Arreglo[$K]["dibujotipo"] = $this->dibujotipo_model->consulto($info->dibujotipo_id);
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
    $consulta = $this->db->get('dibujo',$por_pagina,$segmento);
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
    $this->db->insert('dibujo', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('dibujo', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('dibujo');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'dibujotipo_id' => $info->dibujotipo_id,
           'objeto_id' => $info->objeto_id,
           'texto' => $info->texto,
           'height' => $info->height,
           'width' => $info->width,
           'font' => $info->font,
           'color' => $info->color,
           'velocidad' => $info->velocidad,
           'cuadros' => $info->cuadros,
           'play' => $info->play,
           'fisica' => $info->fisica,
           'immovable' => $info->immovable,
           ####################################################################
           "dibujotipo" => $this->dibujotipo_model->consulto($info->dibujotipo_id),
           "objeto" => $this->objeto_model->consulto($info->objeto_id),
           ####################################################################
       );   
    }
	return  $retorno;
}
//______________________________________________________________________
function lista($objeto_id)
{
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('dibujo');
    $this->db->where("objeto_id", $objeto_id);
    $this->db->order_by('texto', 'asc');
    $sql = $this->db->get();
    $Arreglo[""] = "Ninguno.";
    foreach($sql->result() as $datos)
    {
        $Arreglo[$datos->id] = $datos->texto;
        #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
    }
    return $Arreglo;
}
//______________________________________________________________________
}
?>
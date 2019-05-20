<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Mail_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
    }
//________________________________________________________________
function todo($campanas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('campanas_id', $campanas_id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('mail');
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
                   'usuarios_id' => $info->usuarios_id,
                   'campanas_id' => $info->campanas_id,
                   'referente' => $info->referente,
                   'email' => $info->email,
                   'cambio' => $info->cambio,
               );
               ####################################################################
               $Arreglo[$K]["usuario"] = $this->usuarios_model->consulto($info->usuarios_id);
               #$Arreglo[$K]["lista"] = $this->listas_model->consulto($info->listas_id);
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
    $id = "";
    $datos["cambio"] = date("d-m-Y");
    $this->db->insert('mail', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('mail', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('mail');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'usuarios_id' => $info->usuarios_id,
           'campanas_id' => $info->campanas_id,
           'referente' => $info->referente,
           'email' => $info->email,
           'cambio' => $info->cambio,
       );
    }
	return  $retorno;
}
//______________________________________________________________________
}
?>
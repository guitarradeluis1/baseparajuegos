<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Ticketsusuarios_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
       $this->load->model('tickets_model');
    }
//________________________________________________________________
function todo($tickets_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("tickets_id", $tickets_id);
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('ticketsusuarios');
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        //........................................................
        $Arreglo = array();
        foreach($data as $key => $valor)
        {
            $retorno = array();
            $retorno = array
            (
               'id' => $valor->id,
               'tickets_id' => $valor->tickets_id,
               'usuarios_id' => $valor->usuarios_id
            );
            $retorno["usuario"] = $this->usuarios_model->consulto($valor->usuarios_id);
            $retorno["ticket"] = $this->tickets_model->consulto($valor->tickets_id);
            $Arreglo[] = $retorno;
        }
        //........................................................
        return $Arreglo;
    }
}
//________________________________________________________________
function todousuario($usuarios_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("usuarios_id", $usuarios_id);
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('ticketsusuarios');
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        //........................................................
        $Arreglo = array();
        foreach($data as $key => $valor)
        {
            $retorno = array();
            $retorno = array
            (
               'id' => $valor->id,
               'tickets_id' => $valor->tickets_id,
               'usuarios_id' => $valor->usuarios_id
            );
            $retorno["usuario"] = $this->usuarios_model->consulto($valor->usuarios_id);
            $retorno["ticket"] = $this->tickets_model->consulto($valor->tickets_id);  
            $Arreglo[] = $retorno;
        }
        //........................................................
        return $Arreglo;
    }
}
//________________________________________________________________
function todo_paginados($por_pagina,$segmento) 
{
    $this->db->select('*');
    #$this->db->from('usuarios');
    $this->db->join('tipousuario', 'tipousuario.id = usuarios.tipousuario_id', "inner"); #left inner
    $this->db->order_by('usuarios.id', 'desc');
    $consulta = $this->db->get('ticketsusuarios',$por_pagina,$segmento);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        //........................................................
        foreach($data as $key => $valor)
        {
            echo $valor["usuarios_id"]; exit;
            $data[$key]["usuario"] = $this->usuarios_model->consulto($valor["usuarios_id"]);
        }
        //........................................................
        return $data; 
    }
}
//______________________________________________________________________
function nuevo($usuarios_id, $tickets_id)
{
    $datos["tickets_id"] = $tickets_id;
    $datos["usuarios_id"] = $usuarios_id;
    return $this->db->insert('ticketsusuarios', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('ticketsusuarios', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('ticketsusuarios');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'tickets_id' => $info->tickets_id,
           'usuarios_id' => $info->usuarios_id
        );
    }
	return $retorno;
}
//______________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('ticketsusuarios');
}
//______________________________________________________________________
function verificar($correo , $pass)
{
    
}
//______________________________________________________________________
}
?>
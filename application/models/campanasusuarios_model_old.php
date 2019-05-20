<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campanasusuarios_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
       $this->load->model('campanas_model');
    }
//________________________________________________________________
function todo($campanas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("campanas_id", $campanas_id);
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('campanasusuarios');
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        //........................................................
        $Arreglo = array();
        $retorno = array();
        foreach($data as $key => $valor)
        {
            $retorno = array();
            $retorno = array
            (
               'id' => $valor->id,
               'campanas_id' => $valor->campanas_id,
               'usuarios_id' => $valor->usuarios_id,
               'pibote' => $valor->pibote,
               'pibotesitems_id' => $valor->pibotesitems_id,
            );
            $retorno["usuario"] = $this->usuarios_model->consulto($valor->usuarios_id);
            $retorno["campana"] = $this->campanas_model->consulto($valor->campanas_id);
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
	$consulta = $this->db->get('campanasusuarios');
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
               'campanas_id' => $valor->campanas_id,
               'usuarios_id' => $valor->usuarios_id,
               'pibote' => $valor->pibote,
               'pibotesitems_id' => $valor->pibotesitems_id,
            );
            $retorno["usuario"] = $this->usuarios_model->consulto($valor->usuarios_id);
            $retorno["campana"] = $this->campanas_model->consulto($valor->campanas_id);
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
    $consulta = $this->db->get('campanasusuarios',$por_pagina,$segmento);
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
function nuevo($usuarios_id, $campanas_id)
{
    $datos["campanas_id"] = $campanas_id;
    $datos["usuarios_id"] = $usuarios_id;
    return $this->db->insert('campanasusuarios', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campanasusuarios', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campanasusuarios');
    $this->db->where("id",$id);
    $consulta = $this->db->get();
    foreach($consulta->result() as $info)
    {
        $retorno = array();
        $retorno = array
        (
           'id' => $info->id,
           'campanas_id' => $info->campanas_id,
           'usuarios_id' => $info->usuarios_id,
           'pibote' => $info->pibote,
           'pibotesitems_id' => $info->pibotesitems_id,
        );
    }
	return $retorno;
}
//______________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('campanasusuarios');
}
//______________________________________________________________________
function verificar($correo , $pass)
{
    
}
//______________________________________________________________________
}
?>
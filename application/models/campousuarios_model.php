<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campousuarios_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
       #$this->load->model('listas_model');
       #$this->load->model('agendamientotipocampos_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('campo_usuarios');
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
                   'usuarios_id' => $info->usuarios_id,
                   'nombre' => $info->nombre,
                   'descripcion' => $info->descripcion,
                   'cambio' => $info->cambio,
               );
               ####################################################################
               #$Arreglo[$K]["mapa"] = $this->mapa_model->consulto($info->mapa_id);
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
    $consulta = $this->db->get('campo_usuarios',$por_pagina,$segmento);
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
function nuevo($usuarios_id)
{
    $datos = array();
    $datos["cambio"] = date("d-m-Y");
    $datos["usuarios_id"] = $usuarios_id;
    $datos["campo_id"] = 1;#(int) $datos["campanas_id"];
    #return $this->db->insert('campos', $datos); 
    $retorno = $this->db->insert('campo_usuarios', $datos);
    return $retorno; 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('usuarios_id', $datos["usuarios_id"]);
    return $this->db->update('campo_usuarios', $datos); 
}
//______________________________________________________________________
function consulto($usuarios_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo_usuarios');
    $this->db->where("usuarios_id", $usuarios_id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'usuarios_id' => $info->usuarios_id,
           'campo_id' => $info->campo_id,
           'x' => $info->x,
           'y' => $info->y,
           'cambio' => $info->cambio,
           ####################################################################
           #"usuarios" => $this->usuarios_model->consulto_ligero($info->usuarios_id),
           ####################################################################
       );   
    }
	return  $retorno;
}
//______________________________________________________________________
function consulto_campo($campo_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo_usuarios');
    $this->db->where("campo_id",$campo_id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno[] = array
        (
           'usuarios_id' => $info->usuarios_id,
           'campo_id' => $info->campo_id,
           'x' => $info->x,
           'y' => $info->y,
           'cambio' => $info->cambio,
           ####################################################################
           "usuarios" => $this->usuarios_model->consulto_ligero($info->usuarios_id),
           ####################################################################
       );   
    }
	return  $retorno;
}
//______________________________________________________________________
function conectados($campo_id, $usuarios_id)
{
    $this->db->select('*');
    $this->db->from('campo_usuarios');
    #$this->db->join('usuarios', 'usuarios.id = campo_usuarios.usuarios_id', "inner"); #left inner
    $this->db->where("campo_id",$campo_id);
    $this->db->where("usuarios_id != ".$usuarios_id);
    $this->db->limit(10);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno[] = array
        (
           'usuarios_id' => $info->usuarios_id,
           'campo_id' => $info->campo_id,
           'x' => $info->x,
           'y' => $info->y,
           'cambio' => $info->cambio,
           ####################################################################
           "usuarios" => $this->usuarios_model->consulto_conectado($info->usuarios_id),
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
    $this->db->from('campo_usuarios');
    #$this->db->where("activo", 1);
    $this->db->order_by('nombre', 'asc');
    $sql = $this->db->get();
    $Arreglo["0"] = "Ninguno.";
    foreach($sql->result() as $datos)
    {
        $Arreglo[$datos->usuarios_id] = $datos->usuarios_id;
        #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
    }
    return $Arreglo;
}
//______________________________________________________________________
}
?>
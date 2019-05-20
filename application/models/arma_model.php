<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Arma_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('objeto_model');
       $this->load->model('dibujo_model');
       $this->load->model('funciones_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('nombre', 'asc');
	$consulta = $this->db->get('arma');
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
                    'dibujo_id' => $info->dibujo_id,
                    'funciones_id' => $info->funciones_id,
                    'nombre' => $info->nombre,
                    'dano_min' => $info->dano_min,
                    'dano_max' => $info->dano_max,
                    'defensa' => $info->defensa,
                    'fuerza' => $info->fuerza,
                    'punteria' => $info->punteria,
                    'velocidad' => $info->velocidad,
               );
               ####################################################################
               $Arreglo[$K]["objeto"] = $this->objeto_model->consulto($info->objeto_id);
               $Arreglo[$K]["funciones"] = $this->funciones_model->consulto($info->funciones_id);
               $Arreglo[$K]["dibujo"] = $this->dibujo_model->consulto($info->dibujo_id);
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
    $consulta = $this->db->get('arma',$por_pagina,$segmento);
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
    $this->db->insert('arma', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('arma', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('arma');
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
           'dibujo_id' => $info->dibujo_id,
           'funciones_id' => $info->funciones_id,
           'nombre' => $info->nombre,
           'dano_min' => $info->dano_min,
           'dano_max' => $info->dano_max,
           'defensa' => $info->defensa,
           'fuerza' => $info->fuerza,
           'punteria' => $info->punteria,
           'velocidad' => $info->velocidad,
           ####################################################################
           "objeto" => $this->objeto_model->consulto($info->objeto_id),
           "funciones" => $this->funciones_model->consulto($info->funciones_id),
           "dibujo" => $this->dibujo_model->consulto($info->dibujo_id),
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
    $this->db->from('arma');
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
function status()
{
    $usuarios_id = $this->session->userdata("id");
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where("id",$usuarios_id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'arma1' => $info->arma1,
           'arma2' => $info->arma2,
           'email' => $info->email,
           'nombre' => $info->nombre,
           'vida' => $info->vida,
           'nivel' => $info->nivel,
           'puntos' => $info->puntos,
           'defensa' => $info->defensa,
           'fuerza' => $info->fuerza,
           'punteria' => $info->punteria,
           'velocidad' => $info->velocidad,
           ####################################################################
           "arma_1" => $this->arma_model->consulto($info->arma1),
           "arma_2" => $this->arma_model->consulto($info->arma2),
           ####################################################################
       );
    }
    return $retorno;
}
//______________________________________________________________________
}
?>
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Armausuarios_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
       $this->load->model('arma_model');
    }
//________________________________________________________________
function todo($campanas_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("campanas_id", $campanas_id);
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('arma_usuarios');
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
               'usuarios_id' => $valor->usuarios_id,
               'oro' => $valor->oro,
               'plata' => $valor->plata,
               'arma_1' => $valor->arma_1,
               'arma_2' => $valor->arma_2,
               'arma_3' => $valor->arma_3,
               'arma_4' => $valor->arma_4,
               'arma_5' => $valor->arma_5,
               'arma_6' => $valor->arma_6,
               'arma_7' => $valor->arma_7,
               'arma_8' => $valor->arma_8,
               'c1' => $valor->c1,
               'c2' => $valor->c2,
               'c3' => $valor->c3,
               'c4' => $valor->c4,
               'c5' => $valor->c5,
               'c6' => $valor->c6,
               'c7' => $valor->c7,
               'c8' => $valor->c8,
            );
                #$retorno["usuario"] = $this->usuarios_model->consulto($valor->usuarios_id);
                $retorno["arma_1"] = $this->arma_model->consulto($valor->arma_1);
                $retorno["arma_2"] = $this->arma_model->consulto($valor->arma_2);
                $retorno["arma_3"] = $this->arma_model->consulto($valor->arma_3);
                $retorno["arma_4"] = $this->arma_model->consulto($valor->arma_4);
                $retorno["arma_5"] = $this->arma_model->consulto($valor->arma_5);
                $retorno["arma_6"] = $this->arma_model->consulto($valor->arma_6);
                $retorno["arma_7"] = $this->arma_model->consulto($valor->arma_7);
                $retorno["arma_8"] = $this->arma_model->consulto($valor->arma_8);
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
	$consulta = $this->db->get('arma_usuarios');
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
               'usuarios_id' => $valor->usuarios_id,
               'oro' => $valor->oro,
               'plata' => $valor->plata,
               'arma_1' => $valor->arma_1,
               'arma_2' => $valor->arma_2,
               'arma_3' => $valor->arma_3,
               'arma_4' => $valor->arma_4,
               'arma_5' => $valor->arma_5,
               'arma_6' => $valor->arma_6,
               'arma_7' => $valor->arma_7,
               'arma_8' => $valor->arma_8,
               'c1' => $valor->c1,
               'c2' => $valor->c2,
               'c3' => $valor->c3,
               'c4' => $valor->c4,
               'c5' => $valor->c5,
               'c6' => $valor->c6,
               'c7' => $valor->c7,
               'c8' => $valor->c8,
            );
                $retorno["arma_1"] = $this->arma_model->consulto($valor->arma_1);
                $retorno["arma_2"] = $this->arma_model->consulto($valor->arma_2);
                $retorno["arma_3"] = $this->arma_model->consulto($valor->arma_3);
                $retorno["arma_4"] = $this->arma_model->consulto($valor->arma_4);
                $retorno["arma_5"] = $this->arma_model->consulto($valor->arma_5);
                $retorno["arma_6"] = $this->arma_model->consulto($valor->arma_6);
                $retorno["arma_7"] = $this->arma_model->consulto($valor->arma_7);
                $retorno["arma_8"] = $this->arma_model->consulto($valor->arma_8);
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
    $consulta = $this->db->get('arma_usuarios',$por_pagina,$segmento);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        //.............................s...........................
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
function nuevo($usuarios_id)
{
    $datos = array();
    $datos["usuarios_id"] = (int) $usuarios_id;
    $datos["oro"] = 2;
    $datos["plata"] = 50;
    return $this->db->insert('arma_usuarios', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    $this->db->where('usuarios_id', $datos["usuarios_id"]);
    return $this->db->update('arma_usuarios', $datos); 
}
//______________________________________________________________________
function consulto($usuarios_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('arma_usuarios');
    $this->db->where("usuarios_id", $usuarios_id);
    $consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $valor)
    {
        $retorno = array
        (
           'usuarios_id' => $valor->usuarios_id,
           'oro' => $valor->oro,
           'plata' => $valor->plata,
           'arma_1_id' => $valor->arma_1,
           'arma_2_id' => $valor->arma_2,
           'arma_3_id' => $valor->arma_3,
           'arma_4_id' => $valor->arma_4,
           'arma_5_id' => $valor->arma_5,
           'arma_6_id' => $valor->arma_6,
           'arma_7_id' => $valor->arma_7,
           'arma_8_id' => $valor->arma_8,
            'c1' => $valor->c1,
            'c2' => $valor->c2,
            'c3' => $valor->c3,
            'c4' => $valor->c4,
            'c5' => $valor->c5,
            'c6' => $valor->c6,
            'c7' => $valor->c7,
            'c8' => $valor->c8,
            #######################
                "arma_1" => $this->arma_model->consulto($valor->arma_1),
                "arma_2" => $this->arma_model->consulto($valor->arma_2),
                "arma_3" => $this->arma_model->consulto($valor->arma_3),
                "arma_4" => $this->arma_model->consulto($valor->arma_4),
                "arma_5" => $this->arma_model->consulto($valor->arma_5),
                "arma_6" => $this->arma_model->consulto($valor->arma_6),
                "arma_7" => $this->arma_model->consulto($valor->arma_7),
                "arma_8" => $this->arma_model->consulto($valor->arma_8),
            #######################
        );
    }
	return $retorno;
}
//______________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('arma_usuarios');
}
//______________________________________________________________________
function verificar($correo , $pass)
{
    
}
//______________________________________________________________________
}
?>
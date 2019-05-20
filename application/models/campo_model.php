<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campo_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('mapa_model');
       $this->load->model('dibujo_model');
       $this->load->model('usuarios_model');
    }
//________________________________________________________________
function todo($mapa_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where("mapa_id",$mapa_id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('campo');
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
                   'nombre' => $info->nombre,
                   'mapa_id' => $info->mapa_id,
                   'usuarios_id' => $info->usuarios_id,
                   'fondo' => $info->fondo,
                   'limite_arriba_dibujo' => $info->limite_arriba_dibujo,
                   'limite_abajo_dibujo' => $info->limite_abajo_dibujo,
                   'limite_derecha_dibujo' => $info->limite_derecha_dibujo,
                   'limite_izquierda_dibujo' => $info->limite_izquierda_dibujo,
                );
               ####################################################################
               $Arreglo[$K]["mapa"] = $this->mapa_model->consulto($info->mapa_id);
               $Arreglo[$K]["fondo_dibu"] = $this->dibujo_model->consulto($info->fondo);
               $Arreglo[$K]["limite_arriba_dibujo_dibu"] = $this->dibujo_model->consulto($info->limite_arriba_dibujo);
               $Arreglo[$K]["limite_abajo_dibujo_dibu"] = $this->dibujo_model->consulto($info->limite_abajo_dibujo);
               $Arreglo[$K]["limite_derecha_dibujo_dibu"] = $this->dibujo_model->consulto($info->limite_derecha_dibujo);
               $Arreglo[$K]["limite_izquierda_dibujo_dibu"] = $this->dibujo_model->consulto($info->limite_izquierda_dibujo);
               $Arreglo[$K]["usuarios"] = $this->usuarios_model->consulto_ligero($info->usuarios_id);
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
    $consulta = $this->db->get('campo',$por_pagina,$segmento);
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
function nuevo($datos, $objeto_id)
{
    #$datos["creado"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    #return $this->db->insert('campos', $datos); 
    $id = "";
    $this->db->insert('campo', $datos); 
    $id = $this->db->insert_id();
    
    $campo_objeto = array();
    $campo_objeto["campo_id"] = $id;
    $campo_objeto["objeto_id"] = $objeto_id;
    $this->db->insert('campo_objeto', $campo_objeto); 
    $campo_objeto_id = $this->db->insert_id();
    return $campo_objeto_id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campo', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'nombre' => $info->nombre,
           'mapa_id' => $info->mapa_id,
           'usuarios_id' => $info->usuarios_id,
           'fondo' => $info->fondo,
           'limite_arriba_dibujo' => $info->limite_arriba_dibujo,
           'limite_abajo_dibujo' => $info->limite_abajo_dibujo,
           'limite_derecha_dibujo' => $info->limite_derecha_dibujo,
           'limite_izquierda_dibujo' => $info->limite_izquierda_dibujo,
           ####################################################################
           "mapa" => $this->mapa_model->consulto($info->mapa_id),
           "fondo_dibu" => $this->dibujo_model->consulto($info->fondo),
           "limite_arriba_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_arriba_dibujo),
           "limite_abajo_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_abajo_dibujo),
           "limite_derecha_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_derecha_dibujo),
           "limite_izquierda_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_izquierda_dibujo),
           "usuarios" => $this->usuarios_model->consulto_ligero($info->usuarios_id),
           ####################################################################
        );   
    }
	return  $retorno;
}
//______________________________________________________________________
function consulto_simple($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo');
    $this->db->where("id",$id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'nombre' => $info->nombre,
           'mapa_id' => $info->mapa_id,
           #'fondo' => $info->fondo,
           #'limite_arriba_dibujo' => $info->limite_arriba_dibujo,
           #'limite_abajo_dibujo' => $info->limite_abajo_dibujo,
           #'limite_derecha_dibujo' => $info->limite_derecha_dibujo,
           #'limite_izquierda_dibujo' => $info->limite_izquierda_dibujo,
           ####################################################################
           #"mapa" => $this->mapa_model->consulto($info->mapa_id),
           #"fondo_dibu" => $this->dibujo_model->consulto($info->fondo),
           #"limite_arriba_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_arriba_dibujo),
           #"limite_abajo_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_abajo_dibujo),
           #"limite_derecha_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_derecha_dibujo),
           #"limite_izquierda_dibujo_dibu" => $this->dibujo_model->consulto($info->limite_izquierda_dibujo),
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
    $this->db->from('campo');
    #$this->db->where("activo", 1);
    $this->db->order_by('nombre', 'asc');
    $sql = $this->db->get();
    $Arreglo["0"] = "Ninguno.";
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
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campodibujo_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('campo_model');
       $this->load->model('objeto_model');
       $this->load->model('personaje_model');
       $this->load->model('mapa_model');
       $this->load->model('dibujo_model');
       $this->load->model('funciones_model');
       $this->load->model('ia_model');
       $this->load->model('arma_model');
    }
//________________________________________________________________
function todo($campo_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where('campo_id', $campo_id);
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('campo_dibujo');
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
                   'dibujo_id' => $info->dibujo_id,
                   'funciones_id' => $info->funciones_id,
                   'arma_id' => $info->arma_id,
                   'ia_id' => $info->ia_id,
                   'campo_destino' => $info->campo_destino,
                   'parametros' => $info->parametros,
                   'nivel' => $info->nivel,
                   'posicionx' => $info->posicionx,
                   'posiciony' => $info->posiciony,
               );
               ####################################################################
               $Arreglo[$K]["campo"] = $this->campo_model->consulto_simple($info->campo_id);
               $Arreglo[$K]["dibujo"] = $this->dibujo_model->consulto($info->dibujo_id);
               $Arreglo[$K]["funciones"] = $this->funciones_model->consulto($info->funciones_id);
               $Arreglo[$K]["ia"] = $this->ia_model->consulto($info->ia_id);
               $Arreglo[$K]["arma"] = $this->arma_model->consulto($info->arma_id);
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
    $consulta = $this->db->get('campo_dibujo',$por_pagina,$segmento);
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
    $this->db->insert('campo_dibujo', $datos); 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    #$datos["campanas_id"] = (int) $datos["campanas_id"];
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campo_dibujo', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campo_dibujo');
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
           'dibujo_id' => $info->dibujo_id,
           'funciones_id' => $info->funciones_id,
           'arma_id' => $info->arma_id,
           'ia_id' => $info->ia_id,
           'campo_destino' => $info->campo_destino,
           'parametros' => $info->parametros,
           'nivel' => $info->nivel,
           'posicionx' => $info->posicionx,
           'posiciony' => $info->posiciony,
           ####################################################################
           "campo" => $this->campo_model->consulto_simple($info->campo_id),
           "dibujo" => $this->dibujo_model->consulto($info->dibujo_id),
           "funciones" => $this->funciones_model->consulto($info->funciones_id),
           "ia" => $this->ia_model->consulto($info->ia_id),
           "arma" => $this->arma_model->consulto($info->arma_id),
           ####################################################################
       );  
    }
	return  $retorno;
}
//______________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('campo_dibujo');
}
//______________________________________________________________________
function lista()
{
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('campo_dibujo');
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
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Pibotesitems_model extends CI_Model
{
//__________________________________________________________________
function __construct()
{
   parent::__construct();
   $this->load->database();
   #$this->load->library('session');
   #$this->load->model('lineadeservicios_model');
}
//__________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('pibotesitems');
	return  $consulta;
}
function todo_paginados($por_pagina,$segmento)
{
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('pibotesitems', $por_pagina,$segmento);
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
function lista_opciones()
{
    $Arreglo = array();
    $this->db->select('*');
    $this->db->from('pibotesitems');
    $this->db->where("activo", 1);
    $this->db->order_by('titulo', 'asc');
    $sql = $this->db->get();
    #$Arreglo[""] = "Ninguno.";
    foreach($sql->result() as $datos)
    {
        $Arreglo[$datos->id] = $datos->titulo;
        #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
    }
    return $Arreglo;
}
//______________________________________________________________________
function nuevo($datos)
{
    #$datos["creado"] = date("d-m-Y");
    $this->db->insert('pibotesitems', $datos);
    $id = "";
    $id = $this->db->insert_id();
    return $id;
}
//______________________________________________________________________
function actualizo($datos)
{
    //$datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('pibotesitems', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('pibotesitems');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'pibotes_id' => $info->pibotes_id,
           'nombre' => $info->nombre,
       );
    }
	return $retorno;
}
//______________________________________________________________________
function consultoespesofico($pibote_id, $id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('pibotesitems');
    $this->db->where("id", $id);
    $this->db->where("pibotes_id", $pibote_id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'pibotes_id' => $info->pibotes_id,
           'nombre' => $info->nombre,
       );
    }
	return $retorno;
}
//______________________________________________________________________
function consulto_lista($pibote_id)
{
    #$this->db->join('pibotes', 'pibotes.id = agendas.pibotes_id', "left"); #left inner
    $this->db->select('*');
    $this->db->from('pibotesitems');
    #$this->db->where("id",$id);
    #$this->db->where("pibotes_id", $pibote_id);
    $consulta = $this->db->get();
    $retorno = array();
    $K = 0;
    foreach($consulta->result() as $info)
    {
        $retorno[$info->id] = array
        (
           'id' => $info->id,
           'pibotes_id' => $info->pibotes_id,
           'nombre' => $info->nombre,
        );
       $K = $K + 1;
    }
    return $retorno;
}
//______________________________________________________________________
function consulto_pibote($pibotesitems_id)
{
    #$this->db->join('pibotes', 'pibotes.id = agendas.pibotes_id', "left"); #left inner
    $this->db->select('*');
    $this->db->from('pibotesitems');
    $this->db->where("id", $pibotesitems_id);
    #$this->db->where("pibotes_id", $pibote_id);
    $consulta = $this->db->get();
    $retorno = array();
    $K = 0;
    foreach($consulta->result() as $info)
    {
        $retorno[$info->id] = array
        (
           'id' => $info->id,
           'pibotes_id' => $info->pibotes_id,
           'nombre' => $info->nombre,
        );
       $K = $K + 1;
    }
    return $retorno;
}
//______________________________________________________________________
}
?>
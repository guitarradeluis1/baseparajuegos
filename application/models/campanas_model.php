<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campanas_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       #$this->load->library('session');
       #$this->load->model('lineadeservicios_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('campanas');
	return  $consulta;
}
function todo_paginados($por_pagina,$segmento) 
{
    $this->db->order_by('id', 'desc');
    $consulta = $this->db->get('campanas',$por_pagina,$segmento);
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
    $this->db->from('campanas');
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
    $datos["creado"] = date("d-m-Y");
    return $this->db->insert('campanas', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campanas', $datos); 
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('campanas');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'titulo' => $info->titulo,
           'guion' => $info->guion,
           'creado' => $info->creado,
           'cambio' => $info->cambio,
           'generado' => $info->generado,
           'saliendo' => $info->saliendo,
           'tipocampana' => $info->tipocampana,
           'tipoentrada' => $info->tipoentrada,
           'tipobusca' => $info->tipobusca,
           'regestion' => $info->regestion,
           'activo' => $info->activo,
           'mail' => $info->mail,
           'guionemail' => $info->guionemail,
           'tituloemail' => $info->tituloemail,
           'mailautomatico' => $info->mailautomatico,
       );
    }
	return $retorno;
}
//______________________________________________________________________
}
?>
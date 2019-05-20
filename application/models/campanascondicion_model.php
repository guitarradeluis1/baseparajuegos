<?php
#campanas_condicion
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Campanascondicion_model extends CI_Model
{
//__________________________________________________________________
function __construct()
{
   parent::__construct();
   $this->load->database();
   #$this->load->library('session');
   $this->load->model('campos_model');
   $this->load->model('banderas_model');
   $this->load->model('condicionbanderas_model');
}
//______________________________________________________________________
function nuevo($datos)
{
    #$datos["creado"] = date("d-m-Y");
    $this->db->insert('campanas_condicion', $datos);
    $id = "";
    $id = $this->db->insert_id();
    return $id;
}
//______________________________________________________________________
function actualizo($datos)
{
    #$datos["cambio"] = date("d-m-Y");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('campanas_condicion', $datos); 
}
//__________________________________________________________________
function eliminar($id)
{
	$this->db->where('id',$id);
	return $this->db->delete('campanas_condicion');
}
//__________________________________________________________________
function consulto_campana($campanas_id)
{
    #$this->db->join('pibotes', 'pibotes.id = agendas.pibotes_id', "left"); #left inner
    $this->db->select('*');
    $this->db->from('campanas_condicion');
    #$this->db->where("id",$id);
	$this->db->where("campanas_id", $campanas_id);
    $consulta = $this->db->get();
    $retorno = array();
    $K = 0;
    foreach($consulta->result() as $info)
    {
        $retorno[$K] = array
        (
           'id' => $info->id,
           'campanas_id' => $info->campanas_id,
           'comparo_con' => $info->comparo_con,
           'comparo_campo' => $info->comparo_campo,
           'comparo_text' => $info->comparo_text,
           'condicional' => $info->condicional,
           'valor' => $info->valor,
           'resultado' => $info->resultado,
           #'donde_con' => $info->donde_con,
           #'donde_campo' => $info->donde_campo,
           #'donde_bandera' => $info->donde_bandera,
       );
       ####################################################################
       $retorno[$K]["campo_comparo"] = $this->campos_model->consulto($info->comparo_campo);
       #$retorno[$K]["badera"] = $this->banderas_model->consulto($info->donde_bandera);
       #$retorno[$K]["campo_donde"] = $this->campos_model->consulto($info->donde_campo);
       $retorno[$K]["condicion_banderas"] = $this->condicionbanderas_model->consulto_condicion($info->id);
       ####################################################################
       $K = $K + 1;
    }
	return $retorno;
}
//__________________________________________________________________
function consulto($id)
{
    #$this->db->join('pibotes', 'pibotes.id = agendas.pibotes_id', "left"); #left inner
    $this->db->select('*');
    $this->db->from('campanas_condicion');
    #$this->db->where("id",$id);
	$this->db->where("id", $id);
    $consulta = $this->db->get();
    $retorno = array();
    $K = 0;
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'campanas_id' => $info->campanas_id,
           'comparo_con' => $info->comparo_con,
           'comparo_campo' => $info->comparo_campo,
           'comparo_text' => $info->comparo_text,
           'condicional' => $info->condicional,
           'valor' => $info->valor,
           'resultado' => $info->resultado,
           #'donde_con' => $info->donde_con,
           #'donde_campo' => $info->donde_campo,
           #'donde_bandera' => $info->donde_bandera,
       );
       ####################################################################
       $retorno["campo_comparo"] = $this->campos_model->consulto($info->comparo_campo);
       #$retorno["badera"] = $this->banderas_model->consulto($info->donde_bandera);
       #$retorno["campo_donde"] = $this->campos_model->consulto($info->donde_campo);
       $retorno["condicion_banderas"] = $this->condicionbanderas_model->consulto_condicion($info->id);
       ####################################################################
       #$K = $K + 1;
    }
	return $retorno;
}
//__________________________________________________________________
}
?>
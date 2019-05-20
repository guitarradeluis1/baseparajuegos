<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Chat_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('usuarios_model');
       #$this->load->model('mapa_model');
       #$this->load->model('campo_model');
    }
//________________________________________________________________
function todo($parametro, $valor)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->where($parametro, $valor);
    $this->db->order_by('id', 'desc');
    #$this->db->where('usuarios_id', $datos["usuarios_id"]);
	$consulta = $this->db->get('chat');
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
                   'usuario1' => $info->usuario1,
                   'usuario2' => $info->usuario2,
                   'campo_id' => $info->campo_id,
                   'mapa_id' => $info->mapa_id,
                   'grupo' => $info->grupo,
                   'mensaje' => $info->mensaje,
                   'creado' => $info->creado,
                );
               ####################################################################
               $Arreglo[$K]["usuario_envio"] = $this->usuarios_model->consulto_ligero($info->usuario1);
               $Arreglo[$K]["usuario_lee"] = $this->usuarios_model->consulto_ligero($info->usuario2);
               ####################################################################
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
//______________________________________________________________________
function nuevo($datos)
{
    $datos["creado"] = date("d-m-Y");
    $this->db->insert('chat', $datos);
    $id = ""; 
    $id = $this->db->insert_id();
    return $id; 
}
//______________________________________________________________________
function leer($datos)
{
    if($datos["usuario2"] == 0)
    {
        if($datos["campo_id"]!=0)
        {$this->db->where("campo_id", $datos["campo_id"]);}
        else if($datos["mapa_id"]!=0)
        {$this->db->where("mapa_id", $datos["mapa_id"]);}
        else if($datos["grupo"]!=0)
        {$this->db->where("grupo", $datos["grupo"]);}
        else if($datos["gremio_id"]!=0)
        {$this->db->where("gremio_id", $datos["gremio_id"]);}
    }
    else
    {
        $this->db->where("chat.usuario1 = {$datos["usuario1"]} and chat.usuario2 = {$datos["usuario2"]} or chat.usuario1 = {$datos["usuario2"]} and chat.usuario2 = {$datos["usuario1"]}");
    }
    $this->db->limit(5);
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('chat');
    $Arreglo = array();
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        if(count($data)>0)
        {
            $K = 0;
            foreach($data as $info)
            {
                $Arreglo[$K] = array
                (
                   'id' => $info->id,
                   'usuario1' => $info->usuario1,
                   'usuario2' => $info->usuario2,
                   'campo_id' => $info->campo_id,
                   'mapa_id' => $info->mapa_id,
                   'gremio_id' => $info->gremio_id,
                   'grupo' => $info->grupo,
                   'mensaje' => $info->mensaje,
                   'creado' => $info->creado,
                );
               ####################################################################
               $Arreglo[$K]["usuario_envio"] = $this->usuarios_model->consulto_ligero($info->usuario1);
               $Arreglo[$K]["usuario_lee"] = $this->usuarios_model->consulto_ligero($info->usuario2);
               ####################################################################
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
    }
    #echo "<pre>"; print_r($Arreglo); echo "</pre>"; exit;
    return $Arreglo;
}
//______________________________________________________________________
}
?>
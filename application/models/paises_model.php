<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Paises_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
    }
//______________________________________________________________________
function lista()#($pagination, $segment)
{
    $Arreglo = array();
    $this->db->select('*');
        $this->db->from('paises');
        #$this->db->where("id", $sedes_id);
        $this->db->order_by('nombre', 'asc');
        $sql = $this->db->get();
        $Arreglo[""] = "";
        foreach($sql->result() as $datos)
        {
            $Arreglo[$datos->id] = $datos->nombre;
            #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
        }
    return $Arreglo;
}
//______________________________________________________________________
function consulta($id)
{
    $Arreglo = array();
    $this->db->select('*');
        $this->db->from('paises');
        $this->db->where("id", $id);
        #$this->db->order_by('nombre', 'asc');
        $sql = $this->db->get();
        foreach($sql->result() as $datos)
        {
            $Arreglo["id"] = $datos->id;
            $Arreglo["nombre"] = $datos->nombre;
            $Arreglo["iso"] = $datos->iso;
            #echo "<pre>"; print_r($ofici); echo "</pre>"; exit;
        }
    return $Arreglo;
}
//______________________________________________________________________
//______________________________________________________________________
}
?>
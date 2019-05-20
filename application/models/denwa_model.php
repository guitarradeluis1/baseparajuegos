<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Denwa_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('salidas_model');
       $this->load->model('campos_model');
       $this->load->model('usuarios_model');
    }
//________________________________________________________________
function todo($campana_id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'desc');
	$consulta = $this->db->get('denwa_'.$campana_id);
	return  $consulta;
}
//____________________________________________________________________
function espesifico($id, $campana_id)
{
    $this->db->where("id", $id);
	$consulta = $this->db->get('denwa_'.$campana_id);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        return $data;
    }
}
//____________________________________________________________________
function espesifico_salida($id, $campana_id)
{
    $this->db->where("id", $id);
	$consulta = $this->db->get('saliente_'.$campana_id);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        return $data;
    }
}
//_____________________________________________________________________
function historial($id_saliente, $campanas_id)
{
    $this->db->where("saliente_id", $id_saliente);
    $this->db->order_by("id", "desc"); 
    $this->db->limit(3);
	$consulta = $this->db->get('denwa_'.$campanas_id);
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        $Campos = $this->campos_model->todo($campanas_id);
        if(count($data)>0)
        {
            $Arreglo = array();
            $K = 0;
            foreach($data as $info)
            {
                if($Campos)
                {
                    $Arreglo[$K]["id"] = $info->{"id"};
                    $Arreglo[$K]["usuarios_id"] = $info->{"usuarios_id"};
                    $Arreglo[$K]["saliente_id"] = $info->{"saliente_id"};
                    $Arreglo[$K]["fecha"] = $info->{"fecha"};
                    $Arreglo[$K]["hora"] = $info->{"hora"};
                    $Arreglo[$K]["tiempo"] = $info->{"tiempo"};
                foreach($Campos as $salida)
                {
                    $Arreglo[$K]["campo_".$salida["id"]] = $info->{"campo_".$salida["id"]};
                }
                    $Arreglo[$K]["usuario"] = $this->usuarios_model->consulto($info->{"usuarios_id"});
                }
               $K = $K + 1;
            }
            return $Arreglo;
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
//_____________________________________________________________________
function query($sql)
{
    return $this->db->query($sql);
}
//______________________________________________________________________
function consulta_buscador($campanas_id, $campo, $texto)
{
    $this->db->select('*');
    $this->db->from('saliente_'.$campanas_id);
    #$this->db->where($campo, $texto);
    $this->db->like($campo, $texto); 
    $consulta = $this->db->get();
    $Salidas = $this->salidas_model->todo($campanas_id);
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
                if($Salidas)
                {
                    $Arreglo[$K]["id"] = $info->{"id"};
                    $Arreglo[$K]["leido"] = $info->{"leido"};
                foreach($Salidas as $salida)
                {
                    $Arreglo[$K]["".$salida["nombre"]] = $info->{"".$salida["nombre"]};
                }
                }
               $K = $K + 1;
            }
        }
        #----------------------------------------------------
        return $Arreglo;
    }
}
//_____________________________________________________________________
function consulta_campana($campanas_id, $campo, $texto)
{
    $this->db->select('*');
    $this->db->from('denwa_'.$campanas_id);
    #$this->db->where($campo, $texto);
    $this->db->like($campo, $texto); 
    $consulta = $this->db->get();
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        $Campos = $this->campos_model->todo($campanas_id);
        if(count($data)>0)
        {
            $Arreglo = array();
            $K = 0;
            foreach($data as $info)
            {
                if($Campos)
                {
                    $Arreglo[$K]["id"] = $info->{"id"};
                    $Arreglo[$K]["usuarios_id"] = $info->{"usuarios_id"};
                    $Arreglo[$K]["saliente_id"] = $info->{"saliente_id"};
                    $Arreglo[$K]["fecha"] = $info->{"fecha"};
                    $Arreglo[$K]["hora"] = $info->{"hora"};
                    $Arreglo[$K]["tiempo"] = $info->{"tiempo"};
                foreach($Campos as $salida)
                {
                    $Arreglo[$K]["campo_".$salida["id"]] = $info->{"campo_".$salida["id"]};
                }
                    $Arreglo[$K]["usuario"] = $this->usuarios_model->consulto($info->{"usuarios_id"});
                }
               $K = $K + 1;
            }
            return $Arreglo;
        }
        #----------------------------------------------------
    }
}
//_____________________________________________________________________
function consulta_campana_todo($campanas_id)
{
    $this->db->select('*');
    $this->db->from('denwa_'.$campanas_id);
    #$this->db->where($campo, $texto);
    $consulta = $this->db->get();
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        $Campos = $this->campos_model->todo($campanas_id);
        if(count($data)>0)
        {
            $Arreglo = array();
            $K = 0;
            foreach($data as $info)
            {
                if($Campos)
                {
                    $Arreglo[$K]["id"] = $info->{"id"};
                    $Arreglo[$K]["usuarios_id"] = $info->{"usuarios_id"};
                    $Arreglo[$K]["saliente_id"] = $info->{"saliente_id"};
                    $Arreglo[$K]["fecha"] = $info->{"fecha"};
                    $Arreglo[$K]["hora"] = $info->{"hora"};
                    $Arreglo[$K]["tiempo"] = $info->{"tiempo"};
                foreach($Campos as $salida)
                {
                    $Arreglo[$K]["campo_".$salida["id"]] = $info->{"campo_".$salida["id"]};
                }
                    $Arreglo[$K]["usuario"] = $this->usuarios_model->consulto($info->{"usuarios_id"});
                }
               $K = $K + 1;
            }
            return $Arreglo;
        }
        #----------------------------------------------------
    }
}
//_____________________________________________________________________
function consulta_campana_todo_fecha($campanas_id, $inicio, $fin)
{
    $this->db->select('*');
    $this->db->from('denwa_'.$campanas_id);
    #$this->db->where($campo, $texto);
    if($inicio!="" && $fin!="")
    {
        $iniciof = explode("-", $inicio);
        $inicio = $iniciof[2]."-".$iniciof[1]."-".$iniciof[0];
        $finf = explode("-", $fin);
        $fin = $finf[2]."-".$finf[1]."-".$finf[0];
        $this->db->where("denwa_".$campanas_id.".fecha BETWEEN '".$inicio."' AND '".$fin."'");
        #$this->db->where('denwa_'.$campanas_id.'.fecha >=', $inicio);
        #$this->db->where('denwa_'.$campanas_id.'.fecha <=', $fin);
    }
    $consulta = $this->db->get();
    if($consulta->num_rows()>0)
    {
        foreach($consulta->result() as $fila)
        {
            $data[] = $fila;
        }
        #----------------------------------------------------
        $Campos = $this->campos_model->todo($campanas_id);
        if(count($data)>0)
        {
            $Arreglo = array();
            $K = 0;
            foreach($data as $info)
            {
                if($Campos)
                {
                    $Arreglo[$K]["id"] = $info->{"id"};
                    $Arreglo[$K]["usuarios_id"] = $info->{"usuarios_id"};
                    $Arreglo[$K]["saliente_id"] = $info->{"saliente_id"};
                    $Arreglo[$K]["fecha"] = $info->{"fecha"};
                    $Arreglo[$K]["hora"] = $info->{"hora"};
                    $Arreglo[$K]["tiempo"] = $info->{"tiempo"};
                foreach($Campos as $salida)
                {
                    $Arreglo[$K]["campo_".$salida["id"]] = $info->{"campo_".$salida["id"]};
                }
                    $Arreglo[$K]["usuario"] = $this->usuarios_model->consulto($info->{"usuarios_id"});
                }
               $K = $K + 1;
            }
            return $Arreglo;
        }
        #----------------------------------------------------
    }
}
//_____________________________________________________________________
function nuevo($campanas_id, $datos)
{
    $datos["fecha"] = date("d-m-Y");
    $datos["hora"] = date("h:i:s A");
    if($datos["saliente_id"]!="")
    {
        #Actualizo el leiod
        $this->lei($campanas_id, $datos["saliente_id"]);
    }
    $this->db->insert('denwa_'.$campanas_id, $datos);
    $id = "";
    $id = $this->db->insert_id();
    return $id;
}
function lei($campanas_id, $saliente_id)
{
    #Actualizo el leiod
    $D = array();
    $D["id"] = $saliente_id;
    $D["leido"] = 1;
    $this->db->where('id', $saliente_id);
    return $this->db->update('saliente_'.$campanas_id, $D);
}
//______________________________________________________________________
function aleatorio($campanas_id)
{
    $this->db->limit(1);
    $this->db->where("leido", 0);
    #$this->db->order_by("id", "desc");
    $this->db->order_by('id', 'RANDOM');
	$consulta = $this->db->get('saliente_'.$campanas_id);
    $nuemo_aleatorio = rand(0, $consulta->num_rows());
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
function ultimagestionsaliente($campanas_id, $inicio = null, $fin = null)
{
    #$this->db->where("leido", 0);
    if($inicio!="" && $fin!="")
    {
        $iniciof = explode("-", $inicio);
        $inicio = $iniciof[2]."-".$iniciof[1]."-".$iniciof[0];
        $finf = explode("-", $fin);
        $fin = $finf[2]."-".$finf[1]."-".$finf[0];
        $this->db->where("saliente_".$campanas_id.".fecha BETWEEN '".$inicio."' AND '".$fin."'");
    }
	$consulta = $this->db->get('saliente_'.$campanas_id);
    if($consulta->num_rows()>0)
    {
        $K = 0;
        $data = array();
        foreach($consulta->result_array() as $fila)#->result()
        {
            $data[$K] = $fila;
            #echo "<pre>"; print_r($data[$K]); echo "</pre>"; exit;
            $K = $K + 1;
        }
    }
    else
    {
        $data = array();
    }
    return $data;
}
//______________________________________________________________________
function ultimagestionecha($campanas_id, $saliente_id)
{
    $this->db->limit(1);
    $this->db->order_by("id", "desc");
    $this->db->where("saliente_id", $saliente_id);
    $consulta = array();
    $consulta = $this->db->get('denwa_'.$campanas_id);
    $consulta = $consulta->result_array();
    return $consulta;
}
//______________________________________________________________________
function actualizosalida($campanas_id, $datos)
{
    $this->db->where('id', $datos["id"]);
    return $this->db->update('saliente_'.$campanas_id, $datos); 
}
//______________________________________________________________________
function actualizoentrada($campanas_id, $datos)
{
    $datos["fecha"] = date("d-m-Y");
    $datos["hora"] = date("h:i:s A");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('denwa_'.$campanas_id, $datos); 
}
//______________________________________________________________________
function denwaconsaliente($campanas_id)
{
    $sql = "
    select denwa_".$campanas_id.".id as denwa_id, saliente_".$campanas_id.".id as saliente_id
    from denwa_".$campanas_id." 
    left join saliente_".$campanas_id."  on saliente_".$campanas_id." .id = denwa_".$campanas_id." .saliente_id
    order by saliente_".$campanas_id.".id asc
    ";
	$consulta = $this->db->query($sql);
    $consulta = $consulta->result_array();
    return $consulta; 
}
//______________________________________________________________________
}
?>
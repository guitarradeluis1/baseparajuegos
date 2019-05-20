<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuarios_model extends CI_Model
{
    function __construct()
    {
       parent::__construct();
       $this->load->database();
       $this->load->library('session');
       $this->load->model('tipousuario_model');
       $this->load->model('paises_model');
       $this->load->model('arma_model');
       $this->load->model('personaje_model');
       #$this->load->model('arma_model');
    }
//________________________________________________________________
function todo()
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->order_by('id', 'asc');
	$consulta = $this->db->get('usuarios');
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
                    'tipousuario_id' => $info->tipousuario_id,
                    'paises_id' => $info->paises_id,
                    'personaje_id' => $info->personaje_id,
                    'arma1' => $info->arma1,
                    'arma2' => $info->arma2,
                    'email' => $info->email,
                    //'pass' => $info->pass,
                    'nombre' => $info->nombre,
                    'fecha_nacimento' => $info->fecha_nacimento,
                    'creado' => $info->creado,
                    'ultima_entrada' => $info->ultima_entrada,
                    'img_jugador' => $info->img_jugador,
                    'img_perfil' => $info->img_perfil,
                    'vida' => $info->vida,
                    'nivel' => $info->nivel,
                    'puntos' => $info->puntos,
                    'defensa' => $info->defensa,
                    'fuerza' => $info->fuerza,
                    'punteria' => $info->punteria,
                    'velocidad' => $info->velocidad,
               );
               ####################################################################
                $Arreglo[$K]["tipousuario"] = $this->tipousuario_model->consulta($info->tipousuario_id);
                $Arreglo[$K]["paises"] = $this->paises_model->consulto($info->paises_id);
                if($info->personaje_id != 0 && $info->personaje_id != "")
                {$Arreglo[$K]["personaje"] = $this->personaje_model->consulto($info->personaje_id);}
                if($info->arma1 != 0 && $info->arma1 != "")
                {$Arreglo[$K]["arma_1"] = $this->arma_model->consulto($info->arma1);}
                if($info->arma2 != 0 && $info->arma2 != "")
                {$Arreglo[$K]["arma_2"] = $this->arma_model->consulto($info->arma2);}
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
    $this->db->select('*');
    #$this->db->from('usuarios');
    #$this->db->join('tipousuario', 'tipousuario.id = usuarios.tipousuario_id', "inner"); #left inner
    $this->db->order_by('usuarios.id', 'desc');
    $consulta = $this->db->get('usuarios',$por_pagina,$segmento);
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
    $datos["creado"] = date("Y-m-d");
    return $this->db->insert('usuarios', $datos); 
}
//______________________________________________________________________
function actualizo($datos)
{
    $datos["ultima_entrada"] = date("Y-m-d");
    $this->db->where('id', $datos["id"]);
    return $this->db->update('usuarios', $datos);
}
//______________________________________________________________________
function cambio_vida($id, $vida)
{
    $datos["id"] = $id;
    $datos["vida"] = $vida;
    $this->db->where('id', $datos["id"]);
    #$this->db->where('vida >', $vida);
    return $this->db->update('usuarios', $datos);
}
//______________________________________________________________________
function consulto($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'tipousuario_id' => $info->tipousuario_id,
           'paises_id' => $info->paises_id,
           'personaje_id' => $info->personaje_id,
           'arma1' => $info->arma1,
           'arma2' => $info->arma2,
           'email' => $info->email,
           //'pass' => $info->pass,
           'nombre' => $info->nombre,
           'fecha_nacimento' => $info->fecha_nacimento,
           'creado' => $info->creado,
           'ultima_entrada' => $info->ultima_entrada,
           'img_jugador' => $info->img_jugador,
           'img_perfil' => $info->img_perfil,
           'vida' => $info->vida,
           'nivel' => $info->nivel,
           'puntos' => $info->puntos,
           'defensa' => $info->defensa,
           'fuerza' => $info->fuerza,
           'punteria' => $info->punteria,
           'velocidad' => $info->velocidad,
           ####################################################################
           "tipousuario" => $this->tipousuario_model->consulta($info->tipousuario_id),
           "paises" => $this->paises_model->consulta($info->paises_id),
           "arma_1" => $this->arma_model->consulto($info->arma1),
           "arma_2" => $this->arma_model->consulto($info->arma2),
           ####################################################################
       );
       /*
       if($info->arma1 != 0 && $info->arma1 != "")
       {$retorno["arma_1"] = $this->arma_model->consulta($info->arma1);}
       if($info->arma2 != 0 && $info->arma2 != "")
       {$retorno["arma_2"] = $this->arma_model->consulta($info->arma2);}*/
    }
    return $retorno;
}
//______________________________________________________________________
function consulto_ligero($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'paises_id' => $info->paises_id,
           'personaje_id' => $info->personaje_id,
           'arma1' => $info->arma1,
           'arma2' => $info->arma2,
           'nombre' => $info->nombre,
           'vida' => $info->vida,
           'nivel' => $info->nivel,
           'puntos' => $info->puntos,
           'defensa' => $info->defensa,
           'fuerza' => $info->fuerza,
           'punteria' => $info->punteria,
           'velocidad' => $info->velocidad,
           ####################################################################
           #"tipousuario" => $this->tipousuario_model->consulta($info->tipousuario_id),
           "paises" => $this->paises_model->consulta($info->paises_id),
           "arma_1" => $this->arma_model->consulto($info->arma1),
           "arma_2" => $this->arma_model->consulto($info->arma2),
           ####################################################################
       );
    }
	return $retorno;
}
//______________________________________________________________________
function consulto_conectado($id)
{
    #$this->db->join('rol', 'usuarios.rol_id = rol.rol_id', "inner"); #left inner
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where("id",$id);
	$consulta = $this->db->get();
    $retorno = array();
    foreach($consulta->result() as $info)
    {
        $retorno = array
        (
           'id' => $info->id,
           'paises_id' => $info->paises_id,
           'personaje_id' => $info->personaje_id,
           'arma1' => $info->arma1,
           'arma2' => $info->arma2,
           'nombre' => $info->nombre,
           'vida' => $info->vida,
           'nivel' => $info->nivel,
           'puntos' => $info->puntos,
           ####################################################################
           #"tipousuario" => $this->tipousuario_model->consulta($info->tipousuario_id),
           "personaje" => $this->personaje_model->consulto($info->personaje_id),
           "paises" => $this->paises_model->consulta($info->paises_id),
           ####################################################################
       );
    }
	return $retorno;
}

//______________________________________________________________________
function consultaexistencia($campo, $valor)
{
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where($campo, $valor);
    $sql_contratos = $this->db->get();
    if($sql_contratos->num_rows() >= 1)
    {
        return 1;// Si
    }
    else
    {
        return 0;// NO
    }
}
//______________________________________________________________________
    function verificar($correo , $pass)
    {
        $this->db->select('*');
        $this->db->from('usuarios');
        #$this->db->join('tipousuario', 'tipousuario.id = usuarios.tipousuario_id', "inner"); #left inner
        #$this->db->join('empresas', 'empresas.id = cotizaciones.empresas_id', "inner"); #left inner
        $this->db->where("email", $correo);
        $this->db->where("pass", $pass);
        #$this->db->where("activo", 1);
        $sql_contratos = $this->db->get();#$this->db->get("usuarios");
        if($sql_contratos->num_rows() >= 1)
        {
            #echo "<pre>"; print_r($sql_contratos->result_array()); echo "</pre>"; exit;
            foreach($sql_contratos->result() as $info)
            {
                #echo "<pre>"; print_r($info); echo "</pre>";
                $usuario = array();
                $usuario = array
                (
                   'id' => $info->id,
                   'tipousuario_id' => $info->tipousuario_id,
                   'paises_id' => $info->paises_id,
                   'personaje_id' => $info->personaje_id,
                   'arma1' => $info->arma1,
                   'arma2' => $info->arma2,
                   'email' => $info->email,
                   //'pass' => $info->pass,
                   'nombre' => $info->nombre,
                   'fecha_nacimento' => $info->fecha_nacimento,
                   'perfil' => $info->perfil,
                   'creado' => $info->creado,
                   'ultima_entrada' => $info->ultima_entrada,
                   'img_jugador' => $info->img_jugador,
                   'img_perfil' => $info->img_perfil,
                   'vida' => $info->vida,
                   'nivel' => $info->nivel,
                   'puntos' => $info->puntos,
                   'defensa' => $info->defensa,
                   'fuerza' => $info->fuerza,
                   'punteria' => $info->punteria,
                   'velocidad' => $info->velocidad,
               );
               $this->session->set_userdata($usuario);
               #echo $usuario["pass"]."==".$pass; exit;
               #echo "<pre>"; print_r($usuario); echo "</pre>"; exit;
               #--
               #if($usuario["correo"] == $correo && $usuario["pass"] == $pass)
               {
                   $encontrado = 1;
                   /*$this->session->set_userdata("id", $usuario["id"]);
                   $this->session->set_userdata("tipousuario_id", $usuario["tipousuario_id"]);
                   $this->session->set_userdata("nombreusuario", $usuario["nombreusuario"]);
                   $this->session->set_userdata("correo", $usuario["correo"]);
                   $this->session->set_userdata("identificacion", $usuario["identificacion"]);
                   $this->session->set_userdata("nombre", $usuario["nombre"]);
                   $this->session->set_userdata("apellido", $usuario["apellido"]);*/
               }
               /*else
               {
                    $usuario = array();
                    $encontrado = 0;
                    $this->session->set_userdata("razon_social", "");
               }*/
            }
        }
        else
        {
            $usuario = 0;
            $encontrado = 0;
            $this->session->sess_destroy();
        }
        return $encontrado;
    }
//______________________________________________________________________
function actualizo_puntos($id, $tipo)
{
    $this->db->select('*');
    $this->db->from('usuarios');
    $this->db->where("id", $id);
    $consulta = $this->db->get();
    $data = array();
    foreach($consulta->result() as $info)
    {
        $data = array(
            'puntos' => $info->puntos,
            'defensa' => $info->defensa,
            'fuerza' => $info->fuerza,
            'punteria' => $info->punteria,
            'velocidad' => $info->velocidad
        );
    }
    if($data['puntos'] > 0)
    {
        $puntos = true;#"si ".$tipo;
        $update['puntos'] = ($data['puntos']-1);
        $update[$tipo] = ($data[$tipo]+1);
        $this->db->where('id', $id);
        $this->db->update('usuarios', $update);
    }
    else
    {
        $puntos = false;
    }
	return $puntos;
}
//______________________________________________________________________
}
?>
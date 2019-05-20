<script src="<?php echo base_url('js/jquery-1.7.min.js');?>"></script>
<script src="<?php echo base_url('js/jquery.validate.js');?>"></script>
<script src="<?php echo base_url('js/phaser.min.js');?>"></script>
<script src="<?php echo base_url('js/mundo/pelea_dados.js');?>"></script>
<script src="<?php echo base_url('js/mundo/funciones_juego.js');?>"></script>
<script src="<?php echo base_url('js/mundo/enemigo.js');?>"></script>
<script src="<?php echo base_url('js/mundo/jugadores.js');?>"></script>
<script src="<?php echo base_url('js/juego/funciones.js');?>"></script>
<!---------------------------------------------------------------------->
<!--CHAT-------------------------------------------------------->
<div aria-hidden="true" class="navdrawer navdrawer-right" id="navdrawerDefault" tabindex="-1">
  <div class="navdrawer-content">
    <div class="navdrawer-header">
      <a class="navbar-brand px-0" id="menu_titulo">Cargando...</a>
    </div>
    <div id="chat_dirigido"></div>
    <table id="tr_chat" width="100%;">
        <!--tr>
            <td><p class="text-left"><span class="badge badge-success">Luis1</span></p></td>
            <td>sssssssssssssssssssss</td>
        </tr>
        <tr>
            <td>adsasdasd</td>
            <td><p class="text-right"><span class="badge badge-info">TU</span></p></td>
        </tr-->
    </table>
    <div class="navdrawer-divider"></div>
    <nav class="navdrawer-nav" id="nav_menu2" >
        <input id="chat_input" class="form-control form-control-sm" type="text" placeholder="Escribe aqui tu mensaje" />
        <button class="btn btn-success my-xs" onclick="objchat.enviochat()" type="button"><i class="material-icons">reply</i> ENVIAR</button>
        <br />
        <!--contactot--->   
        <div class="btn-float-dropdown dropdown">
        <button aria-expanded="false" aria-haspopup="true" class="btn btn-float btn-warning" data-toggle="dropdown" type="button"><i class="material-icons">people</i></button>
            <div class="dropdown-menu" id="div_contactos_chat">
                <button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, 'Piso', 1, 0, 0, 0)" type="button">
                    <i class="material-icons">public</i>
                    <span class="badge badge-pill badge-warning">Piso</span>
                </button>
                <button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, 'Campo', 0, 1, 0, 0)" type="button">
                    <i class="material-icons">room</i>
                    <span class="badge badge-pill badge-dark">Campo</span>
                </button>
                <button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, 'Gremio', 0, 0, 0, 1)" type="button">
                    <i class="material-icons">room</i>
                    <span class="badge badge-pill badge-secondary">Gremio</span>
                </button>
            </div>
        </div>
        <!-------------->
    </nav>
  </div>
</div>
<!-------------------------------------------------------------->
<!-- Button trigger modal -->
<div hidden="thue">
<button id="btn_hide_modal" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal"></button>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal_titulo">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_cuerpo">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
            <?php echo img('archivos_fijos/no.png', 'pequeña'); ?>
        </button>
        <button type="button" id="button_modal" onclick="" class="btn btn-primary" data-dismiss="modal">
            <?php echo img('archivos_fijos/si.png', 'pequeña'); ?>
        </button>
      </div>
    </div>
  </div>
</div>
<!--------------------------------------------------------------->
<!-- Button trigger modal Status -->
<div hidden="thue">
<button id="btn_hide_modal_status" type="button" class="btn btn-primary" data-toggle="modal" data-target="#status"></button>
</div>
<!-- Modal Status -->
<div class="modal fade" id="status" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal_titulo">Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_cuerpo">
        <div class="card">
            <div class="card-body">
                <div>
                    <div class="h-auto d-inline-block" style="width: 120px;">
                        <?php echo img('archivos_fijos/status.png', 'mediana'); ?>
                    </div>
                    <div class="h-auto d-inline-block" >
                        <b>Puntos:</b> <label id="label_puntos">0</label><br />
                        <b>Velocidad:</b> <label id="label_velocidad">0</label>&nbsp;&nbsp;<button onclick="mas_puntos('velocidad')" class="btn_mas" type="button">+</button><br />
                        <b>Fuerza:</b> <label id="label_fuerza">0</label>&nbsp;&nbsp;<button onclick="mas_puntos('fuerza')" class="btn_mas" type="button">+</button><br />
                        <b>Punteria:</b> <label id="label_punteria">0</label>&nbsp;&nbsp;<button onclick="mas_puntos('punteria')" class="btn_mas" type="button">+</button><br />
                        <b>Defensa:</b> <label id="label_defensa">0</label>&nbsp;&nbsp;<button onclick="mas_puntos('defensa')" class="btn_mas" type="button">+</button><br />
                    </div>
                </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="btn_cerrar_status" class="btn btn-secondary" data-dismiss="modal">
            <?php echo img('archivos_fijos/no.png', 'pequeña'); ?>
        </button>
        <button type="button" id="button_modal" onclick="" class="btn btn-primary" data-dismiss="modal">
            <?php echo img('archivos_fijos/si.png', 'pequeña'); ?>
        </button>
      </div>
    </div>
  </div>
</div>
<!--------------------------------------------------------------->
<div id="body">
    <?php #echo anchor("ingreso/index", "Atras", "class='plata'"); ?>
    <br />
    <div id="canvas"></div>
</div>
<div style="display: none;" id="div_escondido"></div>
<div id="div_imgcarga" style="display: none;"><?php echo img('img/loader.gif', 'pequeña'); ?></div>
<?php
    #echo img('img/loader.gif', 'pequeña');
    #echo img('img/giphy.gif', 'pequeña');
    
    #echo "<pre>"; print_r($Posicion); echo "</pre>";
    #echo "<pre>"; print_r($campo_objeto); echo "</pre>";
    #echo "<pre>"; print_r($campo); echo "</pre>";
    #echo "<pre>"; print_r($campo_dubujo); echo "</pre>";
    #echo "<pre>"; print_r($personaje); echo "</pre>";
    #echo "<pre>"; print_r($Usuario); echo "</pre>";
    #echo "<pre>"; print_r($campo_enemigo); echo "</pre>";
?>
<script>
$(document).ready(function()
{
    //$(".carga").click(function (){carga($(this).val());});
    //-------------------------
    //usuario_session = <?php #echo json_encode($session); ?>;
    //precargas = <?php #echo json_encode($campo_objeto); ?>;
    precargas_objetos = <?php echo json_encode($precargas_objetos); ?>;
    campo = <?php echo json_encode($campo); ?>;
    campo_dubujo = <?php echo json_encode($campo_dubujo); ?>;
    enemigos = <?php echo json_encode($campo_enemigo); ?>;
    personaje_img = <?php echo json_encode($personaje); ?>;
    Posicion = <?php echo json_encode($Posicion); ?>;
    Usuario = <?php echo json_encode($Usuario); ?>;
    //console.log(campo_dubujo);
});
//**********************************
function modal_mensaje(data)
{
    $('#modal_titulo').html(data.titulo);
    $('#modal_cuerpo').html(data.mensaje);
    $('#button_modal').removeAttr('onclick');
    $('#button_modal').attr('onclick', 'na');
    $('#button_modal').attr('onclick', data.funcion);
    $('#btn_hide_modal').click();
}
//**********************************
</script>
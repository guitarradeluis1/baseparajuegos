var contactos_chat = new Array();//new Object();
let yachat = 0;
$(document).ready(function()
{
    cronometroChat = setInterval(
    	function()
        {
            objchat.segundos++;
            if(objchat.segundos >= 10)
            {
                if(yachat == 0)
                {
                    yachat = 1;
                    objchat.leer();
                    objchat.segundos = 0;
                }
            }
    	}
	,1000);
});
function agregar_jugadores()
{
    var temp_conteo = 0;
    var temp_k = 0;
    var sprit_button = [];
    var dinami_funcion = {};
    //Pintando enemigos--------------------------
    for(var en in pint_jugadores)
    {
        //console.log(pint_jugadores[en].usuarios);
        label_jugadores[temp_conteo].position.x = pint_jugadores[en].x;
        label_jugadores[temp_conteo].position.y = pint_jugadores[en].y-15;
        label_jugadores[temp_conteo].setText( pint_jugadores[en].usuarios.nombre.toString() );
        label_jugadores_panel[temp_conteo].position.x = pint_jugadores[en].x;
        label_jugadores_panel[temp_conteo].position.y = pint_jugadores[en].y-15;
        //label_jugadores_panel[en].width = 30; label_jugadores_panel[en].height = 15;
        //label_jugadores[en] = game.add.text(-500, -500, 'luis', { font: '16px Arial', fill: '#00FF00' });
        var cuadros = pint_jugadores[en].usuarios.personaje.down.cuadros.toString()
        cuadros = cuadros.replace(" ", "");
        cuadros = cuadros.replace("[", "");
        cuadros = cuadros.replace("]", "");
        cuadros = cuadros.split(",");
        //console.log(cuadros);
        cuadros.forEach(function(valor, indice, array)
        {
            if(temp_k < 2)
            {
                sprit_button[temp_k] = eval(valor);
                temp_k = temp_k + 1;   
            }
        });

        //[ (16*7),(16*7)+1,(16*7)+2,(16*7)+3]
        btn_pint_jugadores[en] = game.add.button(
            pint_jugadores[en].x,
            pint_jugadores[en].y, 
            pint_jugadores[en].usuarios.personaje.down.objeto.nombre.toString(), 
            btn_jugador_click.uno, 
            this, 
            sprit_button[0], sprit_button[1], sprit_button[2]
        );
        btn_pint_jugadores[en].jugador = pint_jugadores[en].usuarios;
        btn_pint_jugadores[en].onInputDown.add(btn_jugador_click, this);
        //btn_pint_jugadores[en].onInputOver.add(over_jugador, this);
        //console.log(pint_jugadores[en]);
    }
}
function btn_jugador_click(tem_button)
{
    //console.log(tem_button.jugador);
   var temp_info = tem_button.jugador;
   var temp_var = {};
   temp_var.titulo = "Agregar a chat ?";
   temp_var.mensaje = "Quieres agregar a "+temp_info.nombre+" <b>(Lv"+temp_info.nivel+")</b> a tu chat ?";
   temp_var.funcion = "addchat("+temp_info.id+", '"+temp_info.nombre+" Lv"+temp_info.nivel+"');";
   modal_mensaje(temp_var);
   //$('#myModal').modal('show')
}
function addchat(id, nombre)
{
    var file = new Object();
    file.id = id;
    file.nombre = nombre;
    var temp_repetir = 0;
    contactos_chat.forEach( function(valor, posicio, array)
    {
        if(valor.id == file.id)
        {
            temp_repetir = 1;
        }
    });
    if(temp_repetir == 0)
    {
        contactos_chat.push(file);
    }
    paintaddchat();
}
function paintaddchat()
{
    $("#div_contactos_chat").html("");
    var html = '';
    html += '<button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, \'Piso\', 1, 0, 0, 0)" type="button">';
    html += '    <i class="material-icons">public</i>';
    html += '    <span class="badge badge-pill badge-warning">Piso</span>';
    html += '</button>';
    html += '<button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, \'Campo\', 0, 1, 0, 0)" type="button">';
    html += '    <i class="material-icons">room</i>';
    html += '    <span class="badge badge-pill badge-dark">Campo</span>';
    html += '</button>';
    html += '<button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, \'Campo\', 0, 0, 1, 0)" type="button">';
    html += '    <i class="material-icons">room</i>';
    html += '    <span class="badge badge-pill badge-primary">Grupo</span>';
    html += '</button>';
    html += '<button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat(0, \'Campo\', 0, 0, 0, 1)" type="button">';
    html += '    <i class="material-icons">room</i>';
    html += '    <span class="badge badge-pill badge-secondary">Gremio</span>';
    html += '</button>';
    $("#div_contactos_chat").append(html);
    contactos_chat.forEach( function(valor, posicio, array){
        var html = '';
        html += '<button class="btn btn-float btn-light btn-sm" onclick="enlasar_chat('+valor.id+', \''+valor.nombre+'\', 0, 0, 0)" type="button">';
        html +=     '<i class="material-icons">account_circle</i>';
        html +=     '<span class="badge badge-pill badge-success">'+valor.nombre+'</span>';
        html += '</button>';
        $("#div_contactos_chat").append(html);
        //console.log(valor.id+" "+valor.nombre);
    });
}
function enlasar_chat(idjugador, nombre, piso, campo, grupo, gremio)
{
    $("#chat_dirigido").html("");
    objchat.contacto_jugador = 0;
    objchat.contacto_piso = 0;
    objchat.contacto_campo = 0;
    objchat.contacto_grupo = 0;
    objchat.contacto_gremio = 0;
    var html = '';
    if(idjugador != 0)
    {
        objchat.contacto_jugador = idjugador;
        html += '<span class="chip">'+nombre+'</span>';
        //html += '<span class="chip">Agreagar a grupo</span>';
        /*html += '<button class="chip btn-float btn-light btn-sm" onclick="agregargrupo('+valor.id+', \''+valor.nombre+'\', 0, 0)" type="button">';
        html +=     '<i class="material-icons">account_circle</i>';
        html +=     '<span class="badge badge-pill badge-success">'+valor.nombre+'</span>';
        html += '</button>';*/
        console.log("jugador");
    }
    else if(piso != 0)
    {
        objchat.contacto_piso = piso;
        html += '<span class="badge badge-pill badge-warning">Piso</span>';
        console.log("piso");
    }
    else if(campo != 0)
    {
        objchat.contacto_campo = campo;
        html += '<span class="badge badge-pill badge-dark">Campo</span>';
        console.log("campo");
    }
    else if(grupo != 0)
    {
        objchat.contacto_grupo = grupo;
        html += '<span class="badge badge-pill badge-primary">Grupo</span>';
        console.log("campo");
    }
    else if(gremio != 0)
    {
        objchat.contacto_gremio = gremio;
        html += '<span class="badge badge-pill badge-secondary">Gremio</span>';
        console.log("gremio");
    }
    $("#chat_dirigido").append(html);
    //<span class="chip"><i class="chip-icon">C</i>Chip Label</span>
}

var objchat = {
    contacto_jugador: 0,
    contacto_piso: 0,
    contacto_campo: 1,
    contacto_grupo: 0,
    contacto_gremio: 0,
    segundos: 0,
    mensajes: {},
    cero: function()
    {
        contacto_jugador = 0;
        contacto_piso = 0;
        contacto_campo = 0;
        contacto_grupo = 0;
        contacto_gremio = 0;
    },
    enviochat: function()
    {
        var chat_input = $("input#chat_input").val();
        if(chat_input != "")
        {
            $("input#chat_input").val("");
            var json = new Object();
            json.mensaje = chat_input;
            json.contacto_jugador = objchat.contacto_jugador;
            json.contacto_piso = objchat.contacto_piso;
            json.contacto_campo = objchat.contacto_campo;
            json.contacto_grupo = objchat.contacto_grupo;
            json.contacto_gremio = objchat.contacto_gremio;
            json = "json=" + JSON.stringify(json);
            $.ajax(
            {
                type: "POST",
                dataType: "text/json",
                url: "../../chat/envio/",
                data: json,
                success: function(msg)
                {
                    //objchat.leer();
                },
                error: function(e)
                {
                    console.log("Error envio chat");
                }
            });
        }
    },
    leer: function()
    {
        var json = new Object();
        json.contacto_jugador = objchat.contacto_jugador;
        json.contacto_piso = objchat.contacto_piso;
        json.contacto_campo = objchat.contacto_campo;
        json.contacto_grupo = objchat.contacto_grupo;
        json.contacto_gremio = objchat.contacto_gremio;
        json = "json=" + JSON.stringify(json);
        $.post( "../../chat/leer/",json, function(data){
          $("#div_escondido").html(data);
          yachat = 0;
        });
    },
    micuadro: function(data)
    {
        let html = "";
        html += '<tr>';
        html +=     `<td><p><span class="badge badge-success">${Usuario.nombre}</span></p></td>`;
        html +=     `<td><p class="text-left">${data.mensaje}<br/>${data.creado}<p></td>`;
        html += '</tr>';
        return html;
    },
    otrocuadro: function(data)
    {
        let html = "";
        html += '<tr>';
        html +=    `<td>${data.mensaje}<br/>${data.creado}</td>`;
        html +=    `<td><p class="text-right"><span class="badge badge-info">${data.usuario_envio.nombre} Nv(${data.usuario_envio.nivel})</span></p></td>`;
        html += '</tr>';
        return html;
    },
    pintarchat: function()
    {
        $("#tr_chat").html("");
        let html = "";
        for(var en in objchat.mensajes)
        {
            if(objchat.mensajes[en].usuario1 == Usuario.id)
            {
                html += objchat.micuadro(objchat.mensajes[en]);
            }
            else
            {
                html += objchat.otrocuadro(objchat.mensajes[en]);
            }
            //console.log(objchat.mensajes[en]);
        }
        $("#tr_chat").html(html);
    }
};
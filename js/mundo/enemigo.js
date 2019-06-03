var seg_enemigo = 0;
function movimiento_enemigo(data)
{
    seg_enemigo++;
    if(seg_enemigo == 3)
    {
        seg_enemigo = 0;
        for(var en in enemigos)
        {
            if(pint_enemigos[en].tipo_moviemiento == 4)
            {
                var temp_direccion = Math.floor(Math.random() * (6 - 0)) + 0;
                pint_enemigos[en].direccion = temp_direccion;
            }
            else if(pint_enemigos[en].tipo_moviemiento == 2 || pint_enemigos[en].tipo_moviemiento == 3)
            {
                var temp_direccion = Math.floor(Math.random() * (2 - 0)) + 0;
                pint_enemigos[en].direccion = temp_direccion;
            }
        }   
    }
    // 0 = abajo | 1 = arriba | 2 = derecha | 3 = izquierda | 4 = quieto
    var temp_velosidad= 25;
    for(var en in enemigos)
    {
        //temp_velosidad = 0;
        //temp_velosidad = pint_enemigos[en].velocidad;
        if(pint_enemigos[en].tipo_moviemiento == 2)//arriba abajo
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
        }
        else if(pint_enemigos[en].tipo_moviemiento == 3)//arriba abajo
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.x = -temp_velosidad;
                pint_enemigos[en].animations.play('left');
            }
        }
        else if(pint_enemigos[en].tipo_moviemiento == 4)//aleatorio
        {
            if(pint_enemigos[en].direccion == 0)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else if(pint_enemigos[en].direccion == 1)
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
            else if(pint_enemigos[en].direccion == 3)
            {
                pint_enemigos[en].body.velocity.x = -temp_velosidad;
                pint_enemigos[en].animations.play('left');
            }
            else if(pint_enemigos[en].direccion == 4)
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            else
            {
                pint_enemigos[en].body.velocity.x = 0;
                pint_enemigos[en].body.velocity.y = 0;
                pint_enemigos[en].animations.stop();
            }
        }
        else if(pint_enemigos[en].tipo_moviemiento == 5)//ataque
        {
            if( pint_enemigos[en].position.x > personaje.position.x)
            {
                pint_enemigos[en].body.velocity.x = -temp_velosidad;
                pint_enemigos[en].animations.play('left');
            }
            else
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            if( pint_enemigos[en].position.y < personaje.position.y)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
        }
        else if(pint_enemigos[en].tipo_moviemiento == 6)//defensa
        {
            if( pint_enemigos[en].position.x < personaje.position.x)
            {
                pint_enemigos[en].body.velocity.x = -pint_enemigos[en].velocidad;;
                pint_enemigos[en].animations.play('left');
            }
            else
            {
                pint_enemigos[en].body.velocity.x = temp_velosidad;
                pint_enemigos[en].animations.play('right');
            }
            if( pint_enemigos[en].position.y > personaje.position.y)
            {
                pint_enemigos[en].body.velocity.y = temp_velosidad;
                pint_enemigos[en].animations.play('down');
            }
            else
            {
                pint_enemigos[en].body.velocity.y = -temp_velosidad;
                pint_enemigos[en].animations.play('up');
            }
        }
        if(!pint_enemigos[en].movomiento)
        {
            pint_enemigos[en].body.velocity.x = 0;
            pint_enemigos[en].body.velocity.y = 0;
            pint_enemigos[en].animations.stop();
        }
    }
}
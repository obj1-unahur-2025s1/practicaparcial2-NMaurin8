class Rol{
    method potencialOfensivo(unPersonaje)
    
    method esGroso(unPersonaje)
}

class Guerrero inherits Rol{
    override method potencialOfensivo(unPersonaje) = 100
    override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

class Cazador inherits Rol{
    const mascota

    override method potencialOfensivo(unPersonaje) = mascota.potencialOfensivo()
    override method esGroso(unPersonaje) = mascota.edad() > 10

}

class Brujo inherits Rol{
    override method potencialOfensivo(unPersonaje) = if(unPersonaje.raza().esOrco()) unPersonaje.potencial()*0.1 else 0 
    override method esGroso(unPersonaje) = true
}

class Mascota{
    const property fuerza
    const property edad
    const property tieneGarras

    method potencialOfensivo() = if(tieneGarras) fuerza * 2 else fuerza
}
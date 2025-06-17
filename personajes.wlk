import roles.*
import localidades.*
class Personaje{

  const property raza
  const property fuerza
  const property inteligencia
  var property rol


  method potencial() = fuerza*10
  method potencialOfensivo() = self.potencial() + rol.potencialOfensivo(self)

  method esGroso() = self.esInteligente() or rol.esGroso(self)
  method esInteligente() = raza.esInteligente(self)

}

class Raza{
  method esOrco() = false
  method esInteligente(personaje)
}

class Orco inherits Raza{
  override method esOrco() = true
  override method esInteligente(personaje) = false
}

class Humano inherits Raza{
  override method esInteligente(personaje) = personaje.inteligencia() > 50 
}


class Ejercito{
  const property soldados = #{}
  method contratarSoldado(unPersonaje){
    soldados.add(unPersonaje)
  }

  method potencialOfensivo() = soldados.sum({soldado => soldado.potencialOfensivo()})
  method tamanio() = soldados.size()

  method invadir(unaLocalidad){
    if(self.potencialOfensivo() > unaLocalidad.potencialOfensivo()){
      unaLocalidad.desalojar()
      unaLocalidad.ocupar(self)
    }
  }

  method miembrosMayorPotencial() = soldados.sortedBy({soldado1, soldado2 => soldado1.potencialOfensivo() > soldado2.potencialOfensivo()}).take(10)
}
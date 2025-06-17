import personajes.*
class Localidad{
  const property personajes

  method potencialOfensivo() = personajes.sum({personaje => personaje.potencialOfensivo()}) 

  method desalojar(){
    personajes.clear()
    
  }

  method ocupar(ejercitoAtacante){
    if(self.superaLocalidad(ejercitoAtacante.tamanio())){
        personajes.addAll(ejercitoAtacante.miembrosMayorPotencial())
    }
  }
  method superaLocalidad(unEjercito) = false
}

class Aldea inherits Localidad{
    const cantidadMaxima


    method initialize(){
        if(personajes.size() > cantidadMaxima){
            self.error("Se supera la cantidad maxima permitida")
        }
    }

    override method superaLocalidad(cantidad) = cantidad > cantidadMaxima

}

class Ciudad inherits Localidad{
    override method potencialOfensivo() = super() + 300
}


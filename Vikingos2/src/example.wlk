//Crear un vikingo General
class UserException inherits Exception{ }

class Vikingo {
	var property claseSocial
	var property tipoVikingo
	constructor(_claseSocial){
		claseSocial = _claseSocial
	}
	method nuevaClase(valor){
		claseSocial = valor
	}
}


class Soldado inherits Vikingo{
	var property armas = 0
	var property vidasCobradas = 0
	method puedeSubir(){
		if(claseSocial.equals("Jarl")){
			return armas==0
			}
		else{
			return (armas>0 && vidasCobradas>20)
			}
	}
	
	method ascender(){
		if(claseSocial.equals("Jarl")){
			self.nuevaClase("Karl")
			self.sumarArmas(10)
		}
		if(claseSocial.equals("Karl")){
			self.nuevaClase("Thrall")
		}
		else{
			throw new UserException("Usted ya no puede ascender")
		}
	}
	
	method sumarArmas(valor){
		armas += valor
	}
}

class Granjero inherits Vikingo{
	var property hijos = 0
	var property hectareas = 0

	method puedeSubir(){
		return (return (hijos<=hectareas/2))
	}
	method ascender(){
			if(claseSocial.equals("Jarl")){
			self.nuevaClase("Karl")
			self.sumarHijos(2)
			self.sumarHectareas(2)
		}
		if(claseSocial.equals("Karl")){
			self.nuevaClase("Thrall")
		}
		else{
			throw new UserException("Usted ya no puede ascender")
		}
	}
	method sumarHijos(valor){
		hijos += valor
	}
	
	method sumarHectareas(valor){
		hectareas += valor
	}
}

//Crear expedicion
class Expedicion{
	var listaCiudades = []
	var listaCapitales = []
	var listaVikingos = []
	
	method valePena(){
		var ciudades = (listaCiudades.map{ciudades => ciudades.valenPena(listaVikingos.size())}).all(true)
		var capitales = (listaCiudades.map{capitales => capitales.valenPena(listaVikingos.size())}).all(true)
		return ciudades && capitales
	}
	
	method agregarCiudad(ciudad){
		listaCiudades.add(ciudad)
	}
	
	method agregarCapital(capital){
		listaCapitales.add(capital)
	}
	
	method subirVikingo(vikingo){
		if(vikingo.puedeSubir()){
			listaVikingos.add(vikingo)
			return true
		}
		else{
			throw new UserException("Usted no puede Subir")
		}
	}
	
	
}
//Crear capitales
class Capital{
	var factorRiqueza = [0,1,2,3,4,5,6,7,8,9]*0.5 // Factor de riqueza Aleatorio
	method valenPena(cantidadVikingos){
		return (cantidadVikingos*factorRiqueza>=cantidadVikingos*3)
	}	
}
//Crear ciudades
class Ciudad{
	var minimo =[0,1,2,3,4,5,6,7,8,9].anyOne()*5
	var amurallada = [true,false].anyOne()
	var cantidadCrucifijos = [0,1,2,3,4,5,6,7,8,9].anyOne()*5
	method valenPena(cantidadVikingos){
		if(amurallada.equals(false)){
			return cantidadCrucifijos>=15
		}
		else
		{
			return ( cantidadCrucifijos>=15 && cantidadVikingos>=minimo)
		}
	}
	
}
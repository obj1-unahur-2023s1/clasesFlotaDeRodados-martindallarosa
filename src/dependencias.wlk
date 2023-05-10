import rodados.*
import pedidos.*

class Dependencia {
	const flota = []
	const pedidos = []
	var property empleados
	
	
	method agregarAFlota(unRodado){
		flota.add(unRodado)
	}
	method quitarDeFlota(unRodado){
		flota.remove(unRodado)
	}
	method pesoTotalFlota() = flota.sum({r=>r.peso()})
	method estaBienEquipada() { return flota.size() >= 3 and 
	flota.all({r=>r.velocidad() >= 100})}
	
	method capacidadTotalEnColor(color){
		return flota.filter({r=>r.color()==color}).sum({r=>r.capacidad()})
	}
	
	method colorRodadoMasRapido(){
		return flota.max({r=>r.velocidad()}).color()
	}
	
	method capacidadDeLaFlota() = flota.sum({r=>r.capacidad()})
	method capacidadFaltante() { return
		0.max(empleados -self.capacidadDeLaFlota())		
	}
	method esGrande(){
		return empleados >= 40 and flota.size() >=5
	}
	
	method agregarPedido(unPedido){
		pedidos.add(unPedido)
	}
	
	method quitarrPedido(unPedido){
		pedidos.remove(unPedido)
	}
	method totalPasajerosEnPedidos(){
		return pedidos.sum({p=>p.cantPasajeros()})
	}
	method  hayAlgunRodadoQueSatisfaceUnPedido(unPedido){ return
		flota.any({r=>unPedido.puedeSatisfacer(r)})
	}
	
	method pedidosNoPuedeSatisfacer(){ return
		pedidos.filter({p=>not self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
	}
	
	
	
	
	
}
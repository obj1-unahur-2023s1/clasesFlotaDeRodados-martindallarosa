import dependencias.*
import rodados.*
class Pedido {
	const property distancia
	var property tiempoMaximo
	const property cantPasajeros
	const property coloresIncompatibles = #{}
	method agregarColorIncompatible(unColor){coloresIncompatibles.add(unColor)}
	method velocidadRequerida() {
		return distancia/tiempoMaximo
	}
	method puedeSatisfacer(unRodado){
		return (unRodado.velocidad() >= self.velocidadRequerida() + 10)
		and unRodado.capacidad() >= cantPasajeros and
		not coloresIncompatibles.contains(unRodado.color())
	}
	
	
	
}

object pepe {
	var categoria = gerente
	var bonoResultado = bonoResultadoNulo
	var bonoPresentismo = bonoPresentismoNormal
	var faltas = 0
	
	method sueldo() {
		return self.sueldoNeto() + bonoResultado.obtenerBono(self.sueldoNeto()) + bonoPresentismo.obtenerBono(self)
		
	}
	
	method sueldoNeto(){
		return categoria.netoACobrar()
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method faltas(_faltas){
		faltas = _faltas
	}
	
	method faltas(){
		return faltas
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	
	method bonoPresentismo(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo
	}
}


object gerente {
	method netoACobrar() {
		return 15000
	}
}

object cadete {
	method netoACobrar() {
		return 20000
	}
}

object bonoResultadoPorcentaje {
	const porcentajeActual = 0.1
	method obtenerBono(sueldo) {
		return sueldo * porcentajeActual
	}
}

object bonoResultadoMontoFijo {
	method obtenerBono(sueldo) {
		return 800
	}
}

object bonoResultadoNulo {
	method obtenerBono(sueldo) {
		return 0
	}
}


object bonoPresentismoNormal {
	method obtenerBono(empleado) {
		var bono = 2000
		if (empleado.faltas() == 1)  bono = 1000  else if (empleado.faltas() > 1) bono = 0 
		
		return bono
	}
}


object bonoPresentismoAjuste {
	method obtenerBono(empleado) {
		if (empleado.faltas() == 0) return 100  else return 0
	}
}

object bonoPresentismoDemagogico {
	method obtenerBono(empleado) {
		if (empleado.sueldoNeto() < 18000) return 500  else return 300 
	}
}

object bonoPresentismoNulo {
	method obtenerBono(empleado) {
		return 0 
	}
}
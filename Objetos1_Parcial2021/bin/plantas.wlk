import parcelas.*

class Plantas {
	var property anioSemilla
	var property altura // en metros
	
	method horasDeSol()
	method esFuerte() = self.horasDeSol() > 10
	method daSemillas() = self.esFuerte()
	method espacio()
	
	method esParcelaIdeal(parcela) 
}

class Menta inherits Plantas {
	override method horasDeSol() = 6
	override method daSemillas() = altura > 0.4
	override method espacio() = altura * 3
	override method esParcelaIdeal(parcela)	= parcela.superficie() > 6
}

class Soja inherits Plantas {
	override method horasDeSol() {
		if (altura < 0.5) {
			return 6
		}
		if (altura.between(0.5 , 1)) {
			return 7
		}
		else 
			return 9		
	}
	override method daSemillas() = anioSemilla > 2007 and altura > 1

	override method espacio() = altura / 2
	
	override method esParcelaIdeal(parcela)	= 
		parcela.horasDeSol() == self.horasDeSol()
			
}

class Quinoa inherits Plantas {
	override method daSemillas() = super() or anioSemilla < 2005
	override method espacio() = 0.5
	override method esParcelaIdeal(parcela)	= 
		parcela.plantas().any{ p => p.altura() > 1.5}
	
}

/*---------- variedades ------------- */

class SojaTrans inherits Soja {
	override method daSemillas() = false
	override method esParcelaIdeal(parcela)	= 
		(parcela.plantas().size() == 1)	
}

class Hierbabuena inherits Menta {
	override method espacio() = super() * 2	
}




// self.error("no se puede plantar")
// assert.throwsExceptionWithMessage


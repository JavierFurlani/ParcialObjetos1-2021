import plantas.*

class Parcelas {
	const property ancho 
	const property largo
	const property horasDeSol
	const property plantas = #{}
	
	method superficie() = ancho * largo
	
	method cantMaxPlantas() = 
		if (ancho > largo) {self.superficie() / 5} 
		else {self.superficie() / 3 + largo} 
		
	method tieneComplicaciones() = 
		self.plantas().any{ p => p.horasDeSol() < self.horasDeSol()}
	
	method plantar(planta) = 
		if (self.plantas().size() < self.cantMaxPlantas()) 
		{self.plantas().add(planta)} 
		else {self.error("Capacidad Máxima Alcanzada")}		
}

class ParcelaEcologica inherits Parcelas {
	
	override method plantar(planta) {
		if (
			self.plantas().size() < self.cantMaxPlantas() and 
			not self.tieneComplicaciones()  
			and	planta.esParcelaIdeal(self)) 
			{
				self.plantas().add(planta)
			}
		else 
			{self.error("No es planta para esta Parcela")} 		
	}
}

class ParcelaIndustrial inherits Parcelas {
	
	override method plantar(planta) {
		if (
			self.plantas().size() < 2 and
			self.plantas().any({p => p.esFuerte() }) and
			planta.esParcelaIdeal(self)
			) 
			{
				self.plantas().add(planta)
			}
		else 
			{self.error("No es planta para esta Parcela")} 		
		}
}
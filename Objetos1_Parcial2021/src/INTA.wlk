import plantas.*
import parcelas.*

object inta {
	var property cantParcelas = []
	var totalPlantas = 0
	
	method promedioPlantasXParcela() {
		totalPlantas += cantParcelas.plantas().count()
		return cantParcelas / totalPlantas
		
	}
	method masAutosustentable() {
		return cantParcelas.plantas().size() > 4		
		}
}

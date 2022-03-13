class FactoriaCarreraMontaña < FactoriaCarreraYBicicleta

	def crearCarrera()
		return CarreraMontaña.new()
    end

	def crearBicicleta(dorsal, tengoAcabar) 
		return BicicletaMontaña.new(dorsal, tengoAcabar)
    end
end
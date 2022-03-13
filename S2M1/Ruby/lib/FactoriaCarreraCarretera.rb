class FactoriaCarreraCarretera  < FactoriaCarreraYBicicleta

	def crearCarrera()
		return CarreraCarretera.new()
    end

	def crearBicicleta(dorsal, tengoAcabar) 
		return BicicletaCarretera.new(dorsal, tengoAcabar)
    end
end
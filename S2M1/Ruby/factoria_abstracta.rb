class FactoriaAbstracta 

    def initialize(carrera, bicicleta)
        @carrera_prototipo=carrera
        @bicicleta_prototipo=bicicleta
    end

	def crear_carrera
		@carrera_prototipo.clone
    end

	def crear_bicicleta(dorsal, tiene_acabar)
		bici = @bicicleta_prototipo.clone
        bici.dorsal = dorsal
        bici.acabado = tiene_acabar
        return bici
    end

    private_class_method :new
end
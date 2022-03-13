class FactoriaAbstracta 

    def initialize(carrera, bicicleta)
        @carrera_prototipo=carrera
        @bicicleta_prototipo=bicicleta
    end

	def crear_carrera(tipo)
    end

    def crear_bicicleta(dorsal, tengoAcabar, tipo)
    end

    private_class_method :new
end
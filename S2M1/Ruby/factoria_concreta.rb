
class FactoriaConcreta < FactoriaAbstracta
	def initialize(carrera, bicicleta)
		super
	end

	
	def crear_carrera(tipo)
		return CarreraMontaña.new()
    end

	def crear_bicicleta(dorsal, tengoAcabar, tipo) 
    end

	public_class_method :new
end
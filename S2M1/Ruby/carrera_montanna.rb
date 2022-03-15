class CarreraMontanna < Carrera
    @@TASA = 0.2
    
    def self.TASA
        @@TASA
    end
    
    def run
        comenzar_carrera
        sleep(@@DURACION)
        @hebra.each(&:join)
        acabar_carrera
    end

    def initialize
        super
    end

	def comenzar_carrera
        puts "La carrera de montaña ha comenzado"
        super
    end

    def acabar_carrera
        puts "La carrera de montaña ha terminado"
    end
end
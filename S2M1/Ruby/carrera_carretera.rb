class CarreraCarretera < Carrera
    @@TASA = 0.1

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
        puts "La carrera de carretera ha comenzado"
        super
    end

    def acabar_carrera
        puts "La carrera de carretera ha terminado"
    end

    public_class_method :new
end
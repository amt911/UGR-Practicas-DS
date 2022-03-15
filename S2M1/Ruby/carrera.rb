
class Carrera
    @@abandono_tiempo;
    @@DURACION = 60

    def self.DURACION
        @@DURACION
    end

    def self.abandono_tiempo
        @@abandono_tiempo
    end

    def initialize
        @bicicletas = []
        @@abandono_tiempo=rand(@@DURACION)
    end

    def annadir_bicicleta(bici)
        @bicicletas.push(bici)
    end

    def comenzar_carrera
        @hebra = []
        @bicicletas.each{ |aux|
            @hebra << Thread.new{
                aux.run
            }
        }
    end

    def acabar_carrera
        puts "No implementado"
    end

end
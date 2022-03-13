
class Carrera
    @@abandono_tiempo;

    attr_reader :abandono_tiempo

    def initialize
        @bicicletas = []
        @@abandono_tiempo=rand(61)
    end

    def annadir_bicicleta(bici)
        @bicicletas.push(bici)
    end

#    def comenzar_carrera
#        for(Bicicleta aux: bicicletas){
#            Thread hebra=new Thread(aux)
#            hebra.start()
#        }      
#    end

    def acabar_carrera
        puts "No implementado"
    end

end

class Carrera
    @@abandono_tiempo;

    attr_reader :abandono_tiempo

    def initialize
        @bicicletas = [] ########???????????????
        #Random aleatorio=new Random()
        #@@abandono_tiempo=(aleatorio.nextInt()%60)*1000
        @@abandono_tiempo=20000

        if(@@abandono_tiempo<0)
            @@abandono_tiempo = -@@abandono_tiempo  
        end
    end

    def annadir_bicicleta(bici)
        @bicicletas.add(bici)
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
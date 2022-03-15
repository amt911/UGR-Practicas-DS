class CarreraCarretera < Carrera
    @@TASA = 0.1

    def self.TASA
        @@TASA
    end

#    @Override
#    public void run(){
#        comenzarCarrera();
#         try {
#            Thread.sleep(60000);    //El padre (la carrera) espera a las bicicletas
#        } catch (InterruptedException e) {
#            e.printStackTrace();
#        }
#        
#        acabarCarrera();        
#    }

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
end
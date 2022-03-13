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

    def initialize
        super
    end


    def comenzar_carrera
        super
        puts "La carrera de carretera ha comenzado"
    end

    def acabar_carrera
        puts "La carrera de carretera ha terminado"
    end
end
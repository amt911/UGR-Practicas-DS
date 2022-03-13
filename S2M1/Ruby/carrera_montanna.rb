class CarreraMontanna < Carrera
    @@TASA = 0.2
    
    def self.TASA
        @@TASA
    end



#    public void run(){
#        comenzarCarrera();
#       try {
#            Thread.sleep(60000);        //El padre (la carrera) espera a las bicicletas
#        } catch (InterruptedException e) {
#            e.printStackTrace();
#        }
#        acabarCarrera();
#    }

    def initialize
        super
    end

	def comenzar_carrera
        super
        puts "La carrera de montaña ha comenzado"
    end

    def acabar_carrera
        puts "La carrera de montaña ha terminado"
    end
end
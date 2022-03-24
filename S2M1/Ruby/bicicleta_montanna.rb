class BicicletaMontanna < Bicicleta 

    def initialize(dorsal=-1, tengo_acabar=false)
        super(dorsal, tengo_acabar)
    end

    def run
        puts "La bicicleta de montaña #{dorsal} ha comenzado la carrera"
        if(acabado)
            sleep(Carrera.abandono_tiempo)
            puts "La bicicleta de montaña #{dorsal} ha abandonado la carrera" 
        else
            sleep(Carrera.DURACION)
            puts "La bicicleta de montaña #{dorsal} ha terminado la carrera"  
        end
    end

    public_class_method :new
end
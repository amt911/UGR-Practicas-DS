class BicicletaCarretera < Bicicleta 

    def initialize(dorsal=-1, tengo_acabar=false)   #Sirve para crear los prototipos
        super(dorsal, tengo_acabar)
    end

    def run
        puts "La bicicleta de carretera #{dorsal} ha comenzado la carrera"
        if(acabado)
            sleep(Carrera.abandono_tiempo)
            puts "La bicicleta de carretera #{dorsal} ha abandonado la carrera" 
        else
            sleep(Carrera.DURACION)
            puts "La bicicleta de carretera #{dorsal} ha terminado la carrera"      
        end
    end

    public_class_method :new
end
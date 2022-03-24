class BicicletaCarretera < Bicicleta 

    def initialize(dorsal=-1, tengoAcabar=false)
        super(dorsal, tengoAcabar)
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
end
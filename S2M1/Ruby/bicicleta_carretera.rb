class BicicletaCarretera < Bicicleta 

    def initialize(dorsal=-1, tengoAcabar=false)
        super(dorsal, tengoAcabar)
    end

    def run()
        puts "La bicicleta de carretera " + dorsal + " ha entrado en la carrera"
        if(acabado)
            Thread.sleep(Carrera.getAbandonoTiempo())
        else
            Thread.sleep(60000)
        end
        
        if(acabado)
            puts "La bicicleta de carretera " + dorsal + " ha abandonado la carrera" 
        else
            puts "La bicicleta de carretera " + dorsal + " ha terminado la carrera"      
        end
    end
end
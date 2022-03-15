require_relative 'factoria_abstracta'
require_relative 'factoria_concreta'
require_relative 'bicicleta'
require_relative 'carrera'
require_relative 'bicicleta_montanna'
require_relative 'carrera_montanna'
require_relative 'bicicleta_carretera'
require_relative 'carrera_carretera'

bicis_carretera = 30
bicis_montanna = 30
tengo_acabar = false

#creamos los prototipos
bici_proto_m = BicicletaMontanna.new
carrera_proto_m = CarreraMontanna.new

bici_proto_c = BicicletaCarretera.new
carrera_proto_c = CarreraCarretera.new
#creaemos factorias
factoria_carretera = FactoriaConcreta.new(carrera_proto_c, bici_proto_c)
factoria_montanna = FactoriaConcreta.new(carrera_proto_m, bici_proto_m)

#cada factoria crea su carrera
carrera_carretera = factoria_carretera.crear_carrera()
carrera_montanna = factoria_montanna.crear_carrera()


indice = (1 - CarreraCarretera.TASA) * bicis_carretera
for i in (0..(bicis_carretera-1))
        if (i >= indice)
            tengo_acabar = true
        end
        carrera_carretera.annadir_bicicleta(factoria_carretera.crear_bicicleta(i, tengo_acabar))
end

    tengo_acabar = false
    indice = (1 - CarreraMontanna.TASA) * bicis_carretera;
    for i in (0..(bicis_montanna-1)) 
        if (i >= indice)
        tengo_acabar = true
        end
        carrera_montanna.annadir_bicicleta(factoria_montanna.crear_bicicleta(i, tengo_acabar))
    end

    #Lanzamos carrera montaña
    h1 = Thread.new{
        carrera_montanna.run
    }
    h1.join

    puts "---------------------------------------------------------"
    
    #Lanzamos carrera carretera
    h2 = Thread.new{
        carrera_carretera.run
    }
    h2.join

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

30.times{
puts "===========| COMIENZA LA CARRERA |==========="
}


#creamos los prototipos
bici_proto_m = BicicletaMontanna.new
carrera_proto_m = CarreraMontanna.new

bici_proto_c = BicicletaCarretera.new
carrera_proto_c = CarreraCarretera.new
#creaemos factorias
factoria_carretera = FactoriaConcreta.new(bici_proto_m, carrera_proto_m)
factoria_montanna = FactoriaConcreta.new(bici_proto_c, carrera_proto_c)

#cada factoria crea su carrera
#carreracarretera = factoria_carretera.clone()
#carreramontanna = factoria_montanna.clone()

=begin
indice = (1 - CarreraCarretera.TASA) * bicis_carretera
for i in (0..bicis_carretera)
        if (i >= indice)
        tengo_acabar = true
        end
        carreracarretera.annadir_bicicleta(factoria_carretera.crear_bicicleta(i, tengo_acabar))
end

    tengo_acabar = false
    indice = (1 - CarreraMontanna.TASA) * bicis_carretera;
    for i in (0..bicis_montanna) 
        if (i >= indice)
        tengo_acabar = true
        end
        carreramontanna.annadir_bicicleta(factoria_montanna.crear_bicicleta(i, tengo_acabar))
    end
=end
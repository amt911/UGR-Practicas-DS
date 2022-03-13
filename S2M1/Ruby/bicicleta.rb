class Bicicleta
    def initialize(dorsal, tengoAcabar)
        @dorsal = dorsal
        @acabado = tengoAcabar
    end

    def acabarCarrera() 
        @acabado = true
    end

end

bici = Bicicleta.new(3,false)
